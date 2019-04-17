<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/15
  Time: 18:48
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
    <title>调试界面</title>
</head>

<body>

<div class="container-cup">
    <div class="row-cup">
        <div class="easyui-panel" style="width: 100%">
            <g:form controller="operation4QueryStatement" action="debug">
                <fieldset class="form">
                    <label>HQL</label>
                    <g:textArea name="hql" style="width: 80em"></g:textArea>
                </fieldset>

                <fieldset class="buttons">
                    <input class="save" type="submit" value="执行"/>
                    <a href="operation4QueryStatement/index">返回</a>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>