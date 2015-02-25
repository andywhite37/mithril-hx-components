package mithril.components;

import js.Error;
import mithril.M;
import mithril.components.Component;

class ComponentFactory {
  public static function comp(?options : ComponentOptions) : Module<Dynamic> {
    return new Component(options);
  }

  public static function comps(modules : Array<Module<Dynamic>>) : Module<Dynamic> {
    return new Components(modules);
  }

  public static function stat(?value : BasicType) : Module<Dynamic> {
    return new ValueStatic(value);
  }

  public static function bound(?value : GetterSetter<BasicType>) : Module<Dynamic> {
    return new ValueBound(value);
  }

  public static function empty() : Module<Dynamic> {
    return ValueStatic.empty;
  }

  public static function nil() : Module<Dynamic> {
    return ValueStatic.nil;
  }

  public static function nbsp(?count : Int) : Module<Dynamic> {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) span(M.trust("&nbsp;"))]);
  }

  public static function element(
      selector : String,
      ?options : ComponentOptions,
      ?valueStatic : BasicType,
      ?valueBound : GetterSetter<BasicType>,
      ?child : Module<Dynamic>,
      ?children : Array<Module<Dynamic>>) : Module<Dynamic> {

    if (options == null) {
      options = {};
    }

    options.selector = selector;

    if (valueStatic != null) {
      options.child = stat(valueStatic);
    }

    if (valueBound != null) {
      options.child = bound(valueBound);
    }

    if (child != null) {
      options.child = child;
    }

    if (children != null) {
      options.children = children;
    }

    return comp(options);
  }

  public static function hr(?options : ComponentOptions, ?count : Int) : Module<Dynamic> {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) element("hr", options)]);
  }

  public static function br(?options : ComponentOptions, ?count : Int) : Module<Dynamic> {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) element("br", options)]);
  }

  public static function h1(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("h1", options, value, bound, child, children);
  }

  public static function h2(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("h2", options, value, bound, child, children);
  }

  public static function h3(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("h3", options, value, bound, child, children);
  }

  public static function h4(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("h4", options, value, bound, child, children);
  }

  public static function h5(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("h5", options, value, bound, child, children);
  }

  public static function h6(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("h6", options, value, bound, child, children);
  }

  public static function div(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("div", options, value, bound, child, children);
  }

  public static function span(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("span", options, value, bound, child, children);
  }

  public static function label(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("label", options, value, bound, child, children);
  }

  public static function pre(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("pre", options, value, bound, child, children);
  }

  public static function ul(?options : ComponentOptions, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("ul", options, child, children);
  }

  public static function ol(?options : ComponentOptions, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("ol", options, child, children);
  }

  public static function li(?options : ComponentOptions, ?value : BasicType, ?bound : GetterSetter<BasicType>, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("li", options, value, bound, child, children);
  }

  public static function form(?options : ComponentOptions, ?child : Module<Dynamic>, ?children : Array<Module<Dynamic>>) : Module<Dynamic> {
    return element("form", options, child, children);
  }

  public static function inputText(?options : ComponentOptions) : Module<Dynamic> {
    return element("input[type='text']", options);
  }

  public static function inputCheckbox(?options : ComponentOptions) : Module<Dynamic> {
    return element("input[type='checkbox']", options);
  }
}
