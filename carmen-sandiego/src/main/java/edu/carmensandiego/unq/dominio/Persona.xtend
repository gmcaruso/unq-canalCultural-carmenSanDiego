package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Persona {
	
    String pista;
    Pais ubicacion
	
	def abstract String darPista();
	
}