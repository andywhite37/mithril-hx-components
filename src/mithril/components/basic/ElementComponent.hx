package mithril.components.basic;

import mithril.M;

typedef ElementOptions = {
  ?className : GetterSetter<String>,
  ?style : GetterSetter<Dynamic>
};

class ElementComponent extends ComponentBase {
  var selector : String = "";
  var className : GetterSetter<String> = M.prop("");
  var style : GetterSetter<Dynamic> = M.prop(null);
  var child : IComponent = StaticComponent.nil;

  public function new(?selector, ?options, ?child) {
    super();

    if (selector != null) this.selector = selector;
    if (options != null) {
      if (options.className != null) this.className = options.className;
      if (options.style != null) this.style = options.style;
    }
    if (child != null) this.child = child;
  }

  public override function controller() {
    child.controller();
  }

  public override function view(?ctrl) {
    var attrs = {
      className: className(),
      style: style()
    };

    return m(selector, attrs, child.view());
  }
}
