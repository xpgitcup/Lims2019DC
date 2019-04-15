package cn.edu.cup.operation

import cn.edu.cup.basic.Person
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.TeamController
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingTypeCircle

class Operation4TeamController extends TeamController {

    def systemCommonService

    def recruit() {
        def person = Person.findByName(params.name)
        def team = teamService.get(params.team)
        if (!team.members.contains(person)) {
            team.members.add(person)
            teamService.save(team)
        } else {
            flash.message = "已经加入了!"
        }
        chain(action: "index")
    }

    def disband(Team team) {
        if (team) {
            teamService.delete(team.id)
        }
        redirect(action: "index")
    }

    def dismiss() {
        println("${params}")
        def person = Person.get(params.person)
        def team = Team.get(params.currentTeam)
        if (team) {
            if (team.members.contains(person)) {
                team.members.remove(person)
                teamService.save(team)
            }
        }
        chain(action: "index")
    }

    def quitTeam(Team team) {
        def myself = session.systemUser.person()
        if (team.members.contains(myself)) {
            team.members.remove(myself)
            teamService.save(team)
        } else {
            flash.message = "不属于该团队!"
        }
        chain(action: "index")
    }

    def joinTeam(Team team) {
        def myself = session.systemUser.person()
        if (!team.members.contains(myself)) {
            team.members.add(myself)
            teamService.save(team)
        } else {
            flash.message = "已经加入了!"
        }
        chain(action: "index")
    }

    def createTeam(Thing thing) {
        println("${params}")
        def leader = session.systemUser.person()
        if (leader) {
            if (!Team.findAllByThingAndLeader(thing, leader)) {
                def team = new Team(leader: leader, thing: thing)
                teamService.save(team)
                println("create ok ${team}")
            } else {
                flash.message = "不能重复！"
            }
        } else {
            flash.message = "找不到这个成员！"
        }
        chain(action: "index")
    }

    protected void prepareParams() {
        // 首先获取当前任务
        def parameters = systemCommonService.getParameters(request)
        def currentTask = "科研任务"
        if (parameters) {
            currentTask = parameters.currentTask
        }

        def myself = session.systemUser.person()
        def currentTitle = session.systemUser.personTitle()

        def thingTypeList
        switch (currentTask) {
            case "科研任务":
                thingTypeList = ThingTypeCircle.allRelatedProjects(currentTitle)
                break
            case "教学任务":
                thingTypeList = ThingTypeCircle.allRelatedCourses(currentTitle)
                break
        }
        switch (params.key) {
            case "我参与的":
                params.thingTypeList = thingTypeList
                params.myself = myself
                break
            case "我领导的":
                params.thingTypeList = thingTypeList
                params.myself = myself
                break
            case "可选题目":
                params.thingTypeList = thingTypeList
                break
            case "相关团队":
                def currentThing = Thing.get(params.currentThing)
                params.currentThing = currentThing
                break
            case "队员列表":
                break
        }
    }

    protected def processResult(result, params) {
        switch (params.key) {
            case "队员列表":
                def currentTeam = Team.get(params.currentTeam)
                if (currentTeam) {
                    result.objectList = [currentTeam]
                    result.view = "listMember"
                }
                break
            case "我参与的":
                def teams = []
                result.objectList.each { e ->
                    //println("查找 ${e}")
                    teams.add(Team.get(e.team_members_id))
                }
                //println("转换后：${teams}")
                result.objectList = teams
                break
        }
        return result
    }

    def index() {
        def currentTask
        if (params.currentTask) {
            currentTask = params.currentTask
        }
        model:
        [currentTask: currentTask]
    }

}
