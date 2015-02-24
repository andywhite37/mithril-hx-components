package mithril.components;

import mithril.M;
using Lambda;

class Multi implements Module<Multi> {
  @prop public var content : Array<Module<Dynamic>>;

  public function new(?content : Array<Module<Dynamic>>) {
    this.content = M.prop([]);

    if (content != null) this.content(content);
  }

  public function controller() {
    content().iter(function(item) {
      item.controller();
    });
  }

  public function view() {
    return content().map(function(item) {
      return item.view();
    });
  }
}
