package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Expediente
import edu.carmensandiego.unq.dominio.Villano
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearExpedienteWindow extends TransactionalDialog<Expediente>  {
	
	new(WindowOwner parent, Expediente model) {
		super(parent, model)
		title = "Expedientes"
	}
	
	override protected addActions(Panel arg0) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		var granPanel = new Panel(mainPanel)
		granPanel.layout = new ColumnLayout(2)
		
		this.crearColumnaIzquierda(granPanel)
		
		////////////////////////////////////////////////
		
		var columnaDerecha = new Panel(granPanel)	
		columnaDerecha.layout = new ColumnLayout(1)	
		
		this.crearPanelNombreSexo(columnaDerecha)
		
		crearPanelListas(columnaDerecha)
		
	}
	
	private def crearColumnaIzquierda(Panel granPanel) {
		var columnaIzquierda = new Panel(granPanel)
		columnaIzquierda.layout = new ColumnLayout(1)	
		columnaIzquierda.width = 200
		
		new List<Villano>(columnaIzquierda) => [
			(items <=> "villanos").adapter = new PropertyAdapter(Villano, "nombre")
			width = 220
			height = 220
			value <=> "villanoSeleccionado"
		]
		
		new Button(columnaIzquierda) => [
			caption = "Nuevo"
			onClick([|this.irANuevoVillano])
		]
		
		new Button(columnaIzquierda) => [
			caption = "Editar"
			onClick [ |  ]
		]
//		new Button(panelDeListadoDeMaterias) =>[
//			caption = "Nueva Materia"
//			onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
//		] 
	}
	
	private def crearPanelListas(Panel columnaDerecha) {
		var listas = new Panel(columnaDerecha)	
		listas.layout = new ColumnLayout(1)	
		
		new Label(listas).text = "Señas Particulares: "
		new List(listas) => [
			items <=> "villanoSeleccionado.seniasParticulares"
			width = 220
		]
		
		new Label(listas).text = "Hobbies: "
		new List(listas) => [
			items <=> "villanoSeleccionado.hobbies"
			width = 220
		]
	}
	
	private def crearPanelNombreSexo(Panel columnaDerecha) {
		var nombreSexo = new Panel(columnaDerecha)	
		nombreSexo.layout = new ColumnLayout(2)	
		
		new Label(nombreSexo).text = "Nombre: "
		new TextBox(nombreSexo) => [
			width = 220
			bindValueToProperty("villanoSeleccionado.nombre")
		]
		
		new Label(nombreSexo).text = "Sexo: "
		new TextBox(nombreSexo) => [
			width = 220
			bindValueToProperty("villanoSeleccionado.sexo")
		]
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	
//	TODO Hay que ver como se hacen las transacciones de ventanas...
	def void irANuevoVillano() {
		this.openDialog(new CrearVillanoWindow(this, new Villano))
	}
	
	def void irAEditarVillano() {
		this.openDialog(new CrearVillanoWindow(this, modelObject.villanoSeleccionado))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
}