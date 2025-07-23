
/**
 * 	•	@Component：装饰器，声明 MyComponent 是一个 ArkUI 组件。
 •	export default：让该组件可以被其他文件引用。
 •	struct MyComponent：使用 struct 关键字定义组件，HarmonyOS 采用结构体（struct）来组织组件，不同于 JavaScript 的 class。
 *  @State：用于 组件内部状态管理，当 title 发生变化时，界面会自动刷新。
 * 	private：私有属性，只能在当前组件内部访问。
 * score：数字类型，初始值 78。
 */



@Component
export  default  struct  LearnComponent {
  @State title: string = "这是一个按钮"
  private score: number = 80;



  //  test1(){
 //    let a = 1
 //  console.info("12",a)
 // }
 // getTitle(){
 //    return this.title;
 // }
 //
 //
 // @Builder doRender(){
 //    Text("Builder自定义UI组件")
 // }
 //
  build() {
 //
 //    Row(){
 //      Button(this.getTitle())
 //      if(this.score >= 90){
 //        Text("优秀")
 //      }else if(this.score >= 80){
 //        Text("良好")
 //      }else if(this.score >= 70){
 //        Text("及格")
 //      }else{
 //        Text("不及格")
 //      }
 //    }
 //    .width('80%')
 //    .height('500px')
 //    .backgroundColor("#ff0")
 //    .margin({top:"50px",left:"50px"})
  }
}
