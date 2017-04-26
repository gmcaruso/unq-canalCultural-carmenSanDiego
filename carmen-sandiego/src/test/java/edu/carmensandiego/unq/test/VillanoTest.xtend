package edu.carmensandiego.unq.test

import edu.carmensandiego.unq.dominio.Villano
import org.junit.Test

import static org.junit.Assert.*

class VillanoTest {	
	
 	Villano villano

	@Test def void testAgregarUnaNuevaSeniaCorrectamente() {
		assertTrue(villano.getSeniasParticulares.empty)

		villano.agregarNuevaSenia("Esta es una nueva senia")
		assertTrue("Se espera que el villano tenga la nueva sena: ", villano.getSeniasParticulares.contains("Esta es una nueva senia"))
	}


	@Test def void testEliminarUnaNuevaSenia() {
		assertTrue(villano.getSeniasParticulares.empty)

		villano.getSeniasParticulares.add("Senia nueva")

		villano.eliminarSenia("Senia nueva")
		assertTrue("Se espera que el villano ya no tenga la seÃ±a eliminada: ", !villano.getSeniasParticulares.contains("Senia nueva"))
	}

	@Test def void testAgregarUnNuevoHobbieCorrectamente() {
		assertTrue(villano.hobbies.empty)

		villano.agregarNuevoHobbie("Esta es un nuevo hobbie")
		assertTrue("Se espera que el villano tenga un nuevo hobbie: ", villano.hobbies.contains("Esta es un nuevo hobbie"))
	}
}