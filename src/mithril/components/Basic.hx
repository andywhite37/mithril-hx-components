package mithril.components;

import haxe.ds.Either;
import mithril.M;

class Basic implements Module<Basic> {
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
