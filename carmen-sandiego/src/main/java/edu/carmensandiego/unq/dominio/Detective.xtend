package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Detective {
	
	Caso caso
	Pais estoyPais;
	List<String> miListaDePistas;
	Lugar lugarQueVoyAVisitar;
	Pais pasiAlQueQuieroViajar;
	
	new(){}
}