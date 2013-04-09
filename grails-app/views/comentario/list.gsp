
<%@ page import="nth.Comentario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'comentario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'comentario.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="mail" title="${message(code: 'comentario.mail.label', default: 'Mail')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'comentario.url.label', default: 'Url')}" />
                        
                            <g:sortableColumn property="texto" title="${message(code: 'comentario.texto.label', default: 'Texto')}" />
                        
                            <th><g:message code="comentario.foto.label" default="Foto" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${comentarioInstanceList}" status="i" var="comentarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${comentarioInstance.id}">${fieldValue(bean: comentarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "mail")}</td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "url")}</td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "texto")}</td>
                        
                            <td>${fieldValue(bean: comentarioInstance, field: "foto")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${comentarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
