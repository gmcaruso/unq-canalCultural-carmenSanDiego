package edu.carmensandiego.unq.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Banco extends Lugar {
	
	
	new(Persona laPersona) {
		super("Banco", laPersona)
	}
	
	new() {
		super("Banco", null)
	}
	
		
}