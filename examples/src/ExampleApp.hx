package ;

import js.Browser;
import mithril.M;

class ExampleApp {
  var homeModule : HomeModule;

  public function new() {
    homeModule = new HomeModule();
  }

  public function start() {
    M.routeMode = "hash";
    M.route(Browser.document.getElementById("root"), "/", {
      "/": homeModule
    });
  }

  public static function main() {
    new ExampleApp().start();
  }
}
