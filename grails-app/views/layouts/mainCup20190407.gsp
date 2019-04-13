<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/4/7
  Time: 20:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <!--设置Base-->
    <base href="<%=basePath%>"/>

    <asset:stylesheet src="application.css"/>

    <!-- 只有加载这个样式，才能实现全屏显示 -->
    <!--asset:stylesheet src="bootstrap/css/bootstrap.css"/-->
    <asset:stylesheet src="bootstrap.min.css"/>

    <!--引入easyui的相关内容-->
    <asset:stylesheet src="easyui/themes/default/easyui.css"/>
    <!--asset:stylesheet src="easyui/themes/bootstrap/easyui.css"/-->
    <asset:stylesheet src="easyui/themes/icon.css"/>
    <asset:stylesheet src="easyui/themes/color.css"/>

    <!-- 加载石油大学的设置-->
    <asset:stylesheet src="cup/cup20190407.css"/>

    <!--JS加载-->
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="easyui/jquery.min.js"/>
    <asset:javascript src="easyui/jquery.easyui.min.js"/>

    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery/jquery.cookie.js"/>

    <!-- 加载石油大学的设置-->
    <asset:javascript src="cn/edu/cup/common.js"/>
    <asset:javascript src="cn/edu/cup/commonUI20190206.js"/>
    <asset:javascript src="cn/edu/cup/os/home.js"/>

    <g:layoutHead/>
</head>

<body>

<div class="container-cup">
    <div class="row-cup">

        <div class="col-md-4 column">
            <div class="nav">
                <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main")?.logo}" alt="程序Logo"/>
                <div class="application-title">
                    ${cn.edu.cup.basic.Caption.findByName("main")?.title}
                </div>
            </div>
        </div>

        <div class="col-md-7 column">
            <g:if test="${session.systemUser}">
                <div id="applicationMenuDiv" class="application-menus"></div>
            </g:if>
            <g:else>
                <div class="application-message">
                    请先登录！
                </div>
            </g:else>
        </div>

        <div class="col-md-1 column">
            <ul class="application-status">
                <g:if test="${session.systemUser}">
                    <li>
                        当前：${session.systemUser.personName()}
                    </li>
                    <li>
                        <a href="${createLink(uri: '/home/changePasswordUI')}">修改密码</a>
                    </li>
                    <li>
                        <a href="${createLink(uri: '/home/logout')}">退出</a>
                    </li>
                </g:if>
                <g:else>
                    <li>
                        <a href="${createLink(uri: '/home/loginUI')}">去登录</a>
                    </li>
                </g:else>
            </ul>
        </div>

    </div>

</div>

<g:layoutBody/>

<div class="nav">
    <div class="col-md-6 column">
        <div class="application-copyright">
            中国石油大学（北京），Copyright 2019, Ver 0.9
        </div>
    </div>

    <div class="col-md-6 column">
        <div id="onlineCount" class="application-footer"></div>
    </div>
</div>

<!--asset:javascript src="application.js"/-->

</body>
</html>