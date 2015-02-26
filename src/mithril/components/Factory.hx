package mithril.components;

import mithril.M;
import mithril.components.basic.ElementComponent;
import mithril.components.basic.InputTextComponent;

class Factory {
  public static function comps(components : Array<IComponent>) {
    return new Components(components);
  }

  public static function stat(?value : BasicType) {
    return new StaticComponent(value);
  }

  public static function bound(?value : GetterSetter<BasicType>) {
    return new BoundComponent(value);
  }

  public static function empty() {
    return StaticComponent.empty;
  }

  public static function nil() {
    return StaticComponent.nil;
  }

  public static function nbsp(?count : Int) {
    if (count == null || count <= 0) count = 1;
    return comps(
      [for (i in 0...count) span(M.trust("&nbsp;"))]
    );
  }

  private static function element(selector : String, ?selectorSuffix : String, ?options : ElementOptions, ?child : IComponent) {
    if (selectorSuffix != null) {
      selector += selectorSuffix;
    }
    return new ElementComponent(selector, options, child);
  }

  public static function div(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("div", selector, options, child);
  }

  public static function span(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("span", selector, options, child);
  }

  public static function ul(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("ul", selector, options, child);
  }

  public static function ol(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("ol", selector, options, child);
  }

  public static function li(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("li", selector, options, child);
  }

  public static function inputText(?selector : String, options : InputTextOptions) {
    return new InputTextComponent(selector, options);
  }
}
