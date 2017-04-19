package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Informante extends Persona {
	
	String miPista;
	
	new(String nuevaPista){
		miPista = nuevaPista;
	}
	
	new() {
		super()
	}
	
	override darPista() {

		miPista
	}
	
}