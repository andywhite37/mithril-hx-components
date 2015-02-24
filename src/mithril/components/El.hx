package mithril.components;

import haxe.ds.Either;
import mithril.M;
import mithril.components.Empty;

class El implements Module<El> {
  @prop public var selector : String;
  @prop public var attributes : Void -> Dynamic;
  @prop public var content : Module<Dynamic>;

  public function new(?selector, ?attributes, ?content) {
    this.selector = M.prop("div");
    this.attributes = M.prop(function() { return null; });
    this.content = M.prop(Empty.empty);

    if (selector != null) this.selector(selector);
    if (attributes != null) this.attributes(attributes);
    if (content != null) this.content(content);
  }

  public function controller() {
    trace('El.controller: ${selector()}');
    beforeController();
    content().controller();
    afterController();
  }

  public function view() {
    trace('El.view: ${selector()}');
    beforeView();
    var viewOutput = m(selector(), attributes()(), content().view());
    afterView(viewOutput);
    return viewOutput;
  }

  public function beforeController() {
  }

  public function afterController() {
  }

  public function beforeView() {
    refreshSelector();
  }

  public function afterView(viewOuput : ViewOutput) {
  }

  public function refreshSelector() {
  }
}
