package edu.carmensandiego.unq.dominio

import java.util.List

class Pais {
	String nombre
    String características
    List<String> lugaresDeinterésPorLosCriminales
    List<Pais> conexionesAereas
	List<Lugar> lugares
}