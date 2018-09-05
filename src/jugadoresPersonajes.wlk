object luisa {
	var personajeActivo = noHayPersonaje
}

object castillo{
	var defensa = 150

	method altura(){ return 20 }
	
	method recibirAtaque(potencia){
		defensa -= potencia
	}
	
	method recibirTrabajo(){
			defensa += (defensa + 20).min(200)
	}
	
	method valorQueOtorga(){
		return self.estadoDeLaDefensa() / 5
		
	}
	
	method estadoDeLaDefensa(){
		return defensa
	}
}

object ballesta{
	
	var cargador = 10
	var flecha = 4
	
	method valorDeLaFlecha(){
		return flecha
	}
	method potencia(){
		return self.valorDeLaFlecha() 
	}
	
	
	method registrarUso(){
		cargador -= 1
	}
	
	method recargar(){
		cargador -= 1
	}
	
	method estaCargada(){
		return cargador >= 1
		
	}
}

object jabalina{
	var cargada = true
	var potencia = 30
	
	method registrarUso(){
		cargada = false
	}
	method recargar(){
		cargada = true
	}
	method potencia(){
		return potencia
	}
	
	method estaCargada(){
		return cargada
	}
}

object aurora {
//	var altura = 1
	var live = true
	
	method recibirAtaque(potencia){
		if(potencia > 10) live = false
	}

	method valorQueOtorga(){ return 15 }
	
	method recibirTrabajo(){ }
	
}

object tipa{
	var altura = 8
	
	method verAltura(){
		return altura
	}
	method valorQueOtorga(){ return altura * 2 }
	
	method recibirTrabajo(){ altura += 1  }
	
}

object floki {
	var arma = ballesta
	
	method encontrar(elemento) {
	    if (arma.estaCargada()) {
	        elemento.recibirAtaque(arma.potencia()) 
	        arma.registrarUso()
	    }
	}
}


object mario {
	var valorRecolectado = 15
	var ultimoEncontrado 
	
	method encontrar(elemento) {
	    valorRecolectado += elemento.valorQueOtorga()
	    elemento.recibirTrabajo()
	   ultimoEncontrado = elemento
	}
	
	method esFeliz(){ return valorRecolectado  >= 50 }
	
	method estadoDelValor(){
		return valorRecolectado
	}
	
}


object noHayPersonaje {
	// no hace falta ponerle ningún método, es solamente para marcarle a Luisa que no tiene ningún personaje activo
}