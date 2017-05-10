package edu.carmensandiego.unq.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Biblioteca extends Lugar {
	
	new(Persona persona) {
		super("Biblioteca", persona)
	}
	
}