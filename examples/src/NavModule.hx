package ;

import js.Browser;
import mithril.M;
import mithril.components.*;
import mithril.components.Factory.*;
import mithril.components.bootstrap.NavBar;
using Lambda;

class NavModule implements Module<NavModule> {
  var links = [
    { title: "Home", route: "/", isActive: false },
    { title: "Test", route: "/test", isActive: false },
    { title: "TODO", route: "/todo", isActive: false },
  ];

  var component : IComponent;

  public function new() {
    component = new NavBar(
      new StaticComponent("Mithril Haxe Components"),
      new StaticComponent("Left"),
      new StaticComponent("Right"));
  }

  public function controller() {
    component.controller();
  }

  public function view() {
    return component.view();
  }
}
