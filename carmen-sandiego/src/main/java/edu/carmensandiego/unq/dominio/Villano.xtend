package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class Villano extends Persona {
	
	String nombre
    String sexo
    List<String> senasParticulares = newArrayList
    List<String> hobbies = newArrayList
    
    new(String nombre) {
		this.nombre = nombre
		this.senasParticulares = newArrayList
		this.hobbies = newArrayList
	}
	
	new() {
		this.senasParticulares = newArrayList
		this.hobbies = newArrayList
		}
	
	override darPista() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
		def cambiarNombreDelVillano(String nuevoNombre) {
		nombre = nuevoNombre
		ObservableUtils.firePropertyChanged(this, "nombre", this.nombre);
	}
	
		def agregarNuevaSenia(String seniaAAgregar) {
		if(senasParticulares.contains(seniaAAgregar)) {
			throw new UnsupportedOperationException("La senia que intenta agregar ya existe")
		}
		senasParticulares.add(seniaAAgregar)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", this.senasParticulares);
	}
	
		def eliminarSenia(String seniaAEliminar) {
		senasParticulares.remove(seniaAEliminar)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", this.senasParticulares);
	}
	
		def agregarNuevoHobbie(String hobbieNuevo) {
		if(hobbies.contains(hobbieNuevo)) {
			throw new UnsupportedOperationException("El Hobbit que intenta agregar ya existe")
		}
		hobbies.add(hobbieNuevo)
		ObservableUtils.firePropertyChanged(this, "hobbies", this.hobbies);
	}

	def eliminarHobbie(String hobbieARemover) {
		hobbies.remove(hobbieARemover)
		ObservableUtils.firePropertyChanged(this, "hobbies", this.hobbies);

	}
	
	def hola() {
		"Hola"
	}
	
	
	//def editar(String nombre, String sexo, java.util.List<String> senasParticulares, java.util.List<String> hobbies) {
	//	this.nombre = nombre
	//	this.sexo = sexo
	//	this.senasParticulares = senasParticulares
	//	this.hobbies = hobbies
	//}
	
 
				
}