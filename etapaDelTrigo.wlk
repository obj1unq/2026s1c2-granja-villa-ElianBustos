
object  etapa0{


	method esCosechable(){
	    return false
    }

    method image() {
        return "wheat_0.png"
    }

    method siguienteEtapa() {
		return etapa1
	}
    method costo() {
        return 0
    }

}

object  etapa1{

	method siguienteEtapa() {
		return etapa2
	}

	method esCosechable(){
	    return false
    }

    method image() {
        return "wheat_1.png"
    }
    method costo() {
        return 0
    }


}
object  etapa2{

	method siguienteEtapa() {
		return etapa3
	}

	method esCosechable(){
	    return true
    }

    method image() {
        return "wheat_2.png"
    }

    method costo() {
        return 2
    }

}


object  etapa3{
	method siguienteEtapa() {
		return etapa0
	}


	method esCosechable(){
	    return true
    }

    method image() {
        return "wheat_3.png"
    }

    method costo() {
        return 3
    }


}


