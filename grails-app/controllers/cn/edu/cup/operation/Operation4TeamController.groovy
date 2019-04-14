package cn.edu.cup.operation

import cn.edu.cup.lims.TeamController
import cn.edu.cup.lims.ThingTypeCircle

class Operation4TeamController extends TeamController {

    def systemCommonService

    def index() {
        // 当前参数
        def parameters = systemCommonService.getParameters(request)
        def currentTask
        def taskList
        def taskListCount = 0

        if (params.currentTask) {
            currentTask = params.currentTask
        } else {
            if (parameters) {
                currentTask = parameters.currentTask
            }
        }
        // 当前可选题目
        def pt = session.systemUser.personTitle()
        def thingTypeList
        switch (currentTask) {
            case "科研任务":
                thingTypeList = ThingTypeCircle.allRelatedProjects(pt)
                break
            case "教学任务":
                thingTypeList = ThingTypeCircle.allRelatedCourses(pt)
                break
        }
        params.action = "list"
        params.key = "可选题目"
        params.thingTypeList = thingTypeList
        taskList = commonQueryService.listFunction(params)
        params.action = "count"
        taskListCount = commonQueryService.countFunction(params)
        //println("当前参数：${parameters} ${thingTypeList}")
        //println("${taskList}")
        println("统计： ${taskListCount}")
        model:
        [currentTask: currentTask, taskList: taskList, taskListCount: taskListCount]
    }

}
