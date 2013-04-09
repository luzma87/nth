package nth

class PaginaWebController {
//este si
    def index = { }

    def show = {
        /* todo sitio??? */
        println "show " + params
        if (params.idioma) {
            def idioma = Idioma.get(params.idioma)
            session.idioma = idioma
            println "\n\nCAMBIADO EL IDIOMA A " + idioma
        }

        if (!session.idioma)
            session.idioma = Idioma.findByAbreviacion("es")
        def sitio = Sitio.findByNombre(params.sitio)
        if (sitio)
            session.sitio = sitio
        else {
            sitio = Sitio.findByPrincipal(1)
            if (!sitio)
                response.sendError(404)
        }


        def pagina = Pagina.findByNombreAndSitio(params.pagina, sitio)
        println "pagina " + pagina
        session.pagina = pagina

        def tipo = TipoPagina.findByPagina(pagina)
        def pags = []
        if (tipo) {
            if (!params.id) {
                pags = Pagina.findAllByTipoPagina(tipo)
            }
        }
        if (pagina)
            [pagina: pagina, pags: pags]
        else
            response.sendError(404)
    }

    def showContenido = {
        println "show cont " + params
        if (!session.idioma)
            session.idioma = Idioma.get(6)
        def pagina = Pagina.get(params.id)
        if (pagina)
            [pagina: pagina]
        else
            response.sendError(404)
    }

}
