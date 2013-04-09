<html>
    <head>
        <title><g:layoutTitle default="Grails"/></title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'nth.jpeg')}" type="image/x-icon"/>
        <script type="text/javascript" src="${resource(dir: 'js/jquery/js', file: 'jquery-1.4.2.min.js')}"></script>

        <script type="text/javascript" src="${resource(dir: 'js/jquery/plugins/validation', file: 'jquery.validate.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/jquery/plugins/validation/localization', file: 'messages_es.js')}"></script>

        <script type="text/javascript"
                src="${resource(dir: 'js/jquery/js', file: 'jquery-ui-1.8.5.custom.min.js')}"></script>

        <style type="text/css">
        .menuButton {
            border  : solid 1px #999;
            padding : 3px;
        }

        .menuButton:hover {
            background : #ddd;
        }

        .error {
            color : #BF5D5D;
        }
        </style>

        <g:layoutHead/>
        <g:javascript library="application"/>
    </head>

    <body>
        <g:layoutBody/>
    </body>
</html>