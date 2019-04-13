package cn.edu.cup.os

import cn.edu.cup.system.QueryStatementController

class Operation4QueryStatementController extends QueryStatementController {

    def exportToJsonFileName() {
        commonService.exportObjectsToJsonFileName(queryStatementService.list(), params.fileName)
        redirect(action: "index")
    }

    def index() {}
}
