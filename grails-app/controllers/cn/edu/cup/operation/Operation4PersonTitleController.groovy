package cn.edu.cup.operation

import cn.edu.cup.basic.PersonTitle
import cn.edu.cup.basic.PersonTitleController
import cn.edu.cup.system.JsFrame
import grails.converters.JSON

class Operation4PersonTitleController extends PersonTitleController {

    def treeViewService

    /*
    * 获取json格式的树形结构数据
    * */

    def getTreeViewData() {
        def data = PersonTitle.findAllByUpTitleIsNull(params);
        params.context = "name"
        params.subItems = "subTitles"
        params.attributes = "id"    //
        def result = treeViewService.generateNodesString(data, params, JsFrame.EasyUI)
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
