<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/4/15
  Time: 20:57
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
<!-- end 实现可定制的布局 -->
    <title>调试界面</title>
</head>

<body>
<div class="container-cup">
    <div class="easyui-panel">
        <table>
            <tbody>
            <g:each in="${objectList}" var="item" status="i">
                <tr>
                    <g:each in="${item}" var="e" status="j">
                        <td>${e}</td>
                    </g:each>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>