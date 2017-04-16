package carmen.sandiego.view;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public abstract class Persona {
  @Accessors
  private String pista;
  
  public abstract String darPista();
  
  @Pure
  public String getPista() {
    return this.pista;
  }
  
  public void setPista(final String pista) {
    this.pista = pista;
  }
}
