package carmen.sandiego.view;

import carmen.sandiego.view.Persona;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.ObservableUtils;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class Villano extends Persona {
  private String nombre;
  
  private String sexo;
  
  private List<String> seniasParticulares = CollectionLiterals.<String>newArrayList();
  
  private List<String> hobbies = CollectionLiterals.<String>newArrayList();
  
  public String hola() {
    return "Hola";
  }
  
  public String darPista() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public void cambiarNombreDelVillano(final String nuevoNombre) {
    this.nombre = nuevoNombre;
    ObservableUtils.firePropertyChanged(this, "nombre", this.nombre);
  }
  
  public void agregarNuevaSenia(final String seniaAAgregar) {
    boolean _contains = this.seniasParticulares.contains(seniaAAgregar);
    if (_contains) {
      throw new UnsupportedOperationException("La senia que intenta agregar ya existe");
    }
    this.seniasParticulares.add(seniaAAgregar);
    ObservableUtils.firePropertyChanged(this, "seniasParticulares", this.seniasParticulares);
  }
  
  public void eliminarSenia(final String seniaAEliminar) {
    this.seniasParticulares.remove(seniaAEliminar);
    ObservableUtils.firePropertyChanged(this, "seniasParticulares", this.seniasParticulares);
  }
  
  public void agregarNuevoHobbie(final String hobbieNuevo) {
    boolean _contains = this.hobbies.contains(hobbieNuevo);
    if (_contains) {
      throw new UnsupportedOperationException("El Hobbit que intenta agregar ya existe");
    }
    this.hobbies.add(hobbieNuevo);
    ObservableUtils.firePropertyChanged(this, "hobbies", this.hobbies);
  }
  
  public void eliminarHobbie(final String hobbieARemover) {
    this.hobbies.remove(hobbieARemover);
    ObservableUtils.firePropertyChanged(this, "hobbies", this.hobbies);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getSexo() {
    return this.sexo;
  }
  
  public void setSexo(final String sexo) {
    this.sexo = sexo;
  }
  
  @Pure
  public List<String> getSeniasParticulares() {
    return this.seniasParticulares;
  }
  
  public void setSeniasParticulares(final List<String> seniasParticulares) {
    this.seniasParticulares = seniasParticulares;
  }
  
  @Pure
  public List<String> getHobbies() {
    return this.hobbies;
  }
  
  public void setHobbies(final List<String> hobbies) {
    this.hobbies = hobbies;
  }
}
