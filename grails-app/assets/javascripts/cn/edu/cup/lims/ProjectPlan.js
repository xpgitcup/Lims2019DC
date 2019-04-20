var operation4ProjectPlanDiv;
var jsTitle = "当前阶段";
var title4ProjectPlan = [jsTitle];
var isTreeView4ProjectPlan = [true];
var treeData4ProjectPlan;
var currentTeamId;

var operation4ProjectPlanRightDiv;
var title4ProjectPlanRight = "当前进度"

var operation4ProjectPlanNeedToFile;
var titleNeedToFile = "待归档"
var titleNeedToFiles = [titleNeedToFile]

var localPageSizeProjectPlan = 10;

$(function () {
    console.info("进度维护...")

    operation4ProjectPlanDiv = $("#operation4ProjectPlanDiv");
    currentTeamId = $("#currentTeamId").html();
    treeData4ProjectPlan = ["operation4ProjectPlan/getTreeViewData?currentTeam=" + currentTeamId];

    // 左侧，计划表
    var settings = {
        divId: operation4ProjectPlanDiv,
        titles: title4ProjectPlan,
        // 有关树形结构的设置
        isTreeView: isTreeView4ProjectPlan,
        treeData: treeData4ProjectPlan,
        treeNodeDoSomeThing: projectPlanNodeSelect, //当节点被选择
        paginationMessage: "",
        pageList: [],
        showPageList: false,
        loadFunction: loadProjectPlan,
        countFunction: countProjectPlan
    }
    configDisplayUI(settings);

    // 下面，待归档进度表

    operation4ProjectPlanNeedToFile = $("#operation4ProjectPlanNeedToFile");

    var settingsBottom = {
        divId: operation4ProjectPlanNeedToFile,
        titles: titleNeedToFiles,
        tabsTitle: titleNeedToFile,
        pageSize: localPageSizeProjectPlan,
        pageList: [1, 3, 5, 10],
        paginationMessage: "",
        loadFunction: loadProjectPlan,
        countFunction: countProjectPlan
    }
    configDisplayUI(settingsBottom);


});


/*
* 显示节点信息
* */
function showProjectPlan(node) {
    console.info(jsTitle + "+节点显示......" + node);
    if (node) {
        var id = node.attributes[0];
        ajaxRun("operation4ProjectPlan/show", id, "showProjectPlanDiv");
    }
}

/*
* 节点被选择。。。
* */
function projectPlanNodeSelect(node) {
    console.info(jsTitle + "+节点选择......" + node);
    showProjectPlan(node);
    $("#createProjectPlan").attr('href', 'javascript: createProjectPlan(' + node.attributes[0] + ')');
    console.info(node);
    console.info("当前节点：" + node.target.id);
    $.cookie("currentProjectPlan", node.target.id);
}

/*
* 统计函数
* */
function countProjectPlan(title) {
    console.info(jsTitle + "+统计......");
    var total = ajaxCalculate("operation4projectPlan/count?key=" + title + "&currentTeam=" + currentTeamId);
    return total
}

/*
* 数据加载函数
* */
function loadProjectPlan(title, page, pageSize) {
    console.info(jsTitle + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4ProjectPlan/list" + params + "&key=" + title + "&currentTeam=" + currentTeamId, 0, "list" + title + "Div");
}