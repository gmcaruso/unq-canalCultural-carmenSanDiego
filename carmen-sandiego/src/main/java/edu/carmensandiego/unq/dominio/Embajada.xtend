package edu.carmensandiego.unq.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Embajada extends Lugar {
	
	new(Persona laPersona) {
		super("Embajada", laPersona)
	}
	
	new() {
		super("Embajada", null)
	}
	
}