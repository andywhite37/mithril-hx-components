package mithril.components.simple;

import mithril.M;

class Form extends El {
  public function new(?attributes : Dynamic, ?content : Module<Dynamic>) {
    super("form", attributes, content);
  }
}
