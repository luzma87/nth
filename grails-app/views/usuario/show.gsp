<%@ page import="nth.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}"/>
        <title><g:message code="default.show.label" args="[entityName]"/></title>
    </head>

    <body>
        <div class="nav" style="margin: 10px;">
            <span class="menuButton"><g:link class="list" action="list">Lista</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Nuevo usuario</g:link></span>
            <span class="menuButton"><g:link class="edit" action="edit" id="${usuarioInstance.id}">Editar</g:link></span>
        </div>

        <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.sitio.label" default="Sitio"/></td>

                            <td valign="top" class="value"><g:link controller="sitio" action="show" id="${usuarioInstance?.sitio?.id}">${usuarioInstance?.sitio?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.nombre.label" default="Nombre"/></td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nombre")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.apellido.label" default="Apellido"/></td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "apellido")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.login.label" default="Login"/></td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "login")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.email.label" default="Email"/></td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "email")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.fecha.label" default="Fecha"/></td>

                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.fecha}"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.estado.label" default="Estado"/></td>

                            <td valign="top" class="value">${usuarioInstance.estado == 'A' ? 'Activo' : 'Desactivado'}</td>

                        </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${usuarioInstance?.id}"/>
                %{--<span class="button"><g:actionSubmit class="edit" action="edit" value="Editar"/></span>--}%
                    <g:if test="${session.usuario.id == usuarioInstance?.id && nth.Usuario.countByEstado('A') > 1}">
                        <span class="button"><g:actionSubmit class="delete" action="delete" value="Eliminar" onclick="return confirm('Está seguro de querer eliminar este usuario?');"/></span>
                    </g:if>
                </g:form>
            </div>
        </div>
    </body>
</html>
