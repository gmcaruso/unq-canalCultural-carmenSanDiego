package appModel

import java.util.Arrays
import edu.carmensandiego.unq.dominio.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.carmensandiego.unq.dominio.MapaMundi

@Observable
@Accessors
class MapaMundiAppModel {
	
	MapaMundi mapaMundi = new MapaMundi
	Pais paisSeleccionado 
	
	
	def getCaracteristicas(){
		Arrays.asList(paisSeleccionado.caracteristicas)
	}
	
	def getConexionesAreas(){
		Arrays.asList(paisSeleccionado.conexionesAereas)
	}
	
	def getLugaresDeInteres(){
		Arrays.asList(paisSeleccionado.lugaresDeInteres)
	}
	
	def eliminarPais(){
		mapaMundi.eliminarPais(paisSeleccionado)
	}
	
	def agregarPais(){
		val Pais = new Pais
		mapaMundi.agregarPaisNuevo(Pais)
		
	}
}	