package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.Application

class JuegoApplication extends Application {
	
	override createMainWindow() {
//		new CrearVillanoWindow(this, new Villano)
		new CrearInicioJuegoWindow(this, new Juego)
//		new CrearExpedienteWindow(this, new Expediente)
	}
	
	def static main(String[] args) {
		new JuegoApplication().start
	}
}