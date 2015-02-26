package mithril.components.basic;

import mithril.M;
import mithril.components.basic.ElementComponent;

typedef InputTextOptions = { > ElementOptions,
  value : GetterSetter<BasicType>,
  ?placeholder : String
};

class InputTextComponent extends ElementComponent {
  var value : GetterSetter<BasicType>;
  var placeholder : String;

  public function new(?selector : String, options : InputTextOptions) {
    super(selector, options);
    this.selector = selector != null ? selector : "";
    this.value = options.value;
    this.placeholder = options.placeholder != null ? options.placeholder : "";
  }

  public override function view(?ctrl) {
    var attrs = {
      value: value(),
      onkeyup: M.withAttr("value", value),
      placeholder: placeholder
    };

    return m("input[type='text']" + selector, attrs);
  }
}
