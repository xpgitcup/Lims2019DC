<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/4/19
  Time: 21:49
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
    <g:set var="entityName" value="ProjectPlan"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="container-cup">
    <div class="easyui-panel">
        <div class="nav">
            <ul class="indicator-cup">
                <li id="currentTeam">当前团队：${currentTeam}</li>
                <li id="currentTeamId">${currentTeam?.id}</li>
                <li>||</li>
                <li>操作指示：</li>
                <li><a id="createProjectPlan" href="#">上传进度</a></li>
                <li>||</li>
                <li></li>
                <li><a id="fileToProjectPlan" href="#">归档到</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container-cup">
    <div class="row-cup">
        <div class="col-4">
            <div class="easyui-panel" title="当前阶段：${currentTask}">
                <div id="operation4ProjectPlanDiv" class="easyui-panel"></div>
            </div>
        </div>

        <div class="col-8">
            <div class="easyui-panel">
                <div id="operation4ProjectPlanRightDiv" class="easyui-panel"></div>
            </div>
        </div>
    </div>
</div>

<div class="container-cup">
    <div id="operation4ProjectPlanNeedToFile" class="easyui-panel"></div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>

</body>
</html>