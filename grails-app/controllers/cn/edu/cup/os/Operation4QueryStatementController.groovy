package cn.edu.cup.os

import cn.edu.cup.system.QueryStatementController

import java.text.DateFormat
import java.text.SimpleDateFormat

class Operation4QueryStatementController extends QueryStatementController {

    def systemCommonService

    def debug(Long id) {
        def query = queryStatementService.get(id)

    }

    def exportToJsonFileName() {
        def now = new Date()
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh-mm")
        def fileName = "${params.fileName} ${df.format(now)}.json"
        commonService.exportObjectsToJsonFileName(queryStatementService.list(), fileName)
        redirect(action: "index")
    }

    def index() { }
}
