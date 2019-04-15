package cn.edu.cup.os

import cn.edu.cup.system.QueryStatementController

import java.text.DateFormat
import java.text.SimpleDateFormat

class Operation4QueryStatementController extends QueryStatementController {

    def exportToJsonFileName() {
        def now = new Date()
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd")
        def fileName = "${params.fileName} ${df.format(now)}.json"
        commonService.exportObjectsToJsonFileName(queryStatementService.list(), fileName)
        redirect(action: "index")
    }

    def index() {}
}
