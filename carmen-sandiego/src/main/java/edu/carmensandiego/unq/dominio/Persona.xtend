package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Persona {
	def abstract String darPista(Lugar lugar);
}