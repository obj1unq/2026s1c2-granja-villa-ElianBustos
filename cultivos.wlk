import wollok.game.*
import estadoCultivo.*
import personaje.*
import etapaDelTrigo.*



class Maiz {
	var property estado = bebe
	var property position = game.at(0,0)

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.maiz()
	}
	method cosechar() {
		game.removeVisual(self)
	}

	method esCosechable() {
		return estado.esCosechable()
	}

	method sembrar() {
			game.addVisual(new Maiz(position= personaje.position()))

	}
	
	method regar() {
			estado = adulto
	}
	
	method costo() {
		return 150
	}

	method esPlanta() {
		return true
	}

	
	    method esMercado() {
        return false
    }
	
}


class Trigo {
	var property etapaDelTrigo = etapa0
	var property position = game.at(0,0)

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return etapaDelTrigo.image()
	}


	method sembrar() {
		game.addVisual(new Trigo(position= personaje.position()))

	}

	method cosechar() {

		game.removeVisual(self)
	
	}

	
	method esCosechable() {
		return etapaDelTrigo.esCosechable()
	}

	method regar() {
	
	etapaDelTrigo = etapaDelTrigo.siguienteEtapa()

	}

	

	method costo() {
		return (etapaDelTrigo.costo() - 1) * 100
	}

	method esPlanta() {
		return true
	}

	
	    method esMercado() {
        return false
    }

	
}


class Tomate {
	var property estado = bebe
	var property position = game.at(0,0)

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.tomate()
	}

	
	method sembrar() {
			game.addVisual(new Tomate(position= personaje.position()))

	}

	method regar() {
		estado = adulto
		self.crecerTomate()


	}

	
	method esCosechable() {
		return  true
	}

	method cosechar() {
		game.removeVisual(self)
	}

	method crecerTomate() {
		if(self.estaEnElBorde()){
		position = position.down(game.height() -1)
		}else{ 
		position=position.up(1)
		}
	}

	method estaEnElBorde() {
		return game.width() - 1 == position.y()
	}

		method esPlanta() {
		return true
	}

	method costo() {
		return 80
	}

	    method esMercado() {
        return false
    }
}
















