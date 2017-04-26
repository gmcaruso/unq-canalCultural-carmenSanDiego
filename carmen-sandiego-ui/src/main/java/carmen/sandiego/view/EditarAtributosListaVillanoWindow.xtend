package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarAtributosListaVillanoWindow extends TransactionalDialog<Juego> {
	
	
	new(WindowOwner owner, Juego model, String newTitle) {
		super(owner, model)
		title = newTitle
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val listPanel = new Panel(mainPanel)
		listPanel.layout = new ColumnLayout(1)
		
		var buttonsPanel = new Panel(mainPanel)
		buttonsPanel.layout = new ColumnLayout(2)
		
		new List(listPanel) => [
			(items <=> "villanoSeleccionado.hobbies")
			width = 120
			height = 120
			value <=> "elementoSeleccionado"
		]
		
		new Button(listPanel) => [
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarHobbie())
		]
		
		new TextBox(buttonsPanel) => [
			value <=> "inputText"
			width = 220
		]
		
		new Button(buttonsPanel) => [
			caption = "Agregar"
			onClick [ |
				if (this.modelObject.inputText != "" || this.modelObject.inputText != null) {
					if(this.modelObject.editarSenia){
						this.modelObject.agregarSenia
					}
					else{
						this.modelObject.agregarHobbie						
					}
				}
				
			]
		]
		
		new Button(buttonsPanel) => [
			caption = "Aceptar"
			onClick [ | this.close ]
		]
		
	}
	
}