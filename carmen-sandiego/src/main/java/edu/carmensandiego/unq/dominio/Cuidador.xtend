package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Cuidador extends Persona {
	
	override darPista(Lugar lugar) {
		"Te haz equivocado de país! Mejor vuelve por donde viniste"
	}
	
}