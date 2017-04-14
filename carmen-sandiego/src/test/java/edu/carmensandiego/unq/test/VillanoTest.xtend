package edu.carmensandiego.unq.test

import org.junit.Test
import static org.junit.Assert.*
import edu.carmensandiego.unq.dominio.Villano
import org.junit.Before


class VillanoTest {	
	
 	Villano villano

	@Before def void setup() {
		villano = new Villano
	}

	@Test def void testAgregarUnaNuevaSeniaCorrectamente() {
		assertTrue(villano.senasParticulares.empty)

		villano.agregarNuevaSenia("Esta es una nueva senia")
		assertTrue("Se espera que el villano tenga la nueva seÃ±a: ", villano.senasParticulares.contains("Esta es una nueva senia"))
	}


	@Test def void testEliminarUnaNuevaSenia() {
		assertTrue(villano.senasParticulares.empty)

		villano.senasParticulares.add("Senia nueva")

		villano.eliminarSenia("Senia nueva")
		assertTrue("Se espera que el villano ya no tenga la seÃ±a eliminada: ", !villano.senasParticulares.contains("Senia nueva"))
	}

	@Test def void testAgregarUnNuevoHobbieCorrectamente() {
		assertTrue(villano.hobbies.empty)

		villano.agregarNuevoHobbie("Esta es un nuevo hobbie")
		assertTrue("Se espera que el villano tenga un nuevo hobbie: ", villano.hobbies.contains("Esta es un nuevo hobbie"))
	}
}