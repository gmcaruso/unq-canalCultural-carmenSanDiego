package edu.carmensandiego.unq.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Juego {
	
	List<Caso> listaDeCasosSinResolver
	Caso casoActual
	Expediente expedienteDelJuego
	MapaMundi mapamundiDelJuego
	Detective detectiveACargo
	
}