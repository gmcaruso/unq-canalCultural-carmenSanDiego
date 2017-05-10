package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Juego {
	
	Caso caso = new Caso
	MapaMundi mapaMundi = new MapaMundi
	Pais paisSeleccionado 
	Villano villanoSeleccionado = caso.expediente.villanos.get(0)
	String elementoSeleccionado
	String inputText
	boolean editarSenia
	
	def crearVillano(String nombre, String sexo, List<String> senias, List<String> hobbies) {
		caso.expediente.agregarVillano(new Villano(nombre, sexo, senias, hobbies))
	}
	
	def crearPais(String nombre, List<String> caracteristicas, List<Lugar> lugares) {
		mapaMundi.agregarPaisNuevo(new Pais (nombre, caracteristicas, lugares))
	}
	
	def esNuevoVillano() {
		var esta = true
		for(Villano villano : caso.expediente.villanos){
			if(villano.nombre == villanoSeleccionado.nombre && villano.sexo == villanoSeleccionado.sexo)
				esta = false
			}
		esta
	}
	
	def esNuevoPais() {
		var esta = true
		for(Pais pais : mapaMundi.paises){
			if(pais.nombre == paisSeleccionado.nombre)
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
	
	def eliminarPais(){
		mapaMundi.eliminarPais(paisSeleccionado)
	}
	
	def agregarPais(Pais pais){
		mapaMundi.agregarPaisNuevo(pais)
	}
	
	def eliminarCaracteristica() {
		paisSeleccionado.eliminarCaracteristica(elementoSeleccionado)
	}
	
	def agregarCaracteristica() {
		villanoSeleccionado.agregarNuevoHobbie(inputText)
	}
	
}