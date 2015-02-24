package mithril.components;

import js.Error;
import mithril.M;
import mithril.components.ValueStatic;
import mithril.components.utils.FunctionUtils.f;

typedef ComponentOptions = {
  // TODO: would be nice to use an Either<T, Void -> T> for these, but I don't want the caller
  // to have to specify the Enum.Left/Right types.  Maybe use an abstract wrapper for an Enum with
  // implicit conversions?

  /** Selector value (if it's static) */
  ?selector : String,
  ?s : String, // Same as selector

  /** Function that returns a selector value (if it might change between view redraws) */
  ?getSelector : Void -> String,
  ?sf : Void -> String, // Same as getSelector

  /** Attributes value (if it's static) */
  ?attributes : Dynamic,
  ?a : Dynamic, // Same as attributes

  /** Function that returns an attributes value (if it might change between view redraws) */
  ?getAttributes : Void -> Dynamic,
  ?af : Void -> Dynamic, // Same as getAttributes

  /** Content value (if it's static) */
  ?content : Module<Dynamic>,
  ?c : Module<Dynamic>, // Same as content

  /** Function that returns a content value (if it might change between view redraws) */
  ?getContent : Void -> Module<Dynamic>,
  ?cf : Void -> Module<Dynamic> // Same as getContent
};


/**
 * Component base class which manages a selector string, attributes object,
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
  var content(default, null) : Void -> Module<Dynamic>;

  public function new(?options : ComponentOptions) {
    validateOptions(options);

    selector = getSelector;
    attributes = getAttributes;
    content = getContent;

    if (options != null) {
      if (options.selector != null) selector = f(options.selector);
      if (options.s != null) selector = f(options.s);

      if (options.getSelector != null) selector = options.getSelector;
      if (options.sf != null) selector = options.sf;

      if (options.attributes != null) attributes = f(options.attributes);
      if (options.a != null) attributes = f(options.a);

      if (options.getAttributes != null) attributes = options.getAttributes;
      if (options.af != null) attributes = options.af;

      if (options.content != null) content = f(options.content);
      if (options.c != null) content = f(options.c);

      if (options.getContent != null) content = options.getContent;
      if (options.cf != null) content = options.cf;
    }
  }

  public function controller() {
    //trace('El.controller: ${selector()}');
    beforeController();
    content().controller();
    afterController();
  }

  public function view() {
    //trace('El.view: ${selector()}');
    beforeView();
    var viewOutput = m(selector(), attributes(), content().view());
    afterView(viewOutput);
    return viewOutput;
  }

  public function getSelector() : String {
    return "div";
  }

  public function getAttributes() : Dynamic {
    return null;
  }

  public function getContent() : Module<Dynamic> {
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
    aShouldNotBeAFunction(options);
  }

  public function aShouldNotBeAFunction(?options : ComponentOptions) {
    if (options == null || options.a == null) {
      return;
    }

    if (Reflect.isFunction(options.a)) {
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

    if (options.s != null || options.sf != null) {
      throw new Error("options.s and options.sf should be null for this Component");
    }
  }

  public function shouldHaveAttributesFunction(?options : ComponentOptions) {
    shouldHaveOptions(options);

    if (options.a != null || options.af == null) {
      throw new Error("options.a should be null and options.af should not be null for this Component");
    }
  }
}
