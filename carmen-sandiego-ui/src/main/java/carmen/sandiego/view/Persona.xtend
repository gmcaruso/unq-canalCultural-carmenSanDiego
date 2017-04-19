package carmen.sandiego.view

import org.eclipse.xtend.lib.annotations.Accessors

abstract class Persona {
	
@Accessors	
    String pista;
	
	def abstract String darPista();
	
}