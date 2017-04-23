package carmen.sandiego.view

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import edu.carmensandiego.unq.dominio.Pais

class EditarPaisSeleccionadoWindow extends SimpleWindow<Pais> {
	
	new(WindowOwner parent, Pais pais) {
		super(parent, pais)
		title = "Mapamundi - Nuevo Pais"
	}
	
	override createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new ColumnLayout(2)
		
		new Label(editorPanel).text = "Nombre: "
		new TextBox(editorPanel) => [
			value <=> "nombre"
		]
		
		new Label(editorPanel).text = "Caracteriscticas: " 
		
		new Button(editorPanel) => [
		caption = "Editar Caracteristicas"
		
		onClick [ | jugar ]
		
			]
 		
 		
 		val listaCaracteristicasPanel= new Panel(mainPanel)
 		listaCaracteristicasPanel.layout = new ColumnLayout(1)
		new List(listaCaracteristicasPanel) => [
			width = 220
			value <=> "caracteristicas"
			]
		
		
		val listaConexionesAeresPanel = new Panel(mainPanel)
		listaConexionesAeresPanel.layout = new ColumnLayout(2)
		new Label(listaConexionesAeresPanel).text = "Conexiones Aereas"
		new Button(listaConexionesAeresPanel) => [
			caption = "Editar Caracteristicas: "
			
			onClick[ | jugar]
		]
		
		val listaConexionesAereas = new Panel(mainPanel)
		listaConexionesAereas.layout = new ColumnLayout(1)
		new List(listaConexionesAereas) => [
			width = 220
			value <=> "conexionesAereas"
		]
	
		val listaLugaresInteresPanel = new Panel(mainPanel) 
		listaLugaresInteresPanel.layout = new ColumnLayout(2)
		new Label(listaLugaresInteresPanel).text = "Lugares De Interes: "
		new Button(listaLugaresInteresPanel) => [
			caption = "Editar Lugares De Interes: "
			
			onClick [| jugar]
		]
		 
		 val listaLugaresInteres = new Panel(mainPanel)
		 listaLugaresInteres.layout = new ColumnLayout(1)
		 new List(listaLugaresInteres) => [
		 	width = 220
		 	value <=> "lugaresDeInteres"
		 ]
		
		
		val aceptarPanel = new Panel(mainPanel)
		aceptarPanel.layout = new HorizontalLayout
		new Button(aceptarPanel) =>[
			caption = "Aceptar"
			onClick[| aceptarCambios]
		]
		
		
			
	
		
		
	}
	
	def aceptarCambios() {
	}
	
	def jugar() {
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	
}