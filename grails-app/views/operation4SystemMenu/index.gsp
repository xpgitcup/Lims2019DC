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
    <g:set var="entityName" value="SystemMenu"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/system/${entityName}.js"/>
</head>

<body>
<div class="container-cup">
    <div class="row-cup">
        <div class="col-md-6 column">
            <div class="panel panel-default">
                <div class="nav">
                    <div class="easyui-panel" style="width: 100%">
                        <ul>
                            <li>
                                <a class="list">
                                    系统菜单维护——(重新登录后，更新)
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div id="operation4SystemMenuDiv" class="easyui-panel">
                </div>
            </div>
        </div>

        <div class="col-md-6 column">
            <div class="panel panel-default">
                <div class="nav" role="navigation">
                    <div class="easyui-panel" style="width: 100%">
                        <ul>
                            <li><a class="create" href="javascript: createSystemMenu(0)">新建根节点</a></li>
                            <li><a id="createSystemMenu" class="create" href="#">新建子节点</a></li>
                            <li><a id="exportSystemMenu" href="operation4SystemMenu/exportToJsonFile?fileName=config/out/systemMenu.json"
                                   class="save">导出Json文件</a></li>
                        </ul>
                    </div>
                </div>

                <div class="easyui-panel">
                    <div id="showSystemMenuDiv"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
