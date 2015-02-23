package mithril.components;

import mithril.M;

class Basic implements Module<Basic> {
  @prop public var value : M.BasicType;

  public function new(value) {
    this.value = M.prop(value);
  }

  public function controller() {
  }

  public function view() {
    return value();
  }
}
