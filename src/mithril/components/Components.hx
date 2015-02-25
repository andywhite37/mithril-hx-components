package mithril.components;

import mithril.M;
using Lambda;

/**
 * Module which renders an array of child modules.
 * (with no container element)
 */
class Components implements Module<Components> {
  var contents : Array<Module<Dynamic>>;

  public function new(contents : Array<Module<Dynamic>>) {
    trace(contents);
    this.contents = contents;
  }

  public function controller() {
    if (contents == null) {
      trace("here");
      trace(contents);
    }
    contents.iter(function(content) {
      content.controller();
    });
  }

  public function view() {
    return contents.map(function(content) {
      return content.view();
    });
  }
}
