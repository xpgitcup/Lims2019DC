<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/23
  Time: 11:04
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="DataRootPath"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/system/${entityName}.js"/>
</head>

<body>
<div class="easyui-panel">
    <div class="nav">
        <ul id="operation4DataRootPathUl" class="indicator-cup">
            <li></li>
            <li>
                <a href="operation4DataRootPath/exportToJsonFileName?fileName=config/out/DataRootPathS" class="save">阿里导出Json文件</a>
            </li>
            <li>
                <a href="operation4DataRootPath/exportToJsonFile?fileName=config/out/DataRootPath.json" class="save">导出Json文件</a>
            </li>
            <li>
                <a href="operation4DataRootPath/importFromJsonFile?fileName=config/DataRootPath.json" class="create">从Json文件导入</a>
            </li>
            <li>
                <a id="filter" href="javascript: listToDo()">待编辑&完成</a>
            </li>
            <li>当前筛选条件</li>
            <li id="currentFilter" style="color: red">${keyString}</li>
            <li>
                <a href="javascript: clearFilter()">清除筛选条件</a>
            </li>
            <li>
                <g:form onsubmit="return queryStatement()">
                    <label>关键字</label>
                    <input type="text" id="keyString" name="keyString" value=""/>
                    <input type="submit" name="查询" value="查询">
                </g:form>
            </li>
        </ul>
    </div>
</div>

<div id="operation4DataRootPathDiv" class="easyui-panel"></div>

<g:if test="${flash.message}">
    <div class="easyui-panel"><div class="message" role="status">${flash.message}</div></div>
</g:if>

</body>
</html>