package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.ObservableUtils

@Accessors
class Expediente {
	
	List<Villano> villanos;
	
	new() {
		villanos = newArrayList()
		fabricarVillanos()
	}
	
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
	
	def quitarVillano(Villano unVillano){
				villanos.remove(unVillano)
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
	
		def fabricarVillanos(){
		var villano1 = new Villano
		var villano2 = new Villano
		
		villano1.agregarNuevaSenia("Gordo")
		villano1.agregarNuevaSenia("Alto")
		villano1.agregarNuevoHobbie("Tenis")
		villano1.agregarNuevoHobbie("Don Satur")
		villano1.cambiarNombreDelVillano("Juan P. Guanpirola")
		villano1.sexo = 'Masculino'
		
		villano2.agregarNuevaSenia("Flaco")
		villano2.agregarNuevaSenia("Petiso")
		villano2.agregarNuevoHobbie("Fichines")
		villano2.agregarNuevoHobbie("Toddy")
		villano2.cambiarNombreDelVillano("Sofia Sangarlanga")
		villano2.sexo = 'Femenino'
		
	
		
		agregarVillano(villano1)
		agregarVillano(villano2)
	}

	
}