package mithril.components;

import mithril.M;
import mithril.components.Empty;

class El implements Module<El> {
  @prop public var selector : String;
  @prop public var attributes : Dynamic;
  @prop public var content : Module<Dynamic>;

  public function new(selector, ?attributes, ?content) {
    this.selector = M.prop(selector);
    this.attributes = M.prop({});
    this.content = M.prop(Empty.empty);

    if (attributes != null) this.attributes(attributes);
    if (content != null) this.content(content);
  }

  public function controller() {
    content().controller();
  }

  public function view() {
    return m(selector(), attributes(), content().view());
  }
}
