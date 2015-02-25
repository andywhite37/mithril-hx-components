package mithril.components;

import js.Error;
import mithril.M;
import mithril.components.ValueStatic;
import mithril.components.utils.FunctionUtils.f;
import mithril.components.utils.ValOrFunc;
import mithril.components.utils.Typedefs;
import mithril.components.utils.Children;

/**
 * Module base class which manages a selector string, attributes object,
 * and content module.  The selector, attributes, and content are rendered using
 * the mithril "m" virtual DOM creation function.
 *
 * This class can be instantiated directly with options passed into the constructor,
 * or can be subclassed and options can be dealt with or provided by overriding methods
 * like getSelector, getAttributes, getContent, etc.
 */
class Component implements Module<Dynamic> {
  var selector(default, null) : String;
  var getAttributes(default, null) : AttrsFunc;
  var getChildren(default, null) : ChildrenFunc;

  static var defaultSelector(default, null) = "div";
  static var defaultAttributes(default, null) = function() : Attrs return null;
  static var defaultChildren(default, null) = function() : Children return ValueStatic.nil;

  public function new(selector : String, ?attributes: AttrsFunc, ?children : ChildrenFunc) {
    trace(selector);
    this.selector = selector;
    this.getAttributes = attributes != null ? attributes : defaultAttributes;
    this.getChildren = children != null ? children : defaultChildren;
  }

  public function controller() {
    beforeController();
    getChildren().toModule().controller();
    afterController();
  }

  public function view() {
    trace(selector);
    beforeView();
    var viewOutput = m(selector, getAttributes(), getChildren().toModule().view());
    afterView(viewOutput);
    return viewOutput;
  }

  public function beforeController() {
  }

  public function afterController() {
  }

  public function beforeView() {
  }

  public function afterView(viewOuput : ViewOutput) {
  }
}
