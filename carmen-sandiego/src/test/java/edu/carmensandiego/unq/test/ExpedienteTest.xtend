package edu.carmensandiego.unq.test

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import edu.carmensandiego.unq.dominio.Expediente
import edu.carmensandiego.unq.dominio.Villano

class ExpedienteTest {

	Expediente expediente
	Villano villano

	@Before def void setup() {
		expediente = new Expediente
		villano = new Villano()
	}

	@Test def void testAgregarUnNuevoVillanoCorrectamente() {
		expediente.agregarVillano(villano)
		assertTrue("Se espera que el villano se haya agregado correctamente: ", expediente.villanos.contains(villano))
	}
	
//	@Test def void testBuscarVillanoEnLaColeccion() {
//		expediente.agregarVillano(villano)
//		assertEquals(villano,expediente.buscarVillanoEnLaColeccion(villano.nombre));
//	}
	
	
	
	
	
	
}