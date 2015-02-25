package mithril.components;

import js.Error;
import mithril.M;
import mithril.components.Component;
import mithril.components.utils.Typedefs;
import mithril.components.utils.Children;

class ComponentFactory {
  public static function comp(selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return new Component(selector, attributes, children);
  }

  public static function comps(modules : Mods) : Mod {
    return new Components(modules);
  }

  public static function stat(?value : BasicType) : Children {
    return new ValueStatic(value);
  }

  public static function bound(?value : GetterSetter<BasicType>) : Mod {
    return new ValueBound(value);
  }

  public static function empty() : Mod {
    return ValueStatic.empty;
  }

  public static function nil() : Mod {
    return ValueStatic.nil;
  }

  public static function nbsp(?count : Int) : Mod {
    if (count == null || count <= 0) count = 1;
    return comps(
      [for (i in 0...count) span(null, null, function() return M.trust("&nbsp;"))]
    );
  }

  public static function element(selector : String, ?selectorSuffix : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    if (selectorSuffix != null) {
      selector += selectorSuffix;
    }
    return comp(selector, attributes, children);
  }

  public static function hr(?selector : String, ?attributes : AttrsFunc, ?count : Int) : Mod {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) element("hr", selector, attributes)]);
  }

  public static function br(?selector : String, ?attributes : AttrsFunc, ?count : Int) : Mod {
    if (count == null || count <= 0) count = 1;
    return comps([for (i in 0...count) element("br", selector, attributes)]);
  }

  public static function span(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("span", selector, attributes, children);
  }

  public static function div(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("div", selector, attributes, children);
  }

  public static function ul(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("ul", selector, attributes, children);
  }

  public static function ol(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("ol", selector, attributes, children);
  }

  public static function li(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("li", selector, attributes, children);
  }

  public static function a(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("a", selector, attributes, children);
  }

  public static var link(default, null) = a;

  public static function button(?selector : String, ?attributes : AttrsFunc, ?children : ChildrenFunc) : Mod {
    return element("button[type='button']", selector, attributes, children);
  }
}
