package carmen.sandiego.view

import appModel.MapaMundiAppModel
import edu.carmensandiego.unq.dominio.Pais
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class MapaMundiWindow extends TransactionalDialog<MapaMundiAppModel> {
	
	new(WindowOwner parent, MapaMundiAppModel model) {
		super(parent, model)
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Paises"

		new Label(mainPanel).text = "Mapamundi"
		
		this.crearListaDePaises(mainPanel)
		//this.crearEdicionDePaisSeleccionado(mainPanel)
	}
	
	def crearListaDePaises(Panel owner) {
		
		new Label(owner).text = "Paises"
		new List<Pais>(owner)=>[
		value <=> "paisSeleccionado"
			(items <=> "mapaMundi.listaPaises").adapter = new PropertyAdapter(Pais, "nombre")
		]
		new Button(owner) =>[
			caption = "Eliminar"
			onClick [ | this.modelObject.eliminarPais()]
		]
		
		new Button(owner) =>[
			caption = "Editar"
			onClick [ | new EditarPaisSeleccionadoWindow(this, this.modelObject.paisSeleccionado).open ]
		]
		
		new Button(owner) =>[
			caption = "Nuevo"
			onClick [ | new PaisWindow(this, new Pais).open ]
		]			
	}
	
	def crearEdicionDePaisSeleccionado(Panel owner) {
		new Label(owner).value <=> "paisSeleccionado.nombre"
	}
	
	override protected addActions(Panel actionsPanel) {
		//no queremos usar este template default
	}
	
	override protected createFormPanel(Panel mainPanel) {
		//no queremos usar este template default
	}
	
}