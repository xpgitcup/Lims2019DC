<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--设置布局模板-->
    <meta name="layout" content="mainCup20190407"/>
    %{--浏览器标签上的标题-kq--}%
    <title>${cn.edu.cup.basic.Caption.findByName("main")?.title}</title>
    %{--浏览器标签上的图标-kq--}%
    <asset:link rel="icon" href="cup/${cn.edu.cup.basic.Caption.findByName("main").logo}" type="image/x-ico"/>
    <!-- 设置标题，如果没有特殊情况，标题叫这样了。 -->
    <g:set var="entityName" value="Lims2019CB"/>
</head>

<body>

<div class="container-fluid">
    <div align="center">
        <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main详细介绍")?.logo}"/>
    </div>
</div>

<div id="content" role="main" class="container-fluid">
    <section class="row colset-2-its">
        <h1>${cn.edu.cup.basic.Caption.findByName("main详细介绍")?.title}</h1>

        <g:if test="${flash}">
            <h1>${flash.message}</h1>
        </g:if>

        <p>
            ${cn.edu.cup.basic.Caption.findByName("main详细介绍")?.description}
        </p>

        <div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>

    </section>
</div>

</body>
</html>
