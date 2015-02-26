package mithril.components;

import mithril.M;
using Lambda;

/**
 * Module which renders an array of child modules.
 * (with no container element)
 */
class Components implements IComponent {
  var components : Array<IComponent>;

  @:from
  public static function fromArrayComponents(components : Array<IComponent>) {
    return new Components(components);
  }

  public function new(components : Array<IComponent>) {
    this.components = components;
  }

  public function controller() {
    components.iter(function(component) {
      component.controller();
    });
  }

  public function view() {
    return components.map(function(component) {
      return component.view();
    });
  }
}
