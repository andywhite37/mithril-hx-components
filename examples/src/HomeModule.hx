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
      af: function() return {
        onclick: viewModel.onButton1Click
      },
      c: comps([
        bound(viewModel.button1Text),
        stat(" "),
        stat(viewModel.button1ClickCount()), // Model initial value (does not change after first render)
        stat(" "),
        bound(viewModel.button1ClickCount) // Model bound value (updates with each click)
      ])
    });

    var input1 = inputText({
      af: function() return {
        value: viewModel.input1Value(),
        onkeyup: M.withAttr("value", viewModel.input1Value)
      }
    });

    var input1Output = span({ c: bound(viewModel.input1Value) });

    var checkbox1 = inputCheckbox({
      af: function() return {
        id: "checkbox-1",
        checked: viewModel.checkbox1Value(),
        onchange: M.withAttr("checked", viewModel.checkbox1Value)
      }
    });

    var checkbox1Label = label({
      a: {
        "for": "checkbox-1"
      },
      c: stat("Checkbox label")
    });

    var checkbox1Output = div(viewModel.checkbox1Value);

    var submitButton = bsButton({
      color: ButtonColor.Danger,
      af: function() return {
        type: "submit",
        disabled: viewModel.isLoading()
      },
      cf: function() return comps([
        faIcon({
          type: ".fa-chevron-right",
          isLoading: viewModel.isLoading()
        }),
        stat(" Submit"),
      ])
    });

    var form = form({
      a: {
        onsubmit: viewModel.onFormSubmit
      },
      c: comps([
        input1,
        nbsp(6),
        input1Output,
        br(2),
        checkbox1,
        checkbox1Label,
        checkbox1Output,
        br(),
        submitButton
      ])
    });

    var formOutput = pre(viewModel.formOutput);

    var orderedList = ol({
      content: comps([
        li("Item 1"),
        li("Item 2"),
        li({
          content: comps([
            span("Button 1 Click Count: "),
            span(viewModel.button1ClickCount)
          ])
        }),
        li({
          content: faIcon({ type: ".fa-twitter" })
        }),
        li({
          content: comps([
            span("test"),
            ul({
              content: comps([
                li("nested 1"),
                li("nested 2"),
                li({
                  content: comps([
                    span("is loading: "),
                    span(viewModel.isLoading),
                  ])
                })
              ])
            })
          ])
        })
      ])
    });

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
      module.controller();
    });
  }

  public function view() {
    return m("div", modules.map(function(module) {
      return module.view();
    }));
  }
}
