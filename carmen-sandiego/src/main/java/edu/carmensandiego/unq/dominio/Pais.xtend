package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pais {
	String nombre
    List<String> caracteristicas  = newArrayList
    List<String> lugaresDeInteresPorLosCriminales = newArrayList
    List<Pais> conexionesAereas = newArrayList
	List<Lugar> lugares = newArrayList
	
	def editar(String string, String string2, java.util.List<String> strings, java.util.List<String> strings2, java.util.List<String> strings3) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	

	
}