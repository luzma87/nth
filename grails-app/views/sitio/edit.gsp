<%@ page import="nth.Sitio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'sitio.label', default: 'Sitio')}"/>
        <title><g:message code="default.edit.label" args="[entityName]"/></title>
    </head>

    <body>
        <div class="nav" style="margin: 10px;">

            <span class="menuButton"><g:link class="list" action="list">Lista de sitios</g:link></span>
            %{--<span class="menuButton"><g:link class="create" action="create">Nuevo sitio</g:link></span>--}%
        </div>

        <div class="body">
            <h1>Editar sitio</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sitioInstance}">
                <div class="errors">
                    <g:renderErrors bean="${sitioInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form method="post">
                <g:hiddenField name="id" value="${sitioInstance?.id}"/>
                <g:hiddenField name="version" value="${sitioInstance?.version}"/>
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="sitio.nombre.label" default="Nombre"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sitioInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="20" value="${sitioInstance?.nombre}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizacion"><g:message code="sitio.organizacion.label" default="Organizacion"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sitioInstance, field: 'organizacion', 'errors')}">
                                    <g:textField name="organizacion" maxlength="60" value="${sitioInstance?.organizacion}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contacto"><g:message code="sitio.contacto.label" default="Contacto"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sitioInstance, field: 'contacto', 'errors')}">
                                    <g:textField name="contacto" maxlength="100" value="${sitioInstance?.contacto}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="sitio.telefono.label" default="Telefono"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sitioInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" maxlength="10" value="${sitioInstance?.telefono}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono">Principal</label>
                                </td>
                                <td valign="top">
                                    <g:select from="[0: 'No', 1: 'Si']" name="principal" optionKey="key" optionValue="value"
                                              value="${sitioInstance?.principal}"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Guardar"/></span>
                    <g:if test="${nth.Sitio.count() > 1 && sitioInstance.principal == 0}">
                        <span class="button"><g:actionSubmit class="delete" action="delete" value="Eliminar" onclick="return confirm('Está seguro de querer eliminar este sitio?');"/></span>
                    </g:if>
                </div>
            </g:form>
        </div>
    </body>
</html>
