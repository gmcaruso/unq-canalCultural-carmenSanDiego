package carmen.sandiego.view

import org.uqbar.arena.windows.SimpleWindow
import appModel.ViajarAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.carmensandiego.unq.dominio.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.aop.windows.TransactionalDialog

class ViajarWindow extends TransactionalDialog<ViajarAppModel> {
	
	new(WindowOwner parent, ViajarAppModel model) {
		super(parent, model)
	}
	
	override createMainTemplate(Panel mainPanel) {
		
		this.crearListaDePaises(mainPanel)
	}
		
	def crearListaDePaises(Panel owner) {
		new Label(owner).text = "Estas en: "
		new TextBox(owner) => [
			(value <=> "paisEnQueEstoy").adapter = new PropertyAdapter(Pais, "nombre")
			width = 220
		]
		new Label(owner).text = "Psibles Destinos: "
		new List<Pais>(owner)=>[
		value <=> "paisSeleccionado"
			(items <=> "recorridoPaises").adapter = new PropertyAdapter(Pais, "nombre")
		
		]
		
		new Button(owner) => [
			caption = "Volver al Pais Anterior"			
			onClick [ | this.modelObject.volver()]
		]
		
		new Button(owner) => [
			caption = "Viajar"			
			onClick [ | this.modelObject.viajar()]
		]

}

override protected addActions(Panel actionsPanel) {

}

override protected createFormPanel(Panel mainPanel) {

}

}