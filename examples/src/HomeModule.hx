package ;

import haxe.Json;
import haxe.Timer;
import mithril.M;
import mithril.components.*;
import mithril.components.bootstrap.*;
import mithril.components.bootstrap.Button;
import mithril.components.bootstrap.Icon;
import mithril.components.simple.*;
using Lambda;

class HomeViewModel implements Model {
  @prop public var button1Text : String;
  @prop public var button1ClickCount : Int;
  @prop public var input1Value : String;
  @prop public var checkbox1Value : Bool;
  @prop public var formOutput : String;
  @prop public var isLoading : Bool;

  public function new() {
    button1Text = M.prop("Click me");
    button1ClickCount = M.prop(0);
    input1Value = M.prop("Hello");
    checkbox1Value = M.prop(false);
    formOutput = M.prop("{}");
    isLoading = M.prop(false);
  }

  public function onButton1Click() {
    button1ClickCount(button1ClickCount() + 1);
  }

  public function onFormSubmit(e) {
    e.preventDefault();

    M.startComputation();
    isLoading(true);

    Timer.delay(function() {
      var output = {
        input: input1Value(),
        checkbox: checkbox1Value()
      };
      formOutput(Json.stringify(output));
      isLoading(false);
      M.endComputation();
    }, 1000);
  }
}

class HomeModule implements Module<HomeModule> {
  var modules : Array<Module<Dynamic>>;

  public function new() {
    var viewModel = new HomeViewModel();

    var button1 = new Button({
      type: ButtonType.Default,
      color: ButtonColor.Default,
      size: ButtonSize.Default,
      blockLevel: ButtonBlockLevel.Default
    }, function() return {
      onclick: viewModel.onButton1Click
    }, new Multi([
      new Basic(viewModel.button1Text),
      new Static(" "),
      new Static(viewModel.button1ClickCount()), // Model initial value (does not change after first render)
      new Static(" "),
      new Basic(viewModel.button1ClickCount) // Model bound value (updates with each click)
    ]));

    var input1 = new InputText(function() return {
      value: viewModel.input1Value(),
      onkeyup: M.withAttr("value", viewModel.input1Value)
    });

    var input1Output = new El("div", null, new Basic(viewModel.input1Value));

    var checkbox1 = new InputCheckbox(function() return {
      id: "checkbox-1",
      checked: viewModel.checkbox1Value(),
      onchange: M.withAttr("checked", viewModel.checkbox1Value)
    });

    var checkbox1Label = new El("label", function() return {
      "for": "checkbox-1"
    }, new Static("Checkbox label"));

    var checkbox1Output = new El("div", null, new Basic(viewModel.checkbox1Value));

    var submitButton = new Button({ color: ButtonColor.Danger }, function() return {
      type: "submit"
    }, new Multi([
      new Icon({ type: ".fa-chevron-right" }),
      new Static(" Submit"),
    ]));

    var form = new Form(function() return {
      onsubmit: viewModel.onFormSubmit
    }, new Multi([
      input1,
      input1Output,
      checkbox1,
      checkbox1Label,
      checkbox1Output,
      submitButton
    ]));

    var formOutput = new El("div", null, new Basic(viewModel.formOutput));

    modules = [
      button1,
      new HR(),
      form,
      formOutput,
      new HR(),
      new Icon({ type: ".fa-shopping-cart" })
    ];
  }

  public function controller() {
    modules.iter(function(module) {
      module.controller();
    });
  }

  public function view() {
    return m("div", modules.map(function(module) {
      return module.view();
    }));
  }
}
