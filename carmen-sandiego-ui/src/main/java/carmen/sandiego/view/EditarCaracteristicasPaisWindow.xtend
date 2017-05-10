package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Pais
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarCaracteristicasPaisWindow extends SimpleWindow<Pais>{
	
	new(WindowOwner parent, Pais pais) {
		super(parent, pais)
		title = "Editar Caracteristicas"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val listaCaracteristicas = new Panel(mainPanel)
		listaCaracteristicas.layout = new VerticalLayout
		
		new Label(listaCaracteristicas).text = "Carateristicas: "
		new List(listaCaracteristicas) => [
			width = 220 
			items <=> "caracteristicas"
			]
			
		new Button(listaCaracteristicas) => [
			caption = "Eliminar"
			onClick [ | eliminarCaracteristica ] 
		
			]
		
		val agregarPanel = new Panel(mainPanel) 
		agregarPanel.layout = new ColumnLayout(2)
		new TextBox(agregarPanel) =>[
			value <=> "caracteristicas"
		]
		
		new Button(agregarPanel) => [
			caption = "Agregar" 
			onClick [| agregarCaracteristica]
		]
		
		val aceptarPanel = new Panel(mainPanel)
		aceptarPanel.layout = new VerticalLayout
		new Button(aceptarPanel) => [
			caption = "Aceptar"
			onClick [| aceptarCambios]
		]
		
	}
	
	def aceptarCambios() {
	}
	
	def agregarCaracteristica() {
		new EditarCaracteristicasPaisWindow(this, new Pais).open
		
	}
	
	def eliminarCaracteristica() {
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	
	
}