package mithril.components;

class ComponentBase implements IComponent {
  public function new() {
  }

  public function controller() {
    // No-op in base class
  }

  public function view() {
    return m("Not implemented");
  }
}
