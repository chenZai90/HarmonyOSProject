import PreferenceModel from '../model/PreferenceModel';
import ButtonItemData from '../viewmodel/ButtonItemData';
import Fruit from '../viewmodel/Fruit';
import StyleConstants from '../common/constant/StyleConstants';
import { router } from '@kit.ArkUI';

@Component
export default struct ButtonComponent {
  private buttonItemValues: Array<ButtonItemData> = this.getButtonItemValues();
  @Link fruit: Fruit;


  build() {
    Column() {
      ForEach(this.buttonItemValues, (item: ButtonItemData) => {
        Button(item.resource, { type: ButtonType.Capsule, stateEffect: true })
          .backgroundColor($r('app.color.button_background_color'))
          .width(StyleConstants.BUTTON_WIDTH)
          .height(StyleConstants.BUTTON_HEIGHT)
          .fontWeight(StyleConstants.FONT_WEIGHT)
          .fontSize(StyleConstants.FONT_SIZE)
          .margin({ bottom: StyleConstants.BUTTON_MARGIN_BOTTOM })
          .onClick(() => {
            item.clickMethod();
          })
      }, (item: ButtonItemData) => JSON.stringify(item))
    }
  }




  getButtonItemValues() {
    let values: Array<ButtonItemData> = [
      new ButtonItemData(
        $r('app.string.write_data_btn_text'),
        () => {
          // Write data.
          PreferenceModel.writeData(this.fruit);
        }
      ),
      new ButtonItemData(
        $r('app.string.read_data_btn_text'),
        () => {
          // Get data from the preferences database.
          PreferenceModel.getFruitData().then((resultData: Fruit) => {
            if (resultData) {
              this.fruit = resultData;
            }
          });
        }
      ),
      new ButtonItemData(
        $r('app.string.delete_data_file_btn_text'),
        () => {
          // Delete database files.
          PreferenceModel.deletePreferences();
          // After a database file is deleted, the corresponding data is left blank.
          this.fruit.fruitName = '';
          this.fruit.fruitNum = ''
        }
      ),
      new ButtonItemData(
        $r('app.string.btn_back'),
        () => {
          router.back();
        }
      )
    ];
    return values;
  }
}