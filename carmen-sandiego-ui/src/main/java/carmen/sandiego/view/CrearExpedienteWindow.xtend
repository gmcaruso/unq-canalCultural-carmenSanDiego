package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Expediente
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearExpedienteWindow extends SimpleWindow<Expediente>  {
	
	new(WindowOwner parent, Expediente model) {
		super(parent, model)
		title = "Expedientes"
	}
	
	override protected addActions(Panel arg0) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var granPanel = new Panel(mainPanel)
		granPanel.layout = new ColumnLayout(2)
		
		var columnaIzquierda = new Panel(granPanel)
		columnaIzquierda.layout = new ColumnLayout(1)	
		columnaIzquierda.width = 200
		
		new List(columnaIzquierda) => [
			width = 220
			height = 220
			value <=> "villanos"
		]
		
		new Button(columnaIzquierda) => [
			caption = "Nuevo"
			onClick [ |  ]
		]
		
		new Button(columnaIzquierda) => [
			caption = "Editar"
			onClick [ |  ]
		]
		////////////////////////////////////////////////
		
		var columnaDerecha = new Panel(granPanel)	
		columnaDerecha.layout = new ColumnLayout(1)	
		
		var nombreSexo = new Panel(columnaDerecha)	
		nombreSexo.layout = new ColumnLayout(2)	
		
		new Label(nombreSexo).text = "Nombre: "
		new TextBox(nombreSexo) => [
//			value <=> "sexo"
			width = 220
		]
		
		new Label(nombreSexo).text = "Sexo: "
		new TextBox(nombreSexo) => [
//			value <=> "sexo"
			width = 220
		]
		
		var listas = new Panel(columnaDerecha)	
		listas.layout = new ColumnLayout(1)	
		
		new Label(listas).text = "Señas Particulares: "
		new List(listas) => [
			width = 220
//			value <=> "senasParticulares"
		]
		
		new Label(listas).text = "Hobbies: "
		new List(listas) => [
			width = 220
//			value <=> "senasParticulares"
		]
		
	}
	
}