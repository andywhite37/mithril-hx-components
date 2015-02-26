package mithril.components;

import mithril.M;
using Lambda;

/**
 * Module which renders an array of child modules.
 * (with no container element)
 */
class Components extends ComponentBase {
  var components : Array<IComponent>;

  @:from
  public static function fromArrayComponents(components : Array<IComponent>) {
    return new Components(components);
  }

  public function new(components : Array<IComponent>) {
    super();
    this.components = components;
  }

  public override function controller() {
    components.iter(function(component) {
      component.controller();
    });
  }

  public override function view(?ctrl) : ViewOutput {
    return components.map(function(component) {
      return component.view();
    });
  }
}
