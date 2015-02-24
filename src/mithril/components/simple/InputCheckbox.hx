package mithril.components.simple;

import mithril.M;

class InputCheckbox extends El {
  public function new(?attributes : Void -> Dynamic) {
    super("input[type='checkbox']", attributes);
  }
}
