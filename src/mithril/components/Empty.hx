package mithril.components;

import mithril.M;

class Empty implements Module<Empty> {
  public static var empty : Module<Dynamic> = new Empty();

  private function new() {
  }

  public function controller() {
  }

  public function view() {
    return "";
  }
}
