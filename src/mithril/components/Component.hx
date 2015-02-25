package mithril.components;

import js.Error;
import mithril.M;
import mithril.components.ValueStatic;
import mithril.components.utils.FunctionUtils.f;

typedef ComponentOptions = {
  // TODO: would be nice to use an Either<T, Void -> T> for these, but I don't want the caller
  // to have to specify the Enum.Left/Right types.  Maybe use an abstract wrapper for an Enum with
  // implicit conversions?

  /** Selector value (if it's static and doesn't change between view redraws) */
  ?selector : String,

  /** Function that returns a selector value (if it might change between view redraws) */
  ?getSelector : Void -> String,

  /** Attributes value (if it's static, and doesn't change between view redraws) */
  ?attributes : Dynamic,

  /** Function that returns an attributes value (if it might change between view redraws) */
  ?getAttributes : Void -> Dynamic,

  /** Content value (if it's static, and doesn't change between view redraws) */
  ?child : Module<Dynamic>,

  /** Function that returns a content value (if it might change between view redraws) */
  ?getChild : Void -> Module<Dynamic>,

  /** Array of content modules (if it's static and doesn't change between view redraws) */
  ?children: Array<Module<Dynamic>>,

  /** Function that returns an array of contents */
  ?getChildren: Void -> Array<Module<Dynamic>>
};


/**
 * Module base class which manages a selector string, attributes object,
 * and content module.  The selector, attributes, and content are rendered using
 * the mithril "m" virtual DOM creation function.
 *
 * This class can be instantiated directly with options passed into the constructor,
 * or can be subclassed and options can be dealt with or provided by overriding methods
 * like getSelector, getAttributes, getContent, etc.
 */
class Component implements Module<Component> {
  var selector(default, null) : Void -> String;
  var attributes(default, null) : Void -> Dynamic;
  var child(default, null) : Void -> Module<Dynamic>;

  public function new(?options : ComponentOptions) {
    validateOptions(options);

    selector = getSelector;
    attributes = getAttributes;
    child = getChild;

    if (options != null) {
      if (options.selector != null) selector = f(options.selector);
      if (options.getSelector != null) selector = options.getSelector;

      if (options.attributes != null) attributes = f(options.attributes);
      if (options.getAttributes != null) attributes = options.getAttributes;

      if (options.child != null) child = f(options.child);
      if (options.getChild != null) child = options.getChild;

      if (options.children != null) child = f(new Components(options.children));
      if (options.getChildren != null) child = function() return new Components(options.getChildren());
    }
  }

  public function controller() {
    //trace('El.controller: ${selector()}');
    beforeController();
    child().controller();
    afterController();
  }

  public function view() {
    //trace('El.view: ${selector()}');
    beforeView();
    var viewOutput = m(selector(), attributes(), child().view());
    afterView(viewOutput);
    return viewOutput;
  }

  public function getSelector() : String {
    return "div";
  }

  public function getAttributes() : Dynamic {
    return null;
  }

  public function getChild() : Module<Dynamic> {
    return ValueStatic.nil;
  }

  public function beforeController() {
  }

  public function afterController() {
  }

  public function beforeView() {
  }

  public function afterView(viewOuput : ViewOutput) {
  }

  public function validateOptions(?options : ComponentOptions) {
    attributesShouldNotBeAFunction(options);
  }

  public function attributesShouldNotBeAFunction(?options : ComponentOptions) {
    if (options == null || options.attributes == null) {
      return;
    }

    if (Reflect.isFunction(options.attributes)) {
      throw new Error("options.a should not be a function");
    }
  }

  public function shouldHaveOptions(?options : ComponentOptions) {
    if (options == null) {
      throw new Error("options is required for this component");
    }
  }

  public function shouldHaveNoSelector(?options : ComponentOptions) {
    if (options == null) {
      return;
    }

    if (options.selector != null || options.getSelector != null) {
      throw new Error("options.s and options.sf should be null for this Component");
    }
  }

  public function shouldHaveAttributesFunction(?options : ComponentOptions) {
    shouldHaveOptions(options);

    if (options.attributes != null || options.getAttributes == null) {
      throw new Error("options.a should be null and options.af should not be null for this Component");
    }
  }
}
