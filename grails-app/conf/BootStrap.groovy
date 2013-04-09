import nth.Idioma
import nth.Propiedades
import nth.TipoPagina
import nth.Usuario
import nth.Frase

class BootStrap {

    def init = { servletContext ->
        def su = Usuario.findByLogin("valentinsvt")
        if (!su) {
            println "creando usuario"
            su = new Usuario()
            su.nombre = "Valentin"
            su.apellido = "Zapata"
            su.login = "valentinsvt"
            su.sitio = null
            su.email = "valentinsvt@hotmail.com"
            su.pass = "123456".encodeAsMD5()
            su.save(flush: true)
        }
        def es = new Idioma()
        if (Idioma.list().size() == 0) {
            println "No hay idiomas, creando español e ingles por default..."
            es.abreviacion = 'es'
            es.nombre = 'Español'
            es.save(flush: true)

            def en = new Idioma()
            en.abreviacion = 'en'
            en.nombre = 'English'
            en.save(flush: true)
        } else {
            es = Idioma.findByAbreviacion("es")
        }

//        def frasesGb = Frase.findAllByIdiomaAndTipoIlike(es, "gb%")
//        if (frasesGb.size() == 0) {
//            def fNombre = new Frase()
//            fNombre.frase = "Nombre"
//            fNombre.idioma = es
//            fNombre.estado = "Publicado"
//            fNombre.tipo = "gb_Nombre"
//            fNombre.orden = 1
//            fNombre.tags = "nombre"
//            fNombre.save(flush: true)
//
//            def fImagen = new Frase()
//            fImagen.frase = "Imagen"
//            fImagen.idioma = es
//            fImagen.estado = "Publicado"
//            fImagen.tipo = "gb_Imagen"
//            fImagen.orden = 2
//            fImagen.tags = "foto"
//            fImagen.save(flush: true)
//
//            def fComentario = new Frase()
//            fComentario.frase = "Comentario"
//            fComentario.idioma = es
//            fComentario.estado = "Publicado"
//            fComentario.tipo = "gb_Comentario"
//            fComentario.orden = 3
//            fComentario.tags = "texto"
//            fComentario.save(flush: true)
//
//            def fBotonSave = new Frase()
//            fBotonSave.frase = "Guardar"
//            fBotonSave.idioma = es
//            fBotonSave.estado = "Publicado"
//            fBotonSave.tipo = "gb_Boton_Guardar"
//            fBotonSave.save(flush: true)
//
//            def fBotonCancelar = new Frase()
//            fBotonCancelar.frase = "Cancelar"
//            fBotonCancelar.idioma = es
//            fBotonCancelar.estado = "Publicado"
//            fBotonCancelar.tipo = "gb_Boton_Cancelar"
//            fBotonCancelar.save(flush: true)
//
//            def fTitulo = new Frase()
//            fTitulo.frase = "Nuevo comentario"
//            fTitulo.idioma = es
//            fTitulo.estado = "Publicado"
//            fTitulo.tipo = "gb_Titulo"
//            fTitulo.save(flush: true)
//
//            def fBotonAgregar = new Frase()
//            fBotonAgregar.frase = "Nuevo comentario"
//            fBotonAgregar.idioma = es
//            fBotonAgregar.estado = "Publicado"
//            fBotonAgregar.tipo = "gb_Boton_Agregar"
//            fBotonAgregar.save(flush: true)
//
//             def fAnonimo = new Frase()
//            fAnonimo.frase = "Anónimo"
//            fAnonimo.idioma = es
//            fAnonimo.estado = "Publicado"
//            fAnonimo.tipo = "gb_Anonimo"
//            fAnonimo.save(flush: true)
//        }


        if (TipoPagina.list().size() == 0) {
            println "No hay tipos de pagina, creando principal y secundaria"
            def pr = new TipoPagina()
            pr.nombre = "Principal"
            pr.descripcion = "Página principal normal"
            pr.save(flush: true)

            def sc = new TipoPagina()
            sc.nombre = "Secundaria"
            sc.descripcion = "Página sin menú ni banner, para contenidos"
            sc.save(flush: true)
        }

        if (Propiedades.list().size() == 0) {
            println "No hay propiedades....deberia llenar la tabla..."
            def pathD = servletContext.getRealPath("/") + "backups/"
            def fileName
            new File(pathD).eachFileMatch(~/.*.bck/) { file ->
                fileName = file.name
            }

            def path = servletContext.getRealPath("/") + "backups/" + fileName
            def cont = 0
            def props
            def err = 0

            new File(path).eachLine { line ->
                if (cont > 0) {
                    if (cont == 1) {
                        props = line.split("\\^")
                    } else {
                        if (line.trim() != "") {
                            def campos = line.split("\\^")
                            def ints = ["id", "orden"]
                            def obj = new Propiedades()
                            println cont
                            props.eachWithIndex { prop, i ->
                                if (prop != "id") {
                                    if (ints.contains(prop)) {
                                        println prop + ": " + campos[i].toInteger() + " (int)"
                                        obj[prop] = campos[i].toInteger()
                                    } else {
                                        println prop + ": " + (campos[i]).trim() + " (no int)"
                                        obj[prop] = (campos[i]).trim()
                                    }
                                } //prop <> id
                            } //each prop
                            obj.save(flush: true)
                            if (obj.errors.errorCount > 0) {
                                err++
                            }
                            println obj.errors
                            print "\n"
                        } // if line.trim != ""
                    } // contt > 1
                } //cont > 0
                cont++
            } //eachLine
            if (err > 0) {
                println "OCURRIERON " + err + " ERRORES!!!!!"
            }
        } // llenar propiedades
    } //init
    def destroy = {
    }
}
