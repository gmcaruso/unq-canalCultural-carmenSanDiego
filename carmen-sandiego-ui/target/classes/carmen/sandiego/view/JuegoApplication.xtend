package carmen.sandiego.view

import org.uqbar.arena.Application

class JuegoApplication extends Application {
	
	override createMainWindow() {
		new CrearVillanoWindow(this, new Villano)
	}
	
	def static main(String[] args) {
		new JuegoApplication().start
	}
}