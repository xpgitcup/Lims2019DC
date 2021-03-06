package cn.edu.cup.lims

import cn.edu.cup.system.DataRootPath
import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ProgressController {

    def progressService
    def commonQueryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.progressTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.progressJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond progressService.list(params), model: [progressCount: progressService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def progress = progressService.get(id)

        if (request.xhr) {
            render(template: view, model: [progress: progress])
        } else {
            respond progress
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def progress = new Progress(params)

        if (request.xhr) {
            render(template: view, model: [progress: progress])
        } else {
            respond progress
        }
    }

    def save(Progress progress) {

        if (progress == null) {
            notFound()
            return
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = params.controller
        if (params.nextController) {
            controller = params.nextController
        }

        try {
            progressService.save(progress)
            flash.message = message(code: 'default.created.message', args: [message(code: 'progress.label', default: 'Progress'), progress.id])
        } catch (ValidationException e) {
            flash.message = progress.errors
        }

        if (params.url) {
            redirect(params.url)
        } else {
            switch (params.needToDo) {
                case "toFile":
                    println("处理下一步的任务...")
                    redirect(controller: controller, action: "fileToProjectPlan", params: [progress: progress.id, currentProjectPlan: params.currentProjectPlan])
                    break
                default:
                    println("没有设置下一步的任务...")
                    redirect(controller: controller, action: action)
            }
        }
    }

    protected void uploadFile(params, Progress progress) {
        if (!params.uploadedFile.empty) {
            //处理文件上传
            def keyString = "${grails.util.Environment.current}.operation4Progress"
            def rootPath = DataRootPath.findByKeyString(keyString).rootPath
            def destDir = "${rootPath}/documents/${progress.id}"
            params.destDir = destDir
            println(destDir)
            def sf = commonService.upload(params)
            println("上传${sf}成功...")
        }
    }

    def edit(Long id) {

        println("${params}")

        def view = "edit"
        if (params.view) {
            view = params.view
        }

        def progress = progressService.get(id)

        println("编辑${progress}")

        if (request.xhr) {
            render(template: view, model: [progress: progress])
        } else {
            respond progress
        }
    }

    def update(Progress progress) {
        if (progress == null) {
            notFound()
            return
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        try {
            progressService.save(progress)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'progress.label', default: 'Progress'), progress.id])
        } catch (ValidationException e) {
            flash.message = progress.errors
        }

        if (controller == "") {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        progressService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'progress.label', default: 'Progress'), id])

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "") {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def list() {
        prepareParams()
        def result = commonQueryService.listFunction(params)
        result = processResult(result, params)
        def view = result.view
        flash.message = result.message
        if (request.xhr) {
            render(template: view, model: [objectList: result.objectList, flash: flash])
        } else {
            respond result.objectList
        }
    }

    def count() {
        prepareParams()
        def count = commonQueryService.countFunction(params)
        def result = [count: count]

        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    protected void prepareParams() {}

    protected def processResult(result, params) {
        return result
    }

    def importFromJsonFile() {

        def fileName = "${commonService.webRootPath}/${params.fileName}"
        def objectList = commonService.importObjectListFromJsonFileName(fileName, Progress.class)
        if (objectList.size() > 0) {
            // 先清空
            Progress.list().each { e ->
                progressService.delete(e.id)
            }
            objectList.each { e ->
                progressService.save(e)
            }
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "") {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def exportToJsonFile() {

        def fileName = "${commonService.webRootPath}/${params.fileName}"

        def fjson = commonService.exportObjects2JsonString(Progress.list())
        def printer = new File(fileName).newPrintWriter('utf-8')    //写入文件
        printer.println(fjson)
        printer.close()

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "") {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'progress.label', default: 'Progress'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
