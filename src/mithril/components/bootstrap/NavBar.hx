package mithril.components.bootstrap;

class NavBar extends ComponentBase {
  var brand : IComponent;
  var left : IComponent;
  var right : IComponent;

  public function new(brand : IComponent, left : IComponent, right : IComponent) {
    super();
    this.brand = brand;
    this.left = left;
    this.right = right;
  }

  public override function controller() {
    brand.controller();
    left.controller();
    right.controller();
  }

  public override function view(?ctrl) {
    return m(".navbar.navbar-default.navbar-fixed-top",
      m(".container", [
        m(".navbar-header", [
          m("button.navbar-toggle.collapsed[data-toggle=collapse][data-target=#navbar-collapse]", [
            m("span.sr-only", "Toggle navigation"),
            m("span.icon-bar"),
            m("span.icon-bar"),
            m("span.icon-bar"),
          ]),
          m("a[href='#'].navbar-brand", brand.view())
        ]),
        m("#navbar-collapse.collapse.navbar-collapse", [
          m(".nav.navbar-nav.navbar-left", left.view()),
          m(".nav.navbar-nav.navbar-right", right.view())
        ])
      ])
    );
  }
}
