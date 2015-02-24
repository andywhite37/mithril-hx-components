package mithril.components;

import js.Error;
import mithril.M;
import mithril.components.Component;

class ComponentFactory {
  public static function comp(?options : ComponentOptions) {
    return new Component(options);
  }

  public static function comps(content : Array<Module<Dynamic>>) {
    return new Components(content);
  }

  public static function stat(?content : BasicType) {
    return new ValueStatic(content);
  }

  public static function bound(?content : GetterSetter<BasicType>) {
    return new ValueBound(content);
  }

  public static function empty() {
    return ValueStatic.empty;
  }

  public static function nil() {
    return ValueStatic.nil;
  }

  public static function nbsp(?count : Int) {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) span(M.trust("&nbsp;"))]);
  }

  public static function element(selector : String, ?options : ComponentOptions, ?valueStatic : BasicType, ?valueBound : GetterSetter<BasicType>) {
    if (options != null) {
      options.selector = selector;
      return comp(options);
    }

    options = {
      selector: selector
    };

    if (valueStatic != null) {
      options.content = stat(valueStatic);
      return comp(options);
    }

    if (valueBound != null) {
      options.content = bound(valueBound);
      return comp(options);
    }

    return comp(options);
  }

  public static function hr(?options : ComponentOptions, ?count : Int) {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) element("hr", options)]);
  }

  public static function br(?options : ComponentOptions, ?count : Int) {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) element("br", options)]);
  }

  public static function h1(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("h1", options, value, bound);
  }

  public static function h2(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("h2", options, value, bound);
  }

  public static function h3(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("h3", options, value, bound);
  }

  public static function h4(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("h4", options, value, bound);
  }

  public static function h5(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("h5", options, value, bound);
  }

  public static function h6(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("h6", options, value, bound);
  }

  public static function div(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("div", options, value, bound);
  }

  public static function span(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("span", options, value, bound);
  }

  public static function label(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("label", options, value, bound);
  }

  public static function pre(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("pre", options, value, bound);
  }

  public static function ul(?options : ComponentOptions) {
    return element("ul", options);
  }

  public static function ol(?options : ComponentOptions) {
    return element("ol", options);
  }

  public static function li(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>) {
    return element("li", options, value, bound);
  }

  public static function form(?options : ComponentOptions) {
    return element("form", options);
  }

  public static function inputText(?options : ComponentOptions) {
    return element("input[type='text']", options);
  }

  public static function inputCheckbox(?options : ComponentOptions) {
    return element("input[type='checkbox']", options);
  }
}
