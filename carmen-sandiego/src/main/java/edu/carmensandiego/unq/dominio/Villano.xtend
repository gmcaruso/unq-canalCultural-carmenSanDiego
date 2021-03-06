package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Villano extends Persona {
	String nombre
    String sexo
    List<String> seniasParticulares = newArrayList
    List<String> hobbies = newArrayList
    
    new(String nombre, String sexo, List<String> senias, 
    	List<String> hobbies) {
		this.nombre = nombre
		this.sexo = sexo
		this.seniasParticulares = senias
		this.hobbies = hobbies
	}
	
	new() {
	}
	
	override darPista(Lugar lugar) {
	}
	
	def agregarNuevaSenia(String seniaAAgregar) {
		if(seniasParticulares.contains(seniaAAgregar)) {
			throw new UnsupportedOperationException("La senia que intenta agregar ya existe")
		}
		seniasParticulares.add(seniaAAgregar)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", this.seniasParticulares);
	}
	
	def eliminarSenia(String seniaAEliminar) {
		seniasParticulares.remove(seniaAEliminar)
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", this.seniasParticulares);
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
	
}