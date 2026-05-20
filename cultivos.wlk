import wollok.game.*
import estadoCultivo.*
import personaje.*



class Maiz {
	var property estado = bebe
	const granjero = personaje
	var property position = granjero.position() 

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.maiz()
	}

	method sembrar() {
		game.addVisual(new Maiz())
	}
	
	method regar() {
		// if(not(estado.esCosechable()))
			estado = adulto
	}

	
}


class Trigo {
	var property estado = bebe
	const granjero = personaje
	var property position = granjero.position() 

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}


	method sembrar() {
		game.addVisual(new Trigo())
	}

	method cosechar() {
		
	}

	method crecer() {
		
	}

	method costo() {
		return 
	}
}


class Tomate {
	var property estado = bebe
	const granjero = personaje
	var property position = granjero.position() 

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.tomate()
	}

	
	method sembrar() {
		game.addVisual(new Tomate())
	}

	method regar() {
		if(not(estado.esCosechable()))
			estado = adulto
	}
}



/*

	test "hector siembra y cosecha un maiz"{
	
	setup

		cosnt maiz = new maiz();
		hector.position(game.at(5,5))
		//
		hector.sembrar(maiz)
		assert.notThat(maiz.esCosechable())
		hector.regar()
		assert.that(maiz.esCosechable())// mala practica envidia de atributos, buscar
		hector.cosechar()
		//si esta vacia
		assert.that(hector.cosecha.conyains(maiz))
	
	}













*/

















