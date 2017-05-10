package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class ResolverMisterioWindow extends TransactionalDialog<Juego> {
	
	new(WindowOwner owner, Juego model) {
		super(owner, model)
		title = "Resolviendo Misterio"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panelSuperior = new Panel(mainPanel)
		panelSuperior.layout = new ColumnLayout(2)
		
		new Label(panelSuperior).text = "Estas en: "
		new Label(panelSuperior).text = "Lugares"
		
		new Button(panelSuperior) => [
			caption = "Orden de Arresto"
			onClick [ |]
		]
		new Button(panelSuperior) => [
			caption = "Biblioteca"
			onClick [ | this.irAPista("Biblioteca")]
		]
		new Button(panelSuperior) => [
			caption = "Viajar"
			onClick [ |]
		]
		new Button(panelSuperior) => [
			caption = "Club"
			onClick [ | this.irAPista("Club")]
		]
		new Button(panelSuperior) => [
			caption = "Expedientes"
			onClick [ |]
		]
		new Button(panelSuperior) => [
			caption = "Embajada"
			onClick [ | this.irAPista("Embajada")]
		]
		new Button(panelSuperior) => [
			caption = "Banco"
			onClick [ | this.irAPista("Banco")]
		]		
		
		var panelInferior = new Panel(mainPanel)
		panelInferior.layout = new ColumnLayout(1)
		
		new Label(panelInferior).text = "Lugares"
	}
	
	def void irAPista(String titulo) {
		this.openDialog(new PistaWindow(this, this.modelObject, titulo))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
	
}