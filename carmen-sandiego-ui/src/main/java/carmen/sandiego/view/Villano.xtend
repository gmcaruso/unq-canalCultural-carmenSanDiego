package carmen.sandiego.view

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class Villano extends Persona {
	
	String nombre
    String sexo
    List<String> seniasParticulares = newArrayList
    List<String> hobbies = newArrayList
    
    def hola(){
    	"Hola"
    }
	
	override darPista() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
		def cambiarNombreDelVillano(String nuevoNombre) {
		nombre = nuevoNombre
		ObservableUtils.firePropertyChanged(this, "nombre", this.nombre);
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
	
	
	//def editar(String nombre, String sexo, java.util.List<String> senasParticulares, java.util.List<String> hobbies) {
	//	this.nombre = nombre
	//	this.sexo = sexo
	//	this.senasParticulares = senasParticulares
	//	this.hobbies = hobbies
	//}
	
 
				
}