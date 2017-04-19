package edu.carmensandiego.unq.dominio

class Club extends Lugar {
	
	new(Persona laPersona) {
		super("Club", laPersona)
	}
	
	new() {
		super("Club", null)
	}
	
}