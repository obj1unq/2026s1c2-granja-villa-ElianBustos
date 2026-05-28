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
            posiciones.forEach({ posicion =>self.regarEnPosicion(posicion)})

        })
    }


    

    method regarEnPosicion(posicion) {
        if(self.posicionValida(posicion)){
            self.regarPlanta(posicion)
        }
    }

    	method regarPlanta(posicion) {
            if(self.hayPlanta(posicion)) {
                self.planta(posicion).regar()
            }

            
			
	}



    	method posicionValida(posicion) {
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

	method hayPlanta(posicion) {
		return !self.plantaEnPosicionAspersor(posicion).isEmpty()
	}

	method planta(posicion) {
		return self.plantaEnPosicionAspersor(posicion).first()
	}

}