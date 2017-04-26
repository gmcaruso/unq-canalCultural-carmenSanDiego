package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Juego
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

class ExpedienteWindow extends TransactionalDialog<Juego>  { 
	
	new(WindowOwner owner, Juego model) {
		super(owner, model)
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
			(items <=> "expediente.villanos").adapter = new PropertyAdapter(Villano, "nombre")
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
			onClick [ |this.irAEditarVillano]
		]
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
	
	def void irANuevoVillano() {
		this.modelObject.villanoSeleccionado = new Villano()
		this.openDialog(new EditarVillanoWindow(this, this.modelObject, "Expedientes - Nuevo Villano"))
	}
	
	def void irAEditarVillano() {
		this.openDialog(new EditarVillanoWindow(this, this.modelObject, "Expedientes - Editar Villano"))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
}