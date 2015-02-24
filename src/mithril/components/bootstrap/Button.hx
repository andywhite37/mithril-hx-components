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
  ?type : ButtonType,
  ?color : ButtonColor,
  ?size : ButtonSize,
  ?blockLevel : ButtonBlockLevel,
};

class Button extends El {
  @prop public var type : ButtonType;
  @prop public var color : ButtonColor;
  @prop public var size : ButtonSize;
  @prop public var blockLevel : ButtonBlockLevel;

  public function new(?options : ButtonOptions, ?attributes : Dynamic, ?content : Module<Dynamic>) {
    super("", attributes, content);

    this.type = M.prop(ButtonType.Default);
    this.color = M.prop(ButtonColor.Default);
    this.size = M.prop(ButtonSize.Default);
    this.blockLevel = M.prop(ButtonBlockLevel.Default);

    if (options != null) {
      if (options.type != null) this.type(options.type);
      if (options.color != null) this.color(options.color);
      if (options.size != null) this.size(options.size);
      if (options.blockLevel != null) this.blockLevel(options.blockLevel);
    }
  }

  public override function refreshSelector() {
    selector('${type()}.btn${color()}${size()}${blockLevel()}');
  }
}
