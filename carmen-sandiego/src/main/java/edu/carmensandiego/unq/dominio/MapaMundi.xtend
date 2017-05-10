package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class MapaMundi {
	
	List<Pais> paises

	new() {
		paises = newArrayList()
		
		var caracteristicasEgipto = newArrayList()
		caracteristicasEgipto.add("Tiene muchos habitantes")
		caracteristicasEgipto.add("Hay un rio muy contaminado")
		
		var lugaresEgipto = newArrayList()
		lugaresEgipto.add(new Banco(new Informante()))
		lugaresEgipto.add(new Embajada(new Informante()))
		lugaresEgipto.add(new Club(new Cuidador()))
		lugaresEgipto.add(new Biblioteca(new Cuidador()))
		var egipto = new Pais("Egipto", caracteristicasEgipto, lugaresEgipto)
		
		/////////////////////////////////////////////
		
		var caracteristicasIndia = newArrayList()
		caracteristicasIndia.add("Tiene piramides")
		caracteristicasIndia.add("Hace mucho calor")
		caracteristicasIndia.add("Hay camellos")
		
		var lugaresIndia = newArrayList()
		lugaresIndia.add(new Embajada(new Informante()))
		lugaresIndia.add(new Banco(new Informante()))
		lugaresIndia.add(new Biblioteca(new Informante()))
		lugaresIndia.add(new Club(new Cuidador()))
		
		var india = new Pais("India", caracteristicasIndia, lugaresIndia)
		
		india.crearConexionCon(egipto)
		egipto.crearConexionCon(india)
		paises.addAll(india, egipto)
	}
		
	def eliminarPais(Pais paisSeleccionado) {
		this.paises.remove(paisSeleccionado)
	
	}
	
	def agregarPaisNuevo(Pais pais) {
		if(pais.nombre.empty) {
			throw new UnsupportedOperationException("El pais que intenta agregar no tiene nombre")
		}
 		
		if(paisExiste(pais.nombre)) {
			throw new UnsupportedOperationException("El pais con ese nombre ya existe")
		} 

		paises.add(pais)
	}
		
	def getLugar() {
		//Falta definir
	}

	def getPais(String nombreDelPais) {
		var Pais paisBuscado = null
		for (Pais unPais : this.paises) {
			if(nombreDelPais.equals(unPais.nombre)) paisBuscado = unPais
		}

		if(paisBuscado == null) throw new UnsupportedOperationException("El pais no existe.")
		paisBuscado
	}
	
	def paisExiste(String nombre) {
		paises.exists[unPais|nombre.equalsIgnoreCase(unPais.nombre)]
	}
	
}