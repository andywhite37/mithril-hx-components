package mithril.components;

import mithril.M;
import mithril.components.utils.Typedefs;
using Lambda;

/**
 * Module which renders an array of child modules.
 * (with no container element)
 */
class Components implements Module<Components> {
  var modules : Mods;

  public function new(modules : Mods) {
    this.modules = modules;
  }

  public function controller() {
    modules.iter(function(module) {
      module.controller();
    });
  }

  public function view() {
    return modules.map(function(module) {
      return module.view();
    });
  }
}
