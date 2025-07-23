import { PickerOrientation } from '@kit.MediaLibraryKit'
import { formInfo } from '@kit.FormKit'
import { cloudStorage } from '@kit.CloudFoundationKit';

/**
 * 这个文件是基础语法的联系
 */

// 命名规则：
// ① 只能包含数字、字母、下划线、$，不能以数字开头 -- 重点
// let testNum-1: number = 11 // 错误  特殊字符
// let testNum_1: number = 11 // 正确
// let testNum$: number = 200 // 正确
// let testNum^ : number = 200 // 错误 特殊字符
//
// let testNum1: number = 11 // 正确
// let 1num: number = 22 // 错误 以数字开头

// ② 不能使用内置关键字或保留字 （比如 let、const）
// let let: number = 100  //错误
//let const: string = 'abc' //错误

// ③ 严格区分大小写
// let myName: string = '吴彦祖'
// // let myName: string = '邓超'
// let MyName: string = '刘德华'
// console.log('myName', myName)
// console.log('MyName', MyName)


//1.变量（可以进行存储和修改）
// let hi:string = 'hello'
// hi = 'hello world'
// //2.常量
// const  hello = 'hello' //类型自动推到
//  // hello = '90后晨仔'  报错
//
// //布尔类型
// let  isLohin: boolean = false
// //number 基本数据类型
// const  testnumber: number = 123333
// testnumber.toFixed()
//
// //Number是一个对象，占用内存
// const  testNumver: Number = new Number(1234)
// testNumver.toString()
//
// let t1 = 3.14;
// let t2 = 3.143434343;
// let t3 = .8;
// let t4 = .1e3345;

// function  testFunction(n:number): number{
//   if (n <= 3) {
//     return 3;
//   }
//   return n * testFunction(n-3);
// }

// console.log(testFunction(t1).toString());
// console.log(testFunction(t2).toString());
// console.log(testFunction(t3).toString());
// console.log(testFunction(t4).toString());

///void 类型
///void类型用于指定函数没有返回值。此类型只有一个值，同样是void。由于void是`引用类型`，所以它可以用于泛型类型的参数。
// class  Class<T>{
// }
// let instance: Class <void>

///object

// 声明一个 Object 类型的变量
// let person: Object = {
//   name: "John",
//   age: 30,
//   hobbies: ["reading", "swimming"]
// };
//
// let titles: string[] = ['a1','a2']
//
// enum  Colors {
//   Red,
//   Green,
//   Blue
// }
//
// let c: Colors = Colors.Red;
//
//
// // 示例：遍历数组并打印元素  for 循环
let fruits: string[] = ['Apple', 'Banana', 'Orange'];

for (const fruit of fruits) {
  console.log(`Fruit: ${fruit}`);
}


let sum = 0
for (let i = 0; i < 10; i++){
  sum += 1;
}


///while 循环
let n = 0;
let x = 0;
while (n < 3 ){
  n++;
  x += n;
}

/// do-while
let i = 0;
do {
   i += 1;
} while (i < 10)


//throw
throw  new Error('错误了')
try {
  //可能发生的语句
} catch (e) {
  ///处理异常
}


class ZeroDivisor extends Error {}

function  divide(a: number,c: number): number {
  if (c === 0) {
    throw new Error("除数不能为 0");
  }

  try {
    let res = divide(a, c);
    console.log(res.toString());
  } catch (e) {
    console.log('错误了');
  }
  return a / c;
}


function  test(name?: string){
  if (name == undefined) {
    return;
  }
}


type tringFunc = (x: number) => number //函数类型
function do_action(f: tringFunc){
  console.log(f(100).toString());
}

//箭头函数（也称作是Lambba函数）,下边三种写法是等价的
let sumss1 = (x: number,y: number) : number => {
  return x + y;
}

let sumss2 = (x: number,y: number) => {
  return x + y;
}


let sumss3 = (x: number, y: number) => x + y;

///闭包

function  f(): () => number {
  let count = 0
  let g = (): number => { count++ ; return count; };
  return g;
}
let z = f()
z();


///方法签名
class XTest {
  // 重载签名 1: 接受 number
  food(x: number): void;
  // 重载签名 2: 接受 string
  food(x: string): void;
  // 实现函数: 参数类型为 number | string
  food(x: number | string): void {
    if (typeof x === 'number') {
      console.log(`Number: ${x}`);
    } else {
      console.log(`String: ${x}`);
    }
  }
}

let c = new XTest();
c.food(123);
c.food('aa');

class Example {
  food(x: number): void;
  food(x: number): void;
  food(x: number): void {}
}



let count = 0;
let increment = () => {
  count++;
  return count;
};
console.log(increment().toString()); // 1
console.log(increment().toString()); // 2


class  Aimal {
  static  sumNumber = 1;
  testName?: string//可选类型，testName字段有可能为undefined
  name: string = '';
  age: number = 0;
  static test(): string {
    return'就是玩一玩'
  }

  constructor(name: string,age: number) {
    this.name = name;
    this.age = age;
    Aimal.sumNumber = 10;
  }

  get fullName(): string {
    return this.name + '测试';
  }
  set fullName(name: string){
    this.name = name;
  }
}

let animal = new Aimal('dog',8);
console.log(animal.name);
console.log(Aimal.sumNumber.toString());///静态字段属于类本身，调用需要使用类名
// Aimal.test()

//继承
class  Dog  extends  Aimal {
  dongNam: string  = '';
  total(): number {
    return this.age + 1;
  }
}

///定义接口
interface DareInfo{
  now(): string;
}
///接口实现
class MyDate implements DareInfo {
  now(): string {
    return "now"
  }
}



class RectTest {
  protected height: number = 0;
  protected width: number = 0;

  constructor(h: number, w: number) {
    this.height = h;
    this.width = w;
  }
  draw(){

  }
}

class RectSuBTest extends RectTest  {

  constructor(h: number, w: number) {
    super(h,w);
    this.height = h;
    this.width = w;
  }

}




class TestStack<Element>{
  public push(e: Element): void{
  }
}

let a =  new TestStack<string>();
a.push('a');
// a.push(99);

interface  Hashable {
  hash(): number;
}

class MyHashMap<key extends Hashable,value>{
  public set(k: key,v: value){
    let h = k.hash();
  }

}


function  last(x: number[]): number {
  return x[x.length - 1];
}
last([1,2,3,4]);



// @Entry
// struct  BaseGrammar {
//   build() {
//
//   }
// }





