> jQuery学习笔记 2021/10/24 10:30:04 
#序章 jQuery简介
##0.1 jQuery 库 - 特性
jQuery 是一个 JavaScript 函数库。

jQuery 库包含以下特性：

- HTML 元素选取

- HTML 元素操作

- CSS 操作

- HTML 事件函数

- JavaScript 特效和动画

- HTML DOM 遍历和修改

- AJAX

- Utilities

##0.2 添加 jQuery 库


1. jQuery 库位于一个 JavaScript 文件中，其中包含了所有的 jQuery 函数。



1. 可以通过下面的标记把 jQuery 添加到网页中：

        <head>
        <script type="text/javascript" src="jquery.js"></script>
        </head>



1. 请注意，`<script> `标签应该位于页面的 `<head> `部分

##0.3 下载 jQuery
有两个版本的 jQuery 可供下载，这两个版本都可以从 jQuery.com 下载：

1. Production version - 用于实际的网站中，已被精简和压缩。

1. Development version - 用于测试和开发（未压缩，是可读的代码）


----------
#第一章 jQuery 语法
----------
##1.1 jQuery 选择器

1. jQuery 元素选择器和属性选择器允许您通过标签名、属性名或内容对 HTML 元素进行选择。

1. 选择器允许您对 HTML 元素组或单个元素进行操作

1. 在 HTML DOM 术语中，选择器允许您对 DOM 元素组或单个 DOM 节点进行操作

##1.1.1 jQuery 元素选择器
jQuery 使用 CSS 选择器来选取 HTML 元素

- $("p") 选取 `<p>` 元素

- $("p.intro") 选取所有 class="intro" 的 `<p>` 元素

- $("p#demo") 选取所有 id="demo" 的 `<p> `元素

###1.1.2 jQuery 属性选择器
jQuery 使用 XPath 表达式来选择带有给定属性的元素

- $("[href]") 选取所有带有 href 属性的元素

- $("[href='#']") 选取所有带有 href 值等于 "#" 的元素

- $("[href!='#']") 选取所有带有 href 值不等于 "#" 的元素

- $("[href$='.jpg']") 选取所有 href 值以 ".jpg" 结尾的元素

###1.1.3 jQuery CSS 选择器
jQuery CSS 选择器可用于改变 HTML 元素的 CSS 属性

    $("p").css("background-color","red");
###1.1.4  更多选择器
|---|----|
|语法	|描述	
|$("*")|	选取所有元素	
|$(this)|	选取当前 HTML 元素	
|$("p.intro")|	选取 class 为 intro 的 `<p>` 元素	
|$("p:first")|	选取第一个 `<p>` 元素	
|$("ul li:first")|	选取第一个 `<ul>` 元素的第一个` <li> `元素	
|$("ul li:first-child")	|选取每个 `<ul>` 元素的第一个 `<li>` 元素	
|$("ul:first-child li:first-child")	|选第一个 `<ul>` 元素的第一个 `<li>` 元素
|$("[href]")	|选取带有 href 属性的元素	
|$("a[target='_blank']")|	选取所有 target 属性值等于 "_blank" 的 `<a>` 元素	
|$(":button")	|选取所有 type="button" 的 `<input>` 元素 和 `<button> `元素	
|$("tr:even")|	选取偶数位置的 `<tr>` 元素
|$("tr:odd")	|选取奇数位置的 `<tr>`元素

##1.2 jQuery 事件函数
###1.2.1 什么是事件

- 页面对不同访问者的响应叫做事件。

- 事件处理程序指的是当 HTML 中发生某些事件时所调用的方法

###1.2.2 常见的事件
|----|----|-----|----|
|鼠标事件|	键盘事件	|表单事件|	文档/窗口事件
|click|	keypress|	submit|	load
|dblclick	|keydown	|change|	resize
|mouseenter|	keyup	|focus	|scroll
|mouseleave	| 	|blur	|unload
|hover|

###1.2.3 jQuery 事件语法


- 在 jQuery 中，大多数 DOM 事件都有一个等效的 jQuery 方法



- 页面中指定一个点击事件：

    $("p").click();

###1.2.4 常用的 jQuery 事件

####1.2.4.1 $(document).ready()

$(document).ready() 方法允许我们在文档完全加载完后自动执行函数

####1.2.4.2 click()


- click() 方法是当按钮点击事件被触发时会调用一个函数。



- 该函数在用户点击 HTML 元素时执行。



- 当点击事件在某个 `<p>` 元素上触发时，隐藏当前的 `<p>` 元素：

        
        $("p").click(function(){
          $(this).hide();
        });


####1.2.4.3 dblclick()


- 当双击元素时，会发生 dblclick 事件。



- dblclick() 方法触发 dblclick 事件，或规定当发生 dblclick 事件时运行的函数：

        $("p").dblclick(function(){
          $(this).hide();
        });


####1.2.4.4 mouseenter()


- 当鼠标指针穿过元素时，会发生 mouseenter 事件。



- mouseenter() 方法触发 mouseenter 事件，或规定当发生 mouseenter 事件时运行的函数：


        $("#p1").mouseenter(function(){
            alert('您的鼠标移到了 id="p1" 的元素上!');
        });

####1.2.4.5 mouseleave()


- 当鼠标指针离开元素时，会发生 mouseleave 事件。



- mouseleave() 方法触发 mouseleave 事件，或规定当发生 mouseleave 事件时运行的函数：


        $("#p1").mouseleave(function(){
            alert("再见，您的鼠标离开了该段落。");
        });


####1.2.4.6 mousedown()


- 当鼠标指针移动到元素上方，并按下鼠标按键时，会发生 mousedown 事件。



- mousedown() 方法触发 mousedown 事件，或规定当发生 mousedown 事件时运行的函数：

        $("#p1").mousedown(function(){
            alert("鼠标在该段落上按下！");
        });

####1.2.4.7 mouseup()


- 当在元素上松开鼠标按钮时，会发生 mouseup 事件。



- mouseup() 方法触发 mouseup 事件，或规定当发生 mouseup 事件时运行的函数：

        
        $("#p1").mouseup(function(){
            alert("鼠标在段落上松开。");
        });


####1.2.4.8 hover()

hover()方法用于模拟光标悬停事件

- 当鼠标移动到元素上时，会触发指定的第一个函数(mouseenter)


- 当鼠标移出这个元素时，会触发指定的第二个函数(mouseleave)


        $("#p1").hover(
            function(){
                alert("你进入了 p1!");
            },
            function(){
                alert("拜拜! 现在你离开了 p1!");
            }
        );

####1.2.4.9 focus()

- 当元素获得焦点时，发生 focus 事件。

- 当通过鼠标点击选中元素或通过 tab 键定位到元素时，该元素就会获得焦点。

- focus() 方法触发 focus 事件，或规定当发生 focus 事件时运行的函数：

        $("input").focus(function(){
          $(this).css("background-color","#cccccc");
        });

####1.2.4.10 blur()

- 当元素失去焦点时，发生 blur 事件。

- blur() 方法触发 blur 事件，或规定当发生 blur 事件时运行的函数：

        $("input").blur(function(){
          $(this).css("background-color","#ffffff");
        });

##1.3 jQuery 名称冲突

- jQuery 使用 $ 符号作为 jQuery 的简洁方式

- 某些其他 JavaScript 库中的函数（比如 Prototype）同样使用 $ 符号。

- jQuery 使用名为 noConflict() 的方法来解决该问题。

        var jq=jQuery.noConflict()

帮助您使用自己的名称（比如 jq）来代替 $ 符号


----------
#第二章 jQuery 效果
----------
##2.1 隐藏和显示
###2.1.1 hide() 和 show()



- 使用 hide() 和 show() 方法来隐藏和显示 HTML 元素：

        $("#hide").click(function(){
          $("p").hide();
        });
    
        $("#show").click(function(){
          $("p").show();
        });



- 可选的 speed 参数规定隐藏/显示的速度，可以取以下值："slow"、"fast" 或毫秒



- 可选的 callback 参数是隐藏或显示完成后所执行的函数名称

        $(selector).hide(speed,callback);
        
        $(selector).show(speed,callback);




- 带有 speed 参数的 hide() 方法：

        $("button").click(function(){
          $("p").hide(1000);
        });

###2.1.2 toggle()


- 使用 toggle() 方法来切换 hide() 和 show() 方法

        $("button").click(function(){
          $("p").toggle();
        });

- 可选的 speed 参数规定隐藏/显示的速度，可以取以下值："slow"、"fast" 或毫秒

- 可选的 callback 参数是 toggle() 方法完成后所执行的函数名称

        $(selector).toggle(speed,callback);

##2.2 淡入淡出
jQuery 拥有下面四种 fade 方法：

1. fadeIn()

1. fadeOut()

1. fadeToggle()

1. fadeTo()
###2.2.1 fadeIn() 方法


- jQuery fadeIn() 用于淡入已隐藏的元素

        $(selector).fadeIn(speed,callback);



1. 可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。



1. 可选的 callback 参数是 fading 完成后所执行的函数名称。

        $("button").click(function(){
          $("#div1").fadeIn();
          $("#div2").fadeIn("slow");
          $("#div3").fadeIn(3000);
        });

###2.2.2 fadeOut() 方法


- jQuery fadeOut() 方法用于淡出可见元素。
    
        $(selector).fadeOut(speed,callback);

###2.2.3 jQuery fadeToggle() 方法


- jQuery fadeToggle() 方法可以在 fadeIn() 与 fadeOut() 方法之间进行切换。



- 如果元素已淡出，则 fadeToggle() 会向元素添加淡入效果。



- 如果元素已淡入，则 fadeToggle() 会向元素添加淡出效果。
    
        $(selector).fadeToggle(speed,callback);

###2.2.4 fadeTo() 方法


- jQuery fadeTo() 方法允许渐变为给定的不透明度（值介于 0 与 1 之间）
        
        $(selector).fadeTo(speed,opacity,callback);


- 必需的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒



- fadeTo() 方法中必需的 opacity 参数将淡入淡出效果设置为给定的不透明度（值介于 0 与 1 之间）

##2.3 滑动

jQuery 拥有以下滑动方法：

1. slideDown()


1. slideUp()


1. slideToggle()

###2.3.1 slideDown() 方法


- jQuery slideDown() 方法用于向下滑动元素。
        
        $(selector).slideDown(speed,callback);

###2.3.2 slideUp() 方法


- jQuery slideUp() 方法用于向上滑动元素。
    
        $(selector).slideUp(speed,callback);

###2.3.3  slideToggle() 方法


- jQuery slideToggle() 方法可以在 slideDown() 与 slideUp() 方法之间进行切换。



- 如果元素向下滑动，则 slideToggle() 可向上滑动它们。



- 如果元素向上滑动，则 slideToggle() 可向下滑动它们

        $(selector).slideToggle(speed,callback);

##2.4 动画
###2.4.1 animate() 方法


1. jQuery animate() 方法用于创建自定义动画。

        
        $(selector).animate({params},speed,callback);


1. 必需的 params 参数定义形成动画的 CSS 属性。



1. 可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。



1. 可选的 callback 参数是动画完成后所执行的函数名称。



1. 下面的例子演示 animate() 方法的简单应用。它把 `<div>` 元素往右边移动了 250 像素：

        $("button").click(function(){
          $("div").animate({left:'250px'});
        });

###2.4.2 操作多个属性


- 生成动画的过程中可同时使用多个属性：


        $("button").click(function(){
          $("div").animate({
            left:'250px',
            opacity:'0.5',
            height:'150px',
            width:'150px'
          });
        });

###2.4.3 使用相对值


- 定义相对值（该值相对于元素的当前值）,需要在值的前面加上 += 或 -=：


        $("button").click(function(){
          $("div").animate({
            left:'250px',
            height:'+=150px',
            width:'+=150px'
          });
        });

###2.4.4 jQuery animate() - 使用预定义的值

- 您甚至可以把属性的动画值设置为 "show"、"hide" 或 "toggle"：
      
        $("button").click(function(){
          $("div").animate({
            height:'toggle'
          });
        });

###2.4.5 使用队列功能

- 默认地，jQuery 提供针对动画的队列功能。

- 编写多个 animate() 调用，jQuery 会创建包含这些方法调用的"内部"队列,然后逐一运行这些 animate 调用


        $("button").click(function(){
          var div=$("div");
          div.animate({height:'300px',opacity:'0.4'},"slow");
          div.animate({width:'300px',opacity:'0.8'},"slow");
          div.animate({height:'100px',opacity:'0.4'},"slow");
          div.animate({width:'100px',opacity:'0.8'},"slow");
        });

###2.4.6 停止动画

1. jQuery stop() 滑动


1. jQuery stop() 动画(带参数)

        $(selector).stop(stopAll,goToEnd);



- 可选的 stopAll 参数规定是否应该清除动画队列。默认是 false，即仅停止活动的动画，允许任何排入队列的动画向后执行。



- 可选的 goToEnd 参数规定是否立即完成当前动画。默认是 false。



- 默认stop() 会清除在被选元素上指定的当前动画

##2.5 Callback 方法
###2.5.1 jQuery 动画的问题


- 许多 jQuery 函数涉及动画。这些函数也许会将 speed 或 duration 作为可选参数

        $("p").hide("slow")

- speed 或 duration 参数可以设置许多不同的值，比如 "slow", "fast", "normal" 或毫秒

###2.5.2 jQuery Callback 函数


1. 当动画 100% 完成后，即调用 Callback 函数

        $(selector).hide(speed,callback)



1. callback 参数是一个在 hide 操作完成后被执行的函数



1. 错误（没有 callback）
2. 
        $("p").hide(1000);
        alert("The paragraph is now hidden");

##2.6 链(Chaining)


- 通过 jQuery，可以把动作/方法链接在一起。


- Chaining 允许我们在一条语句中运行多个 jQuery 方法（在相同的元素上）

- 因为每次操作结束的返回值是本类，因此可以链式操作

        $("#p1").css("color","red").slideUp(2000).slideDown(2000);


----------
#第三章 DOM操作
----------
##3.1 jQuery DOM 操作

- jQuery 中非常重要的部分，就是操作 DOM 的能力。

- jQuery 提供一系列与 DOM 相关的方法，这使访问和操作元素和属性变得很容易。


- DOM = Document Object Model（文档对象模型）


- DOM 定义访问 HTML 和 XML 文档的标准：

##3.2 获得内容
三个简单实用的用于 DOM 操作的 jQuery 方法：

1. text() - 设置或返回所选元素的文本内容


1. html() - 设置或返回所选元素的内容（包括 HTML 标记）


1. val() - 设置或返回表单字段的值

##3.3 获取属性 - attr()
jQuery attr() 方法用于获取属性值

##3.4  添加元素
我们将学习用于添加新内容的四个 jQuery 方法：

1. append() - 在被选元素的结尾插入内容

1. prepend() - 在被选元素的开头插入内容

1. after() - 在被选元素之后插入内容

1. before() - 在被选元素之前插入内容

##3.5 删除元素/内容

1. remove() - 删除被选元素（及其子元素）

1. empty() - 从被选元素中删除子元素

1. 过滤被删除的元素

        $("p").remove(".italic");

##3.6 获取并设置 CSS 类


1. addClass() - 向被选元素添加一个或多个类


1. removeClass() - 从被选元素删除一个或多个类


1. toggleClass() - 对被选元素进行添加/删除类的切换操作


1. css() - 设置或返回样式属性

##3.7 处理尺寸方法

1. width()


1. height()


1. innerWidth()


1. innerHeight()


1. outerWidth()


1. outerHeight()

----------
#第四章 遍历
----------
##4.1 什么是遍历


- jQuery 遍历，意为"移动"，用于根据其相对于其他元素的关系来"查找"（或选取）HTML 元素

- 以某项选择开始，并沿着这个选择移动，直到抵达您期望的元素为止。

- 通过 jQuery 遍历，您能够从被选（当前的）元素开始，轻松地在家族树中向上移动（祖先），向下移动（子孙），水平移动（同胞）

- 这种移动被称为对 DOM 进行遍历

##4.2 祖先


1. parent()


1. parents()


1. parentsUntil()

##4.3 后代


- children()


- find()

##4.4 同胞(siblings)


- siblings()


- next()


- nextAll()


- nextUntil()


- prev()


- prevAll()


- prevUntil()

##4.5 过滤



1. 三个最基本的过滤方法是：first(), last() 和 eq()，它们允许您基于其在一组元素中的位置来选择一个特定的元素。



1. 其他过滤方法，比如 filter() 和 not() 允许您选取匹配或不匹配某项指定标准的元素。