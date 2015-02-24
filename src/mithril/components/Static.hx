package mithril.components;

import mithril.M;

class Static extends Basic {
  public function new(?content : BasicType) {
    super(M.prop(content));
  }
}
