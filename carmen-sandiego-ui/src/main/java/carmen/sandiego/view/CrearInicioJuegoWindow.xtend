package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import edu.carmensandiego.unq.dominio.Expediente

class CrearInicioJuegoWindow extends SimpleWindow<Juego> {
	
	new(WindowOwner parent, Juego model) {
		super(parent, model)
		title = "¿Dónde está Carmen Sandiego?"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var preguntaInicial = new Panel(mainPanel)
		preguntaInicial.layout = new ColumnLayout(1)
		
		new Label(preguntaInicial).text = "¿Que haremos ahora detective?"
		
		var botoneraInicial = new Panel(mainPanel)
		botoneraInicial.layout = new ColumnLayout(3)
	}
	
	override protected addActions(Panel botoneraInicial) {
		new Button(botoneraInicial) => [
			caption = "Resolver Misterio"
			onClick([|this.irAResolverMisterio])
		]
		
		new Button(botoneraInicial) => [
			caption = "Mapamundi"
			onClick([|this.irAMapamundi])
		]
		
		new Button(botoneraInicial) => [
			caption = "Expedientes"
			onClick([|this.irAExpedientes])
		]
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	
//	TODO Hay que ver como se hacen las transacciones de ventanas...
	def void irAResolverMisterio() {
//		this.openDialog(new CrearResolverMisterioWindow(this))
	}
	
	def void irAMapamundi() {
//		this.openDialog(new CrearMapaMundiWindow(this))
	}
	
	def void irAExpedientes() {
		this.openDialog(new CrearExpedienteWindow(this, new Expediente))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
}