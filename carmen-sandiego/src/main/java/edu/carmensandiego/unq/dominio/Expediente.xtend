package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.ObservableUtils

@Accessors
class Expediente {
	
	List<Villano> villanos;
	
	new(){}
	
	def agregarVillano(Villano villanoAAgregar) {
		if(villanoExiste(villanoAAgregar.nombre)) throw new UnsupportedOperationException("El villano que intenta ingresar ya existe.")
		else{
			villanos.add(villanoAAgregar)	
		}
		ObservableUtils.firePropertyChanged(this, "villanos", this.villanos);
	}

	def actualizarVillano(Villano villanoAAgregar) {

		villanos.add(villanoAAgregar)
		ObservableUtils.firePropertyChanged(this, "villanos", this.villanos);
	}
	def quitarVillano(Villano v){
				villanos.remove(v)
	}

	def villanoExiste(String nombre) {
		villanos.exists[unVillano|nombre.equalsIgnoreCase(unVillano.nombre)]
	}
	
	def buscarVillanoEnLaColeccion(String nombreDelVillano) {
		var Villano villanoBuscado = new Villano
		villanoBuscado.nombre = "buscarVillanoEnLaColeccion no encontro a nadie"
		for (Villano unVillano : this.villanos) {
			if(nombreDelVillano.equalsIgnoreCase(unVillano.nombre)) villanoBuscado = unVillano
		}
		villanoBuscado
	}
	
}