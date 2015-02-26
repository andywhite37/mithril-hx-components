package mithril.components.basic;

import mithril.M;
import mithril.components.basic.ElementComponent;

typedef InputTextOptions = { > ElementOptions,
  value : GetterSetter<BasicType>,
  ?placeholder : String
};

class InputTextComponent extends ElementComponent {
  var value : GetterSetter<BasicType> = M.prop(null);
  var placeholder : String = null;

  public function new(?selectorSuffix : String, options : InputTextOptions) {
    if (selectorSuffix == null) selectorSuffix = "";
    this.value = options.value;
    this.placeholder = options.placeholder;
    super("input[type='text']" + selectorSuffix, options);
  }

  public override function getAttributes() {
    var attrs = super.getAttributes();
    attrs.value = value();
    attrs.onkeyup = M.withAttr("value", value);
    attrs.placeholder = placeholder;
    return attrs;
  }
}
