package mithril.components;

import mithril.M;
import mithril.components.utils.Typedefs;

/**
 * Component primitive which renders a static BasicType value.
 * The value is set a construction time, and does not change from
 * redraw to redraw.
 */
class ValueStatic extends ValueBound {
  public static var nil(default, null) : Mod = new ValueStatic(null);
  public static var empty(default, null) : Mod = new ValueStatic("");
  public static var nbsp(default, null) : Mod = new ValueStatic(M.trust("&nbsp;"));

  public function new(?content : BasicType) {
    super(M.prop(content));
  }
}
