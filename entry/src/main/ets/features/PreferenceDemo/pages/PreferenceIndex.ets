import PreferenceModel from '../model/PreferenceModel';
import ButtonComponent from '../View/ButtonComponent';
import TextItemComponent from '../View/TextItemComponent';
import Fruit from '../viewmodel/Fruit';
import CommonConstants from '../common/constant/CommonConstants';
import StyleConstants from '../common/constant/StyleConstants';

@Entry
@Component
struct PreferenceIndex {
  @State fruit: Fruit = new Fruit();

  build() {
    Column() {
      // Fruit name text item component.
      TextItemComponent({
        textResource: $r('app.string.fruit_text'),
        placeholderResource: $r('app.string.fruit_placeholder'),
        textFlag: CommonConstants.FRUIT_FLAG,
        fruit: $fruit,
        textInputCallBack: (value: string) => {
          this.fruit.fruitName = value;
        }
      })

      // Fruit num text item component.
      TextItemComponent({
        textResource: $r('app.string.number_text'),
        placeholderResource: $r('app.string.number_placeholder'),
        textFlag: CommonConstants.NUMBER_FLAG,
        fruit: $fruit,
        textInputCallBack: (value: string) => {
          this.fruit.fruitNum = value;
        }
      })

      // button component.
      ButtonComponent({ fruit: $fruit })
    }
    .width(StyleConstants.FULL_PERCENT)
    .height(StyleConstants.FULL_PERCENT)
    .backgroundColor($r('app.color.main_background_color'))
  }

  async aboutToAppear() {
    // Get the lightweight storage db file from memory.
    await PreferenceModel.getPreferencesFromStorage();
    // Get the key value with the key name fruit from the lightweight storage db file.
    PreferenceModel.getFruitData().then((resultData: Fruit) => {
      if (resultData) {
        this.fruit = resultData;
      }
    });
  }
}