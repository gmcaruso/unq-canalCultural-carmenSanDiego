package edu.carmensandiego.unq.test
import org.junit.Test
import static org.junit.Assert.*
import edu.carmensandiego.unq.dominio.Villano
import java.util.List
import edu.carmensandiego.unq.dominio.Pais
import edu.carmensandiego.unq.dominio.Embajada
import edu.carmensandiego.unq.dominio.Biblioteca
import edu.carmensandiego.unq.dominio.Club
import edu.carmensandiego.unq.dominio.Lugar
import edu.carmensandiego.unq.dominio.Banco
import edu.carmensandiego.unq.dominio.Persona
import edu.carmensandiego.unq.dominio.Informante
import org.junit.Before

class PaisTest {

	Pais pais
	Persona ocupante = new Informante
	Pais paisLimitrofe = new Pais("Israel")
	
	@Before def void setup() {
		pais = new Pais("Egipto")
	}

	@Test def void testAgregarNuevaConexionAOtroPais() {
		pais.crearConexionCon(paisLimitrofe)
		assertTrue("Se espera que el pais limitrofe se agregue correctamente", pais.conexionesAereas.contains("Israel"))
	}
	
	@Test def void testBorrarConexionAOtroPais() {
		pais.conexionesAereas.add(paisLimitrofe)
		assertTrue("Se espera que el pais a borrar, se encuentre previamente cargado", pais.conexionesAereas.contains(paisLimitrofe))
		pais.eliminarConexion(paisLimitrofe)
		assertFalse("Se espera que el pais limitrofe borrado no se encuentre en la lista", pais.conexionesAereas.contains(paisLimitrofe))
	}

	@Test def void testAgregarCaracteristicaAUnPais() {
		pais.agregarCaracteristica("Caracteristica nueva")
		assertTrue("Se espera que la lista caracteristica contenga la agregada", pais.caracteristicas.contains("Caracteristica nueva"))
	}

	@Test def void testBorrarCaracteristicaDeUnPais() {
		pais.agregarCaracteristica("Caracteristica para borrar")
		pais.eliminarCaracteristica("Caracteristica para borrar")
		assertTrue("Se espera que la caracteristica sea borrada", pais.caracteristicas.empty)

	}
	
	@Test def void testAgregarNuevoLugarDeInteres() {
		var banco = new Banco(ocupante)
		pais.agregarNuevoLugar(banco)
		assertTrue("Se espera que el lugar de interes nuevo se agregue correctamente", pais.lugaresDeInteres.contains(banco))
	}
	
	@Test def void testBorrarLugarDeInteres() {
		var banco = new Banco(ocupante)
		pais.lugaresDeInteres.add(banco)
		assertTrue("Se espera que el lugar de interes a borrar se encuentre previamente cargado", pais.lugaresDeInteres.contains(banco))
		pais.eliminarLugar(banco)
		assertFalse("Se espera que el lugar borrado no se encuentre mas en la lista", pais.lugaresDeInteres.contains(banco))
	}
	
}	
	
