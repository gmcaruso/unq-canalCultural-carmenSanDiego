package carmen.sandiego.view

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import edu.carmensandiego.unq.dominio.Villano

/**
 * 
 */
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
		]
		
		new Label(editorPanel).text = "Sexo: "
		new TextBox(editorPanel) => [
			value <=> "sexo"
		]
		new Label(editorPanel).text = "Señas Particulares: " new Button(editorPanel) => [
			caption = "Editar Señas Particulares"
			setAsDefault
			onClick [ | jugar ]
		]
		
		val gridSenias = new Table(editorPanel, typeof(Villano)) => [
			width = 600
			height = 400
		]
		
		new Column<Villano>(gridSenias) => [
			title = "Seña"
			bindContentsToProperty("sexo")
		]
		
		new Label(editorPanel).text = "Hobbies: " new Button(editorPanel) => [
			caption = "Editar Hobbies"
			setAsDefault
			onClick [ | jugar ]
		]
		
		val gridHobbies = new Table(editorPanel, typeof(String)) => [
			width = 600
			height = 400
			items <=> ""
		]
		
		new Column<String>(gridHobbies) => [
			title = "Hobbie"
			bindContentsToProperty("sexo")
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

