package mithril.components;

import mithril.M;

/**
 * Component primitive which renders a static BasicType value.
 * The value is set a construction time, and does not change from
 * redraw to redraw.
 */
class StaticComponent extends BoundComponent {
  public static var nil(default, null) : IComponent = new StaticComponent(null);
  public static var empty(default, null) : IComponent = new StaticComponent("");
  public static var nbsp(default, null) : IComponent = new StaticComponent(M.trust("&nbsp;"));

  public function new(?staticValue : BasicType) {
    super(M.prop(staticValue));
  }
}
