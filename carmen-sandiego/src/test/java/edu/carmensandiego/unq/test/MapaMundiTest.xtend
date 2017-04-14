package edu.carmensandiego.unq.test

import edu.carmensandiego.unq.dominio.MapaMundi
import edu.carmensandiego.unq.dominio.Pais
import org.junit.Before
import org.junit.Test
import edu.carmensandiego.unq.dominio.Club
import edu.carmensandiego.unq.dominio.Biblioteca
import edu.carmensandiego.unq.dominio.Embajada
import static org.junit.Assert.*

class MapaMundiTest {
	
	MapaMundi mapamundi
	Pais pais1
	Pais pais2

	@Before def void setup() {
		mapamundi = new MapaMundi
		pais1 = new Pais("Marruecos")
		pais2 = new Pais("Sudan")
		mapamundi.listaPaises.addAll(pais1, pais2)
	}

	@Test def void testEliminarUnPais() {
		mapamundi.eliminarPais(pais1)
		assertTrue("Se espera que el pais eliminado ya no se encuentre en la lista de paises", !mapamundi.listaPaises.contains(pais1))
	}
	
	@Test def void testAgregarUnPaisNuevo(){
		var paisNuevo = new Pais("China")
		mapamundi.agregarPaisNuevo(paisNuevo)
		assertTrue("Se espera que el pais agregado se encuentre en la lista de paises", mapamundi.listaPaises.contains(paisNuevo))
	}
	

}