package ;

import js.Browser;
import mithril.M;
using Lambda;

class NavModule implements Module<NavModule> {
  var links = [
    { title: "Home", route: "/", isActive: false },
    { title: "Test", route: "/test", isActive: false },
    { title: "TODO", route: "/todo", isActive: false },
  ];

  public function new() {
    /*
    module = div(".navbar.navbar-default.navbar-fixed-top", c([
      div(".container", c([
        div(".navbar-header", c([
          button(".navbar-toggle.collapsed", a({ "data-toggle": "collapse", "data-target": "#navbar-collapse" }), c([
            span(".sr-only", null, function() return "Toggle navigation"),
            span(".icon-bar"),
            span(".icon-bar"),
            span(".icon-bar"),
          ])),
          link("[href='#'].navbar-brand", c("Mithril Haxe Components")),
          div("#navbar-collapse.collapse.navbar-collapse", c(
            ul(".nav.navbar-nav", c(
              links.map(function(l) {
                return li(c(
                  link('[href=${l.route}' + (l.isActive ? ".active" : ""), a({ config: M.route }), c(l.title))
                ));
              })
            ))
          ))
        ]))
      ]))
    ]));
    */
  }

  public function controller() {
    //module.controller();
  }

  public function view() {
    links.iter(function(link) {
      link.isActive = link.route == M.route();
    });

    //return module.view();
    return m("nav", "Nav");
  }
}
