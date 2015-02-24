package mithril.components;

import mithril.M;

/**
 * Component primitive which renders a static BasicType value.
 * The value is set a construction time, and does not change from
 * redraw to redraw.
 */
class ValueStatic extends ValueBound {
  public static var nil(default, null) : Module<Dynamic> = new ValueStatic(null);
  public static var empty(default, null) : Module<Dynamic> = new ValueStatic("");
  public static var nbsp(default, null) : Module<Dynamic> = new ValueStatic(M.trust("&nbsp;"));

  public function new(?content : BasicType) {
    super(M.prop(content));
  }
}
