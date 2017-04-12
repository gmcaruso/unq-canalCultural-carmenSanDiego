package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pais {
	String nombre
    String caracteristicas
    List<String> lugaresDeInteresPorLosCriminales
    List<Pais> conexionesAereas
	List<Lugar> lugares
	
	def editar(String string, String string2, java.util.List<String> strings, java.util.List<String> strings2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}