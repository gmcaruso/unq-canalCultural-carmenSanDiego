package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Expediente {
	
	List<Villano> villanos = newArrayList;
	Villano villanoSeleccionado
	
	new() {
		fabricarVillanos
	}
	
	def agregarVillano(Villano villanoAAgregar) {
//		if(villanoExiste(villanoAAgregar.nombre)) throw new UnsupportedOperationException("El villano que intenta ingresar ya existe.")
//		else{
			villanos.add(villanoAAgregar)	
//		}
//		ObservableUtils.firePropertyChanged(this, "villanos", this.villanos);
	}

	def actualizarVillano(Villano villanoAAgregar) {

		villanos.add(villanoAAgregar)
		ObservableUtils.firePropertyChanged(this, "villanos", this.villanos);
	}
	
	def quitarVillano(Villano unVillano){
		villanos.remove(unVillano)
	}

	def villanoExiste(String nombre) {
		villanos.exists[unVillano|nombre.equalsIgnoreCase(unVillano.nombre)]
	}
	
//	def buscarVillanoEnLaColeccion(String nombreDelVillano) {
//		var villanoBuscado = new Villano
//		villanoBuscado.nombre = "buscarVillanoEnLaColeccion no encontro a nadie"
//		for (Villano unVillano : this.villanos) {
//			if(nombreDelVillano.equalsIgnoreCase(unVillano.nombre)) villanoBuscado = unVillano
//		}
//		villanoBuscado
//	}
	
	def fabricarVillanos(){
		var senias = newArrayList
		var hobbies = newArrayList
		
		senias.add("Gordo")
		senias.add("Alto")
		hobbies.add("Tenis")
		hobbies.add("Comer")
		
		var villano1 = new Villano("Pepe", "Masculino", senias, hobbies)
		var villano2 = new Villano("Carlita", "Femenino", senias, hobbies)
		
		this.villanos.add(villano1)
		this.villanos.add(villano2)
	}
	
}