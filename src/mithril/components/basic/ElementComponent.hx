package mithril.components.basic;

import js.html.Event;
import js.html.KeyboardEvent;
import js.html.MouseEvent;
import mithril.M;

typedef ElementOptions = {
  // DOM-related options
  ?id : String,
  ?className : GetterSetter<String>,
  ?style : GetterSetter<Dynamic>,
  ?href : String,
  ?placeholder : String,
  ?value : GetterSetter<BasicType>,
  ?readOnly : GetterSetter<Bool>,
  ?disabled : GetterSetter<Bool>,

  // Image
  ?src : GetterSetter<String>,
  ?alt : String,

  // Mithril options
  ?key : String,
  ?config : Dynamic -> Dynamic -> Dynamic -> Void,

  // Mouse events
  ?onclick : MouseEvent -> Void,
  ?onmouseover : MouseEvent -> Void,
  ?onmouseout : MouseEvent -> Void,
  ?onmouseenter : MouseEvent -> Void,
  ?onmouseleave : MouseEvent -> Void
};

class ElementComponent extends ComponentBase {
  var selector(default, null) : String = "";

  var id(default, null) : String = null;
  var className(default, null) : GetterSetter<String> = M.prop(null);
  var key(default, null) : String = null;
  var style(default, null) : GetterSetter<Dynamic> = M.prop(null);

  var child(default, null) : IComponent = StaticComponent.nil;

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
    var attrs = getAttributes();
    return m(selector, attrs, child.view());
  }

  public function getAttributes() : Dynamic {
    var attrs : Dynamic = {};

    if (id != null) attrs.id = id;
    if (className() != null) attrs.className = className();
    if (key != null) attrs.key = key;
    if (style() != null) attrs.style = style();

    return attrs;
  }
}
