package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.carmensandiego.unq.dominio.Pais

@Accessors
@Observable
class EditarCaracteristicasAppModel {


	Pais pais
	String caracteristicaElegida
	String caracteristicaAgregar

	def eliminarCaracteristica() {
		if(caracteristicaElegida != ""){
			this.pais.borrarCaracteristica(caracteristicaElegida)	
		}else{
			throw new UnsupportedOperationException("selecciona una caracteristica para eliminar")
		}
	}
	
	def agregarCaracteristica() {
		if(this.caracteristicaAgregar != ""){
			this.pais.agregarCaracteristica(this.caracteristicaAgregar)
		}else{
			throw new UnsupportedOperationException("introduzca una caracteristica para agregar");
		}
	}
	
	
}