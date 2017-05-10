package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Caso {

	Expediente expediente
	Villano villano
	Detective detective
	Pais paisDelCrimen
	
	new() {
		this.villano = new Villano("Jorge", "Masculino", newArrayList(), newArrayList())
		this.expediente = new Expediente
		this.paisDelCrimen = new Pais("Egipto", newArrayList(), newArrayList())
		this.detective = new Detective()
	}
	
	def viajar(Pais pais) {
		if(detective.miPais.conexionesAereas.contains(pais.nombre)) {
			detective.paisesVisitados.add(detective.miPais.nombre)
			detective.miPais = pais;
		} else {
			throw new UnsupportedOperationException("El pais al que intenta viajar no tiene conexion con el pais donde se encuentra ahora")
		}
	}
}