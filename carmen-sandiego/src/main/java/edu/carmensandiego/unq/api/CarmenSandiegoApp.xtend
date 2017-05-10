package edu.carmensandiego.unq.api

import org.uqbar.xtrest.api.XTRest
import edu.carmensandiego.unq.dominio.Villano

class CarmenSandiegoApp {
	
	def static void main(String[] args) {
		var villanos = newArrayList()
		villanos.add(new Villano("pepe", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("lala", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("lele", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("popo", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("pipi", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("eeee", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("aaaa", "masc", newArrayList(), newArrayList()))
		villanos.add(new Villano("wwww", "masc", newArrayList(), newArrayList()))
		
        XTRest.startInstance(new CarmenSanDiegoRestApi(villanos), 8080)
    }
	
}