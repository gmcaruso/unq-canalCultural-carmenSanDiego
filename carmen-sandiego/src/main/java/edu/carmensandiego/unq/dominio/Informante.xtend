package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Informante extends Persona {
	
	override darPista(Lugar lugar) {
	  switch lugar.nombre {
	    case "Embajada" : this.pistaEmbajada
	    case "Banco" : this.pistaBanco
	    case "Biblioteca" : this.pistaBiblioteca
	    default : this.pistaClub
	  }
	}
	
	def pistaClub() {
		"Club"
	}
	
	def pistaBiblioteca() {
		"Biblioteca"
	}
	
	def pistaBanco() {
		"Banco"
	}
	
	def pistaEmbajada() {
		"Embajada"
	}
}