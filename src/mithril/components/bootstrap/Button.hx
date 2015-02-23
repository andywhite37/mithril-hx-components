package mithril.components.bootstrap;

import mithril.M;
import js.html.MouseEvent;

@:enum
abstract ButtonType(String) to String {
  var Default = "button[type='button']";
  var Link = "a[role='button']";
  var ButtonButton = Default;
  var ButtonSubmit = "button[type='submit']";
  var InputButton = "input[type='button']";
  var InputSubmit = "input[type='submit']";
}

@:enum
abstract ButtonColor(String) to String {
  var Default = ".btn-default";
  var Primary = ".btn-primary";
  var Success = ".btn-success";
  var Info = ".btn-info";
  var Warning = ".btn-warning";
  var Danger = ".btn-danger";
  var Link = ".btn-link";
}

@:enum
abstract ButtonSize(String) to String {
  var Default = "";
  var Large = ".btn-lg";
  var Small = ".btn-sm";
  var ExtraSmall = ".btn-xs";
}

@:enum
abstract ButtonBlockLevel(String) to String {
  var Default = "";
  var BlockLevel = ".btn-block";
}

typedef ButtonOptions = {
  content : Module<Dynamic>,
  ?onClick : MouseEvent -> Void,
  ?type : ButtonType,
  ?color : ButtonColor,
  ?size : ButtonSize,
  ?blockLevel : ButtonBlockLevel,
  ?isDisabled: Bool
};

class Button implements Module<Button> {
  @prop var content : Module<Dynamic>;
  @prop var type : ButtonType;
  @prop var color : ButtonColor;
  @prop var size : ButtonSize;
  @prop var blockLevel : ButtonBlockLevel;
  @prop var isDisabled : Bool;
  @prop var onClick : MouseEvent -> Void;

  public function new(options : ButtonOptions) {
    content = M.prop(options.content);
    type = M.prop(ButtonType.Default);
    color = M.prop(ButtonColor.Default);
    size = M.prop(ButtonSize.Default);
    blockLevel = M.prop(ButtonBlockLevel.Default);
    isDisabled = M.prop(false);
    onClick = M.prop(function(e : MouseEvent) { });

    if (options != null) {
      if (options.type != null) type(options.type);
      if (options.color != null) color(options.color);
      if (options.size != null) size(options.size);
      if (options.blockLevel != null) blockLevel(options.blockLevel);
      if (options.isDisabled != null) isDisabled(options.isDisabled);
      if (options.onClick != null) this.onClick(options.onClick);
    }
  }

  public function controller() {
    content().controller();
  }

  public function view() {
    var selector = '${type()}.btn${color()}${size()}${blockLevel()}';
    var attributes = {
      onclick: onClick()
    };
    return m(selector, attributes, content().view());
  }
}
