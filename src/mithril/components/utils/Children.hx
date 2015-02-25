package mithril.components.utils;

import mithril.M;

@:enum
abstract Children(Either4<Module<Dynamic>, Array<Module<Dynamic>>, BasicType, GetterSetter<BasicType>>) {
  inline function new(e : Either4<Module<Dynamic>, Array<Module<Dynamic>>, BasicType, GetterSetter<BasicType>>) {
    this = e;
  }

  @:from
  public static inline function fromModule(module : Module<Dynamic>) {
    return new Children(First(module));
  }

  @:from
  public static inline function fromModules(modules : Array<Module<Dynamic>>) {
    return new Children(Second(modules));
  }

  @:from
  public static inline function fromBasicType(value : BasicType) {
    return new Children(Third(value));
  }

  @:from
  public static inline function fromGetterSetter(getterSetter : GetterSetter<BasicType>) {
    return new Children(Fourth(getterSetter));
  }

  @:to
  public function toModule() : Module<Dynamic> {
    return switch this {
      case First(module) : return module;
      case Second(modules) : return new Components(modules);
      case Third(value) : return new ValueStatic(value);
      case Fourth(getterSetter) : return new ValueBound(getterSetter);
    };
  }
}
