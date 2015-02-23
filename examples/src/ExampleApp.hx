package ;

import mithril.M;

class ExampleApp {
  var home : HomeModule;

  public function new() {
    home = new HomeModule();
  }

  public function start() {
    M.routeMode = "hash";
    M.route(js.Browser.document.getElementById("root"), "/", {
      "/": home
    });
  }

  public static function main() {
    new ExampleApp().start();
  }
}