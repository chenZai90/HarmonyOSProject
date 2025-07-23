import { promptAction } from '@kit.ArkUI';
import { preferences } from '@kit.ArkData';
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constant/CommonConstants';
import Fruit from '../viewmodel/Fruit';

let context = getContext(this);
let preference: preferences.Preferences;
let preferenceTemp: preferences.Preferences;

/**
 * Preference model.
 *
 * @param fruitData Fruit data.
 */
class PreferenceModel {
  private fruitData: Fruit = new Fruit();

  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  async getPreferencesFromStorage() {
    try {
      preference = await preferences.getPreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get preferences, Cause: ${err}`);
    }
  }

  /**
   * Deletes the specified Preferences persistence file from memory and removes the Preferences instance.
   */
  async deletePreferences() {
    try {
      await preferences.deletePreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch(err) {
      Logger.error(CommonConstants.TAG, `Failed to delete preferences, Cause: ${err}`);
    };
    preference = preferenceTemp;
    this.showToastMessage($r('app.string.delete_success_msg'));
  }

  /**
   * Save the data to the Preferences.
   *
   * @param fruit Fruit data.
   */
  async putPreference(fruit: Fruit) {
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    // The fruit name and fruit quantity data entered by the user are saved to the cached Preference instance.
    try {
      await preference.put(CommonConstants.KEY_NAME, JSON.stringify(fruit));
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to put value, Cause: ${err}`);
    }
    // Store the Preference instance in the preference persistence file
    await preference.flush();
  }

  /**
   * Get preference data.
   */
  async getPreference() {
    let fruit = '';
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    try {
      // fruit = <string> await preference.get(CommonConstants.KEY_NAME, '');
      fruit = (await preference.get(CommonConstants.KEY_NAME, '')).toString();
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get value, Cause: ${err}`);
    }
    // If the data is empty, a message is displayed indicating that data needs to be written.
    if (fruit === '') {
      this.showToastMessage($r('app.string.data_is_null_msg'));
      return;
    }
    this.showToastMessage($r('app.string.read_success_msg'));
    return JSON.parse(fruit);
  }

  /**
   * Process the data obtained from the database.
   */
  async getFruitData() {
    this.fruitData = await this.getPreference();
    return this.fruitData;
  }

  /**
   * Verifies that the data entered is not empty.
   *
   * @param fruit Fruit data.
   */
  checkFruitData(fruit: Fruit) {
    if (fruit.fruitName === '' || fruit.fruitNum === '') {
      this.showToastMessage($r('app.string.fruit_input_null_msg'));
      return true;
    }
    return false;
  }

  /**
   * write data.
   *
   * @param fruit  Fruit data.
   */
  writeData(fruit: Fruit) {
    // Check whether the data is null.
    let isDataNull = this.checkFruitData(fruit);
    if (isDataNull) {
      return;
    }
    // The data is inserted into the preferences database if it is not empty.
    this.putPreference(fruit);
    this.showToastMessage($r('app.string.write_success_msg'));
  }

  /**
   * Popup window prompt message.
   *
   * @param message Prompt message.
   */
  showToastMessage(message: Resource) {
    promptAction.showToast({
      message: message,
      duration: CommonConstants.DURATION
    });
  };
}

export default new PreferenceModel()