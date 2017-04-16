package carmen.sandiego.view;

import carmen.sandiego.view.CrearVillanoWindow;
import carmen.sandiego.view.Villano;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class JuegoApplication extends Application {
  public Window<?> createMainWindow() {
    Villano _villano = new Villano();
    return new CrearVillanoWindow(this, _villano);
  }
  
  public static void main(final String[] args) {
    JuegoApplication _juegoApplication = new JuegoApplication();
    _juegoApplication.start();
  }
}
