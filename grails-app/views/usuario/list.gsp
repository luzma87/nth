<%@ page import="nth.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}"/>
        <title><g:message code="default.list.label" args="[entityName]"/></title>
    </head>

    <body>
        <div class="nav" style="margin: 10px;">
            <span class="menuButton">
                <g:link class="create" action="create" name="btnUsu">Nuevo Usuario</g:link>
            </span>
        </div>

        <div class="body">
            <h1>Usuarios</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="login" title="${message(code: 'usuario.login.label', default: 'Login')}"/>
                            <th><g:message code="usuario.sitio.label" default="Sitio"/></th>
                            <g:sortableColumn property="tipo" title="${message(code: 'usuario.tipo.label', default: 'Tipo')}"/>
                            <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}"/>
                            <g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}"/>
                            <g:sortableColumn property="estado" title="${message(code: 'usuario.estado.label', default: 'Estado')}"/>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "login")}</g:link></td>
                                <td>${fieldValue(bean: usuarioInstance, field: "sitio")}</td>
                                <td>${fieldValue(bean: usuarioInstance, field: "tipo")}</td>
                                <td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
                                <td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
                                <td>${usuarioInstance.estado == 'A' ? 'Activo' : 'Desactivado'}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate total="${usuarioInstanceTotal}"/>
            </div>
        </div>

        <script type="text/javascript">
            $(function () {

            });
        </script>

    </body>
</html>
