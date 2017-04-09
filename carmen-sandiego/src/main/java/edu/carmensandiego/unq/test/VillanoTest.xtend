package edu.carmensandiego.unq.test

import org.junit.Test
import static org.junit.Assert.*
import edu.carmensandiego.unq.dominio.Villano
import java.util.List

class VillanoTest {	
	
    @Test
	def void testVillanoCreado(){
		
		var String nombreQueTiene = "Caruso Lombardi"
		var String sexoQueTiene = 'Masculino'
		var String sena = 'Usa peluquin'
		var String hobbie = 'Vende humo'
		var List <String> senas = newArrayList
		var List <String> hobbies = newArrayList
		
		
		
		
		
		var Villano elVillano = new Villano
		
		elVillano.setNombre(nombreQueTiene)
		elVillano.setSexo(sexoQueTiene)
		elVillano.senasParticulares.add(sena)
		elVillano.hobbies.add(hobbie)
		
		
		elVillano.editar('Juan Palomino','Femenino',senas,hobbies)
		
		assertEquals(elVillano.getNombre ,'Juan Palamino')
		assertEquals(elVillano.getSexo ,'Femenino')
		assertEquals(elVillano.getSenasParticulares , senas)
		assertEquals(elVillano.getHobbies , hobbies)
		
    }	
}