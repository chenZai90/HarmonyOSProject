import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import Banner from '../../View/Banner';
import EnablementView from '../../View/EnablementView';
import TutorialView from '../../View/TutorialView';

// let name = '90晨仔'
// let title = name + '第一个个人作品'

@Entry
@Component
export  default struct  HomePage {
  @State message: string = '90晨仔学习的第一个个人作品';
  build() {
     Column(){
      // Text(title)
       Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({left: 16})
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(50)
         .textOverflow({
           overflow: TextOverflow.Ellipsis
         });

       Scroll() {
         Column() {
           Banner()
           EnablementView()
           TutorialView()
         }
       }
       .layoutWeight(1)
       .scrollBar(BarState.Off)
       .align(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }

}
