<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <g:importsWeb/>
        <title>NTH</title>

        <style type="text/css" media="screen">
        * {
            margin  : 0;
            padding : 0;
        }

        ul li {
            display : inline;
        }

        .wide {
            border-bottom : 1px #000 solid;
            width         : 4000px;
        }

        .selected {
            border     : solid 1px #9932cc;
            background : #d8bfd8;
        }

        </style>

        <link rel="stylesheet" href="estilosIdiomas.gsp" type="text/css" />

    </head>

    <body style="${(pagina.layout?.css != null) ? pagina.layout?.css : ''}">
        <div>
            <g:if test="${pagina.layout.banner}">
                <div class="banner"
                     style="position:absolute;top:${pagina.layout.banner.top};left:${pagina.layout.banner.izq};width:${pagina.layout.banner.width};height:${pagina.layout.banner.height}; ${pagina.layout.banner.css}">
                    <g:if test="${pagina.layout?.banner.foto}">
                        ${ig.img(["src": g.createLink(action: 'showImage', controller: 'image', id: pagina.layout?.banner?.foto?.id), "alt": pagina.layout?.banner?.foto?.caption, "title": pagina.layout?.banner?.foto?.caption, "thumbnailSrc": g.createLink(action: 'showImage', controller: 'image', id: pagina.layout?.banner?.foto?.id, params: [thumbnail: false])])}
                    </g:if>
                    <g:if test="${pagina.layout.banner.contenido}">
                        <g:mostrarSeccion id="${pagina.layout.banner.id}" idioma="${session.idioma.id}"
                                          tipo="Borrador"></g:mostrarSeccion>
                    </g:if>
                </div>
            </g:if>
            <g:if test="${pagina.layout.menu}">
                <div class="menu"
                     style="position:absolute;top:${pagina.layout.menu.top};left:${pagina.layout.menu.izq};width:${pagina.layout.menu.width};height:${pagina.layout.menu.height}; ${pagina.layout.menu.css}">
                    <g:mostrarMenuPag tipo="web" actual="${pagina.id}"></g:mostrarMenuPag>
                </div>
            </g:if>

            <g:if test="${pagina.layout.idioma}">
                <div class="idioma"
                     style="position:absolute;top:${pagina.layout.idioma.top};left:${pagina.layout.idioma.izq};width:${pagina.layout.idioma.width};height:${pagina.layout.idioma.height}; ${pagina.layout.idioma.css}">
                    <g:mostrarIdiomas tipo="pagina" layout="${pagina?.layout?.id}"
                                      pagina="${pagina.id}"/>
                </div>
            </g:if>

            <div class="contendido"
                 style="position:absolute;top:${pagina.layout.contenido.top};left:${pagina.layout.contenido.izq};width:${pagina.layout.contenido.width};height:${pagina.layout.contenido.height}; ${pagina.layout.contenido.css}">

            </div>
            <g:each in="${pagina.secciones}" var="seccion">
                <g:mostrarSeccion id="${seccion.id}" idioma="${session.idioma.id}" pagina="${pagina.id}" tipo="Borrador"></g:mostrarSeccion>
            </g:each>
        </div>

        <g:if test="${pagina.layout.css =~ 'center'}">
            <script type="text/javascript">
                $(function () {
                    var pantalla = $(document).width();

                    var banner = ${pagina?.layout?.banner?.width};
                    var menu = ${pagina?.layout?.menu?.width};
                    var contenido = ${pagina?.layout?.contenido?.width};

                    var max = Math.max(banner, menu, contenido);

                    var margen = (pantalla - max) / 2;

                    //console.log($("body").children().first().children("div"));


                    $("body").children().first().children("div").css("left", parseInt(margen));

                    //console.log(pantalla + " " + banner + " " + menu + " " + contenido + " ----- " + max + "   >>>  " + margen);
                });
            </script>
        </g:if>
    </body>
</html>
