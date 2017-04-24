package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.Application
import edu.carmensandiego.unq.dominio.MapaMundi
import appModel.MapaMundiAppModel
import appModel.ViajarAppModel

class JuegoApplication extends Application {
	
	override createMainWindow() {
//		new CrearVillanoWindow(this, new Villano)
		new ViajarWindow(this, new ViajarAppModel)
//		new CrearExpedienteWindow(this, new Expediente)
//		new CrearInicioJuegoWindow(this, new Juego)
	}
	
	def static main(String[] args) {
		new JuegoApplication().start
	}
}