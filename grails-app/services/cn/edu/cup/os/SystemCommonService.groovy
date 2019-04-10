package cn.edu.cup.os

import cn.edu.cup.system.SystemAttribute
import cn.edu.cup.system.SystemStatus
import cn.edu.cup.system.SystemStatusItem
import cn.edu.cup.system.SystemUser
import grails.gorm.transactions.Transactional

@Transactional
class SystemCommonService {

    def systemUserService
    def systemStatusService

    def updateSystemStatus(request, params) {
        def ps = params
        ps.remove('password')
        def sid = request.session.getId()
        def ss = SystemStatus.findBySessionId(sid)
        if (ss) {
            if (ps.action == "logout") {
                ss.logoutTime = new Date()
            }
        } else {
            def user = request.session.systemUser
            ss = new SystemStatus(
                    sessionId: sid,
                    userName: user.personName(),
                    userRole: user.userRoles()
            )
        }
        // 更新参数
        def status = ss.getParameters()
        if (!status) {
            status = [:]
        }
        status.putAll(params)
        println("${status}")
        ss.statusParameters = com.alibaba.fastjson.JSON.toJSONString(status)
        // 记录详情
        def item = new SystemStatusItem(paramsString: com.alibaba.fastjson.JSON.toJSONString(ps), systemStatus: ss)
        if (!ss.items) {
            ss.items = []
        }
        ss.items.add(item)
        systemStatusService.save(ss)
    }

    boolean removePersonFromUser(person) {
        def u = SystemUser.findByUserName(person.code)
        if (u) {
            systemUserService.delete(u.id)
            return true
        } else {
            return false
        }
    }

    boolean addPersonToUser(person) {
        def role = SystemAttribute.findByName("系统权限")
        switch (person.class.simpleName) {
            case "Teacher":
                role = SystemAttribute.findByName("教师权限")
                break
            case "Student":
                role = SystemAttribute.findByName("学生权限")
                break
        }
        if (SystemUser.countByUserName(person.code) < 1) {
            def app = person.class.simpleName
            def u = new SystemUser(
                    userName: person.code,
                    password: "12345678",
                    roleAttribute: role,
                    appendAttribute: "${app}=${person.name}"
            )
            systemUserService.save(u)
            return true
        } else {
            return false
        }
    }

    @Transactional(readOnly = false)
    def deleteBefore(aDate) {
        SystemLog.executeUpdate("delete SystemLog a where a.actionDate < :d", [d: aDate])
    }

    def updateSystemUserList(request) {
        def pscontext = request.session.servletContext
        Map serviceMap = pscontext.getAttribute("systemUserList")
        if (serviceMap) {
            //当前在线人员列表
            def m = Math.min(5, serviceMap.size())
            def users = ""
            for (int i = 0; i < m; i++) {
                if (i != 0) {
                    users += ", "
                }
                users += serviceMap.keySet()[i]
            }
            if (serviceMap.size() > 5) {
                users += "..."
            }
            request.session.systemUserList = users
            //统计人数
            request.session.onlineCount = serviceMap.size()
            println("${users}")
        }
    }

    //获取顶级菜单---?????
    def getAllTopLevelMenus(params) {
        def q = SystemMenu.createCriteria()
        def systemMenuList = []
        if (params.user) {
            SystemUser user = params.user
            def roles = user.userRoles()
            println("${roles}")
            if (roles) {
                systemMenuList = q.list(params) {
                    isNull('upMenuItem')
                    'in'('menuContext', roles)      // 只要菜单的名字在其中就可以 20181208
                    order('menuOrder')
                }
            }
        }
        return systemMenuList
    }

}
