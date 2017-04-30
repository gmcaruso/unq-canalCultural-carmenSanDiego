package carmen.sandiego.view

import appModel.MapaMundiAppModel
import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class InicioJuegoWindow extends SimpleWindow<Juego> {
	
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
		this.openDialog(new ResolverMisterioWindow(this, this.modelObject))
	}
	
	def void irAMapamundi() {
		this.openDialog(new MapaMundiWindow(this, new MapaMundiAppModel))
	}
	
	def void irAExpedientes() {
		this.openDialog(new ExpedienteWindow(this, this.modelObject))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
}