package cn.edu.cup.init

import cn.edu.cup.basic.Caption
import cn.edu.cup.basic.PersonTitle
import cn.edu.cup.basic.Teacher
import cn.edu.cup.system.SystemAttribute
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.system.SystemUser
import grails.gorm.transactions.Transactional

import javax.servlet.ServletContext

@Transactional
class InitService {
    def grailsApplication
    def dataSource
    def systemMenuService
    def systemUserService
    def captionService
    def commonService
    def personTitleService
    def teacherService
    def systemCommonService
    def systemAttributeService

    /**
     * 初始化代码__开发环境下的初始化代码
     */
    def configureForDevelopment(ServletContext servletContext) {
        println "这是开发环境..."
        println(grailsApplication.metadata.getApplicationName())
        processConfigFile(servletContext)
        checkSystemStatus()
    }

    def checkSystemStatus() {
        def domains = []
        grailsApplication.controllerClasses.each { e ->
            domains.add(e.name)
        }
        println("域类：${domains}")
        def controllers = [:]
        SystemMenu.list().each { e ->
            def item = [:]
            if (e.menuAction != "#") {
                def ee = e.menuAction.split("/")
                def ename = ee[0]
                def firstChar = ename.charAt(0).toUpperCase()
                def cname = "${firstChar}${ename.substring(1)}"
                println(cname)
                def ok = domains.findIndexOf { it == cname }
                println("${cname} ${ok}")
                controllers.put(cname, (ok > -1))
            }
        }
        println("系统状态 ${controllers}")
        return controllers
    }

    /*
    * 处理ocnfig.json文件
    * */

    private void processConfigFile(ServletContext servletContext) {
        def webRootDir = servletContext.getRealPath("/")

        // 先处理数据库脚本文件
        def configFileName = "${webRootDir}/config/scriptList.json"
        def scriptList = [:]
        scriptList = commonService.importObjectFromJsonFileName(configFileName, scriptList.getClass())
        println("处理脚本：${scriptList}")
        scriptList.each { e ->
            switch (e.key) {
                case "dir":
                    loadScripts("${webRootDir}/${e.value}")
                    break
                case "file":
                    def sfile = new File("${webRootDir}/${e.value}")
                    executeScript(sfile)
                    break
            }
        }

        // 处理应用程序名称、图标等信息
        def captionsFileName = "${webRootDir}/config/captions.json"
        if (captionService.count() < 1) {
            def captions = commonService.importObjectListFromJsonFileName(captionsFileName, Caption.class)
            captions.each { e ->
                captionService.save(e)
            }
        }

        // 处理菜单的设置
        def systemMenuFileName = "${webRootDir}/config/systemMenu.json"
        if (systemMenuService.count() < 1) {
            def menus = commonService.importTreeFromJsonFileName(systemMenuFileName, SystemMenu.class, "menuItems")
            menus.each { e ->
                systemMenuService.save(e)
            }
        }

        // 处理人员身份
        def personTitleFileName = "${webRootDir}/config/personTitle.json"
        if (personTitleService.count() < 1) {
            def personTitels = commonService.importTreeFromJsonFileName(personTitleFileName, PersonTitle.class, "subTitels")
            personTitels.each { e ->
                personTitleService.save(e)
            }
        }

        // 处理系统属性
        def attributeFileName = "${webRootDir}/config/systemAttribute.json"
        if (systemAttributeService.count() < 1) {
            def attributes = commonService.importObjectListFromJsonFileName(attributeFileName, SystemAttribute.class)
            attributes.each { e ->
                systemAttributeService.save(e)
            }
        }

        // 处理人员
        def teacherFileName = "${webRootDir}/config/teacher.json"
        if (teacherService.count() < 1) {
            def teachers = commonService.importObjectListFromJsonFileName(teacherFileName, Teacher.class)
            teachers.each { e ->
                //println("${e}")
                teacherService.save(e)
                systemCommonService.addPersonToUser(e)
            }
        }
    }

    /**
     * 发布后的初始化代码
     */
    def configureForProduction(ServletContext servletContext) {
        println "这是发布环境..."
        processConfigFile(servletContext)
    }

    /*
    * 加载数据库初始化脚本
    * */

    def loadScripts(String dir) {
        File sf = new File(dir)
        if (sf.exists()) {
            println "load scripts ${dir}"
            if (sf.isDirectory()) {
                sf.eachFile { f ->
                    if (f.isFile()) {
                        executeScript(f)
                    }
                }
            } else {
                println("执行${sf}...")
                executeScript(sf)
            }
        }
    }

    /**
     * 执行附加脚本
     * */

    def executeScript(File sf) {
        //def File sf = new File(fileName)
        println "init - ${sf}"
        if (sf) {
            def db
            def sql = sf.text
            db = new groovy.sql.Sql(dataSource)
            //println "init - ${sql}"
            def lines = sql.split(";")
            lines.each() { it ->
                //println "line: ${it}"
                it = it.trim()
                if (!it.isEmpty()) {
                    db.executeUpdate(it)
                }
            }
        }
    }

}
