package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Pais {
	String nombre
    List<String> caracteristicas = newArrayList()
    List<Pais> conexionesAereas = newArrayList()
	List<Lugar> lugares = newArrayList()
	
	new(String nombreDelPais, List<String> caracteristicas, List<Lugar> lugares) {
		this.nombre = nombreDelPais
		this.caracteristicas = caracteristicas
		this.lugares = lugares
	}

	new(){
	}	
	
	def crearConexionCon(Pais conexionAAgregar) {
		if(this.conexionesAereas.contains(conexionAAgregar.nombre) || this.nombre.equalsIgnoreCase(conexionAAgregar.nombre)) {
			throw new UnsupportedOperationException("La conexion que intenta crear ya existe o es invalida")
		}

		this.conexionesAereas.add(conexionAAgregar)
		conexionAAgregar.conexionesAereas.add(this)
	}
	
	def eliminarConexion(Pais pais) {
		this.conexionesAereas.remove(pais)
		pais.conexionesAereas.remove(this)
	}

	def eliminarCaracteristica(String string) {
		caracteristicas.remove(string)
	}
	
	def agregarCaracteristica(String string) {
		if(string.empty) {
			throw new UnsupportedOperationException("Esta intentando agregar una caracteristica vacia")
		}

		if(this.caracteristicas.contains(string)) {
			throw new UnsupportedOperationException("La caracteristica que intenta agregar ya existe")
		}
		this.caracteristicas.add(string)
		ObservableUtils::firePropertyChanged(this, "caracteristicas", caracteristicas)
	}

}