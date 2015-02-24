package mithril.components.simple;

import mithril.M;

class InputText extends El {
  public function new(?attributes : Dynamic) {
    super("input[type='text']", attributes);
  }
}
