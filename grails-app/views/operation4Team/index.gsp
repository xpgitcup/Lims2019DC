<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<!--meta name="layout" content="main"/-->
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
    <g:set var="entityName" value="Team"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="container-cup">
    <div class="easyui-panel">
        <div class="nav">
            <ul class="indicator-cup">
                <li id="currentCase">${currentCase}</li>
                <li>操作指示：</li>
                <li id="currentTask">${currentTask}</li>
                <li>==></li>
                <li>选择任务</li>
                <li>==></li>
                <li>完成任务</li>
                <li></li>
                <li></li>
                <li class="icon-help">&nbsp&nbsp&nbsp&nbsp：</li>
                <li><a id="tipsOperation4Team"></a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container-cup">
    <div class="row-cup">
        <div class="col-6">
            <div class="easyui-panel" title="可选：${currentTask}">
                <div id="operation4TeamDiv" class="easyui-panel"></div>
            </div>
        </div>

        <div class="col-6">
            <div class="easyui-panel" title="已选：${currentTask}">
                <div id="operation4TeamRightDiv" class="easyui-panel"></div>
            </div>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>

</body>
</html>
