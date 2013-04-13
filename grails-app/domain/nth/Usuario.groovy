package nth

class Usuario {

    Sitio sitio
    Integer tipo = 0
    String nombre
    String apellido
    String login
    String pass
    String email
    Date fecha = new Date()

    String estado = "A"

    static constraints = {
        sitio(nullable: true, blank: true)
        tipo(blank: false, nullable: false)
        nombre(blank: false, nullable: true, size: 3..40)
        apellido(blank: false, nullable: false, size: 3..40)
        login(blank: false, nullable: false, size: 8..15, unique: true)
        pass(blank: false, nullable: false, size: 1..255)
        email(blank: false, nullable: false, size: 6..50)
        fecha(blank: false, nullable: false)
        estado(blank: true, nullable: true)
    }

    static mapping = {
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'

        table 'usro'
        id column: 'usro__id'
        sitio column: 'stio__id'
        tipo column: 'usrotipo'
        nombre column: 'usronmbr'
        apellido column: 'usroapll'
        login column: 'usrolgin'
        pass column: 'usropssw'
        email column: 'usroemail'
        fecha column: 'usrofcha'
        estado column: 'usroetdo'
    }

    String toString() {
        return this.nombre
    }
}
