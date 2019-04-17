package cn.edu.cup.os

import cn.edu.cup.lims.Team
import cn.edu.cup.lims.ThingTypeCircle
import cn.edu.cup.system.QueryStatement
import cn.edu.cup.system.QueryStatementController

import java.text.DateFormat
import java.text.SimpleDateFormat

class Operation4QueryStatementController extends QueryStatementController {

    def debugUI() {}

    def debug() {
        def hql = params.hql
        def myself = session.systemUser.person()
        def currentTitle = session.systemUser.personTitle()
        def thingTypeList = ThingTypeCircle.allRelatedProjects(currentTitle)
        println("${thingTypeList}")
        println("${myself}")
        def objectList
        def q = Team.createCriteria()
        objectList = q.list {
            'in'(team.thing.thingType, thingTypeList)
            and
                    {
                        'in'(myself, team.members)
                    }
        }
        println("${objectList}")
        model:
        [objectList: objectList]
    }

    def debugA() {
        def hql = params.hql
        def myself = session.systemUser.person()
        def currentTitle = session.systemUser.personTitle()
        def thingTypeList = ThingTypeCircle.allRelatedProjects(currentTitle)
        println("${thingTypeList}")
        println("${myself}")
        def objectList = QueryStatement.executeQuery(hql, [myself: myself])//, thingTypeList: thingTypeList])
        println("${objectList}")
        model:
        [objectList: objectList]
    }

    def exportToJsonFileName() {
        def now = new Date()
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh-mm")
        def fileName = "${params.fileName} ${df.format(now)}.json"
        commonService.exportObjectsToJsonFileName(queryStatementService.list(), fileName)
        redirect(action: "index")
    }

    def index() {}
}
