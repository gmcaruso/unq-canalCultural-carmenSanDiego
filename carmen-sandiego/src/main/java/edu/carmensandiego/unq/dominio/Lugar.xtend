package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Lugar {
	
	String nombreLugar
	Persona persona
	
		new(String nombreL, Persona laPersona) {
		this.nombreLugar = nombreL
		this.persona = persona
	}
	
	def String darPista(){
		this.persona.darPista
	}
	
	
	override equals(Object objeto) {
		var resultado = false
		if(objeto != null) {
			resultado = (this.nombreLugar == (objeto as Lugar).nombreLugar)
		}
		return resultado
	}
}