>JSON 学习笔记
#第一章 JSON简介
##1.1 何为JSON

1. JSON: JavaScript Object Notation(JavaScript 对象表示法)


1. JSON 是存储和交换文本信息的语法，类似 XML。


1. JSON 比 XML 更小、更快，更易解析

1. JSON 独立于语言：JSON 使用 Javascript语法来描述数据对象，但是 JSON 仍然独立于语言和平台。


1. JSON 解析器和 JSON 库支持许多不同的编程语言。 目前非常多的动态（PHP，JSP，.NET）编程语言都支持JSON。
        
        {
            "sites": [
            { "name":"菜鸟教程" , "url":"www.runoob.com" }, 
            { "name":"google" , "url":"www.google.com" }, 
            { "name":"微博" , "url":"www.weibo.com" }
            ]
        }

##1.2 JSON转化为 JavaScript 对象

1. JSON 文本格式在语法上与创建 JavaScript 对象的代码相同。

1. 由于这种相似性，无需解析器，JavaScript 程序能够使用内建的 eval() 函数，用 JSON 数据来生成原生的 JavaScript 对象。

##1.3 与 XML 相同之处


- JSON 是纯文本


- JSON 具有"自我描述性"（人类可读）


- JSON 具有层级结构（值中存在值）


- JSON 可通过 JavaScript 进行解析


- JSON 数据可使用 AJAX 进行传输

##1.4 与 XML 不同之处


- 没有结束标签


- 更短


- 读写的速度更快


- 能够使用内建的 JavaScript eval() 方法进行解析


- 使用数组


- 不使用保留字

##1.5 为什么使用 JSON？
对于 AJAX 应用程序来说，JSON 比 XML 更快更易使用：



使用 XML


1. 读取 XML 文档


1. 使用 XML DOM 来循环遍历文档


1. 读取值并存储在变量中


使用 JSON


1. 读取 JSON 字符串


1. 用 eval() 处理 JSON 字符串


----------
#第二章 JSON 语法
----------
JSON 语法是 JavaScript 语法的子集
##2.1 语法规则


1. 数据在名称/值对中


1. 数据由逗号分隔


1. 大括号 {} 保存对象


1. 中括号 [] 保存数组，数组可以包含多个对象

##2.2 JSON名称/值对
JSON 数据的书写格式是：

        key : value

##2.3 JSON 值

- 数字（整数或浮点数）


- 字符串（在双引号中）


- 逻辑值（true 或 false）


- 数组（在中括号中）


- 对象（在大括号中）


- null

##2.4 JSON 使用 JavaScript 语法


1. 因为 JSON 使用 JavaScript 语法，所以无需额外的软件就能处理 JavaScript 中的 JSON



1. 通过 JavaScript，您可以创建一个对象数组，并像这样进行赋值：


        var sites = [
            { "name":"1" , "url":"1.com" }, 
            { "name":"google" , "url":"www.google.com" }, 
            { "name":"微博" , "url":"www.weibo.com" }
        ];

##2.5 JSON 文件


1. JSON 文件的文件类型是 .json


1. JSON 文本的 MIME 类型是 application/json


----------
#第三章 JSON vs XML
----------
 JSON 和 XML 都用于接收 web 服务端的数据
##3.1最大的不同

XML 需要使用 XML 解析器来解析，JSON 可以使用标准的 JavaScript 函数来解析。

1. JSON.parse(): 将一个 JSON 字符串转换为 JavaScript 对象。

1. JSON.stringify(): 于将 JavaScript 值转换为 JSON 字符串

##3.2 JSON 比 XML 更好


1. XML 比 JSON 更难解析。



1. JSON 可以直接使用现有的 JavaScript 对象解析。



1. 针对 AJAX 应用，JSON 比 XML 数据加载更快，而且更简单：

使用 XML



- 获取 XML 文档


- 使用 XML DOM 迭代循环文档


- 接数据解析出来复制给变量

使用 JSON



- 获取 JSON 字符串


- JSON.Parse 解析 JSON 字符串


----------
#第四章 JSON对象
----------
##4.1 语法


- JSON 对象使用在大括号({})中书写。



- 对象可以包含多个 key/value（键/值）对。



- key 必须是字符串，value 可以是合法的 JSON 数据类型（字符串, 数字, 对象, 数组, 布尔值或 null）。



- key 和 value 中使用冒号(:)分割。



- 每个 key/value 对使用逗号(,)分割

##4.2 访问对象值
使用点号（.）来访问对象的值：
    
    var myObj, x;
    myObj = { "name":"r1", "alexa":10000, "site":null };
    x = myObj.name;

##4.3 循环对象
使用 for-in 来循环对象的属性：
    
    var myObj = { "name":"r1", "alexa":10000, "site":null };
    for (x in myObj) {
        document.getElementById("demo").innerHTML += x + "<br>";
    }

##4.4 嵌套 JSON 对象
JSON 对象中可以包含另外一个 JSON 对象：

        myObj = {
            "name":"runoob",
            "alexa":10000,
            "sites": {
                "site1":"www.runoob.com",
                "site2":"m.runoob.com",
                "site3":"c.runoob.com"
            }
        }
使用点号(.)或者中括号([])来访问嵌套的 JSON 对象

##4.5 删除对象属性
使用 delete 关键字来删除 JSON 对象的属性：
    
    delete myObj.sites.site1;


----------
#第五章 JSON.parse()
----------
##5.1 使用场景


- JSON 通常用于与服务端交换数据。



- 在接收服务器数据时一般是字符串。



- 使用 JSON.parse() 方法将数据转换为 JavaScript 对象

##5.2 语法
        JSON.parse(text[, reviver])
参数说明：

- text:必需， 一个有效的 JSON 字符串。

- reviver: 可选，一个转换结果的函数， 将为对象的每个成员调用此函数
##5.3 解析使用
解析完成后，我们就可以在网页上使用 JSON 数据了


        <p id="demo"></p>
         
        <script>
        var obj = JSON.parse('{ "name":"runoob", "alexa":10000, "site":"www.runoob.com" }');
        document.getElementById("demo").innerHTML = obj.name + "：" + obj.site;
        </script>

##5.4 接收 JSON 数据
使用 AJAX 从服务器请求 JSON 数据，并解析为 JavaScript 对象
        
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                document.getElementById("demo").innerHTML = myObj.name;
            }
        };
        xmlhttp.open("GET", "/try/ajax/json_demo.txt", true);
        xmlhttp.send();

##5.5 接收数组的 JSON 数据
如果从服务端接收的是数组的 JSON 数据，则 JSON.parse 会将其转换为 JavaScript 数组：


    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myArr = JSON.parse(this.responseText);
            document.getElementById("demo").innerHTML = myArr[1];
        }
    };
    xmlhttp.open("GET", "/try/ajax/json_demo_array.txt", true);
    xmlhttp.send();
----------
#第六章 JSON.stringify()

----------
##6.1 使用场景



- JSON 通常用于与服务端交换数据。



- 在向服务器发送数据时一般是字符串。



- 使用 JSON.stringify() 方法将 JavaScript 对象转换为字符串

##6.2 语法
        JSON.stringify(value[, replacer[, space]])
参数说明：



- value:必需， 要转换的 JavaScript 值（通常为对象或数组）。



- replacer:可选。用于转换结果的函数或数组。

如果 replacer 为函数，则 JSON.stringify 将调用该函数，并传入每个成员的键和值。使用返回值而不是原始值。如果此函数返回 undefined，则排除成员。根对象的键是一个空字符串：""。

如果 replacer 是一个数组，则仅转换该数组中具有键值的成员。成员的转换顺序与键在数组中的顺序一样。当 value 参数也为数组时，将忽略 replacer 数组。

space:
可选，文本添加缩进、空格和换行符，如果 space 是一个数字，则返回值文本在每个级别缩进指定数目的空格，如果 space 大于 10，则文本缩进 10 个空格。space 也可以使用非数字，如：\t。

##6.3 异常

- JSON 不能存储 Date 对象。



- JSON.stringify() 会将所有日期转换为字符串。

        
        var obj = { "name":"R1", "initDate":new Date(), "site":"www.r1.com"};
        var myJSON = JSON.stringify(obj);
        document.getElementById("demo").innerHTML = myJSON;

##6.4 解析函数
JSON 不允许包含函数，JSON.stringify() 会删除 JavaScript 对象的函数，包括 key 和 value
        
        var obj = { "name":"Runoob", "alexa":function () {return 10000;}, "site":"www.runoob.com"};
        var myJSON = JSON.stringify(obj);
         
        document.getElementById("demo").innerHTML = myJSON;