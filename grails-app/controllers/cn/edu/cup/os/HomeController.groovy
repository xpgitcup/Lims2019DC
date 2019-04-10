package cn.edu.cup.os

import cn.edu.cup.basic.Caption
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.system.SystemStatus
import cn.edu.cup.system.SystemUser
import grails.converters.JSON

class HomeController {

    def systemCommonService
    def systemMenuService
    def initService

    def selectCurrentMenuItem() {
        println("${params}")
        systemCommonService.updateSystemStatus(request, params)
        redirect(action: "index")
    }

    def getMenuItems() {
        def systemMenuList = []
        def menuPath = []
        def currentMenuItem = null
        def sid = session.getId()
        def ss = SystemStatus.findBySessionId(sid)
        if (ss) {
            println("参数：${ss.statusParameters}")
            def ps = com.alibaba.fastjson.JSON.parseObject(ss.statusParameters)
            currentMenuItem = systemMenuService.get(ps.currentMenuItem)
            println("当前菜单：${currentMenuItem}")
            if (currentMenuItem) {
                println("当前：${currentMenuItem}")
                menuPath = currentMenuItem.menuPath()
                systemMenuList = currentMenuItem.menuItems
            } else {
                def q = SystemMenu.createCriteria()
                def user = session.systemUser
                println("当前用户：${user}")
                if (user) {
                    def roles = user.userRoles()
                    println("当前权限：${roles}")
                    systemMenuList = q.list(params) {
                        isNull('upMenuItem')
                        'in'('menuContext', roles)      // 只要菜单的名字在其中就可以 20181208
                        order('menuOrder')
                    }
                }
            }
        } else {
        }
        def result = [systemMenuList: systemMenuList, meunPath: menuPath, currentMenuItem: currentMenuItem]
        if (request.xhr) {
            render(template: "applicationMenu", model: result)
        } else {
            result
        }
    }

    def countOnlineUsers() {
        def current = new Date()
        Date start = new Date(current.getTime() - 30 * 60 * 1000) // 30分钟转换成毫秒
        def cc = SystemStatus.countByLogoutTimeIsNullAndLoginTimeGreaterThan(start)
        def users = SystemStatus.findAllByLogoutTimeIsNullAndLoginTimeGreaterThan(start)
        def usersStr = ""
        if (users.size() < 3) {
            users.each { e ->
                usersStr += "${e.userName},"
            }
        } else {
            usersStr = "${users[0].userName},${users[0].userName},${users[0].userName}..."
        }
        def result = [count: cc, usersStr: usersStr]
        if (request.xhr) {
            render(template: "onlineCount", model: result)
        } else {
            result
        }
    }

    def index() {
        def controllers = initService.checkSystemStatus()
        def fc = 0
        controllers.each { e ->
            //println("${e.key}--")
            if (e.value) {
                fc++
            }
        }
        def pfc = Math.round(fc / controllers.size() * 100 * 100) / 100
        model:
        [controllers: controllers, pfc: pfc]
    }

    /*
    * 退出登录
    * */

    def logout() {
        def pscontext = request.session.servletContext
        systemCommonService.updateSystemStatus(request, params)
        if (session.systemUser) {
            println("${session.systemUser.userName}退出...")
            def logoutUser = session.systemUser.personName()
            session.invalidate()
            //redirect(uri: "/")
            println("拜拜...${logoutUser}")
            model:
            [logoutUser: logoutUser]
        } else {
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 登录
    * */

    def login() {
        String userName = params.userName;
        String p = params.password.encodeAsMD5()
        def systemUser = SystemUser.findByUserNameAndPassword(userName, p)
        if (systemUser) {
            //println("找到了：${systemUser}")
            session.layout = Caption.findByName("main").layout
            session.systemUser = systemUser
            systemCommonService.updateSystemStatus(request, params)
            redirect(uri: "/home")
        } else {
            flash.message = "用户名或密码错误！"
            println("用户名或密码错误！")
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 显示登录界面
    * */

    def loginUI() {}

}
