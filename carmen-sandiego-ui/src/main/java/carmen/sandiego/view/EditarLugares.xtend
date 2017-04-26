package carmen.sandiego.view

import edu.carmensandiego.unq.dominio.Lugar
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class EditarLugares extends SimpleWindow<Lugar> {
	
	new(WindowOwner parent, Lugar lugar) {
		super(parent, lugar)
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	

	
}