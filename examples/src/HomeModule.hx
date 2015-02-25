package ;

import haxe.Json;
import haxe.Timer;
import mithril.M;
import mithril.components.ComponentFactory.*; // Import all static factory functions
import mithril.components.bootstrap.BootstrapFactory.*; // Import all static factory functions
import mithril.components.bootstrap.Button;
import mithril.components.fontAwesome.FontAwesomeFactory.*; // Import all static factory functions
import mithril.components.fontAwesome.Icon;
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

    isLoading(true);
    formOutput("");

    Timer.delay(function() {
      var output = {
        input: input1Value(),
        checkbox: checkbox1Value()
      };
      formOutput(Json.stringify(output, null, "  "));
      isLoading(false);

      M.redraw();
    }, 1000);
  }
}

class HomeModule implements Module<HomeModule> {
  var modules : Array<Module<Dynamic>>;

  public function new() {
    var viewModel = new HomeViewModel();

    var button1 = bsButton({
      attributes: {
        onclick: viewModel.onButton1Click
      },
      children: [
        bound(viewModel.button1Text),
        stat(" "),
        stat(viewModel.button1ClickCount()), // Model initial value (does not change after first render)
        stat(" "),
        bound(viewModel.button1ClickCount) // Model bound value (updates with each click)
      ]
    });

    var input1 = inputText({
      getAttributes: function() return {
        value: viewModel.input1Value(),
        onkeyup: M.withAttr("value", viewModel.input1Value)
      }
    });

    var input1Output = span(viewModel.input1Value);

    var checkbox1 = inputCheckbox({
      getAttributes: function() return {
        id: "checkbox-1",
        checked: viewModel.checkbox1Value(),
        onchange: M.withAttr("checked", viewModel.checkbox1Value)
      }
    });

    var checkbox1Label = label({
      attributes: {
        "for": "checkbox-1"
      },
      child: stat("Checkbox label")
    });

    var checkbox1Output = div(viewModel.checkbox1Value);

    var submitButton = bsButton({
      color: ButtonColor.Danger,
      getAttributes: function() return {
        type: "submit",
        disabled: viewModel.isLoading()
      },
      getChildren: function() return [
        faIcon({
          type: ".fa-chevron-right",
          isLoading: viewModel.isLoading()
        }),
        stat(" Submit"),
      ]
    });

    var form = form({
      attributes: {
        onsubmit: viewModel.onFormSubmit
      },
      children: [
        input1,
        nbsp(6),
        input1Output,
        br(2),
        checkbox1,
        checkbox1Label,
        checkbox1Output,
        br(),
        submitButton
      ]
    });

    var formOutput = pre(viewModel.formOutput);

    var orderedList = ol([
      li("Item 1"),
      li("Item 2"),
      li([
        span("Button 1 Click Count: "),
        span(viewModel.button1ClickCount),
        div([
          h1("Test")
        ])
      ]),
      li(faIcon({ type: ".fa-twitter" })),
      li([
        span("test"),
        ul([
          li("nested 1"),
          li("nested 2"),
          li([
            span("is loading: "),
            span(viewModel.isLoading),
          ])
        ])
      ])
    ]);

    modules = [
      h1("Demo button"),
      button1,
      hr(),

      h1("Demo form"),
      form,
      br(),
      formOutput,
      hr(),

      h1("Demo icon (Font Awesome)"),
      faIcon({ type: ".fa-shopping-cart" }),
      hr(),

      h1("Demo list"),
      orderedList,
      hr(),
    ];
  }

  public function controller() {
    modules.iter(function(module) {
      trace("module", module.view());
      module.controller();
    });
  }

  public function view() {
    return m("div", modules.map(function(module) {
      return module.view();
    }));
  }
}
