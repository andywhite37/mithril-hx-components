package mithril.components;

import haxe.ds.Either;
import mithril.M;

/**
 * Component primitive which renders a BasicType value (not wrapped
 * in an element).  The BasicType value managed by this class is a
 * GetterSetter<BasicType>, so it will render the current value of
 * the GetterSetter value with each redraw.
 */
class BoundComponent extends ComponentBase {
  public var getterSetter : GetterSetter<BasicType>;

  public function new(getterSetter) {
    super();
    this.getterSetter = getterSetter;
  }

  public override function view(?ctrl) : ViewOutput {
    return getterSetter();
  }
}
