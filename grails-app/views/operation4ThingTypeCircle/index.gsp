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
    <g:set var="entityName" value="ThingTypeCircle"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="nav">
    <div class="easyui-panel" style="width: 100%; padding-top: 15px">
        <div class="col-12">
            <ul id="operation4ThingTypeCircleUl">
                <li>
                    <g:form controller="operation4ThingTypeCircle" action="save">
                        <label>任务</label>
                        <g:textField name="thingType" value="" id="thingType"/>
                        <label>人员</label>
                        <g:textField name="personTitle" value="" id="personTitle"/>
                        <g:submitButton name="create"/>
                    </g:form>
                </li>
            </ul>
        </div>
    </div>
</div>


<div id="operation4ThingTypeCircleDiv" class="easyui-panel"></div>

<div id="edit4ThingTypeCircleDiv">
    <div class="container-cup">
        <div class="row-cup">
            <div class="col-md-6">
                <div class="easyui-panel">
                    <h1>任务类型</h1>
                    <hr>
                    <ul class="easyui-tree" id="thingTypeTree"></ul>
                </div>
            </div>

            <div class="col-md-6">
                <div class="easyui-panel">
                    <h1>人员类型</h1>
                    <hr>
                    <ul class="easyui-tree" id="personTitleTree"></ul>
                </div>
            </div>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel"><div class="message" role="status">${flash.message}</div></div>
</g:if>

</body>
</html>
