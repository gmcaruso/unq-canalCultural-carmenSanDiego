package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.Application

class JuegoApplication extends Application {
	
	override createMainWindow() {
		new InicioJuegoWindow(this, new Juego)
	}
	
	def static main(String[] args) {
		new JuegoApplication().start
	}
}