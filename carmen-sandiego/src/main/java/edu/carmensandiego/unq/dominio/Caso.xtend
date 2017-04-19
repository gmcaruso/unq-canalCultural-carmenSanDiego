package edu.carmensandiego.unq.dominio

import java.util.List

class Caso {

    Pais estoyPais;
	List<String> miListaDePistas;
	Lugar lugarQueVoyAVisitar;
	Pais pasiAlQueQuieroViajar;
	Expediente expediente;
	Villano elResponsable;
	List<String> paisesVisitados;
	
	new(String nombreCaso, Pais paisDondeOcurrioElRobo, Villano responsable) {
		this.estoyPais = paisDondeOcurrioElRobo
		this.miListaDePistas = newArrayList
		this.elResponsable = responsable
		this.expediente = new Expediente
		this.paisesVisitados = newArrayList

	}
	
	
	def viajar(Pais pais) {
		if(estoyPais.conexionesAereas.contains(pais.nombre)) {
			this.paisesVisitados.add(estoyPais.nombre)
			estoyPais = pais;
		} else {
			throw new UnsupportedOperationException("El pais al que intenta viajar no tiene conexion con el pais donde se encuentra ahora")
		}
	}
}