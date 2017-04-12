package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pais {
	String nombre
    List<String> caracteristicas  = newArrayList
    List<Pais> conexionesAereas = newArrayList
	List<Lugar> lugares = newArrayList
	
	def editar(String nombre, List<String> caracteristicas, List<Lugar> lugares, List<Pais> conexiones) {
		this.nombre = nombre
		this.caracteristicas = caracteristicas
		this.conexionesAereas = conexiones
		this.lugares = lugares
	}
	



	
}