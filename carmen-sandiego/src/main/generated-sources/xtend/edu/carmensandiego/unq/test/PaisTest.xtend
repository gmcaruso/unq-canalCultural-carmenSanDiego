package edu.carmensandiego.unq.test
import org.junit.Test
import static org.junit.Assert.*
import edu.carmensandiego.unq.dominio.Villano
import java.util.List
import edu.carmensandiego.unq.dominio.Pais

class PaisTest {

	
    @Test
	def void testPaisCreado(){
		
		var String nombreQueTiene = "Guatemala"
		var String caracteristicas = 'Tiene Playa'
		var List <String> lugaresDeInteresPorLosCriminales = newArrayList
		var List <String> conexionesAreas = newArrayList
		var List <String> lugares = newArrayList
		
		
		
		var Pais elPais = new Pais
		
		elPais.setNombre(nombreQueTiene)
		elPais.setCaracteristicas(caracteristicas)
		//elPais.lugaresDeInteresPorLosCriminales.add(lugaresDeInteresPorLosCriminales)
		//elPais.conexionesAereas.add(conexionesAreas)
		
		
		elPais.editar('Brasil','Tiene Playa',conexionesAreas,lugares)
		
		assertEquals(elPais.getNombre ,'Brasil')
		assertEquals(elPais.getCaracteristicas ,'Tiene Playa')
		
    }	
	
}