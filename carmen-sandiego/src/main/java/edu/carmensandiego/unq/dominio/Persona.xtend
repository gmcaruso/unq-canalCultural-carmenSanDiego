package edu.carmensandiego.unq.dominio

abstract class Persona {
	
	private Lugar ubicacion
	def String responder()
	
	def Lugar getUbicacion(){
		this.ubicacion
	}
	
	def setUbicacion(Lugar ubicacion){
		this.ubicacion = ubicacion
	}
}