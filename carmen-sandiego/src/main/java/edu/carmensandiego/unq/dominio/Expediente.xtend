package edu.carmensandiego.unq.dominio

import edu.carmensandiego.unq.dominio.repos.RepoVillanos
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Expediente {
	List<Villano> villanos = newArrayList;
	RepoVillanos repoVillanos
	
	new() {
		villanos = this.fabricarVillanos
	}
	
	def private fabricarVillanos(){
		var villanose = newArrayList 
		var senias = newArrayList
		var hobbies = newArrayList
		
		senias.add("Gordo")
		senias.add("Alto")
		hobbies.add("Tenis")
		hobbies.add("Comer")
		
		var villano1 = new Villano("Pepe", "Masculino", senias, hobbies)
		var villano2 = new Villano("Carlita", "Femenino", senias, hobbies)
		var villano3 = new Villano("Jorge", "Femenino", senias, hobbies)
		
		villanose.add(villano1)
		villanose.add(villano2)
		villanose.add(villano3)
		
		villanos = villanose
	}
	
	def agregarVillano(Villano villano){
		villanos.add(villano)
	}
	
	def getVillanos(){
		villanos
	}
	
//	new() {
//		repoVillanos = RepoVillanos.instance
//		villanos = repoVillanos.fabricarVillanos
//	}
	
}