<%@ page import="nth.Sitio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'sitio.label', default: 'Sitio')}"/>
        <title><g:message code="default.show.label" args="[entityName]"/></title>
    </head>

    <body>
        <div class="nav" style="margin: 10px;">
            <span class="menuButton"><g:link class="list" action="list">Lista</g:link></span>
            %{--<span class="menuButton"><g:link class="create" action="create">Nuevo sitio</g:link></span>--}%
        </div>

        <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sitio.nombre.label" default="Nombre"/></td>

                            <td valign="top" class="value">${fieldValue(bean: sitioInstance, field: "nombre")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sitio.organizacion.label" default="Organizacion"/></td>

                            <td valign="top" class="value">${fieldValue(bean: sitioInstance, field: "organizacion")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sitio.contacto.label" default="Contacto"/></td>

                            <td valign="top" class="value">${fieldValue(bean: sitioInstance, field: "contacto")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sitio.telefono.label" default="Telefono"/></td>

                            <td valign="top" class="value">${fieldValue(bean: sitioInstance, field: "telefono")}</td>

                        </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${sitioInstance?.id}"/>
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Editar"/></span>
                    <g:if test="${nth.Sitio.count() > 1 && sitioInstance.principal == 0}">
                        <span class="button"><g:actionSubmit class="delete" action="delete" value="Eliminar" onclick="return confirm('Está seguro de querer eliminar este sitio?');"/></span>
                    </g:if>
                </g:form>
            </div>
        </div>
    </body>
</html>
