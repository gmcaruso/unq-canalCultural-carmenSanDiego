package edu.carmensandiego.unq.dominio

class Biblioteca extends Lugar {
	
	new(Persona laPersona) {
		super("Biblioteca", laPersona)
	}
	
	new() {
		super("Biblioteca", null)
	}
	
}