package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

abstract class Persona {
	
@Accessors	
    String pista;
	
	def abstract String darPista();
	
}