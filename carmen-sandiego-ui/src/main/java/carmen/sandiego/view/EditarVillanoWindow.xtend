package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarVillanoWindow extends TransactionalDialog<Juego> {
	
	new(WindowOwner owner, Juego model, String newTitle) {
		super(owner, model)
		title = newTitle
	}
	
	override createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new ColumnLayout(2)
		
		new Label(editorPanel).text = "Nombre: "
		new TextBox(editorPanel) => [
			value <=> "villanoSeleccionado.nombre"
			width = 220
		]
		
		new Label(editorPanel).text = "Sexo: "
		new TextBox(editorPanel) => [
			value <=> "villanoSeleccionado.sexo"
			width = 220
		]
		new Label(editorPanel).text = "Señas Particulares: " 
		new Button(editorPanel) => [
			caption = "Editar Señas Particulares"
			onClick [ |this.irAEditarSenias]
		]
		
		val listaSenia = new Panel(mainPanel)
		listaSenia.layout = new ColumnLayout(1)
		new List(listaSenia) => [
			width = 220
			items <=> "villanoSeleccionado.seniasParticulares"
		]
		
		val hobbies = new Panel(mainPanel)
		hobbies.layout = new ColumnLayout(2)
		new Label(hobbies).text = "Hobbies: " 
		new Button(hobbies) => [
			caption = "Editar Hobbies"
			onClick [ |this.irAEditarHobbies]
		]
		
		val listaHobbies = new Panel(mainPanel)
		listaHobbies.layout = new ColumnLayout(1)
		new List(listaHobbies) => [
			width = 220
			items <=> "villanoSeleccionado.hobbies"
		]
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	def irAEditarSenias() {
		this.modelObject.editarSenia = true
		this.openDialog(new EditarAtributosListaVillanoWindow(this, modelObject, "Editar Señas Particulares"))
	}
	
	def irAEditarHobbies() {
		this.modelObject.editarSenia = false
		this.openDialog(new EditarAtributosListaVillanoWindow(this, modelObject, "Editar Hobbies"))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [| 
				if(modelObject.esNuevoVillano){
					this.modelObject.crearVillano(modelObject.villanoSeleccionado.nombre, 
					modelObject.villanoSeleccionado.sexo, modelObject.villanoSeleccionado.seniasParticulares, 
					modelObject.villanoSeleccionado.hobbies)
				}
				this.close
			]
		]
	}

}
