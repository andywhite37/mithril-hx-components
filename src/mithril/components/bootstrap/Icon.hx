package mithril.components.bootstrap;

import mithril.M;
using StringTools;

@:enum
abstract IconSize(String) to String {
  var Default = "";
  var Large = ".fa-large";
  var TwoX = ".fa-2x";
  var ThreeX = ".fa-3x";
  var FourX = ".fa-4x";
  var FiveX = ".fa-5x";
}

@:enum
abstract IconFixedWidth(String) to String {
  var Default = "";
  var FixedWitdh = ".fa-fw";
}

@:enum
abstract IconSpin(String) to String {
  var Default = "";
  var Spin = ".fa-spin";
  var Pulse = ".fa-pulse";
}

@:enum
abstract IconListItem(String) to String {
  var Default = "";
  var ListItem = ".fa-li";
}

@:enum
abstract IconBorder(String) to String {
  var Default = "";
  var Border = ".fa-border";
}

@:enum
abstract IconPull(String) to String {
  var Default = "";
  var Left = ".pull-left";
  var Right = ".pull-right";
}

@:enum
abstract IconRotate(String) to String {
  var Default = "";
  var Rotate90 = ".fa-rotate-90";
  var Rotate180 = ".fa-rotate-180";
  var Rotate270 = ".fa-rotate-270";
}

@:enum
abstract IconFlip(String) to String {
  var Default = "";
  var Horizontal = ".fa-flip-horizontal";
  var Vertical = ".fa-flip-vertical";
}

typedef IconOptions = {
  type: String,
  ?size : IconSize,
  ?fixedWidth : IconFixedWidth,
  ?spin: IconSpin,
  ?listItem : IconListItem,
  ?border : IconBorder,
  ?pull : IconPull,
  ?rotate : IconRotate,
  ?flip : IconFlip
};

class Icon extends El {
  @prop public var type : String;
  @prop public var size : IconSize;
  @prop public var fixedWidth : IconFixedWidth;
  @prop public var spin : IconSpin;
  @prop public var listItem : IconListItem;
  @prop public var border : IconBorder;
  @prop public var pull : IconPull;
  @prop public var rotate : IconRotate;
  @prop public var flip : IconFlip;

  public function new(options : IconOptions, ?attributes : Dynamic) {
    super("", attributes);

    if (!options.type.startsWith(".fa-")) throw new js.Error("Icon options.type must start with .fa- prefix");

    this.type = M.prop(options.type);
    this.size = M.prop(IconSize.Default);
    this.fixedWidth = M.prop(IconFixedWidth.Default);
    this.spin = M.prop(IconSpin.Default);
    this.listItem = M.prop(IconListItem.Default);
    this.border = M.prop(IconBorder.Default);
    this.pull = M.prop(IconPull.Default);
    this.rotate = M.prop(IconRotate.Default);
    this.flip = M.prop(IconFlip.Default);
  }

  public override function refreshSelector() {
    selector('.fa${type()}${size()}${fixedWidth()}${spin()}${listItem()}${border()}${pull()}${rotate()}${flip()}');
  }
}
