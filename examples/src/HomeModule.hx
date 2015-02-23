package ;

import mithril.M;
import mithril.components.Basic;
import mithril.components.Multi;
import mithril.components.El;
import mithril.components.bootstrap.Button;
using Lambda;

class HomeModule implements Module<HomeModule> {
  var modules : Array<Module<Dynamic>>;

  public function new() {
    modules = [
      new Button({
        content: new Basic("Click me!"),
        type: ButtonType.Default,
        color: ButtonColor.Default,
        size: ButtonSize.Default,
        onClick: function(e) {
          trace("click");
        }
      }),
      new Button({
        content: new Basic("Click 2"),
        type: ButtonType.Default,
        color: ButtonColor.Primary,
        size: ButtonSize.Large,
        onClick: function(e) {
          trace("click 2");
        }
      }),
      new Button({
        content: new Multi([
          new El("i.fa.fa-shopping-cart"),
          new Basic(" Checkout")
        ])
      }),
      new Multi([
        new El(".blue", { style: { backgroundColor: "blue" } }, new Basic("Blue box") ),
        new El(".red", { style: { backgroundColor: "red" } }, new Basic("Red box") ),
      ]),
      new El(".container", new Multi([
        new El(".blue", { style: { backgroundColor: "blue" } }, new Basic("Blue box") ),
        new El(".red", { style: { backgroundColor: "red" } }, new Basic("Red box") ),
      ]))
    ];
  }

  public function controller() {
    modules.foreach(function(module) {
      module.controller();
      return true;
    });
  }

  public function view() {
    return m("div", modules.map(function(module) {
      return module.view();
    }));
  }
}
