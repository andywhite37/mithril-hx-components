package mithril.components.utils;

import mithril.components.utils.Typedefs;


/**
 * Function utilities
 */
class FunctionUtils {
  /**
   * Returns a function that returns the given value.
   */
  public static function f<T>(value : T) : Void -> T {
    return function() : T {
      return value;
    }
  }

  public static function a(?value) : AttrsFunc {
    return f(value);
  }

  public static function c(?value) : ChildrenFunc {
    return f(value);
  }
}
