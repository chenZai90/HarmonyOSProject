import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
export default   struct MyWebHtml {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear() {
    // 配置Web开启调试模式
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  build() {
    Column() {
      Button('返回')
        .onClick(() => {
          router.back(); // 返回到上一个界面
        })
        .fontColor(Color.White)
        .margin({ top: 20, left: 0 }) // 调整按钮的边距
        .backgroundColor(Color.Blue)


      Button('点击测试')
        .onClick(() => {
          this.controller.runJavaScript('showAlert(测试了)');
        })
        .fontColor(Color.White)
        .margin({ top: 20, left: 100 }) // 调整按钮的边距
        .backgroundColor(Color.Blue)





      Web({ src: $rawfile('webTongxin.html'), controller: this.controller })
        .javaScriptAccess(true)
        .imageAccess(true)
        .onPageEnd(e => {
          this.controller.runJavaScript('showAlert(测试了)')
            .then((result) => {
              console.log('result: ' + result);
            })
            .catch((error: BusinessError) => {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
            })
          if (e) {
            console.info('url: ', e.url);
          }
        })
        .height('100%')
    }
  }

}


