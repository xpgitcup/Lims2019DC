<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/3
  Time: 14:22
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainCup20190407"/>
    <title>Home</title>
</head>

<body>

<div align="center" class="container-fluid">
    <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main详细介绍")?.logo}"/>
</div>

<div class="container-fluid">
    <h1>完成度${pfc}%</h1>
    <table>
        <thead>
        <th>控制器</th>
        <th>状态</th>
        </thead>
        <tbody>
        <g:each in="${controllers}" var="item" status="i">
            <tr>
                <td>${item.key}</td>
                <td>${item.value}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>