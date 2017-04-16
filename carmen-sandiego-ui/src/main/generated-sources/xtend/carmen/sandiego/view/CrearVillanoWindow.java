package carmen.sandiego.view;

import carmen.sandiego.view.Villano;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class CrearVillanoWindow extends SimpleWindow<Villano> {
  public CrearVillanoWindow(final WindowOwner owner, final Villano villano) {
    super(owner, villano);
    this.setTitle("Expedientes - Nuevo Villano");
  }
  
  public void createFormPanel(final Panel mainPanel) {
    final Panel editorPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    editorPanel.setLayout(_columnLayout);
    Label _label = new Label(editorPanel);
    _label.setText("Nombre: ");
    TextBox _textBox = new TextBox(editorPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "nombre");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Label _label_1 = new Label(editorPanel);
    _label_1.setText("Sexo: ");
    TextBox _textBox_1 = new TextBox(editorPanel);
    final Procedure1<TextBox> _function_1 = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "sexo");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_1);
    Label _label_2 = new Label(editorPanel);
    _label_2.setText("Señas Particulares: ");
    Button _button = new Button(editorPanel);
    final Procedure1<Button> _function_2 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Editar Señas Particulares");
        it.setAsDefault();
        final Action _function = new Action() {
          public void execute() {
            CrearVillanoWindow.this.jugar();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_2);
  }
  
  public void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Jugar");
        it.setAsDefault();
        final Action _function = new Action() {
          public void execute() {
            CrearVillanoWindow.this.jugar();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  public void jugar() {
    Villano _modelObject = this.getModelObject();
    String _hola = _modelObject.hola();
    String _string = _hola.toString();
    this.showInfo(_string);
  }
}
