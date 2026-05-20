import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"


	method sembrar(semilla) {
		// if(self.noHayPlanta(semilla))
		semilla.sembrar()
		

	}
	method hayPlanta(semilla) {
		return (semilla.position() == position)
	}

	method cosechar() {
		
	}

	method regar(semilla) {
		if(self.hayPlanta(semilla)){
			semilla.regar()
		}else{
			game.say(self, "no tengo nada para regar")
		}
	}

	method vender() {
		
	}

}