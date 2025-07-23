/**
 * 在鸿蒙系统中，constructor指的是类的构造函数，用于创建和初始化一个类的对象。‌
 * 构造函数在对象被创建时自动调用，用于设置对象的初始状态。
 * 如果未定义构造函数，系统会自动创建一个默认的构造函数，使用字段类型的默认值来初始化实例中的字段‌12。
 构造函数可以包含多个重载签名，即多个同名但参数不同的构造函数头。
 这允许根据不同的参数调用同一个构造函数，实现灵活的对象初始化。
 例如，一个构造函数可以接受数字或字符串作为参数，根据传入的参数类型执行不同的初始化操作‌。
 */

export class GlobalContext {
  private constructor() { }
  private static instance: GlobalContext;
  private _objects = new Map<string, Object>();

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getObject(value: string): Object | undefined {
    return this._objects.get(value);
  }

  setObject(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }
}