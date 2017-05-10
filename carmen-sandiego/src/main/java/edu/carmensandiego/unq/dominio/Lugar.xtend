package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Lugar {
	
	String nombre
	Persona persona
	
	new(String nombre, Persona persona) {
		this.nombre = nombre
		this.persona = persona
	}
}