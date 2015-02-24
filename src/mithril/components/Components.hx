package mithril.components;

import mithril.M;
using Lambda;

/**
 * Component primitive which renders an array of child components
 * (with no container element)
 */
class Components implements Module<Components> {
  var content : Array<Module<Dynamic>>;

  public function new(content : Array<Module<Dynamic>>) {
    this.content = content;
  }

  public function controller() {
    content.iter(function(item) {
      item.controller();
    });
  }

  public function view() {
    return content.map(function(item) {
      return item.view();
    });
  }
}
