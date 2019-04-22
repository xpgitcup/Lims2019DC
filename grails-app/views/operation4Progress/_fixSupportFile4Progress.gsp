<!DOCTYPE html>
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
    <g:set var="entityName" value="${message(code: 'progress.label', default: 'Progress')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-progress" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.progress}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.progress}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:uploadForm id="${this.progress.id}" action="doFixSupportFile" controller="${params.controller}" method="POST">
        <fieldset class="form">
            <!--f:all bean="progress"/-->
            <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'currentStatus', 'error')} required">
                <label for="currentStatus">
                    <g:message code="progress.currentStatus.label" default="本次进展"/>
                    ${this.progress?.currentStatus}
                    <span class="required-indicator">*</span>
                </label>

            </div>

            <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'supportFileName', 'error')} ">
                <label for="supportFileName">
                    <g:message code="progress.supportFileName.label" default="支撑文件"/>
                </label>
                <!--g:textField name="supportFileName" value="${this.progress?.supportFileName}"/-->
                <input type="text" name="supportFileName" id="supportFileName"
                       value="${this.progress?.supportFileName}"/>
                <input type="file" name="uploadedFile" id="uploadedFile" onchange="updateUploadFileName(this.value)"/>
            </div>

            <!---------------->
            <g:hiddenField name="nextController" value="${params.nextController}"/>
            <g:hiddenField name="nextAction" value="${params.nextAction}"/>
            <g:hiddenField name="url" value=""/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:uploadForm>
</div>
</body>
</html>
