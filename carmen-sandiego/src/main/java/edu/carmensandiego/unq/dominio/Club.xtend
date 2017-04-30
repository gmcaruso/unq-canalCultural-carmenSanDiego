package edu.carmensandiego.unq.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Club extends Lugar {
	
	new(Persona laPersona) {
		super("Club", laPersona)
	}
	
	new() {
		super("Club", null)
	}
	
}