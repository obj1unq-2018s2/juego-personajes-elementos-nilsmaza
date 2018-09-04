object luisa {
	var personajeActivo = noHayPersonaje
}

object castillo{
	var altura = 20 //metros
	var defensa = 150
	
	method recibirAtaque(arma){
		defensa -= arma.potencia()
	}
	
	method recibirTrabajo(){
		if(defensa.min(200) ){
			defensa +=self.estadoDeLaDefensa() / 5
		}
	}
	
	method estadoDeLaDefensa(){
		return defensa
	}
}

object ballesta{
	
	var cargada = true
	var cargador = 10
	var flecha = 4
	
	method valorDeLaFlecha(){
		return flecha
	}
	method potencia(){
		return self.valorDeLaFlecha() 
	}
	
	
	method registrarUso(){
		cargada = false
	}
	
	method recargar(){
		cargador -= 1
		cargada = true
	}
	
	method estaCargada(){
		return cargada
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
	var altura = 1
	var live = true
	
	method recibirAtaque(arma){
		if(arma.Potencia() > 10) live = false
	}

}

object tipa{
	var altura = 8
	
	method verAltura(){
		return altura
	}
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
	var valorRecolectado = 0
	
	method encontrar(elemento) {
	    valorRecolectado += elemento.valorQueOtorga()
	    elemento.recibirTrabajo()
	    // ... acá hay que agregar una línea ...
	}
	
	method estadoDelValor(){
		return valorRecolectado
	}
	
}


object noHayPersonaje {
	// no hace falta ponerle ningún método, es solamente para marcarle a Luisa que no tiene ningún personaje activo
}