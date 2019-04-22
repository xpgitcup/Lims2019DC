package cn.edu.cup.operation

import cn.edu.cup.lims.Progress
import cn.edu.cup.lims.ProgressController
import cn.edu.cup.lims.ProjectPlan

import java.text.SimpleDateFormat

class Operation4ProgressController extends ProgressController {

    def doFixSupportFile() {

        println("更新文件 ${params}")
        def progress = progressService.get(params.id)
        progress.supportFileName = params.supportFileName
        progressService.save(progress)

        uploadFile(params, progress)

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

    def fixSupportFile(Long id) {

        println("${params}")

        def view = "fixSupportFile4Progress"
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

    def createNextProgress() {
        def prevProgress = progressService.get(params.prevProgress)
        def currentProjectPlan = ProjectPlan.get(params.currentProjectPlan)
        def myself = session.systemUser.person()
        def progress
        if (prevProgress) {
            progress = new Progress(
                    team: prevProgress.team,
                    prevProgress: prevProgress,
                    contributor: myself
            )
            setupDate(prevProgress, progress)
        } else {
            progress = new Progress(
                    team: currentProjectPlan.team,
                    contributor: myself
            )
        }
        def view = "createProgress"
        if (request.xhr) {
            render(template: view, model: [progress: progress, needToDo: params.needToDo])
        } else {
            respond progress
        }
    }

    private void setupDate(Progress prevProgress, Progress progress) {
        Date prev = prevProgress.regDate
        Date now = progress.regDate
        def dif = (now.getTime() - prev.getTime()) / 1000 / 60
        println("时间差：${dif}")
        if (dif < 1) {
            def year = prevProgress.regDate[Calendar.YEAR]
            def month = prevProgress.regDate[Calendar.MONTH]
            def day = prevProgress.regDate[Calendar.DATE]
            def hour = prevProgress.regDate[Calendar.HOUR_OF_DAY]
            def minute = prevProgress.regDate[Calendar.MINUTE] + 1
            println("时间没有错开！${year} ${month} ${day} ${hour} ${minute}")
            //progress.regDate = new Date(year: year, month: month, date: day, hours: hour, minutes: minute)    //不对--完全是乱的
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm")
            progress.regDate = df.parse("${year}-${month + 1}-${day} ${hour}:${minute}")    // 月份+1
            println("修正后的时间：${progress.regDate}")
        } else {
            println("两个时间：${prevProgress.regDate} ${prevProgress.regDate}")
        }
    }

    def index() {}
}
