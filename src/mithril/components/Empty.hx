package mithril.components;

import mithril.M;

class Empty extends Basic {
  public static var empty : Module<Dynamic> = new Empty();

  private function new() {
    super(M.prop(""));
  }
}
