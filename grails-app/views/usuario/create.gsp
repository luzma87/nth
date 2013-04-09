<%@ page import="nth.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
    </head>

    <body>
        <div class="nav" style="margin: 10px;">
            <span class="menuButton"><g:link class="list" action="list">Lista</g:link></span>
        </div>

        <div class="body">
            <h1>Crear usuario</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
                <div class="errors">
                    <g:renderErrors bean="${usuarioInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form action="save" name="frmUsu">
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sitio"><g:message code="usuario.sitio.label" default="Sitio"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'sitio', 'errors')}">
                                    <g:select name="sitio.id" from="${nth.Sitio.list()}" optionKey="id" value="${usuarioInstance?.sitio?.id}" noSelection="['null': '']"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="usuario.nombre.label" default="Nombre"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" class="required" minlength="3" maxlength="40" value="${usuarioInstance?.nombre}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido"><g:message code="usuario.apellido.label" default="Apellido"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'apellido', 'errors')}">
                                    <g:textField name="apellido" class="required" minlength="3" maxlength="40" value="${usuarioInstance?.apellido}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login"><g:message code="usuario.login.label" default="Login"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'login', 'errors')}">
                                    <g:textField name="login" class="required" minlength="8" maxlength="15" value="${usuarioInstance?.login}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pass"><g:message code="usuario.pass.label" default="Pass"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'pass', 'errors')}">
                                    <input type="password" name="pass" id="pass" class="required" minlength="3"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pass2">Verifique <g:message code="usuario.pass.label" default="Pass"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'pass', 'errors')}">
                                    <input type="password" name="pass2" equalTo="#pass" class="required" minlength="3"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="usuario.email.label" default="Email"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" class="required email" minlength="6" maxlength="50" value="${usuarioInstance?.email}"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Guardar"/></span>
                </div>
            </g:form>
        </div>

        <script type="text/javascript">
            $(function () {
                $("#frmUsu").validate({
                    errorElement: "div"
                });
            });
        </script>

    </body>
</html>
