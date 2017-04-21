package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Villano
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearVillanoWindow extends SimpleWindow<Villano> {
	
	new(WindowOwner owner, Villano villano) {
		super(owner, villano)
		title = "Expedientes - Nuevo Villano"
	}

	override createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new ColumnLayout(2)
		
		new Label(editorPanel).text = "Nombre: "
		new TextBox(editorPanel) => [
			value <=> "nombre"
			width = 220
		]
		
		new Label(editorPanel).text = "Sexo: "
		new TextBox(editorPanel) => [
			value <=> "sexo"
			width = 220
		]
		new Label(editorPanel).text = "Señas Particulares: " new Button(editorPanel) => [
			caption = "Editar Señas Particulares"
			setAsDefault
			onClick [ | jugar ]
		]
		
		val listaSenia = new Panel(mainPanel)
		listaSenia.layout = new ColumnLayout(1)
		new List(listaSenia) => [
			width = 220
			value <=> "senasParticulares"
		]
		
		val hobbies = new Panel(mainPanel)
		hobbies.layout = new ColumnLayout(2)
		new Label(hobbies).text = "Hobbies: " new Button(hobbies) => [
			caption = "Editar Hobbies"
			setAsDefault
			onClick [ | jugar ]
		]
		
		val listaHobbies = new Panel(mainPanel)
		listaHobbies.layout = new ColumnLayout(1)
		new List(listaHobbies) => [
			width = 220
			value <=> "hobbies"
		]
	}

	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick [ | jugar ]
		]
	}

	def jugar() {
		showInfo(modelObject.hola.toString)
	}

}

