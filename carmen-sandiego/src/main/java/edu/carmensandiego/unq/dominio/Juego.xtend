package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Juego {
	
	List<Caso> casos
	Caso casoActual
	Expediente expediente = new Expediente
	MapaMundi mapaMundi
	Detective detective
	
	Villano villanoSeleccionado = expediente.villanos.get(0)
	String elementoSeleccionado
	String inputText
	boolean editarSenia
	
	def crearVillano(String nombre, String sexo, java.util.List<String> senias, java.util.List<String> hobbies) {
		expediente.agregarVillano(new Villano(nombre, sexo, senias, hobbies))
	}
	
	def esNuevoVillano() {
		var esta = true
		for(Villano villano : expediente.villanos){
			if(villano.nombre == villanoSeleccionado.nombre && villano.sexo == villanoSeleccionado.sexo)
				esta = false
			}
		esta
	}
	
	def eliminarHobbie() {
		villanoSeleccionado.eliminarHobbie(elementoSeleccionado)
	}
	
	def agregarHobbie() {
		villanoSeleccionado.agregarNuevoHobbie(inputText)
	}
	
	def agregarSenia() {
		villanoSeleccionado.agregarNuevaSenia(inputText)
	}
	
	def eliminarSenia() {
		villanoSeleccionado.eliminarSenia(elementoSeleccionado)
	}
	
}