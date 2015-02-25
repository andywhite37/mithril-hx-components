package mithril.components.utils;

import haxe.ds.Either;
import mithril.M;

@:enum
abstract ValOrFunc<T>(Either<T, Void -> T>) {
  function new(e : Either<T, Void -> T>) {
    this = e;
  }

  @:from
  public static function fromValue<T>(v : T) {
    return new ValOrFunc(Left(v));
  }

  @:from
  public static function fromFunction<T>(f : Void -> T) {
    return new ValOrFunc(Right(f));
  }

  @:to
  public function toValue<T>() : T {
    return switch this {
      case Left(v): v;
      case Right(f): f();
    }
  }

  @:to
  public function toFunction<T>() : Void -> T {
    return switch this {
      case Left(v): function() { return v; };
      case Right(f): return f;
    };
  }
}

