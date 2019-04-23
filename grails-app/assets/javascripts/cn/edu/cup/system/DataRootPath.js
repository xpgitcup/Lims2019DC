var operation4DataRootPathDiv;
var jsTitleDataRootPath = "根路径配置";
var title4DataRootPath = [jsTitleDataRootPath]
var localPageSizeDataRootPath = 5;

$(function () {
    console.info(jsTitleDataRootPath + "......");

    operation4DataRootPathDiv = $("#operation4DataRootPathDiv");
    var settings = {
        divId: operation4DataRootPathDiv,
        titles: title4DataRootPath,
        pageSize: localPageSizeDataRootPath,
        pageList: [1, 3, 5, 10],
        loadFunction: loadDataRootPath,
        countFunction: countDataRootPath
    }

    configDisplayUI(settings);
});

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4DataRootPath/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

/*
* 查询
* */
function DataRootPath() {
    var keyString = document.getElementById("keyString");
    //alert("查询..." + keyString.value);
    console.info("查询..." + keyString.value);
    $.cookie("filter", true);
    $.cookie("keyString", keyString.value);
    //$("#currentFilter").html(keyString.value);
    location.reload();
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(jsTitleDataRootPath + "+待完成......");
    $.cookie("filter", true);
    location.reload();
}

/*
* 清除过滤条件
* */
function clearFilter() {
    $.cookie("filter", "");
    $.cookie("keyString", "");
    //$("#filter").html("待编辑&完成");
    console.info("?????清除....")
    //ajaxExecute("operation4DataRootPath/clearFilter") //不好使！！
    location.reload();
}

/*
* 附加参数
* */
function appendParam() {
    var filter = false
    filter = readCookie("filter", false);
    var keyString = readCookie("keyString", "")
    console.info("过滤状态：" + filter + " " + keyString);
    var param = ""
    if (filter) {
        if (keyString) {
            param = "&keyString=" + keyString;
            $("#currentFilter").html(keyString)
        } else {
            param = "&filter=true"
        }
    }
    console.info("附加参数：" + param);
    return param
}

/*
* 统计函数
* */
function countDataRootPath(title) {
    console.info(jsTitleDataRootPath + "+统计......");
    var total = ajaxCalculate("operation4DataRootPath/count?key=" + title + appendParam());
    return total
}

/*
* 数据加载函数
* */
function loadDataRootPath(title, page, pageSize) {
    console.info(jsTitleDataRootPath + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4DataRootPath/list" + params + "&key=" + title + appendParam(), 0, "list" + title + "Div");
}