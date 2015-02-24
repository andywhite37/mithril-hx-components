package mithril.components.simple;

import mithril.M;

class Button extends El {
  public function new(?attributes : Dynamic, ?content : Module<Dynamic>) {
    super("button[type='button']", attributes, content);
  }
}
