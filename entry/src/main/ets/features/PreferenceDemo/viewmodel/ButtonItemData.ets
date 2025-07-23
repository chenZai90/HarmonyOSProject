
/**
* Button item data.
  *
  * @param resource Button item resource.
  * @param clickMethod Button item clickMethod.
  */
export  default class  ButtonItemData {

  /**
   * Button item resource.
   */
  resource: Resource;

  /**
   * 按钮点击方法
   */
  clickMethod: () => void;

  /**
   * The constructor of ButtonItemData.
   *
   * @param resource Button item resource.
   * @param clickMethod Button item clickMethod.
   */
  constructor(resource: Resource, clickMethod: () => void) {
    this.resource = resource;
    this.clickMethod = clickMethod;
  }


}