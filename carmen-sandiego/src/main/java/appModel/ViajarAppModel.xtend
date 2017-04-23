package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.carmensandiego.unq.dominio.Pais
import java.util.List

@Observable
@Accessors
class ViajarAppModel {
	
	Pais paisSeleccionado
	List<Pais> recorridoPaises
	Pais paisEnQueEstoy
	
	
	
	def viajar() {
		this.recorridoPaises.add(paisSeleccionado)
		this.paisEnQueEstoy = paisSeleccionado
	}
	
	def volver() {
			this.recorridoPaises.remove(paisEnQueEstoy)
			this.paisEnQueEstoy = this.recorridoPaises.get(this.recorridoPaises.size -1)
	
	}
}