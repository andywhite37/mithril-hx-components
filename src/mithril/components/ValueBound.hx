package mithril.components;

import haxe.ds.Either;
import mithril.M;

/**
 * Component primitive which renders a BasicType value (not wrapped
 * in an element).  The BasicType value managed by this class is a
 * GetterSetter<BasicType>, so it will render the current value of
 * the GetterSetter value with each redraw.
 */
class ValueBound implements Module<ValueBound> {
  public var content : GetterSetter<BasicType>;

  public function new(content) {
    this.content = content;
  }

  public function controller() {
  }

  public function view() {
    return content();
  }
}
