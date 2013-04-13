package nth

class GuestbookController {
//este si
    def index = { }

    def config = {

        if (!session.idioma) {
            session.idioma = Idioma.get(1)
        }

        def seccion = Seccion.get(params.id)
        def comentarios = Comentario.findAllBySeccionAndEstado(seccion, "Publicado", [sort: 'fecha', order: 'desc'])

        def esp = Idioma.findByAbreviacion("es")
//        def frasesEsp = Frase.findAllByIdiomaAndTipoIlike(esp, "gb%", [sort: "orden"])
//        def frases = Frase.findAllByIdiomaAndTipoIlike(session.idioma, "gb%", [sort: "orden"])

        def c = Frase.createCriteria()
        def frasesEsp = c.list {
            and {
                eq("idioma", esp)
                eq("seccion", seccion)
                ilike("tipo", "gb%")
            }
            order("orden", "asc")
        }

        c = Frase.createCriteria()
        def frases = c.list {
            and {
                eq("idioma", session.idioma)
                eq("seccion", seccion)
                ilike("tipo", "gb%")
            }
            order("orden", "asc")
        }

        def nop = ["gb_Titulo", "gb_Boton_Guardar", "gb_Boton_Cancelar", "gb_Boton_Agregar", "gb_Anonimo"]

        def ul = "<table border='1' style=' color:white;'>"
        ul += "<thead>"
        ul += "<tr>"
        ul += "<th width='130'>Campo</th>"
        ul += "<th width='300'>Etiqueta</th>"
        ul += "<th width='30'>Orden</th>"
        ul += "</tr>"
        ul += "<thead>"

        ul += "<tbody>"
        if (frases.size() == 0) {
            frasesEsp.each { frase ->
                ul += "<tr>"
                ul += "<td>"
                def parts = frase.tipo.split("_")
                parts.eachWithIndex { p, i ->
                    if (i > 0) {
                        ul += p + " "
                    }
                }
                ul += "</td>"
                ul += "<td class='editable' id='-1' tipo='" + frase.tipo + "' tag='" + frase.tags + "'>&nbsp;</td>"
                if (!nop.contains(frase.tipo)) {
                    ul += "<td class='editable order'>"
                    ul += frase.orden
                    ul += "</td>"
                } else {
                    ul += "<td>"
                    ul += "&nbsp;"
                    ul += "</td>"
                }
                ul += "</tr>"
            }
        } else {
            frases.each { frase ->
                ul += "<tr>"
                ul += "<td>"
                def parts = frase.tipo.split("_")
                parts.eachWithIndex { p, i ->
                    if (i > 0) {
                        ul += p + " "
                    }
                }
                ul += "</td>"
                ul += "<td class='editable' id='" + frase.id + "' tipo='" + frase.tipo + "' tag='" + frase.tags + "'>" + frase.frase + "</td>"
                if (!nop.contains(frase.tipo)) {
                    ul += "<td class='editable order'>"
                    ul += frase.orden
                    ul += "</td>"
                } else {
                    ul += "<td>"
                    ul += "&nbsp;"
                    ul += "</td>"
                }
                ul += "</tr>"
            }
        }
        ul += "</tbody>"
        ul += "</table>"

        return [ul: ul, comentarios: comentarios, seccion: seccion]
    }

    def saveConfig = {
        println "saveconfig "+params
        def ids = ""
        def error = false

        def seccion = Seccion.get(params.seccion)

        params.item.each { item ->
            def parts = item.split("\\^")
            println "parts "+parts
            if (parts.size() == 5) {
                def id = parts[0].trim()
                def tipo = parts[1].trim()
                def txt = parts[2].trim()
                def orden = parts[3].trim()
                def tag = parts[4].trim()

                if (orden == "") {
                    orden = 1
                }

                def frase = new Frase()
                if (id != "" && id != " ") {
                    if (id != "-1" && id != -1) {
                        frase = Frase.get(id.toLong())
                        println "update frase " + id + "   " + txt+"  "+frase
                    } else {
                        println "create frase " + txt
                    }
                    frase.frase = txt
                    frase.tipo = tipo
                    frase.orden = orden.toInteger()
                    frase.tags = tag
                    frase.estado = "Publicado"
                    frase.idioma = session.idioma
                    frase.seccion = seccion

                    if (frase.save(flush: true)) {
                        ids += frase.id + ","
                    } else {
                        error = true
                        println "ERROR!!!! " + frase.errors
                    }
                }
            } //if parts.size = 3
        } // each
        if (error) {
            render("ERROR")
        } else {
            render("OK")
        }
    }

    def deleteComment = {
        def com = Comentario.get(params.id)

        if (com.delete()) {
            render("OK")
        } else {
            render("ERROR")
        }
    }

    def saveComment = {

//        println params
//        println session.sitio.nombre
//        println "\n"

        def pagina = Pagina.get(params.pagina.id)

        def comentario = new Comentario()
        comentario.nombre = params.nombre
        comentario.texto = params.texto
        comentario.seccion = Seccion.get(params.seccion.id)
        comentario.estado = "Publicado"
        comentario.fecha = new Date()

        if (comentario.save(flush: true, failOnError: true)) {

            //handle uploaded file
            def uploadedFile = request.getFile('foto')
            if (!uploadedFile.empty) {
//                println "Class: ${uploadedFile.class}"
//                println "Name: ${uploadedFile.name}"
//                println "OriginalFileName: ${uploadedFile.originalFilename}"
//                println "Size: ${uploadedFile.size}"
//                println "ContentType: ${uploadedFile.contentType}"

                def webRootDir = servletContext.getRealPath("/")
                def userDir = new File(webRootDir, "/fotos/${session.sitio.nombre}/${pagina.nombre}")
                userDir.mkdirs()

                def nom = uploadedFile.originalFilename
                def pnom = nom.split("\\.")
                def ext = pnom[pnom.size() - 1]
                nom = ""
                pnom.eachWithIndex { p, i ->
                    if (i < pnom.size() - 1) {
                        nom += p
                    }
                }

                nom += "_" + comentario.id + "." + ext
                uploadedFile.transferTo(new File(userDir, nom))
                comentario.foto = nom
//                println "nom: " + nom
                comentario.save(flush: true, failOnError: true)
            }


            redirect(controller: "paginaWeb", action: "show", params: [pagina: pagina.nombre, sitio: session.sitio.nombre])

//            def seccion = Seccion.get(params.seccion.id)
//
//            def comentarios = Comentario.findAllBySeccionAndEstado(seccion, "Publicado", [sort: 'fecha', order: 'desc'])
//            def str = ""
//
//            comentarios.each { com ->
//                str += com.display()
//            }
//
//            render(str)
        }
        else {
            render("ERROR")
        }
    }
}
