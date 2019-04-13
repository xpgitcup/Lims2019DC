package cn.edu.cup.os

import cn.edu.cup.system.SystemUserController

class Operation4SystemUserController extends SystemUserController {

    def exportToJsonFileName() {
        commonService.exportObjectsToJsonFileName(systemUserService.list(), params.fileName)
        redirect(action: "index")
    }

    def index() {}
}
