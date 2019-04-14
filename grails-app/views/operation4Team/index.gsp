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
    <g:set var="entityName" value="UserServiceTeam"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="container-cup">
    <div class="easyui-panel">
        <div class="nav">
            <ul class="indicator-cup">
                <li>操作指示：</li>
                <li>==></li>
                <li>选择任务</li>
                <li>==></li>
                <li>完成任务</li>
            </ul>
        </div>
    </div>
</div>

<div class="container-cup">
    <div class="row-cup">
        <div class="col-6">
            <div class="easyui-panel" title="可选：${currentTask}">
                <table>
                    <thead>
                    <th>项目</th>
                    </thead>
                    <tbody>
                    <g:each in="${taskList.objectList}" var="item" status="i">
                        <tr>
                            <td>${item.name}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

                <div class="paginationGrails">
                    <g:paginate total="${taskListCount}"/>
                </div>
            </div>

        </div>

        <div class="col-6">
            <div class="easyui-panel" title="已选：${currentTask}">

            </div>
        </div>
    </div>
</div>
</body>
</html>
