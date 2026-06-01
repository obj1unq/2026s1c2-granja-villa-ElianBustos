import wollok.game.*
import estadoCultivo.*
import personaje.*
import etapaDelTrigo.*



class Mercado {
	var property position = game.at(0,0)
    var monedas = 0
    const mercancia = []


	method monedas() {
		return monedas
	}

	method monedas(_monedas) {
		monedas = _monedas
	}

    method image() {
      return  "market.png"
    }

    method vender(_mercancia,vendedor) {
        if(self.suficienteDinero(_mercancia)){
            mercancia.addAll(_mercancia)
            vendedor.reciveMonedas( self.totalDeDinero(mercancia))
            self.descontarMonedas(_mercancia)
            vendedor.vaciarCosecha()

            }

    }

    method descontarMonedas(_mercacia) {
        monedas -= self.totalDeDinero(_mercacia)
    }

    method suficienteDinero(_mercancia) {
        return monedas >= self.totalDeDinero(_mercancia)
    }

	method totalDeDinero(_mercancia) {
		return _mercancia.sum({ planta => planta.costo()})
	}
    method esPlanta() {
		return false
	}

    method esMercado() {
        return true
    }
}