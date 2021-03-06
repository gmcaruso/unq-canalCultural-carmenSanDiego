package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Lugar
import edu.carmensandiego.unq.dominio.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarPaisSeleccionadoWindow extends SimpleWindow<Pais> {
	
	new(WindowOwner parent, Pais pais) {
		super(parent, pais)
		title = "Mapamundi - Editar Pais"
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
			onClick [ | this.irAEditarCaracteristicas]

		]
 		
 		val listaCaracteristicasPanel= new Panel(mainPanel)
 		listaCaracteristicasPanel.layout = new ColumnLayout(1)
		new List(listaCaracteristicasPanel) => [
			width = 220
		
			items <=> "caracteristicas"
			
		]
		
		val listaConexionesAeresPanel = new Panel(mainPanel)
		listaConexionesAeresPanel.layout = new ColumnLayout(2)
		new Label(listaConexionesAeresPanel).text = "Conexiones Aereas"
		new Button(listaConexionesAeresPanel) => [
			caption = "Editar Conexiones Aereas: "
			onClick[| irAEditarConexionesAereas ]
		]
		
		val listaConexionesAereas = new Panel(mainPanel)
		listaConexionesAereas.layout = new ColumnLayout(1)
		new List(listaConexionesAereas) => [
			(items <=> "conexionesAereas").adapter = new PropertyAdapter(Pais, "nombre")
			width = 220
		]
	
		val listaLugaresInteresPanel = new Panel(mainPanel) 
		listaLugaresInteresPanel.layout = new ColumnLayout(2)
		new Label(listaLugaresInteresPanel).text = "Lugares De Interes: "
		new Button(listaLugaresInteresPanel) => [
			caption = "Editar Lugares De Interes: "
			onClick [| irAEditarLugares]
		]
		 
		 val listaLugaresInteres = new Panel(mainPanel)
		 listaLugaresInteres.layout = new ColumnLayout(1)
		 new List(listaLugaresInteres) => [
		 	width = 220
		 	(items <=> "lugares").adapter = new PropertyAdapter(Lugar, "nombre")
		 ]
		
		val aceptarPanel = new Panel(mainPanel)
		aceptarPanel.layout = new HorizontalLayout
		new Button(aceptarPanel) =>[
			caption = "Aceptar"
			onClick[| aceptarCambios]
		]
		
	}
	
	def irAEditarLugares() {
		//new EditarLugares(this, new  Lugar).open
	}
	
	def irAEditarConexionesAereas() {
		new EditarConexionesAereas(this, new Pais).open
	}
	
	def irAEditarCaracteristicas() {
		new EditarCaracteristicasPaisWindow(this, new Pais).open
	}
	

	
	def aceptarCambios() {
		this.close
	}
	
	def jugar() {
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	
}