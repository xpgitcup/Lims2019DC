package cn.edu.cup.lims

import cn.edu.cup.basic.Person

import java.sql.Timestamp

class Progress {

    def commonService

    Progress prevProgress
    String currentStatus
    String problemEncounter
    String supportFileName
    Person contributor
    Date regDate = new Date()

    static belongsTo = [team: Team]

    static constraints = {
        prevProgress(nullable: true)
        currentStatus(nullable: false)
        problemEncounter(nullable: true)
        supportFileName(nullable: true)
        contributor(nullable: false)
        regDate()
    }

    String toString() {
        return "${team}.${regDate}.${currentStatus}"
    }

    Boolean checkSupportFile() {
        if (this.supportFileName.isEmpty()) {
            return true
        } else {
            def fileName = commonService.dataRootPath
            + "/documents/${this.id}${this.supportFileName}"
            def file = new File(fileName)
            return file.exists()
        }
    }

}
