package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils

@Accessors
class Pais {
	String nombre
    List<String> caracteristicas 
    List<Pais> conexionesAereas 
	List<Lugar> lugaresDeInteres
	List<Lugar> lugaresPosibles
	
	new(String nombreDelPais) {
		this.nombre = nombreDelPais
		this.caracteristicas = newArrayList
		this.lugaresDeInteres = newArrayList
		this.lugaresPosibles = newArrayList
		var banco = new Banco()
		var biblioteca = new Biblioteca()
		var embajada = new Embajada()
		var club = new Club()
		this.lugaresPosibles.addAll(banco, biblioteca, embajada, club)
		this.conexionesAereas = newArrayList

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

	def borrarCaracteristica(String string) {
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

	def eliminarLugar(Lugar lugar) {
		lugaresDeInteres.remove(lugar)
		lugaresPosibles.add(lugar)
		ObservableUtils::firePropertyChanged(this, "lugaresDeInteres", this.lugaresDeInteres)
	}

	def agregarNuevoLugar(Lugar lugar) {
		if(this.lugaresDeInteres.size == 3) {
			throw new UnsupportedOperationException("No se pueden cargar mas lugares a este pais. Ya alncanzo el maximo permitido")
		}

		if(estaEnLaListaDeLugaresPosibles(lugar)) {
			lugaresDeInteres.add(lugar)
			removerLugarPosible(lugar)
		} else {
			throw new UnsupportedOperationException("El lugar que intenta agregar ya pertenece al pais")

		}
	}
	
	def removerLugarPosible(Lugar lugarARemover) {
		var Lugar lugarBuscado
		for (Lugar unLugar : this.lugaresPosibles) {
			if(lugarARemover.nombreLugar.equals(unLugar.nombreLugar)) {
				lugarBuscado = unLugar
			}
		}
		lugaresPosibles.remove(lugarBuscado)
	}
	
	def estaEnLaListaDeLugaresPosibles(Lugar lugarAAgregar) {
		return (lugaresPosibles.exists[unLugar|unLugar.nombreLugar == lugarAAgregar.nombreLugar])
	}
	
	
	override equals(Object objeto) {
		var resultado = false
		if(objeto != null) {
			resultado = (this.nombre == (objeto as Pais).nombre)
		}
		return resultado
	}
	
	
	
}