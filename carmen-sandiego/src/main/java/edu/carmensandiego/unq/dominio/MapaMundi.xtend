package edu.carmensandiego.unq.dominio

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Observable
@Accessors
class MapaMundi {
	
	List<Pais> listaPaises
	static MapaMundi instance = new MapaMundi()

	static def getInstance() {
		instance
	}

	new() {
		listaPaises = newArrayList()
		var india = new Pais("India")
		india.caracteristicas.add("Tiene muchos habitantes")
		india.caracteristicas.add("Hay un rio muy contaminado")
		india.agregarNuevoLugar(new Banco(new Informante("Si, vino aqui un senor preguntando sobre piramides")))
		india.agregarNuevoLugar(new Embajada(new Informante("Si, vino aqui un senor preguntando sobre los faraones")))
		india.agregarNuevoLugar(new Club(new Informante("Si, vino aqui un senor con muchos anillos")))
		
		var egipto = new Pais("Egipto")
		egipto.caracteristicas.add("Tiene piramides")
		egipto.caracteristicas.add("Hace mucho calor")
		egipto.caracteristicas.add("Hay camellos")
		egipto.agregarNuevoLugar(new Embajada(new Informante("Si, vino aqui un senor preguntando sobre la moneda que usan en Francia e Italia.")))
		egipto.agregarNuevoLugar(new Banco(new Informante("Si, vino aqui un senor mas bien bajito")))
		egipto.agregarNuevoLugar(new Biblioteca(new Informante("Ayer vino un hombre de negro muy extrano")))
		
		india.crearConexionCon(egipto)
		egipto.crearConexionCon(india)
		listaPaises.addAll(india, egipto)
	}
		
	def eliminarPais(Pais paisSeleccionado) {
		if(!paisSeleccionado.conexionesAereas.empty) {
			throw new UnsupportedOperationException("El pais que intena borrar tiene conexiones a otros paises. Quite estas conexiones para poder borrarlo.")
		} 
		this.listaPaises.remove(paisSeleccionado)
		ObservableUtils::firePropertyChanged(this, "listaPaises", this.listaPaises)
	}
	
	def agregarPaisNuevo(Pais pais) {
		if(pais.nombre.empty) {
			throw new UnsupportedOperationException("El pais que intenta agregar no tiene nombre")
		}
 		
		if(paisExiste(pais.nombre)) {
			throw new UnsupportedOperationException("El pais con ese nombre ya existe")
		} 

		listaPaises.add(pais)
		ObservableUtils::firePropertyChanged(this, "listaPaises", this.listaPaises)
	}
		
	def getLugar() {
		//Falta definir
	}

	def getPais(String nombreDelPais) {
		var Pais paisBuscado = null
		for (Pais unPais : this.listaPaises) {
			if(nombreDelPais.equals(unPais.nombre)) paisBuscado = unPais
		}

		if(paisBuscado == null) throw new UnsupportedOperationException("El pais no existe.")
		paisBuscado
	}
	
	def paisExiste(String nombre) {
		listaPaises.exists[unPais|nombre.equalsIgnoreCase(unPais.nombre)]
	}
	
}