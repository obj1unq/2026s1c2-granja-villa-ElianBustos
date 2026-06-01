import wollok.game.*
import estadoCultivo.*
import personaje.*
import etapaDelTrigo.*



class Aspersor {
	var property position = game.at(0,0)

    method image() {
        return "aspersor.png"
    }


    method regarPlantas() {
        const aspersor = new Aspersor(position = personaje.position())
        game.addVisual(aspersor)
        aspersor.activar()
   
    }

    method activar() {
            game.onTick(1000, "Regar", {
            const posiciones = [position.up(1),
                                position.down(1),
                                position.left(1),
                                position.right(1),
                                position.up(1).left(1),
                                position.down(1).right(1),
                                position.left(1).down(1),
                                position.right(1).up(1)]
            posiciones.forEach({ posicion =>self.regarEnPosicionSiPuede(posicion)})

        })
    }


    

    method regarEnPosicionSiPuede(posicion) {
        if(self.esPosicionValida(posicion)){
            self.regarPlantaEnLaPosicion(posicion)
        }
    }

    	method regarPlantaEnLaPosicion(posicion) {
            if(self.hayPlantaAqui(posicion)) {
                self.plantaEnPosicion(posicion).regar()
            }

            
			
	}



    	method esPosicionValida(posicion) {
		  return posicion.x() >= 0 && posicion.y() >= 0 &&  posicion.x() < game.width() && posicion.y() < game.height()
        }

    method esPlanta() {
		return false
	}

        method esMercado() {
        return false
    }
//-----------------------------------------

	method objetosEnPosicion(posicion) {
		return game.getObjectsIn(posicion)
	}

    	method plantaEnPosicionAspersor(posicion) {
		return self.objetosEnPosicion(posicion).filter({ obj => obj.esPlanta() })
	}

	method hayPlantaAqui(posicion) {
		return !self.plantaEnPosicionAspersor(posicion).isEmpty()
	}

	method plantaEnPosicion(posicion) {
		return self.plantaEnPosicionAspersor(posicion).first()
	}

}