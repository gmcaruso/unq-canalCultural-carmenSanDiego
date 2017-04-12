package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Villano extends Persona {
	
	String nombre
    String sexo
    List <String> senasParticulares = newArrayList
    List <String> hobbies = newArrayList
	
	override responder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def agregarSenaParticular(String senaParticular){		
		
		this.senasParticulares.add(senaParticular)
		
	}
	
	
	def editar(String nombre, String sexo, java.util.List<String> senasParticulares, java.util.List<String> hobbies) {
		this.nombre = nombre
		this.sexo = sexo
		this.senasParticulares = senasParticulares
		this.hobbies = hobbies
	}
	
 
				
}