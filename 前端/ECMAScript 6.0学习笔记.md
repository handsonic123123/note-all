> 2021/12/6 16:34:24 
> ECMAScript 6.0语法学习
> https://www.w3cschool.cn/escript6/escript6-y81937f7.html
> https://www.runoob.com/w3cnote/es6-tutorial.html

----------
#序章  ES6简介
----------

1. ES6， 全称 ECMAScript 6.0 ，是 JavaScript 的下一个版本标准，2015.06 发版

1. ES6 主要是为了解决 ES5 的先天不足，比如 JavaScript 里并没有类的概念

##0.1 历史

1. 1997 年 ECMAScript 1.0 诞生。


1. 1998 年 6 月 ECMAScript 2.0 诞生，包含一些小的更改，用于同步独立的 ISO 国际标准。


1. 1999 年 12 月 ECMAScript 3.0诞生，它是一个巨大的成功，在业界得到了广泛的支持，它奠定了 JS 的基本语法，被其后版本完全继承。直到今天，我们一开始学习 JS ，其实就是在学 3.0 版的语法。


1. 2000 年的 ECMAScript 4.0 是当下 ES6 的前身，但由于这个版本太过激烈，对 ES 3 做了彻底升级，所以暂时被"和谐"了。


1. 2009 年 12 月，ECMAScript 5.0 版正式发布。ECMA 专家组预计 ECMAScript 的第五个版本会在 2013 年中期到 2018 年作为主流的开发标准。2011年6月，ES 5.1 版发布，并且成为 ISO 国际标准。

1. 2013 年，ES6 草案冻结，不再添加新的功能，新的功能将被放到 ES7 中；2015年6月， ES6 正式通过，成为国际标准。

##0.2 目标与愿景

1. 适应更复杂的应用；实现代码库之间的共享；

1. 不断迭代维护新版本


----------
#第一章 环境搭建
----------
目前各大浏览器基本上都支持 ES6 的新特性，其中 Chrome 和 Firefox 浏览器对 ES6 新特性最友好，IE7~11 基本不支持 ES6

##1.1 在 Node.js 环境中运行 ES6

    $ node
    > let sitename="runoob"
    undefined
    > console.log(sitename)
    runoob
    undefined
    >
使用下面的命令，可以查看 Node 已经实现的 ES6 特性。

    node --v8-options | grep harmony
    node --v7-options|findstr harmony

##1.2 webpack
webpack 是一个现代 JavaScript 应用程序的静态模块打包器 (module bundler) 。当 webpack 处理应用程序时，它会递归地构建一个依赖关系图 (dependency graph) ，其中包含应用程序需要的每个模块，然后将所有这些模块打包成一个或多个 bundle 。

webpack 主要有四个核心概念:


1. 入口 (entry)

1. 输出 (output)

1. loader

1. 插件 (plugins)
 
###1.2.1 入口
入口会指示 webpack 应该使用哪个模块，来作为构建其内部依赖图的开始。进入入口起点后，webpack 会找出有哪些模块和库是入口起点（直接和间接）依赖

1. 单个入口（简写）语法:

    const config = {
      entry: "./src/main.js"
    }

1. 对象语法:

    const config = {
      app: "./src/main.js",
      vendors: "./src/vendors.js"
    }

1. 输出 (output):

output 属性会告诉 webpack 在哪里输出它创建的 bundles ，以及如何命名这些文件，默认值为 ./dist:

    const config = {
      entry: "./src/main.js",
      output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, 'dist')
      }
    }
    
###1.2.2 loader


1. loader 让 webpack 可以去处理那些非 JavaScript 文件（ webpack 自身只理解 JavaScript ）。


1. loader 可以将所有类型的文件转换为 webpack 能够有效处理的模块
        
        const config = {
          entry: "./src/main.js",
          output: {
            filename: "bundle.js",
            path: path.resolve(__dirname, 'dist')
          },
          module: {
            rules: [
              {
                  test: /\.js$/,
                  exclude: /node_modules/,
                  loader: "babel-loader",
                  options: [
                    presets: ["env"]
                  ]
              }
            ]
          }
        }


###1.2.3 插件 (


1. loader 被用于转换某些类型的模块，而插件则可以做更多的事情。


1. 包括打包优化、压缩、定义环境变量等等。


1. 使用一个插件也非常容易，只需要 require() ，然后添加到 plugins 数组中
    
        // 通过 npm 安装
    
        const HtmlWebpackPlugin = require('html-webpack-plugin');
    
        // 用于访问内置插件 
    
        const webpack = require('webpack'); 
         
        const config = {
          module: {
            rules: [
              {
                  test: /\.js$/,
                  exclude: /node_modules/,
                  loader: "babel-loader"
              }
            ]
          },
          plugins: [
            new HtmlWebpackPlugin({template: './src/index.html'})
          ]
        };

###1.2.4 利用webpack搭建应用

webpack.config.js

    const path = require('path');
     
    module.exports = {
      mode: "development", // "production" | "development"
      // 选择 development 为开发模式， production 为生产模式
      entry: "./src/main.js",
      output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, 'dist')
      },
      module: {
        rules: [
          {
            test: /\.js$/,
            exclude: /node_modules/,
            loader: "babel-loader",
            options: [
              presets: ["env"]
            ]
          }
        ]
      },
      plugins: [
        ...
      ]
    }


----------
#第二章 let和const
----------
ES6 新增加了两个重要的 JavaScript 关键字: let 和 const


1. let 声明的变量只在 let 命令所在的代码块内有效。

1. const 声明一个只读的常量，一旦声明，常量的值就不能改变。

##2.1 let
1.代码块内有效

let 是在代码块内有效，var 是在全局范围内有效:

    {
      let a = 0;
      var b = 1;
    }
    a  // ReferenceError: a is not defined
    b  // 1


2.不能重复声明

let 只能声明一次 var 可以声明多次:
    
    let a = 1;
    let a = 2;
    var b = 3;
    var b = 4;
    a  // Identifier 'a' has already been declared
    b  // 4

for循环遍历：

    for (var i = 0; i < 10; i++) {
      setTimeout(function(){
        console.log(i);
      })
    }
    // 输出十个 10
    for (let j = 0; j < 10; j++) {
      setTimeout(function(){
        console.log(j);
      })
    }
    // 输出 0123456789



1. 变量 i 是用 var 声明的，在全局范围内有效，所以全局中只有一个变量 i, 每次循环时，setTimeout 定时器里面的 i 指的是全局变量 i ，而循环里的十个 setTimeout 是在循环结束后才执行，所以此时的 i 都是 10

1. 变量 j 是用 let 声明的，当前的 j 只在本轮循环中有效，每次循环的 j 其实都是一个新的变量，所以 setTimeout 定时器里面的 j 其实是不同的变量，即最后输出 0123456789

3.不存在变量提升

let 不存在变量提升，var 会变量提升:
    
    console.log(a);  //ReferenceError: a is not defined
    let a = "apple";
     
    console.log(b);  //undefined
    var b = "banana";

##2.2 const
1.const 声明一个只读变量，声明之后不允许改变。意味着，一旦声明必须初始化，否则会报错
    
    const PI = "3.1415926";
    PI  // 3.1415926
    
    const MY_AGE;  // SyntaxError: Missing initializer in const declaration    

2.暂时性死区:

    var PI = "a";
    if(true){
      console.log(PI);  // ReferenceError: PI is not defined
      const PI = "3.1415926";
    }

代码块内如果存在 let 或者 const，代码块会对这些命令声明的变量从块的开始就形成一个封闭作用域。

代码块内，在声明变量 PI 之前使用它会报错

 const 只能保证指针是固定的，至于指针指向的数据结构变不变无法控制，使用 const 声明复杂类型对象时要慎重


----------
#第三章 解构赋值
----------
1.解构赋值是一种针对数组或者对象进行模式匹配，然后对其中的变量进行赋值

2.解构模型

1. 解构的源，解构赋值表达式的右边部分。


1. 解构的目标，解构赋值表达式的左边部分

##3.1 数组模型的解构

###3.1.1 基本

    let [a, b, c] = [1, 2, 3];
    // a = 1
    // b = 2
    // c = 3

###3.1.2 可忽略

    let [a, , b] = [1, 2, 3];
    // a = 1
    // b = 3

###3.1.3 不完全解构

    let [a = 1, b] = []; // a = 1, b = undefined

###3.1.4 剩余运算符

    let [a, ...b] = [1, 2, 3];
    //a = 1
    //b = [2, 3]

###3.1.5 字符串解构

在数组的解构中，解构的目标若为可遍历对象，皆可进行解构赋值。可遍历对象即实现 Iterator 接口的数据

    let [a, b, c, d, e] = 'hello';
    // a = 'h'
    // b = 'e'
    // c = 'l'
    // d = 'l'
    // e = 'o'

###3.1.6 解构默认值

当解构模式有匹配结果，且匹配结果是 undefined 时，会触发默认值作为返回结果

    let [a = 3, b = a] = [];     // a = 3, b = 3
    let [a = 3, b = a] = [1];    // a = 1, b = 1
    let [a = 3, b = a] = [1, 2]; // a = 1, b = 2


##3.2 对象模型的解构

###3.2.1 基本

    let { foo, bar } = { foo: 'aaa', bar: 'bbb' };
    // foo = 'aaa'
    // bar = 'bbb'
     
    let { baz : foo } = { baz : 'ddd' };
    // foo = 'ddd'

###3.2.2 可嵌套可忽略

    let obj = {p: ['hello', {y: 'world'}] };
    let {p: [x, { y }] } = obj;
    // x = 'hello'
    // y = 'world'
    let obj = {p: ['hello', {y: 'world'}] };
    let {p: [x, {  }] } = obj;
    // x = 'hello'

###3.2.3 不完全解构

    let obj = {p: [{y: 'world'}] };
    let {p: [{ y }, x ] } = obj;
    // x = undefined
    // y = 'world'

###3.2.4 剩余运算符

    let {a, b, ...rest} = {a: 10, b: 20, c: 30, d: 40};
    // a = 10
    // b = 20
    // rest = {c: 30, d: 40}

###3.2.5 解构默认值

    let {a = 10, b = 5} = {a: 3};
    // a = 3; b = 5;
    let {a: aa = 10, b: bb = 5} = {a: 3};
    // aa = 3; bb = 5;


----------
#第四章 Symbol
----------
##4.1 概述

- ES6 引入了一种新的原始数据类型 Symbol ，表示独一无二的值，最大的用法是用来定义对象的唯一属性名

- ES6 数据类型除了 Number 、 String 、 Boolean 、 Object、 null 和 undefined ，还新增了 Symbol 

##4.2 用法

1. Symbol 函数栈不能用 new 命令，因为 Symbol 是原始数据类型，不是对象。

1. 可以接受一个字符串作为参数，为新创建的 Symbol 提供描述，用来显示在控制台或者作为字符串的时候使用，便于区分。

        let sy = Symbol("KK");
        console.log(sy);   // Symbol(KK)
        typeof(sy);        // "symbol"
         
        // 相同参数 Symbol() 返回的值不相等
        let sy1 = Symbol("kk"); 
        sy === sy1;       // false

##4.3 使用场景

###4.3.1 作为属性名

由于每一个 Symbol 的值都是不相等的，所以 Symbol 作为对象的属性名，可以保证属性不重名。

    let sy = Symbol("key1");
     
    // 写法1
    let syObject = {};
    syObject[sy] = "kk";
    console.log(syObject);    // {Symbol(key1): "kk"}
     
    // 写法2
    let syObject = {
      [sy]: "kk"
    };
    console.log(syObject);    // {Symbol(key1): "kk"}
     
    // 写法3
    let syObject = {};
    Object.defineProperty(syObject, sy, {value: "kk"});
    console.log(syObject);   // {Symbol(key1): "kk"}

Symbol 作为对象属性名时不能用.运算符，要用方括号。

因为**.**运算符后面是字符串，所以取到的是字符串 sy 属性，而不是 Symbol 值 sy 属性。
 
    syObject[sy];  // "kk"
    syObject.sy;   // undefined


**难点：**

1. Symbol 值作为属性名时，该属性是公有属性不是私有属性，可以在类的外部访问。但是不会出现在 for...in 、 for...of 的循环中，也不会被 Object.keys() 、 Object.getOwnPropertyNames() 返回。
2. 如果要读取到一个对象的 Symbol 属性，可以通过 Object.getOwnPropertySymbols() 和 Reflect.ownKeys() 取到。
        
        let syObject = {};
        syObject[sy] = "kk";
        console.log(syObject);
         
        for (let i in syObject) {
          console.log(i);
        }    // 无输出
         
        Object.keys(syObject);                     // []
        Object.getOwnPropertySymbols(syObject);    // [Symbol(key1)]
        Reflect.ownKeys(syObject);                 // [Symbol(key1)]

###4.3.2 定义常量
使用 Symbol 定义常量，这样就可以保证这一组常量的值都不相等。用 Symbol 来修改上面的例子。
    
    const COLOR_RED = Symbol("red");
    const COLOR_YELLOW = Symbol("yellow");
    const COLOR_BLUE = Symbol("blue");
     
    function ColorException(message) {
       this.message = message;
       this.name = "ColorException";
    }
    function getConstantName(color) {
        switch (color) {
            case COLOR_RED :
                return "COLOR_RED";
            case COLOR_YELLOW :
                return "COLOR_YELLOW ";
            case COLOR_BLUE:
                return "COLOR_BLUE";
            default:
                throw new ColorException("Can't find this color");
        }
    }
     
    try {
       
       var color = "green"; // green 引发异常
       var colorName = getConstantName(color);
    } catch (e) {
       var colorName = "unknown";
       console.log(e.message, e.name); // 传递异常对象到错误处理
    }


##4.4 Symbol.for()
Symbol.for() 类似单例模式，首先会在全局搜索被登记的 Symbol 中是否有该字符串参数作为名称的 Symbol 值，如果有即返回该 Symbol 值，若没有则新建并返回一个以该字符串参数为名称的 Symbol 值，并登记在全局环境中供搜索。
    
    let yellow = Symbol("Yellow");
    let yellow1 = Symbol.for("Yellow");
    yellow === yellow1;      // false
     
    let yellow2 = Symbol.for("Yellow");
    yellow1 === yellow2;     // true

##4.5 Symbol.keyFor()
Symbol.keyFor() 返回一个已登记的 Symbol 类型值的 key ，用来检测该字符串参数作为名称的 Symbol 值是否已被登记。

    let yellow1 = Symbol.for("Yellow");
    Symbol.keyFor(yellow1);    // "Yellow"




----------
#第五章 扩展
----------
##5.1 字符串的扩展
###5.1.1 字符的 Unicode 表示法
####5.1.1.1 改进前
采用 \uxxxx 形式表示一个字符，其中 xxxx 表示字符的 Unicode 码点。
        
        "\u0061"
        // "a"

但是，这种表示法只限于码点在 \u0000 ~ \uFFFF 之间的字符。超出这个范围的字符，必须用两个双字节的形式表示。
    
    "\uD842\uDFB7"
    // "????"

    "\u20BB7"
    // " 7"

上面代码表示，如果直接在 \u 后面跟上超过 0xFFFF 的数值（比如 \u20BB7 ），JavaScript 会理解成 \u20BB+7 

由于 \u20BB 是一个不可打印字符，所以只会显示一个空格，后面跟着一个 7 

####5.1.1.2 改进后

    "\u{20BB7}"
    // "????"
    "\u{41}\u{42}\u{43}"
    // "ABC"
    let hello = 123;
    hell\u{6F} // 123
    '\u{1F680}' === '\uD83D\uDE80'
    // true

上面代码中，最后一个例子表明，大括号表示法与四字节的 UTF-16 编码是等价的

有了这种表示法之后，JavaScript 共有6种方法可以表示一个字符:
    
    '\z' === 'z'  // true
    '\172' === 'z' // true
    '\x7A' === 'z' // true
    '\u007A' === 'z' // true
    '\u{7A}' === 'z' // true

###5.1.2 字符串的遍历器接口

除了遍历字符串，这个遍历器最大的优点是可以识别大于 0xFFFF 的码点，传统的 for 循环无法识别这样的码点。

    let text = String.fromCodePoint(0x20BB7);
    for (let i = 0; i < text.length; i++) {
      console.log(text[i]);
    }
    // " "
    // " "
    for (let i of text) {
      console.log(i);
    }
    // "????"

上面代码中，字符串 text 只有一个字符，但是 for 循环会认为它包含两个字符（都不可打印），而 for...of 循环会正确识别出这一个字符

###5.1.3 直接输入 U+2028 和 U+2029
JavaScript 规定有5个字符，不能在字符串里面直接使用，只能使用转义形式。

1. U+005C：反斜杠（reverse solidus)

1. U+000D：回车（carriage return）

1. U+2028：行分隔符（line separator）

1. U+2029：段分隔符（paragraph separator）

1. U+000A：换行符（line feed）

这个规定本身没有问题，麻烦在于 JSON 格式允许字符串里面直接使用 U+2028（行分隔符）和 U+2029（段分隔符）。

这样一来，服务器输出的 JSON 被 JSON.parse 解析，就有可能直接报错。

    const json = '"\u2028"';
    JSON.parse(json); // 可能报错

注意，模板字符串现在就允许直接输入这两个字符。另外，正则表达式依然不允许直接输入这两个字符，这是没有问题的，因为 JSON 本来就不允许直接包含正则表达式

###5.1.4  JSON.stringify() 的改造
根据标准，JSON 数据必须是UTF-8 编码。但是，现在的 JSON.stringify() 方法有可能返回不符合 UTF-8 标准的字符串

>具体来说，UTF-8 标准规定， 0xD800 到 0xDFFF 之间的码点，不能单独使用，必须配对使用。
>
>比如， \uD834\uDF06 是两个码点，但是必须放在一起配对使用，代表字符 ???? ,这是为了表示码点大于 0xFFFF 的字符的一种变通方法。
>
>单独使用 \uD834 和 \uDFO6 这两个码点是不合法的，或者颠倒顺序也不行，因为 \uDF06\uD834 并没有对应的字符

JSON.stringify() 的问题在于，它可能返回 0xD800 到 0xDFFF 之间的单个码点。

    JSON.stringify('\u{D834}') // "\u{D834}"

为了确保返回的是合法的 UTF-8 字符，ES2019 改变了 JSON.stringify() 的行为。

如果遇到 0xD800 到 0xDFFF 之间的单个码点，或者不存在的配对形式，它会返回转义字符串，留给应用自己决定下一步的处理。

    JSON.stringify('\u{D834}') // ""\\uD834""
    JSON.stringify('\uDF06\uD834') // ""\\udf06\\ud834""

###5.1.5   模板字符串
 模板字符串(template string）是增强版的字符串，用反引号 ' ' 标识。

它可以当作普通字符串使用，也可以用来定义多行字符串，或者在字符串中嵌入变量。
    
    // 普通字符串
       In JavaScript '\n' is a line-feed.   
    // 多行字符串
       In JavaScript this is
     not legal.   
    console.log(   string text line 1
    string text line 2   );
    // 字符串中嵌入变量
    let name = "Bob", time = "today";
       Hello ${name}, how are you ${time}?   

模板字符串之中还能调用函数。

    function fn() {
      return "Hello World";
    }
       foo ${fn()} bar   
    // foo Hello World bar

模板字符串甚至还能嵌套。
    
    const tmpl = addrs => `
      <table>
      ${addrs.map(addr => `
        <tr><td>${addr.first}</td></tr>
        <tr><td>${addr.last}</td></tr>
      `).join('')}
      </table>
    `;
    上面代码中，模板字符串的变量之中，又嵌入了另一个模板字符串，使用方法如下。
    
    const data = [
        { first: '<Jane>', last: 'Bond' },
        { first: 'Lars', last: '<Croft>' },
    ];
    console.log(tmpl(data));
    // <table>
    //
    //   <tr><td><Jane></td></tr>
    //   <tr><td>Bond</td></tr>
    //
    //   <tr><td>Lars</td></tr>
    //   <tr><td><Croft></td></tr>
    //
    // </table>

如果需要引用模板字符串本身，在需要时执行，可以写成函数。

    let func = (name) =>    Hello ${name}!   ;
    func('Jack') // "Hello Jack!"


##5.2 字符串的新增方法
###5.2.1 String.fromCodePoint()
    String.fromCodePoint(0x20BB7)
    // "????"
    String.fromCodePoint(0x78, 0x1f680, 0x79) === 'x\uD83D\uDE80y'
    // true

上面代码中，如果 String.fromCodePoint 方法有多个参数，则它们会被合并成一个字符串返回。

注意， fromCodePoint 方法定义在 String 对象上，而 codePointAt 方法定义在字符串的实例对象上。

###5.2.2  String.raw()
该方法返回一个斜杠都被转义（即斜杠前面再加一个斜杠）的字符串，往往用于模板字符串的处理方法

    String.raw`Hi\n${2+3}!`
    // 实际返回 "Hi\\n5!"，显示的是转义后的结果 "Hi\n5!"
    String.raw`Hi\u000A!`;
    // 实际返回 "Hi\\u000A!"，显示的是转义后的结果 "Hi\u000A!"

实现伪代码：

        String.raw = function (strings, ...values) {
          let output = '';
          let index;
          for (index = 0; index < values.length; index++) {
            output += strings.raw[index] + values[index];
          }
          output += strings.raw[index]
          return output;
        }

##5.3 函数的扩展
###5.3.1 函数参数的默认值
ES6 允许为函数的参数设置默认值，即直接写在参数定义的后面。
    
    function log(x, y ='World'){
      console.log(x, y);
    }
    log('Hello')// Hello World
    log('Hello','China')// Hello China
    log('Hello','')// Hello
参数变量是默认声明的，所以不能用let或const再次声明。

    function foo(x =5){
      let x =1;// error
    const x =2;// error
    }

上面代码中，参数变量x是默认声明的，在函数体中，不能用let或const再次声明，否则会报错

使用参数默认值时，函数不能有同名参数。

    // 不报错
    function foo(x, x, y){
    // ...
    }
    // 报错
    function foo(x, x, y =1){
    // ...
    }
    // SyntaxError: Duplicate parameter name not allowed in this context

###5.3.2 与解构赋值默认值结合使用
参数默认值可以与解构赋值的默认值，结合起来使用。

    function foo({x, y =5}){
      console.log(x, y);
    }
    foo({})// undefined 5
    foo({x:1})// 1 5
    foo({x:1, y:2})// 1 2
    foo()// TypeError: Cannot read property 'x' of undefined

###5.3.3 rest 参数
ES6 引入 rest 参数（形式为...变量名），用于获取函数的多余参数，这样就不需要使用arguments对象了。

rest 参数搭配的变量是一个数组，该变量将多余的参数放入数组中

下面是一个 rest 参数代替arguments变量的例子。

    // arguments变量的写法
    function sortNumbers() {
      return Array.prototype.slice.call(arguments).sort();
    }
    // rest参数的写法
    const sortNumbers = (...numbers) => numbers.sort();
上面代码的两种写法，比较后可以发现，rest 参数的写法更自然也更简洁

注意，rest 参数之后不能再有其他参数（即只能是最后一个参数），否则会报错。

    // 报错
    function f(a, ...b, c) {
      // ...
    }

函数的length属性，不包括 rest 参数。

    (function(a) {}).length  // 1
    (function(...a) {}).length  // 0
    (function(a, ...b) {}).length  // 1


###5.3.4  严格模式
ES2016 做了一点修改，规定只要函数参数使用了默认值、解构赋值、或者扩展运算符，那么函数内部就不能显式设定为严格模式，否则会报错。

    // 报错
    function doSomething(a, b = a) {
      'use strict';
      // code
    }
    // 报错
    const doSomething = function ({a, b}) {
      'use strict';
      // code
    };
    // 报错
    const doSomething = (...a) => {
      'use strict';
      // code
    };
    const obj = {
      // 报错
      doSomething({a, b}) {
        'use strict';
        // code
      }
    };
这样规定的原因是，函数内部的严格模式，同时适用于函数体和函数参数。但是，函数执行的时候，先执行函数参数，然后再执行函数体。这样就有一个不合理的地方，只有从函数体之中，才能知道参数是否应该以严格模式执行，但是参数却应该先于函数体执行。

##5.4 数组的扩展
扩展运算符（spread）是三个点（...）。它好比 rest 参数的逆运算，将一个数组转为用逗号分隔的参数序列

该运算符主要用于函数调用。

    function push(array,...items){
      array.push(...items);
    }
    function add(x, y){
    return x + y;
    }
    const numbers =[4,38];
    add(...numbers)// 42
上面代码中，array.push(...items)和add(...numbers)这两行，都是函数的调用，它们都使用了扩展运算符。该运算符将一个数组，变为参数序列

注意，只有函数调用时，扩展运算符才可以放在圆括号中，否则会报错。
    
    (...[1,2])
    // Uncaught SyntaxError: Unexpected number

    console.log((...[1,2]))
    // Uncaught SyntaxError: Unexpected number

    console.log(...[1,2])
    // 1 2

上面三种情况，扩展运算符都放在圆括号里面，但是前两种情况会报错，因为扩展运算符所在的括号不是函数调用

###5.4.1 替代函数的 apply 方法

下面是扩展运算符取代apply方法的一个实际的例子，应用Math.max方法，简化求出一个数组最大元素的写法。

    // ES5 的写法
    Math.max.apply(null,[14,3,77])
    // ES6 的写法
    Math.max(...[14,3,77])
    // 等同于
    Math.max(14,3,77);

上面代码中，由于 JavaScript 不提供求数组最大元素的函数，所以只能套用Math.max函数，将数组转为一个参数序列，然后求最大值。

有了扩展运算符以后，就可以直接用Math.max了

###5.4.2 扩展运算符的应用
####5.4.2.1 复制数组
数组是复合的数据类型，直接复制的话，只是复制了指向底层数据结构的指针，而不是克隆一个全新的数组。

    const a1 =[1,2];
    const a2 = a1;
    a2[0]=2;
    a1 // [2, 2]

上面代码中，a2并不是a1的克隆，而是指向同一份数据的另一个指针。修改a2，会直接导致a1的变化


    ES5 只能用变通方法来复制数组。
    
    const a1 =[1,2];
    const a2 = a1.concat();
    a2[0]=2;
    a1 // [1, 2]
    
    
    扩展运算符提供了复制数组的简便写法。
    
    const a1 =[1,2];
    // 写法一
    const a2 =[...a1];
    // 写法二
    const[...a2]= a1;
上面的两种写法，a2都是a1的克隆，a1会返回原数组的克隆，再修改a2就不会对a1产生影响。

####5.4.2.2 合并数组

扩展运算符提供了数组合并的新写法。

    const arr1 =['a','b'];
    const arr2 =['c'];
    const arr3 =['d','e'];
    // ES5 的合并数组
    arr1.concat(arr2, arr3);
    // [ 'a', 'b', 'c', 'd', 'e' ]
    // ES6 的合并数组
    [...arr1,...arr2,...arr3]
    // [ 'a', 'b', 'c', 'd', 'e' ]

不过，这两种方法都是浅拷贝，使用的时候需要注意。

###5.4.3 对象的扩展
####5.4.3.1 对象的简介表示法
ES6 允许在大括号里面，直接写入变量和函数，作为对象的属性和方法。这样的书写更加简洁。

    const foo = 'bar';
    const baz = {foo};
    baz // {foo: "bar"}
    // 等同于
    const baz = {foo: foo};

除了属性简写，方法也可以简写。

    const o = {
      method() {
        return "Hello!";
      }
    };
    // 等同于
    const o = {
      method: function() {
        return "Hello!";
      }
    };

CommonJS 模块输出一组变量，就非常合适使用简洁写法。

    let ms = {};
    function getItem (key) {
      return key in ms ? ms[key] : null;
    }
    function setItem (key, value) {
      ms[key] = value;
    }
    function clear () {
      ms = {};
    }
    module.exports = { getItem, setItem, clear };
    // 等同于
    module.exports = {
      getItem: getItem,
      setItem: setItem,
      clear: clear
    };

----------
#第六章 Map 与 Set
----------
##6.1 Set
###6.1.1 基本用法

1. 类似于数组，但是成员的值都是唯一的，没有重复的值

1. Set 本身是一个构造函数，用来生成 Set 数据结构
    
        const s =newSet();
        [2,3,5,4,5,2,2].forEach(x => s.add(x));
        for(let i of s){
          console.log(i);
        }
        // 2 3 5 4



- SET也可以用于，去除字符串里面的重复字符。

        [...newSet('ababbc')].join('')
        // "abc"
    


1. 向 Set 加入值的时候，不会发生类型转换，所以5和"5"是两个不同的值。Set 内部判断两个值是否不同，使用的算法叫做“Same-value-zero equality”，它类似于精确相等运算符（===），主要的区别是向 Set 加入值时认为NaN等于自身，而精确相等运算符认为NaN不等于自身。
    
        let set=newSet();
        let a =NaN;
        let b =NaN;
        set.add(a);
        set.add(b);
        set// Set {NaN}



1. 另外，由于两个空对象不相等，所以它们被视为两个值

        let set=newSet();
        set.add({});
        set.size // 1
        set.add({});
        set.size // 2

###6.1.2 属性和方法
Set 结构的实例有以下属性:




- Set.prototype.constructor：构造函数，默认就是Set函数。


- Set.prototype.size：返回Set实例的成员总数。


- Set.prototype.add(value)：添加某个值，返回 Set 结构本身。


- Set.prototype.delete(value)：删除某个值，返回一个布尔值，表示删除是否成功。


- Set.prototype.has(value)：返回一个布尔值，表示该值是否为Set的成员。


- Set.prototype.clear()：清除所有成员，没有返回值

##6.2 WeakSet
WeakSet 结构与 Set 类似，也是不重复的值的集合。但是，它与 Set 有两个区别。



1. 首先，WeakSet 的成员只能是对象，而不能是其他类型的值



1. 其次，WeakSet 中的对象都是弱引用，即垃圾回收机制不考虑 WeakSet 对该对象的引用，也就是说，如果其他对象都不再引用该对象，那么垃圾回收机制会自动回收该对象所占用的内存，不考虑该对象还存在于 WeakSet 之中。



1. 如果一个值的引用次数不为0，垃圾回收机制就不会释放这块内存。结束使用该值之后，有时会忘记取消引用，导致内存无法释放，进而可能会引发内存泄漏。


1.  WeakSet 里面的引用，都不计入垃圾回收机制，所以就不存在这个问题。因此，WeakSet 适合临时存放一组对象，以及存放跟对象绑定的信息。只要这些对象在外部消失，它在 WeakSet 里面的引用就会自动消失。

##6.3  Map
JavaScript 的对象（Object），本质上是键值对的集合（Hash 结构），类似于对象，也是键值对的集合，但是“键”的范围不限于字符串，各种类型的值（包括对象）都可以当作键

如果对同一个键多次赋值，后面的值将覆盖前面的值。

    const map = new Map();
    map
    .set(1, 'aaa')
    .set(1, 'bbb');
    map.get(1) // "bbb"
上面代码对键1连续赋值两次，后一次的值覆盖前一次的值

如果读取一个未知的键，则返回undefined。

    new Map().get('asfddfsasadf')
    // undefined

注意，只有对同一个对象的引用，Map 结构才将其视为同一个键。这一点要非常小心。

###6.3.1 与其他数据结构的互相转换
####6.3.1.1 Map 转为数组
前面已经提过，Map 转为数组最方便的方法，就是使用扩展运算符（...）
    
    const myMap = new Map()
      .set(true, 7)
      .set({foo: 3}, ['abc']);
    [...myMap]
    // [ [ true, 7 ], [ { foo: 3 }, [ 'abc' ] ] ]

####6.3.1.2 数组 转为 Map

将数组传入 Map 构造函数，就可以转为 Map。

    new Map([
      [true, 7],
      [{foo: 3}, ['abc']]
    ])
    // Map {
    //   true => 7,
    //   Object {foo: 3} => ['abc']
    // }

####6.3.1.3Map 转为对象

如果所有 Map 的键都是字符串，它可以无损地转为对象。

    function strMapToObj(strMap) {
      let obj = Object.create(null);
      for (let [k,v] of strMap) {
        obj[k] = v;
      }
      return obj;
    }
    const myMap = new Map()
      .set('yes', true)
      .set('no', false);
    strMapToObj(myMap)
    // { yes: true, no: false }

如果有非字符串的键名，那么这个键名会被转成字符串，再作为对象的键名。

####6.3.1.4 对象转为 Map

对象转为 Map 可以通过Object.entries()。
    
    let obj = {"a":1, "b":2};
    let map = new Map(Object.entries(obj));

此外，也可以自己实现一个转换函数。

    function objToStrMap(obj) {
      let strMap = new Map();
      for (let k of Object.keys(obj)) {
        strMap.set(k, obj[k]);
      }
      return strMap;
    }
    objToStrMap({yes: true, no: false})
    // Map {"yes" => true, "no" => false}

####6.3.1.5Map 转为 JSON

Map 转为 JSON 要区分两种情况：

一种情况是，Map 的键名都是字符串，这时可以选择转为对象 JSON。

    function strMapToJson(strMap) {
      return JSON.stringify(strMapToObj(strMap));
    }
    let myMap = new Map().set('yes', true).set('no', false);
    strMapToJson(myMap)
    // '{"yes":true,"no":false}'

另一种情况是，Map 的键名有非字符串，这时可以选择转为数组 JSON。

    function mapToArrayJson(map) {
      return JSON.stringify([...map]);
    }
    let myMap = new Map().set(true, 7).set({foo: 3}, ['abc']);
    mapToArrayJson(myMap)
    // '[[true,7],[{"foo":3},["abc"]]]'

####6.3.1.6 JSON 转为 Map

JSON 转为 Map，正常情况下，所有键名都是字符串。
    
    function jsonToStrMap(jsonStr) {
      return objToStrMap(JSON.parse(jsonStr));
    }
    jsonToStrMap('{"yes": true, "no": false}')
    // Map {'yes' => true, 'no' => false}

但是，有一种特殊情况，整个 JSON 就是一个数组，且每个数组成员本身，又是一个有两个成员的数组。这时，它可以一一对应地转为 Map。这往往是 Map 转为数组 JSON 的逆操作。
    
    function jsonToMap(jsonStr) {
      return new Map(JSON.parse(jsonStr));
    }
    jsonToMap('[[true,7],[{"foo":3},["abc"]]]')
    // Map {true => 7, Object {foo: 3} => ['abc']}

##6.4 WeakMap
WeakMap结构与Map结构类似，也是用于生成键值对的集合。

    // WeakMap 可以使用 set 方法添加成员
    const wm1 = new WeakMap();
    const key = {foo: 1};
    wm1.set(key, 2);
    wm1.get(key) // 2
    // WeakMap 也可以接受一个数组，
    // 作为构造函数的参数
    const k1 = [1, 2, 3];
    const k2 = [4, 5, 6];
    const wm2 = new WeakMap([[k1, 'foo'], [k2, 'bar']]);
    wm2.get(k2) // "bar"

WeakMap与Map的区别有两点：



1. WeakMap只接受对象作为键名（null除外），不接受其他类型的值作为键名


1. WeakMap的键名所指向的对象，不计入垃圾回收机制


----------
#第七章 Proxy和Reflect
----------
##7.1 Proxy


- Proxy 用于修改某些操作的默认行为，等同于在语言层面做出修改，所以属于一种“元编程”（meta programming），即对编程语言进行编程



- Proxy 可以理解成，在目标对象之前架设一层“拦截”，外界对该对象的访问，都必须先通过这层拦截，因此提供了一种机制，可以对外界的访问进行过滤和改写

- Proxy 这个词的原意是代理，用在这里表示由它来“代理”某些操作，可以译为“代理器”

ES6 原生提供 Proxy 构造函数，用来生成 Proxy 实例。

    var proxy =newProxy(target, handler);   

Proxy 对象的所有用法，都是上面这种形式，不同的只是handler参数的写法。其中，new Proxy()表示生成一个Proxy实例，target参数表示所要拦截的目标对象，handler参数也是一个对象，用来定制拦截行为。

##7.2 Reflect
Reflect对象与Proxy对象一样，也是 ES6 为了操作对象而提供的新 API。Reflect对象的设计目的有这样几个:



1.  将Object对象的一些明显属于语言内部的方法（比如Object.defineProperty），放到Reflect对象上。现阶段，某些方法同时在Object和Reflect对象上部署，未来的新方法将只部署在Reflect对象上。也就是说，从Reflect对象上可以拿到语言内部的方法。



1.  修改某些Object方法的返回结果，让其变得更合理。比如，Object.defineProperty(obj, name, desc)在无法定义属性时，会抛出一个错误，而Reflect.defineProperty(obj, name, desc)则会返回false


1.  让Object操作都变成函数行为。某些Object操作是命令式，比如name in obj和delete obj[name]，而Reflect.has(obj, name)和Reflect.deleteProperty(obj, name)让它们变成了函数行为


1. Reflect对象的方法与Proxy对象的方法一一对应，只要是Proxy对象的方法，就能在Reflect对象上找到对应的方法。这就让Proxy对象可以方便地调用对应的Reflect方法，完成默认行为，作为修改行为的基础。也就是说，不管Proxy怎么修改默认行为，你总可以在Reflect上获取默认行为。


----------
#第八章 Iterator 和 for…of 循环
----------
##8.1 迭代器

JavaScript 原有的表示“集合”的数据结构，主要是数组（Array）和对象（Object），ES6 又添加了Map和Set。这样就有了四种数据集合，用户还可以组合使用它们，定义自己的数据结构，比如数组的成员是Map，Map的成员是对象。这样就需要一种统一的接口机制，来处理所有不同的数据结构。

遍历器（Iterator）就是这样一种机制。它是一种接口，为各种不同的数据结构提供统一的访问机制。任何数据结构只要部署 Iterator 接口，就可以完成遍历操作（即依次处理该数据结构的所有成员）。

Iterator 的作用有三个：一是为各种数据结构，提供一个统一的、简便的访问接口；二是使得数据结构的成员能够按某种次序排列；三是 ES6 创造了一种新的遍历命令for...of循环，Iterator 接口主要供for...of消费。

Iterator 的遍历过程是这样的。

（1）创建一个指针对象，指向当前数据结构的起始位置。也就是说，遍历器对象本质上，就是一个指针对象。

（2）第一次调用指针对象的next方法，可以将指针指向数据结构的第一个成员。

（3）第二次调用指针对象的next方法，指针就指向数据结构的第二个成员。

（4）不断调用指针对象的next方法，直到它指向数据结构的结束位置。

每一次调用next方法，都会返回数据结构的当前成员的信息。具体来说，就是返回一个包含value和done两个属性的对象。其中，value属性是当前成员的值，done属性是一个布尔值，表示遍历是否结束。

##8.2 for...of循环
ES6 借鉴 C++、Java、C# 和 Python 语言，引入了for...of循环，作为遍历所有数据结构的统一的方法。

一个数据结构只要部署了Symbol.iterator属性，就被视为具有 iterator 接口，就可以用for...of循环遍历它的成员。也就是说，for...of循环内部调用的是数据结构的Symbol.iterator方法。

for...of循环可以使用的范围包括数组、Set 和 Map 结构、某些类似数组的对象（比如arguments对象、DOM NodeList 对象）、后文的 Generator 对象，以及字符串。


----------
#第九章 Generator函数 和 async函数
----------
##9.1 Generator函数 
###9.1.1 基本概念 


- Generator 函数是 ES6 提供的一种异步编程解决方案，语法行为与传统函数完全不同。



- Generator 函数有多种理解角度。语法上，首先可以把它理解成，Generator 函数是一个状态机，封装了多个内部状态。



- 执行 Generator 函数会返回一个遍历器对象，也就是说，Generator 函数除了状态机，还是一个遍历器对象生成函数。返回的遍历器对象，可以依次遍历 Generator 函数内部的每一个状态。



- 形式上，Generator 函数是一个普通函数，但是有两个特征。一是，function关键字与函数名之间有一个星号；二是，函数体内部使用yield表达式，定义不同的内部状态（yield在英语里的意思就是“产出”）
        
        function* helloWorldGenerator() {
          yield 'hello';
          yield 'world';
          return 'ending';
        }
        
        var hw = helloWorldGenerator();


- 上面代码定义了一个 Generator 函数helloWorldGenerator，它内部有两个yield表达式（hello和world），即该函数有三个状态：hello，world 和 return 语句（结束执行）。



- 然后，Generator 函数的调用方法与普通函数一样，也是在函数名后面加上一对圆括号。

- 不同的是，调用 Generator 函数后，该函数并不执行，返回的也不是函数运行结果，而是一个指向内部状态的指针对象，也就是遍历器对象（Iterator Object）。



- 下一步，必须调用遍历器对象的next方法，使得指针移向下一个状态。也就是说，每次调用next方法，内部指针就从函数头部或上一次停下来的地方开始执行，直到遇到下一个yield表达式（或return语句）为止。换言之，Generator 函数是分段执行的，yield表达式是暂停执行的标记，而next方法可以恢复执行
        
        hw.next()
        // { value: 'hello', done: false }
        
        hw.next()
        // { value: 'world', done: false }
        
        hw.next()
        // { value: 'ending', done: true }
        
        hw.next()
        // { value: undefined, done: true }

- 上面代码一共调用了四次next方法。

    第一次调用，Generator 函数开始执行，直到遇到第一个yield表达式为止。next方法返回一个对象，它的value属性就是当前yield表达式的值hello，done属性的值false，表示遍历还没有结束。
    
    第二次调用，Generator 函数从上次yield表达式停下的地方，一直执行到下一个yield表达式。next方法返回的对象的value属性就是当前yield表达式的值world，done属性的值false，表示遍历还没有结束。

    第三次调用，Generator 函数从上次yield表达式停下的地方，一直执行到return语句（如果没有return语句，就执行到函数结束）。next方法返回的对象的value属性，就是紧跟在return语句后面的表达式的值（如果没有return语句，则value属性的值为undefined），done属性的值true，表示遍历已经结束。

    第四次调用，此时 Generator 函数已经运行完毕，next方法返回对象的value属性为undefined，done属性为true。以后再调用next方法，返回的都是这个值。

- ES6 没有规定，function关键字与函数名之间的星号，写在哪个位置。这导致下面的写法都能通过:

    function * foo(x, y) { ··· }
    function *foo(x, y) { ··· }
    function* foo(x, y) { ··· }
    function*foo(x, y) { ··· }



- 由于 Generator 函数仍然是普通函数，所以一般的写法是上面的第三种，即星号紧跟在function关键字后面。

###9.1.2 yield 表达式

由于 Generator 函数返回的是遍历器对象，只有调用next方法才会遍历下一个内部状态，所以其实提供了一种可以暂停执行的函数。yield表达式就是暂停标志。

遍历器对象的next方法的运行逻辑如下：


1. 遇到yield表达式，就暂停执行后面的操作，并将紧跟在yield后面的那个表达式的值，作为返回的对象的value属性值。



1. 下一次调用next方法时，再继续往下执行，直到遇到下一个yield表达式。


1. 如果没有再遇到新的yield表达式，就一直运行到函数结束，直到return语句为止，并将return语句后面的表达式的值，作为返回的对象的value属性值。


1. 如果该函数没有return语句，则返回的对象的value属性值为undefined

    yield表达式后面的表达式，只有当调用next方法、内部指针指向该语句时才会执行，因此等于为 JavaScript 提供了手动的“惰性求值”（Lazy Evaluation）的语法功能，yield后面的表达式123 + 456，不会立即求值，只会在next方法将指针移到这一句时，才会求值：

    function* gen() {
      yield  123 + 456;
    }

yield表达式与return语句既有相似之处，也有区别：
    

1. 相似之处在于，都能返回紧跟在语句后面的那个表达式的值。
    

1. 区别在于每次遇到yield，函数暂停执行，下一次再从该位置继续向后执行，而return语句不具备位置记忆的功能。
    

1. 一个函数里面，只能执行一次（或者说一个）return语句，但是可以执行多次（或者说多个）yield表达式。
    

1. 正常函数只能返回一个值，因为只能执行一次return；Generator 函数可以返回一系列的值，因为可以有任意多个yield。
    

1. 从另一个角度看，也可以说 Generator 生成了一系列的值，这也就是它的名称的来历（英语中，generator 这个词是“生成器”的意思）。



Generator 函数可以不用yield表达式，这时就变成了一个单纯的暂缓执行函数。

    function* f() {
      console.log('执行了！')
    }
    
    var generator = f();
    
    setTimeout(function () {
      generator.next()
    }, 2000);

上面代码中，函数f如果是普通函数，在为变量generator赋值时就会执行。但是，函数f是一个 Generator 函数，就变成只有调用next方法时，函数f才会执行

**yield表达式如果用在另一个表达式之中，必须放在圆括号里面**

    function* demo() {
      console.log('Hello' + yield); // SyntaxError
      console.log('Hello' + yield 123); // SyntaxError
    
      console.log('Hello' + (yield)); // OK
      console.log('Hello' + (yield 123)); // OK
    }

    下面代码中，第二次运行next方法的时候不带参数，
    导致 y 的值等于2 * undefined（即NaN），除以 3 以后还是NaN，
    因此返回对象的value属性也等于NaN。
    第三次运行Next方法的时候不带参数，
    所以z等于undefined，
    返回对象的value属性等于5 + NaN + undefined，即NaN。
    
    function* foo(x) {
      var y = 2 * (yield (x + 1));
      var z = yield (y / 3);
      return (x + y + z);
    }
    
    var a = foo(5);
    a.next() // Object{value:6, done:false}
    a.next() // Object{value:NaN, done:false}
    a.next() // Object{value:NaN, done:true}
    
    var b = foo(5);
    b.next() // { value:6, done:false }
    b.next(12) // { value:8, done:false }
    b.next(13) // { value:42, done:true }


    


如果想要第一次调用next方法时，就能够输入值，可以在 Generator 函数外面再包一层。

    function wrapper(generatorFunction) {
      return function (...args) {
        let generatorObject = generatorFunction(...args);
        generatorObject.next();
        return generatorObject;
      };
    }
    
    const wrapped = wrapper(function* () {
      console.log(`First input: ${yield}`);
      return 'DONE';
    });
    
    wrapped().next('hello!')
    // First input: hello!

上面代码中，Generator 函数如果不用wrapper先包一层，是无法第一次调用next方法，就输入参数的。


##9.2 async 函数
ES2017 标准引入了 async 函数，使得异步操作变得更加方便。

async 函数是什么？一句话，它就是 Generator 函数的语法糖

----------
#第十章 Promise对象
----------
##10.1 Promise 的含义


- Promise 是异步编程的一种解决方案，比传统的解决方案——回调函数和事件——更合理和更强大。

- 它由社区最早提出和实现，ES6 将其写进了语言标准，统一了用法，原生提供了Promise对象。

##10.2 Promise的特点


1. 对象的状态不受外界影响。Promise对象代表一个异步操作，有三种状态：**pending（进行中）、fulfilled（已成功）和rejected（已失败）**。只有异步操作的结果，可以决定当前是哪一种状态，任何其他操作都无法改变这个状态。这也是Promise这个名字的由来，它的英语意思就是“承诺”，表示其他手段无法改变。



1. 一旦状态改变，就不会再变，任何时候都可以得到这个结果。Promise对象的状态改变，只有两种可能：**从pending变为fulfilled和从pending变为rejected**。只要这两种情况发生，状态就凝固了，不会再变了，会一直保持这个结果，这时就称为 **resolved（已定型）**。如果改变已经发生了，你再对Promise对象添加回调函数，也会立即得到这个结果。这与事件（Event）完全不同，事件的特点是，**如果你错过了它，再去监听，是得不到结果的**。

##10.3 Promise.resolve()
###10.3.1参数是一个 Promise 实例

如果参数是 Promise 实例，那么Promise.resolve将不做任何修改、原封不动地返回这个实例

###10.3.2 参数是一个thenable对象

thenable对象指的是具有then方法的对象，比如下面这个对象。

    let thenable = {
      then: function(resolve, reject) {
        resolve(42);
      }
    };

Promise.resolve方法会将这个对象转为 Promise 对象，然后就立即执行thenable对象的then方法

    let thenable = {
      then: function(resolve, reject) {
        resolve(42);
      }
    };
    let p1 = Promise.resolve(thenable);
    p1.then(function(value) {
      console.log(value);  // 42
    });

上面代码中，thenable对象的then方法执行后，对象p1的状态就变为resolved，从而立即执行最后那个then方法指定的回调函数，输出 42

###10.3.3 参数不是具有then方法的对象，或根本就不是对象

如果参数是一个原始值，或者是一个不具有then方法的对象，则Promise.resolve方法返回一个新的 Promise 对象，状态为resolved。

    const p = Promise.resolve('Hello');
    p.then(function (s){
      console.log(s)
    });
    // Hello

上面代码生成一个新的 Promise 对象的实例p。由于字符串Hello不属于异步操作（判断方法是字符串对象不具有 then 方法），返回 Promise 实例的状态从一生成就是resolved，所以回调函数会立即执行。Promise.resolve方法的参数，会同时传给回调函数。

###10.3.4 不带有任何参数

Promise.resolve()方法允许调用时不带参数，直接返回一个resolved状态的 Promise 对象。

所以，如果希望得到一个 Promise 对象，比较方便的方法就是直接调用Promise.resolve()方法。

    const p = Promise.resolve();
    p.then(function () {
      // ...
    });
上面代码的变量p就是一个 Promise 对象。

需要注意的是，立即resolve()的 Promise 对象，是在本轮“事件循环”（event loop）的结束时执行，而不是在下一轮“事件循环”的开始时。

    setTimeout(function () {
      console.log('three');
    }, 0);
    Promise.resolve().then(function () {
      console.log('two');
    });
    console.log('one');
    // one
    // two
    // three

上面代码中，setTimeout(fn, 0)在下一轮“事件循环”开始时执行，Promise.resolve()在本轮“事件循环”结束时执行，console.log('one')则是立即执行，因此最先输出。

##10.4 Promise.reject()

Promise.reject(reason)方法也会返回一个新的 Promise 实例，该实例的状态为rejected

注意，Promise.reject()方法的参数，会原封不动地作为reject的理由，变成后续方法的参数。这一点与Promise.resolve方法不一致。
    
    const thenable = {
      then(resolve, reject) {
        reject('出错了');
      }
    };
    Promise.reject(thenable)
    .catch(e => {
      console.log(e === thenable)
    })
    // true

上面代码中，Promise.reject方法的参数是一个thenable对象，执行以后，后面catch方法的参数不是reject抛出的“出错了”这个字符串，而是thenable对象

##10.5 应用
###10.5.1 加载图片
