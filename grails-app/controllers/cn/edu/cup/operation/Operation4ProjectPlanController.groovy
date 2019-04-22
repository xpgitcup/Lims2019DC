package cn.edu.cup.operation

import cn.edu.cup.lims.Plan
import cn.edu.cup.lims.Progress
import cn.edu.cup.lims.ProjectPlanController
import cn.edu.cup.lims.Team
import cn.edu.cup.system.JsFrame
import cn.edu.cup.lims.ProjectPlan
import grails.converters.JSON

class Operation4ProjectPlanController extends ProjectPlanController {

    def treeViewService
    def teamService
    def cookieService

    /*
    删除归档信息
    * */

    def removeProgress() {
        println("${params}")
        def currentProjectPlan = ProjectPlan.get(params.currentProjectPlan)
        def progress = Progress.get(params.progress)
        def currentTeam = currentProjectPlan.team
        println("${currentProjectPlan} ${progress}")
        if (currentProjectPlan && progress) {
            currentProjectPlan.progresses.remove(progress)
            projectPlanService.save(currentProjectPlan)
            println("删除归档...${currentProjectPlan.progresses}")
        }
        redirect(action: "index", params: [currentTeam: currentTeam.id])
    }

    /*
    进度归档
    * */

    def fileToProjectPlan() {
        println("${params}")
        def currentProjectPlan = ProjectPlan.get(params.currentProjectPlan)
        def progress = Progress.get(params.progress)
        def currentTeam = currentProjectPlan.team
        println("${currentProjectPlan} ${progress}")
        doFileToProjectPlan(currentProjectPlan, progress)
        redirect(action: "index", params: [currentTeam: currentTeam.id])
    }

    private void doFileToProjectPlan(ProjectPlan currentProjectPlan, Progress progress) {
        if (currentProjectPlan && progress) {
            currentProjectPlan.progresses.add(progress)
            projectPlanService.save(currentProjectPlan)
            println("归档...${currentProjectPlan.progresses}")
        }
    }

    /*
    处理结果
    * */

    protected def processResult(result, params) {
        switch (params.key) {
            case "当前进度":
                def progressList = []
                result.objectList.each { e ->
                    //println("查找 ${e}")
                    progressList.add(Progress.get(e.progress_id))
                }
                //println("转换后：${teams}")
                result.objectList = progressList
                break
        }
        return result
    }

    /*
    准备参数
    * */

    protected void prepareParams() {
        // 首先获取当前任务
        def currentTeam = Team.get(params.currentTeam)
        def currentProjectPlan = ProjectPlan.findByTeam(currentTeam)
        def filedList = []
        currentProjectPlan.subItems.each { e ->
            filedList.addAll(e.progresses)
        }
        println("已归档的：${filedList}")
        switch (params.key) {
            case "待归档":
                params.currentTeam = currentTeam
                if (filedList.size() > 0) {
                    params.filedList = filedList
                }
                break
        }
    }

    /*
    * 获取json格式的树形结构数据
    * */

    def getTreeViewData() {
        def team = teamService.get(params.currentTeam)
        def projectPlan
        if (ProjectPlan.countByTeam(team) < 1) {
            projectPlan = createProjectPlan(team)
        } else {
            projectPlan = ProjectPlan.findByTeamAndUpProjectPlanIsNull(team)
        }
        params.context = "description"
        params.subItems = "subItems"
        params.attributes = "id"    //
        def result = treeViewService.generateNodesString(projectPlan, params, JsFrame.EasyUI)
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def createProjectPlan(Team team) {
        def projectPlan = new ProjectPlan(
                upProjectPlan: null,
                description: "${team}.进度管理",
                team: team,
                precent: 0,
                updateDate: new Date(),
                serialNumber: 0
        )
        projectPlanService.save(projectPlan)
        checkProjectPlanItems(team, projectPlan)
        return projectPlan
    }

    private void checkProjectPlanItems(Team team, projectPlan) {
        if (!projectPlan.subItems) {
            def typePlan = Plan.findByThingType(team.thing.thingType)
            //println("找到同类型的计划：${typePlan}")
            typePlan.subItems.each { e ->
                def newItem = new ProjectPlan(
                        upProjectPlan: projectPlan,
                        description: e.description,
                        precent: 0,
                        team: team,
                        updateDate: new Date(),
                        serialNumber: e.serialNumber
                )
                projectPlanService.save(newItem)
                //println("保存item:${newItem}")
            }
        }
    }

    def index() {
        // 计划检查--确保每个团队都有计划
        Team.list().each { e->
            if (ProjectPlan.countByTeam(e) < 1) {
                createProjectPlan(e)
            }
        }

        println("${params}")
        def currentTeam = Team.get(params.currentTeam)
        if (!currentTeam) {
            def ctid = cookieService.getCookie("currentTeamId")
            currentTeam = Team.get(ctid)
        }

        def nextAction = cookieService.getCookie("nextAction")
        def currentProjectPlanId = Integer.parseInt(cookieService.getCookie("currentProjectPlanId"))
        def currentProjectPlan
        if (currentProjectPlanId > 0) {
            currentProjectPlan = projectPlanService.get(currentProjectPlanId)
        }
        println("下一步：${nextAction}")
        switch (nextAction) {
            case "toFile":
                def progress = Progress.last()
                doFileToProjectPlan(currentProjectPlan, progress)
                cookieService.setCookie("nextAction", "")
                break
        }
        model:
        [currentTeam: currentTeam]
    }
}
