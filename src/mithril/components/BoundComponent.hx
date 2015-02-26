package mithril.components;

import haxe.ds.Either;
import mithril.M;

/**
 * Component primitive which renders a BasicType value (not wrapped
 * in an element).  The BasicType value managed by this class is a
 * GetterSetter<BasicType>, so it will render the current value of
 * the GetterSetter value with each redraw.
 */
class BoundComponent implements IComponent {
  public var getterSetter : GetterSetter<BasicType>;

  @:from
  public static function fromGetterSetter(getterSetter : GetterSetter<BasicType>) {
    return new BoundComponent(getterSetter);
  }

  public function new(getterSetter) {
    this.getterSetter = getterSetter;
  }

  public function controller() {
  }

  public function view() {
    return getterSetter();
  }
}
