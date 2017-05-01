package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class PistaWindow extends TransactionalDialog<Juego>{
	
	new(WindowOwner owner, Juego model, String titulo) {
		super(owner, model)
		title = titulo
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(1)
		
		new Label(panel) => [
			text = "Estas visitando: " + this.title
		] 
		
		new Label(panel)=> [
			text = "Pista"
		] 
		
		new Button(panel) => [
			caption = "Continuar"
			
			onClick([|this.close])
		]
	}
	
}