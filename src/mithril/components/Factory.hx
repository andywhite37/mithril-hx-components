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

  public static function element(selector : String, ?selectorSuffix : String, ?options : ElementOptions, ?child : IComponent) {
    if (selectorSuffix != null) {
      selector += selectorSuffix;
    }
    return new ElementComponent(selector, options, child);
  }

  // Content sectioning

  public static function address(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("address", selector, options, child);
  }

  public static function article(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("article", selector, options, child);
  }

  public static function footer(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("footer", selector, options, child);
  }

  public static function header(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("header", selector, options, child);
  }

  public static function h1(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("h1", selector, options, child);
  }

  public static function h2(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("h2", selector, options, child);
  }

  public static function h3(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("h3", selector, options, child);
  }

  public static function h4(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("h4", selector, options, child);
  }

  public static function h5(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("h5", selector, options, child);
  }

  public static function h6(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("h6", selector, options, child);
  }

  public static function hgroup(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("hgroup", selector, options, child);
  }

  public static function nav(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("nav", selector, options, child);
  }

  public static function section(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("section", selector, options, child);
  }

  // Text content

  public static function blockquote(selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("blockquote", selector, options, child);
  }

  public static function dd(selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("dd", selector, options, child);
  }

  public static function div(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("div", selector, options, child);
  }

  public static function dl(selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("dl", selector, options, child);
  }

  public static function dt(selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("dt", selector, options, child);
  }

  public static function figcaption(selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("figcaption", selector, options, child);
  }

  public static function figure(selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("figure", selector, options, child);
  }

  public static function hr(selector : String, ?options : ElementOptions) {
    return element("hr", selector, options);
  }

  public static function li(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("li", selector, options, child);
  }

  public static function main(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("main", selector, options, child);
  }

  public static function ol(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("ol", selector, options, child);
  }

  public static function p(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("p", selector, options, child);
  }

  public static function pre(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("pre", selector, options, child);
  }

  public static function ul(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("ul", selector, options, child);
  }

  // Inline text

  public static function a(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("a", selector, options, child);
  }

  public static function b(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("b", selector, options, child);
  }

  public static function br(?selector : String, ?options : ElementOptions) {
    return element("br", selector, options);
  }

  public static function code(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("code", selector, options, child);
  }

  public static function em(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("em", selector, options, child);
  }

  public static function i(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("i", selector, options, child);
  }

  public static function span(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("span", selector, options, child);
  }

  public static function strong(?selector : String, ?options : ElementOptions, ?child : IComponent) {
    return element("strong", selector, options, child);
  }

  // Image and multi-media

  public static function img(?selector : String, ?options : ElementOptions) {
    return element("img", selector, options);
  }

  // Table content

  // Forms

  public static function button(?selector : String, ? options : ElementOptions, ?child : IComponent) {
    return element("button[type='button']", selector, options, child);
  }


  public static function inputText(?selector : String, options : InputTextOptions) {
    return new InputTextComponent(selector, options);
  }
}
