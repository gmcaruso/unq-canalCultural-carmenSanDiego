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
import org.uqbar.arena.bindings.PropertyAdapter
import edu.carmensandiego.unq.dominio.Pais

class EditarPaisWindow extends TransactionalDialog<Juego> {

new(WindowOwner owner, Juego model, String newTitle) {
		super(owner, model)
		title = newTitle
	}
	
	override createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new ColumnLayout(2)
		
		new Label(editorPanel).text = "Nombre: "
		new TextBox(editorPanel) => [
			value <=> "paisSeleccionado.nombre"
			width = 220
		]
		
		new Label(editorPanel).text = "Caracteristicas: " 
		new Button(editorPanel) => [
			caption = "Editar caractaeristicas"
			onClick [ |this.irAEditarCaracteristicas]
		]
		
		val listaSenia = new Panel(mainPanel)
		listaSenia.layout = new ColumnLayout(1)
		new List(listaSenia) => [
			width = 220
			items <=> "paisSeleccionado.caracteristicas"
		]
		
		val conexiones = new Panel(mainPanel)
		conexiones.layout = new ColumnLayout(2)
		new Label(conexiones).text = "Conexiones Aereas: " 
		new Button(conexiones) => [
			caption = "Editar Conexiones Aereas"
			onClick [ |this.irAEditarConexionesAereas]
		]
		
		val listaConexiones = new Panel(mainPanel)
		listaConexiones.layout = new ColumnLayout(1)
		new List(listaConexiones) => [
			width = 220
			(items <=> "paisSeleccionado.conexionesAereas").adapter = new PropertyAdapter(Pais, "nombre")
		]
	}
	
	// ********************************************************
	// ** Acciones
	// ********************************************************
	def irAEditarCaracteristicas() {
		//this.modelObject.editarSenia = true
		this.openDialog(new EditarAtributosListaVillanoWindow(this, modelObject, "Editar Caracteristicas"))
	}
	
	def irAEditarConexionesAereas() {
		//this.modelObject.editarSenia = false
		this.openDialog(new EditarAtributosListaVillanoWindow(this, modelObject, "Editar ConexionesAreas"))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [| 
				if(modelObject.esNuevoVillano){
					this.modelObject.crearPais(modelObject.paisSeleccionado.nombre, modelObject.paisSeleccionado.caracteristicas, 
					modelObject.paisSeleccionado.conexionesAereas)
				}
				this.close
			]
		]
	}
	
}