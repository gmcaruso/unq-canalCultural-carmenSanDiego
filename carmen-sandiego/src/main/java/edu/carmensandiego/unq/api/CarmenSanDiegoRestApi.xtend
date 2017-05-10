package edu.carmensandiego.unq.api

import edu.carmensandiego.unq.dominio.Villano
import java.util.List
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class CarmenSanDiegoRestApi {
	
    extension JSONUtils = new JSONUtils

	List<Villano> villanos = newArrayList()

    new(List<Villano> villanos) {
        this.villanos = villanos
    }

    @Get("/villanos")
    def getvillanos() {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.villanos.toJson)
    }
    
}