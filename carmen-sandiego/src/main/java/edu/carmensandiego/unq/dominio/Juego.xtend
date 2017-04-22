package edu.carmensandiego.unq.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.carmensandiego.unq.dominio.repos.RepoVillanos

@Accessors
@Observable
class Juego {
	
	List<Caso> listaDeCasosSinResolver
	Caso casoActual
	Expediente expedienteDelJuego
	MapaMundi mapamundiDelJuego
	Detective detectiveACargo
	RepoVillanos repoVillanos
	
	
	new() {
	}
	
	
}