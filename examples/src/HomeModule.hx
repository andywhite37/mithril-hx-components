package ;

import mithril.M;

class HomeModule implements Module<HomeModule> {
  public function new() {
  }

  public function controller() {
  }

  public function view() {
    m("h1", "Welcome to the example app!");
  }
}
