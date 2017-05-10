package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Detective {
	
	Pais miPais
	Lugar miLugar
	List<String> paisesVisitados
	
	new(){}
}