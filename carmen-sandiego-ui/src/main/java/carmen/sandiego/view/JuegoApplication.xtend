package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.Application


class JuegoApplication extends Application {
	
	override createMainWindow() {
//		new CrearVillanoWindow(this, new Villano)
//		new CrearExpedienteWindow(this, new Expediente)
		new CrearInicioJuegoWindow(this, new Juego)
	}
	
	def static main(String[] args) {
		new JuegoApplication().start
	}
}