package ;

import mithril.M;
import mithril.components.Factory.*;
import mithril.components.IComponent;

class HomeViewModel implements Model {
  @prop public var inputText : String;
  @prop public var liStyle : Dynamic;

  public function new() {
    inputText = M.prop("");
    liStyle = M.prop({});
  }
}

class HomeModule implements Module<HomeModule> {
  var model : HomeViewModel;
  var component : IComponent;

  public function new() {
    model = new HomeViewModel();

    component = div(".test", comps([
      stat("Static text"),
      div(".inner", stat("Inner Text")),
      inputText(".text-input", { value: model.inputText, placeholder: "Enter something" }),
      span(".text-span", bound(model.inputText)),
      ul(".my-ul", comps([
        li({ style: model.liStyle }, stat("one")),
        li(stat("two")),
        li(stat("three"))
      ]))
    ]));
  }

  public function controller() {
    component.controller();
  }

  public function view() {
    if (model.inputText().length > 0) {
      model.liStyle({ backgroundColor: "blue" });
    } else {
      model.liStyle({});
    }

    return [
      m("h1", "Welcome to the example app!"),
      component.view()
    ];
  }
}
