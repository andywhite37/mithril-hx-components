package ;

import js.Browser;
import mithril.M;

class ExampleApp {
  public function new() {
    M.module(Browser.document.getElementById("nav"), new NavModule());

    M.routeMode = "hash";

    M.route(Browser.document.getElementById("root"), "/", {
      "/" : new HomeModule()
      //"/test" : new TestModule(),
      //"/todo" : new TodoModule()
    });
  }

  public static function main() {
    new ExampleApp();
  }
}
