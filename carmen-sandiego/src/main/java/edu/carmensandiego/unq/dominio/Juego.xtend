package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Juego {
	
	List<Caso> listaDeCasosSinResolver
	Caso casoActual
	Expediente expedienteDelJuego
	MapaMundi mapamundiDelJuego
	Detective detectiveACargo
	
new(){}	
}