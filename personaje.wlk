import aspersor.*
import wollok.game.*

object personaje {
	var property   position = game.at(5,5)
	const property image = "fplayer.png"
	const plantasCosechadas = []
	var monedas = 0



	method plantasCosechadas() {
		return plantasCosechadas
	}

	method plantasCosechadas(_plantas) {
		plantasCosechadas.addAll(_plantas)
	}

	


	method monedas() {
		return monedas
	}

	method monedas(_monedas) {
		monedas = _monedas
	}
	


	method sembrar(semilla) {
		semilla.sembrar()
		

	}

//-----------------------------------------

	method objetosEnPosicion() {
		return game.getObjectsIn(self.position())
	}

	method plantaEnPosicionPersonaje() {
		return self.objetosEnPosicion().filter({ obj => obj.esPlanta() })
	}

	method hayPlanta() {
		return !self.plantaEnPosicionPersonaje().isEmpty()
	}

	method planta() {
		return self.plantaEnPosicionPersonaje().first()
	}

//----------------------------------------------------

	method cosechar() {
		if(self.hayPlanta()) {
			self.cosechar(self.planta())
		}
	}

	method cosechar(planta) {
		self.validarSiHayPlanta(planta)
		self.cosecharPlanta(planta)

	}

	method	cosecharPlanta(planta) {
		if(planta.esCosechable()){
			planta.cosechar()
			self.guardarPlanta(planta)
			}
	}

	method guardarPlanta(planta) {
		plantasCosechadas.add(planta)
	}
//----------------------------------------------

	method regar() {
		if(self.hayPlanta()) {
			self.regar(self.planta())
		}
	}
	method regar(planta) {
		self.validarSiHayPlanta(planta)
		self.regarPlanta(planta)
	}


	method regarPlanta(planta) {
			planta.regar()
	}
	method validarSiHayPlanta(planta) {
		
		if(!self.hayPlanta()){
				self.error("No tengo planta para hacer algo ")
		}
	}

//---------------------------------------------------------

	method vender() {
		if(self.hayMercado()) {
			self.vender(self.mercado())
		}
	}

	method vender(mercado) {
		if(!self.hayPlantas()){
		mercado.vender(plantasCosechadas,self)
		}
	}

	method hayPlantas() {
		return plantasCosechadas.isEmpty()
	}

	method vaciarCosecha() {
		plantasCosechadas.clear()

	}

	method reciveMonedas(_monedas) {
		monedas += _monedas
	}




	method info() {
    		game.say(self, "Tengo " + monedas + " monedas y " + plantasCosechadas + " plantas para vender")
	}
//--------------------------------------------------------------


		method esPlanta() {
		return false
	}

	
	    method esMercado() {
        return false
    }

	//-----------------------------

	method colocarAspersor(aspersor){
		aspersor.regarPlantas()
	}

	//------------------------------

	method mercadoEnPosicionPersonaje() {
		return self.objetosEnPosicion().filter({ obj => obj.esMercado() })
	}



	method hayMercado() {
		return !self.mercadoEnPosicionPersonaje().isEmpty()
	}

	method mercado() {
		return self.mercadoEnPosicionPersonaje().first()
	}


}

