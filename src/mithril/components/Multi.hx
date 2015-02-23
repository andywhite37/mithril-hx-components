package mithril.components;

import mithril.M;
using Lambda;

class Multi implements Module<Multi> {
  @prop public var content : Array<Module<Dynamic>>;

  public function new(content : Array<Module<Dynamic>>) {
    this.content = M.prop(content);
  }

  public function controller() {
    content().foreach(function(item) {
      item.controller();
      return true;
    });
  }

  public function view() {
    return content().map(function(item) {
      return item.view();
    });
  }
}
