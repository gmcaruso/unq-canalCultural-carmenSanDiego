package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Pais
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarConexionesAereas extends SimpleWindow<Pais> {
	
	new(WindowOwner parent, Pais pais) {
			super(parent, pais)
		title = "Editar Conexiones Aereas"
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val listaConexionesAereas = new Panel(mainPanel)
		listaConexionesAereas.layout = new VerticalLayout
		
		
		new Label(listaConexionesAereas).text = "Conexiones: "
		
		new List(listaConexionesAereas) => [
			width = 220 
			value <=> "caracteristicas"
			]
			
		new Button(listaConexionesAereas) => [
			caption = "Eliminar"
			onClick [ | eliminarConexion ] 
		
			]
		
		val agregarPanel = new Panel(mainPanel) 
		agregarPanel.layout = new ColumnLayout(2)
		new List(agregarPanel) =>[
			value <=> "caracteristicas"
		]
		
		new Button(agregarPanel) => [
			caption = "Agregar" 
			onClick [| agregarConexion]
		]
		
		val aceptarPanel = new Panel(mainPanel)
		aceptarPanel.layout = new VerticalLayout
		new Button(aceptarPanel) => [
			caption = "Aceptar"
			onClick [| aceptarCambios]
		]
		
	}
	
	def agregarConexion() {
		//this.modelObject.crearConexionCon()
		
	}
	
	def aceptarCambios() {
		
	}
	
	def eliminarConexion() {
		this.modelObject.eliminarConexion(modelObject)
	}
	
}