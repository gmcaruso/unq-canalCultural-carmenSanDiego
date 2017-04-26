package edu.carmensandiego.unq.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Biblioteca extends Lugar {
	
	new(Persona laPersona) {
		super("Biblioteca", laPersona)
	}
	
	new() {
		super("Biblioteca", null)
	}
	
}