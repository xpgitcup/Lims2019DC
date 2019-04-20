package cn.edu.cup.operation

import cn.edu.cup.lims.Plan
import cn.edu.cup.lims.ProjectPlanController
import cn.edu.cup.lims.Team
import cn.edu.cup.system.JsFrame
import cn.edu.cup.lims.ProjectPlan
import grails.converters.JSON

class Operation4ProjectPlanController extends ProjectPlanController {

    def treeViewService
    def teamService

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
        def currentTeam = Team.get(params.currentTeam)
        model:[currentTeam: currentTeam]
    }
}
