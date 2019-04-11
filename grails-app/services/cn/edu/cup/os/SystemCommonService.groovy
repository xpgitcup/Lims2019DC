package cn.edu.cup.os

import cn.edu.cup.system.StatusParameter
import cn.edu.cup.system.SystemAttribute
import cn.edu.cup.system.SystemStatus
import cn.edu.cup.system.SystemStatusItem
import cn.edu.cup.system.SystemUser
import com.alibaba.fastjson.JSON
import grails.gorm.transactions.Transactional

//@Transactional
class SystemCommonService {

    def systemUserService
    def systemStatusService
    def statusParameterService
    def systemStatusItemService

    private synchronized void setParameters(amap, systemStatus) {
        amap.each { e ->
            def p = StatusParameter.findByStatusKeyAndSystemStatus("${e.key}", systemStatus)
            //println("设置参数：${e} ${p}")
            if (p) {
                if (p.statusValue!="${e.value}") {
                    //println("更新！")
                    p.statusValue = "${e.value}"
                    //p.save(flush: true)
                    statusParameterService.save(p)
                    //systemStatusService.save(systemStatus)
                }
            } else {
                p = new StatusParameter(
                        statusKey: "${e.key}",
                        statusValue: "${e.value}",
                        systemStatus: systemStatus
                )
                statusParameterService.save(p)
            }
        }
    }


    def updateSystemStatus(request, params) {
        //println("updateSystemStatus: ${params}")
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
        systemStatusService.save(ss)
        // 更新参数
        setParameters(ps, ss)
        // 记录详细信息
        setDetailParameters(ps, ss)
    }

    private void setDetailParameters(ps, SystemStatus ss) {
        // 记录详情
        def pps = JSON.toJSONString(ps)
        def ppl = pps.length()
        def item = new SystemStatusItem(
                paramsString: pps.substring(0, Math.min(ppl, 200)),
                systemStatus: ss
        )
        systemStatusItemService.save(item)
        println("save ${ps} ${item} ok")
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

}
