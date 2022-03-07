2021/10/11 18:42:18 
> H5 (HTML5 标准)学习记录
#第一章 HTML简介

##1.1 HTML概念
- 超文本标记语言（英语：HyperText Markup Language，简称：HTML）是一种用于创建网页的标准标记语言

- HTML 不是一种编程语言，而是一种标记语言 (markup language)

- 标记语言是一套标记标签 (markup tag)

- HTML 使用标记标签来描述网页

##1.2 HTML 标签
![](./src/1.jpg)

- HTML 标记标签通常被称为 HTML 标签 (HTML tag)。


- HTML 标签是由尖括号包围的关键词，比如 `<html>`


- HTML 标签通常是成对出现的，比如 `<b> `和 `</b>`


- 标签对中的第一个标签是开始标签，第二个标签是结束标签


- 开始和结束标签也被称为开放标签和闭合标签


- <!DOCTYPE html> 声明为 HTML5 文档


- `<html> `元素是 HTML 页面的根元素


- `<head>` 元素包含了文档的元（meta）数据，如 `<meta charset="utf-8">` 定义网页编码格式为 utf-8。


- `<title> `元素描述了文档的标题


- `<body> `元素包含了可见的页面内容


- `<h1> `元素定义一个大标题




- `<p>` 元素定义一个段落
##1.3 HTML 元素
"HTML 标签" 和 "HTML 元素" 通常都是描述同样的意思.

但是严格来讲, 一个 HTML 元素包含了开始标签与结束标签，如下实例:

##1.4HTML 文档 = 网页


- HTML 文档描述网页


- HTML 文档包含 HTML 标签和纯文本


- HTML 文档也被称为网页


- Web 浏览器的作用是读取 HTML 文档，并以网页的形式显示出它们。浏览器不会显示 HTML 标签，而是使用标签来解释页面的内容：

##1.5 HTML 示例
示例解释：


- `<html> `与 `</html> `之间的文本描述网页

- `<body>`与 `</body> `之间的文本是可见的页面内容


- `<h1>` 与 `</h1>` 之间的文本被显示为标题


- `<p>` 与 `</p>` 之间的文本被显示为段落

 `示例：`

    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8">
    <title>第一个html</title>
    </head>
    <body>
        <h1>我的第一个标题</h1>
        <p>我的第一个段落。</p>
    </body>
    </html>

注意：

1. 对于中文网页需要使用 `<meta charset="utf-8">` 声明编码，否则会出现乱码


1. 有些浏览器(如 360 浏览器)会设置 GBK 为默认编码，则你需要设置为 `<meta charset="gbk">`

##1.6 Web 浏览器


1. Web浏览器（如谷歌浏览器，Internet Explorer，Firefox，Safari）是用于读取HTML文件，并将其作为网页显示。



1. 浏览器并不是直接显示的HTML标签，但可以使用标签来决定如何展现HTML页面的内容给用户：

##1.7 HTML版本
从初期的网络诞生后，已经出现了**许多**HTML版本:

|----|----|
|版本|发布时间|
|HTML|	1991|
|HTML+|	1993|
|HTML 2.0|	1995|
|HTML 3.2|	1997|
|HTML 4.01|	1999|
|XHTML 1.0|	2000|
|**HTML5**|**2012**|
|XHTML5|	2013|
##1.8 <!DOCTYPE> 声明
<!DOCTYPE>声明有助于浏览器中正确显示网页。

网络上有很多不同的文件，如果能够正确声明HTML的版本，浏览器就能正确显示网页内容。

doctype 声明是不区分大小写的，以下方式均可：

<!DOCTYPE html>

<!DOCTYPE HTML>

<!doctype html>

<!Doctype Html>

注解：

1. doctype 声明是不区分大小写的，用来告知 Web 浏览器页面使用了哪种 HTML 版本。

1. 在HTML 4.01 中，<!DOCTYPE> 声明需引用 DTD （文档类型声明），因为 HTML 4.01 是基于 SGML（Standard Generalized Markup Language 标准通用标记语言）。

1. HTML 4.01 规定了三种不同的 <!DOCTYPE> 声明，分别是：Strict、Transitional 和 Frameset。

1. HTML5 不是基于 SGML，因此不要求引用 DTD。

1. 对于中文网页需要使用 <meta charset="utf-8"> 声明编码，否则会出现乱码。有些浏览器(如 360 浏览器)会设置 GBK 为默认编码，则你需要设置为 <meta charset="gbk">。

1. 目前在大部分浏览器中，直接输出中文会出现中文乱码的情况，这时候需要在头部将字符声明为 UTF-8。

----------

#第二章 HTML基础

----------

##2.1 HTML 编辑器推荐
可以使用专业的 HTML 编辑器来编辑 HTML，菜鸟教程为大家推荐几款常用的编辑器：

1. VS Code：https://code.visualstudio.com/


1. VS Code 插件信息同步：<br>***Sync: 上传完成。Gist ID:eecc42ccdd5b41c0faf438bd067df25a。请复制这个 ID 并将其用于其他设备来下载配置。***

1. Sublime Text：http://www.sublimetext.com/

    可以从以上软件的官网中下载对应的软件，按步骤安装即可。

1. Linux 用户可以选择几种不同的文本编辑器，如 vi、vim 或者 emacs ；

1. Mac 用户可以使用 OS X 预装的 TextEdit。

##2.2 HTML 标题

###2.2.1 定义：

网上的定义很多，也称为Heading标签，是网页中对特定文字进行着重强调的一种代码标签。


###2.2.2 分类与属性：

依次分为h1，h2，h3，h4，h5，h6，h7作为标题标签等

标准属性：


id, class, title, style, dir, lang, xml:lang


###2.2.3 区别：

**从H1到H7依次按重要序、文字大小程递减排列。**

**HTML 标题（Heading）是通过`<h1> - <h6>` 标签来定义的。**

###2.2.4 使用规范



1. 每个页面只能使用一个H1标签，如果使用多个H1标签，搜索引擎会认为是作弊。



1. H1标签最好用在H2-H7标签前面。



1. H1使用的关键词，最好是页面主机的关键词或品牌相关词，一般以标题为主。



1. 如果首页要使用H1标签的话，最好用在网站名称上。



1. 文章页面一般的H1标签都使用在文章标题上。



1. 一般都要放在body内容里面的。搜索引擎一般是从上而下抓取的，这样也是方便搜索引擎最快视别重要的内容。



1. H2标签一般用于段落标题，或者是副标题，主要是用来部署长尾关键词的。



1. H3标签跟Strong差不多，一般用在段落小节里面，表示文章内容的小节标题。



1. h4-h7标签基本很少用到，一般是用来表示不太重要的内容，

###2.2.5  默认比例
- 浏览器默认为body:100%=16px;


- 浏览器计算得出


- p=16px； 默认


- h1=32px； 2倍


- h2=24px； 1.5倍


- h3=18.72px； 1.17倍


- h4=16px； 1倍


- h5=13.28px ； 0.83倍


- h6=12px； 0.75倍

###2.2.6  默认样式默认使用百分比的原因
> 链接：https://www.zhihu.com/question/20350041/answer/15564935



1. 浏览器在给 h 标题元素设定默认样式时，使用的是 h1 {font-size: 200%;} h2 {font-size: 150%;} 等等这样的规则来设定字体大小。


1. 浏览器通过这些样式来确保各级标题文本可以与普通文本呈现字体大小的固定比例关系。那么浏览器为什么要通过百分比来固定这个比例，而不是用固定的 px 值来确定相对的比例关系呢（比如这样：h1 {font-size: 32px;} h2 {font-size: 24px;} p {font-size: 16px;} 等等


1. 一方面，百分比显然更适合用来设置比例，另一方面，是因为几乎所有浏览器通常都提供了文本缩放功能（注意：非整页缩放），这是浏览器对网页可访问性提供的最基础的支持。


1. 而浏览器（尤其是 IE）的文本缩放功能在原理上，通常是通过重设 body 元素的字体大小来实现的——当 body 的字体大小变化时，其后代元素通过 CSS 的层层继承和百分比的换算来呈现字体大小的比例关系。


1. 所以，浏览器自身的默认样式中是不会使用 px 这样的绝对单位的，否则文本缩放特性无法实现。（我们一定都有过这样的经验，一旦某个元素的字体大小使用了固定的 px 值，它就再也不受 IE 缩放设置的影响了）

###2.2.7 HTML 水平线

1. ` <hr />` 标签在 HTML 页面中创建水平线。

1. hr 元素可用于分隔内容。

###2.2.8 `<br> `还是 `<br />`


1. ` <br>` 与 `<br />` 很相似。



1. 在 XHTML、XML 以及未来的 HTML 版本中，不允许使用没有结束标签（闭合标签）的 HTML 元素。



1. 即使 `<br>` 在所有浏览器中的显示都没有问题，使用 `<br />` 也是更长远的保障。


##2.3 HTML 段落

1. HTML 段落是通过标签 `<p> `来定义的

1. 浏览器会自动地在段落的前后添加空行（`<p> `是块级元素）

##2.4 HTML 超链接（链接）

###2.4.1  链接的介绍
- 超链接可以是一个字，一个词，或者一组词，也可以是一幅图像，您可以点击这些内容来跳转到新的文档或者当前文档中的某个部分。

- 当您把鼠标指针移动到网页中的某个链接上时，箭头会变为一只小手。


- 我们通过使用 `<a> `标签在 HTML 中创建链接。

###2.4.2 连接的使用

- 有两种使用 `<a>` 标签的方式：


- 通过使用 href 属性 - 创建指向另一个文档的链接


- 通过使用 name 属性 - 创建文档内的书签

###2.4.3 HTML 链接 - target 属性


1. 使用 Target 属性，你可以定义被链接的文档在何处显示。

###2.4.4 HTML命名锚


1. name 属性规定锚（anchor）的名称。



1. 您可以使用 name 属性创建 HTML 页面中的书签。



1. 书签不会以任何特殊方式显示，它对读者是不可见的。



1. 当使用命名锚（named anchors）时，我们可以创建直接跳至该命名锚（比如页面中某个小节）的链接，这样使用者就无需不停地滚动页面来寻找他们需要的信息了。

####2.4.4.1 命名锚的语法：
    <a name="label">锚（显示在页面上的文本）</a>

提示：您可以使用 id 属性来替代 name 属性，命名锚同样有效。

####2.4.4.2 实例
首先，我们在 HTML 文档中对锚进行命名（创建一个书签）：

    <a name="tips">基本的注意事项 - 有用的提示</a>

然后，我们在同一个文档中创建指向该锚的链接：

    <a href="#tips">有用的提示</a>
您也可以在其他页面中创建指向该锚的链接：

    <a href="http://www.w3school.com.cn/html/html_links.asp#tips">有用的提示</a>

在上面的代码中，我们将 # 符号和锚名称添加到 URL 的末端，就可以直接链接到 tips 这个命名锚了。


##2.5 HTML 图像

        HTML 图像是通过 <img>标签进行定义的

###2.5.1 HTML 图像- 图像标签（ <img>）和源属性（Src）


- 在 HTML 中，图像由<img> 标签定义。



- `<img> `是空标签，意思是说，它只包含属性，并且没有闭合标签。



- 要在页面上显示图像，你需要使用源属性（src）。src 指 "source"。源属性的值是图像的 URL 地址。



- 定义图像的语法是：

    `<img src="url" alt="some_text">`


- 浏览器将图像显示在文档中图像标签出现的地方。

- 如果你将图像标签置于两个段落之间，那么浏览器会首先显示第一个段落，然后显示图片，最后显示第二段。

###2.5.2 HTML 图像- Alt属性


- alt 属性用来为图像定义一串预备的可替换的文本。



- 替换文本属性的值是用户定义的。

    `<img src="boat.gif" alt="Big Boat">`

- 在浏览器无法载入图像时，替换文本属性告诉读者她们失去的信息。此时，浏览器将显示这个替代性的文本而不是图像

- 为页面上的图像都加上替换文本属性是个好习惯，这样有助于更好的显示信息，并且对于那些使用纯文本浏览器的人来说是非常有用的
###2.5.3 创建图像映射


1. 搭配使用usemap属性和map标签，且img 元素中的 "usemap" 属性引用 map 元素中的 "id" 或 "name" 属性（根据浏览器不同
2. 所以一般同时向 map 元素添加了 "id" 和 "name" 属性

`例子：`

    <img
    src="/i/eg_planets.jpg"
    border="0" usemap="#planetmap"
    alt="Planets" />
    
    <map name="planetmap" id="planetmap">
    
    <area
    shape="circle"
    coords="180,139,14"
    href ="/example/html/venus.html"
    target ="_blank"
    alt="Venus" />
    
    <area
    shape="circle"
    coords="129,161,10"
    href ="/example/html/mercur.html"
    target ="_blank"
    alt="Mercury" />
    
    <area
    shape="rect"
    coords="0,0,110,260"
    href ="/example/html/sun.html"
    target ="_blank"
    alt="Sun" />
    
    </map>

##2.6 链接的有用的提示

1. 请始终将正斜杠添加到子文件夹。假如这样书写链接：href="http://www.w3school.com.cn/html"，就会向服务器产生两次 HTTP 请求。这是因为服务器会添加正斜杠到这个地址，然后创建一个新的请求，就像这样：href="http://www.w3school.com.cn/html/"。

1. 命名锚经常用于在大型文档开始位置上创建目录。可以为每个章节赋予一个命名锚，然后把链接到这些锚的链接放到文档的上部。如果您经常访问百度百科，您会发现其中几乎每个词条都采用这样的导航方式。

1. 假如浏览器找不到已定义的命名锚，那么就会定位到文档的顶端。不会有错误发生。

----------

# 第三章 HTML属性

----------


1. HTML 标签可以拥有属性。属性提供了有关 HTML 元素的更多的信息。

1. 属性总是以名称/值对的形式出现，比如：name="value"。

1. 属性总是在 HTML 元素的开始标签中规定。

##3.1 HTML 属性格式规范
###3.1.1 属性和属性值对大小写不敏感。



- 万维网联盟在其 HTML 4 推荐标准中推荐小写的属性/属性值



- 而新版本的 (X)HTML 要求使用小写属性。

###3.1.2 始终为属性值加引号


- 属性值应该始终被包括在引号内。双引号是最常用的，不过使用单引号也没有问题。



- 在某些个别的情况下，比如属性值本身就含有双引号，那么您必须使用单引号，例如：`name='Bill "HelloWorld" `Gates'

##3.2 HTML 属性参考  
下面列出了适用于大多数 HTML 元素的属性：


|----|----|----|
|属性|值|描述|
|class|classname|	规定元素的类名（classname）|
|id|	id|	规定元素的唯一 id|
|style|	style_definition|	规定元素的行内样式（inline style）|
|title	|text	|规定元素的额外信息（可在工具提示中显示）|

##3.3  更多 HTML 属性实例

`属性例子 1:`

    <h1> 定义标题的开始
    
    <h1 align="center"> 拥有关于对齐方式的附加信息

`属性例子 2:`

    <body> 定义 HTML 文档的主体
    
    <body bgcolor="yellow"> 拥有关于背景颜色的附加信息

`属性例子 3:`

    <table> 定义 HTML 表格（将在稍后的章节学习到更多有关 HTML 表格的内容）
    
    <table border="1"> 拥有关于表格边框的附加信息


----------
#第四章 HTML格式化
----------
##4.1 HTML 文本格式化标签
|----|----|
|标签|	描述|
|`<b>`|	定义粗体文本|
|`<em>`|	定义着重文字|
|`<i>`	|定义斜体字|
|`<small>`|	定义小号字|
|`<strong>`|	定义加重语气|
|`<sub>`|	定义下标字|
|`<sup>`|	定义上标字|
|`<ins>`|	定义插入字|
|`<del>`|	定义删除字|
##4.2 HTML "计算机输出" 标签

|----|----|
|标签|描述|
|`<code>`|	定义计算机代码
|`<kbd>`|	定义键盘码
|`<samp>`|	定义计算机代码样本
|`<var>`|	定义变量
|`<pre>`|	定义预格式文本
##4.3 HTML 引文, 引用, 及标签定义

|----|----|
|标签|	描述|
|`<abbr>`|	定义缩写
|`<address>`|	定义地址
|`<bdo>`|	定义文字方向
|`<blockquote>`|	定义长的引用
|`<q>`|	定义短的引用语
|`<cite>`|	定义引用、引证
|`<dfn>`|	定义一个定义项目

----------
2021/10/12 9:17:29 
#第五章  HTML表格
----------
#5.1 表格的定义

1. 表格由 `<table> `标签来定义。


1. 每个表格均有若干行（由 `<tr> `标签定义），每行被分割为若干单元格（由 `<td> `标签定义）。


1. 字母 td 指表格数据（table data），即数据单元格的内容。

##5.2 表格和边框属性


1. 如果不定义边框属性，表格将不显示边框。有时这很有用，但是大多数时候，我们希望显示边框。



1. 使用边框属性来显示一个带有边框的表格：

        <table border="1">
        <tr>
        <td>Row 1, cell 1</td>
        <td>Row 1, cell 2</td>
        </tr>
        </table>

##5.3 表格的表头

1. 表格的表头使用 `<th>` 标签进行定义

1. 大多数浏览器会把表头显示为粗体居中的文本

##5.4 表格中的空单元格

1. 在一些浏览器中，没有内容的表格单元显示得不太好。

1. 如果某个单元格是空的（没有内容），浏览器可能无法显示出这个单元格的边框。

##5.5 属性

    <tbody>

    <tfoot>

单元格边距(Cell padding)

单元格间距(Cell spacing)

colspan  行扩展

rowspan 列扩展

----------

#第六章 HTML表单

----------
##6.1 `<form>` 元素


- 表单是一个包含表单元素的区域。



- 表单元素是允许用户在表单中输入内容：

比如：文本域(textarea)、下拉列表、单选框(radio-buttons)、复选框(checkboxes)等等。

- 表单使用表单标签 <form> 来设置:

##6.2  HTML 表单标签
|----|----|
|`<form>`|	定义供用户输入的表单
|`<input>`|	定义输入域
|`<textarea>`|	定义文本域 (一个多行的输入控件)
|`<label>`|	定义了 `<input> `元素的标签，一般为输入标题
|`<fieldset>`|	定义了一组相关的表单元素，并使用外框包含起来
|`<legend>`|	定义了 `<fieldset> `元素的标题
|`<select>`|	定义了下拉选项列表
|`<optgroup>`|	定义选项组
|`<option>`|	定义下拉列表中的选项
|`<button>`|	定义一个点击按钮
|`<datalist>`|	指定一个预先定义的输入控件选项列表
|`<keygen>`|	定义了表单的密钥对生成器字段
|`<output>`|	定义一个计算结果|

##6.3  输入元素（`<input>`）
###6.3.1 文本域（Text Fields）
   文本域通过`<input type="text">` 标签来设定，当用户要在表单中键入字母、数字等内容时，就会用到文本域
###6.3.2  密码字段
密码字段通过标签`<input type="password"> `来定义
###6.3.3 单选按钮（Radio Buttons）
`<input type="radio"> `标签定义了表单单选框选项
###6.3.4  复选框（Checkboxes）
`<input type="checkbox">` 定义了复选框. 用户需要从若干给定的选择中选取一个或若干选项。

        <form>
        <input type="checkbox" name="vehicle" value="Bike">I have a bike<br>
        <input type="checkbox" name="vehicle" value="Car">I have a car
        </form>
###6.3.5 提交按钮(Submit Button)

`<input type="submit"> `定义了提交按钮.

当用户单击确认按钮时，表单的内容会被传送到另一个文件。表单的动作属性定义了目的文件的文件名

由动作属性定义的这个文件通常会对接收到的输入数据进行相关的处理

###6.4 属性 
####6.4.1 Action 属性
如果省略 action 属性，则将 action 设置为当前页面。
####6.4.2 Target 属性
 target 属性规定提交表单后在何处显示响应：

|----|----|
|_blank|	响应显示在新窗口或选项卡中。
|_self|	响应显示在当前窗口中。

####6.4.3 Method 属性

1. 表单数据可以作为 URL 变量（使用 method="get"）或作为 HTTP post 事务（使用 method="post"）发送

1. 提交表单数据时，默认的 HTTP 方法是 GET



1. 关于 GET 的注意事项：

    以名称/值对的形式将表单数据追加到 URL
    永远不要使用 GET 发送敏感数据！（提交的表单数据在 URL 中可见！）
    URL 的长度受到限制（2048 个字符）
    对于用户希望将结果添加为书签的表单提交很有用
    GET 适用于非安全数据，例如 Google 中的查询字符串


1. 关于 POST 的注意事项：

    将表单数据附加在 HTTP 请求的正文中（不在 URL 中显示提交的表单数据）
    POST 没有大小限制，可用于发送大量数据。
    带有 POST 的表单提交无法添加书签
    提示：如果表单数据包含敏感信息或个人信息，请务必使用 POST！

####6.3.4   Autocomplete 属性

1. autocomplete 属性规定表单是否应打开自动完成功能。

1. 启用自动完成功能后，浏览器会根据用户之前输入的值自动填写值。

1. 保存的自动填写值，删除应清除浏览器设置中的**自动填充表单数据**

####6.3.5 Novalidate 属性

1. novalidate 属性是一个布尔属性。

1. 如果已设置，它规定提交时不应验证表单数据。


####6.3.6 enctype 属性

enctype 属性规定在发送到服务器之前应该如何对表单数据进行编码。

默认地，表单数据会编码为 "application/x-www-form-urlencoded"。就是说，在发送到服务器之前，所有字符都会进行编码（空格转换为 "+" 加号，特殊符号转换为 ASCII HEX 值）

|----|----|
|application/x-www-form-urlencoded|	在发送前编码所有字符（默认）|
|multipart/form-data|	 不对字符编码，在使用包含文件上传控件的表单时，必须使用该值|
|text/plain|	空格转换为 "+" 加号，但不对特殊字符编码|

##6.4 input类型与属性
|----|----|----|
|属性|值|描述
|accept|	mime_type	|规定通过文件上传来提交的文件的类型|
|checked|	checked	|规定此 input 元素首次加载时应当被选中|
|pattern	regexp_pattern	|规定输入字段的值的模式或格式|例如 pattern="[0-9]" 表示输入值必须是 0 与 9 之间的数字|
|readonly|	readonly|	规定输入字段为只读|
|type|button checkbox file hidden image password radio reset submit text|规定 input 元素的类型|


----------
#第七章  HTML响应式文本设计(RWD)
----------
2021/10/17 21:21:26 
#7.1 什么是响应式 Web 设计？


- RWD 指的是响应式 Web 设计（Responsive Web Design）


- RWD 能够以可变尺寸传递网页


- RWD 对于平板和移动设备是必需的

#7.2 创建RWD
##7.2.1 纯个人创建


1. 使用类选择器对某一部分设计绝对大小以完成自适应

`例子：`

    <!DOCTYPE html>
    <html lang="en-US">
    <head>
    <style>
    .city {
    float: left;
    margin: 5px;
    padding: 15px;
    width: 300px;
    height: 300px;
    border: 1px solid black;
    } 
    </style>
    </head>
    
    <body>
    
    <h1>W3School Demo</h1>
    <h2>Resize this responsive page!</h2>
    <br>
    
    <div class="city">
    <h2>London</h2>
    <p>London is the capital city of England.</p>
    <p>It is the most populous city in the United Kingdom,
    with a metropolitan area of over 13 million inhabitants.</p>
    </div>
    
    <div class="city">
    <h2>Paris</h2>
    <p>Paris is the capital and most populous city of France.</p>
    </div>
    
    <div class="city">
    <h2>Tokyo</h2>
    <p>Tokyo is the capital of Japan, the center of the Greater Tokyo Area,
    and the most populous metropolitan area in the world.</p>
    </div>
    
    </body>
    </html>
###7.2.2 使用Bootstrap


- 另一个创建响应式设计的方法，是使用现成的 CSS 框架。



- Bootstrap 是最流行的开发响应式 web 的 HTML, CSS, 和 JS 框架。



- Bootstrap 帮助您开发在任何尺寸都外观出众的站点：显示器、笔记本电脑、平板电脑或手机

 `例子：`

    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" 
      href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    </head>
    
    <body>
    
    <div class="container">
    <div class="jumbotron">
      <h1>W3School Demo</h1> 
      <p>Resize this responsive page!</p> 
    </div>
    </div>
    
    <div class="container">
    <div class="row">
      <div class="col-md-4">
        <h2>London</h2>
        <p>London is the capital city of England.</p>
        <p>It is the most populous city in the United Kingdom,
        with a metropolitan area of over 13 million inhabitants.</p>
      </div>
      <div class="col-md-4">
        <h2>Paris</h2>
        <p>Paris is the capital and most populous city of France.</p>
      </div>
      <div class="col-md-4">
        <h2>Tokyo</h2>
        <p>Tokyo is the capital of Japan, the center of the Greater Tokyo Area,
        and the most populous metropolitan area in the world.</p>
      </div>
    </div>
    </div>
    
    </body>
    </html>


----------
#第八章 HTML图形
----------
##8.1 画布(Canvas)
###8.1.1 什么是 Canvas？


- HTML5 的 canvas 元素使用 JavaScript 在网页上绘制图像



- 画布是一个矩形区域，您可以控制其每一像素



- canvas 拥有多种绘制路径、矩形、圆形、字符以及添加图像的方法

###8.1.2 创建 Canvas 元素


####8.1.2.1 向 HTML5 页面添加 canvas 元素

- 规定元素的 id、宽度和高度：`<canvas id="myCanvas" width="200" height="100"></canvas>`

####8.1.2.2 通过 JavaScript 来绘制


1. canvas 元素本身是没有绘图能力的。所有的绘制工作必须在 JavaScript 内部完成：
        
        <script type="text/javascript">
        var c=document.getElementById("myCanvas");
        var cxt=c.getContext("2d");
        cxt.fillStyle="#FF0000";
        cxt.fillRect(0,0,150,75);
        </script>



1. JavaScript 使用 id 来寻找 canvas 元素：

        var c=document.getElementById("myCanvas");


1. 然后，创建 context 对象(对象是内建的 HTML5 对象，拥有多种绘制路径、矩形、圆形、字符以及添加图像的方法):

        var cxt=c.getContext("2d"); 
        getContext("2d") 


1. 下面的两行代码绘制一个红色的矩形,fillStyle 方法将其染成红色，fillRect 方法规定了形状、位置和尺寸:

        cxt.fillStyle="#FF0000";
        cxt.fillRect(0,0,150,75); 

####8.1.2.3 更多 Canvas 实例
1. 实例 - 线条

        JavaScript 代码：
        
        <script type="text/javascript">
        var c=document.getElementById("myCanvas");
        var cxt=c.getContext("2d");
        cxt.moveTo(10,10);
        cxt.lineTo(150,50);
        cxt.lineTo(10,50);
        cxt.stroke();
        </script>

        canvas 元素：
        
        <canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;">
        Your browser does not support the canvas element.
        </canvas>

1. 实例 - 圆形

        JavaScript 代码：

        <script type="text/javascript">
        var c=document.getElementById("myCanvas");
        var cxt=c.getContext("2d");
        cxt.fillStyle="#FF0000";
        cxt.beginPath();
        cxt.arc(70,18,15,0,Math.PI*2,true);
        cxt.closePath();
        cxt.fill();
        </script>

        canvas 元素：
        
        <canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;">
        Your browser does not support the canvas element.
        </canvas>

1. 实例 - 渐变

        JavaScript 代码：
        
        <script type="text/javascript">
        var c=document.getElementById("myCanvas");
        var cxt=c.getContext("2d");
        var grd=cxt.createLinearGradient(0,0,175,50);
        grd.addColorStop(0,"#FF0000");
        grd.addColorStop(1,"#00FF00");
        cxt.fillStyle=grd;
        cxt.fillRect(0,0,175,50);
        </script>

        canvas 元素：
        
        <canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;">
        Your browser does not support the canvas element.
        </canvas>

1. 实例 - 图像

        JavaScript 代码：
        
        <script>
        window.onload = function() {
            var canvas = document.getElementById("myCanvas");
            var ctx = canvas.getContext("2d");
            var img = document.getElementById("scream");
           ctx.drawImage(img, 10, 10);
        };
        </script>

        canvas 元素：
        
        <canvas id="myCanvas" width="244" height="182" style="border:1px solid #d3d3d3;">
        Your browser does not support the HTML5 canvas tag.
        </canvas>

##8.2 内联 SVG
###8.2.1 什么是SVG？


- SVG 指可伸缩矢量图形 (Scalable Vector Graphics)


- SVG 用于定义用于网络的基于矢量的图形


- SVG 使用 XML 格式定义图形


- SVG 图像在放大或改变尺寸的情况下其图形质量不会有损失


- SVG 是万维网联盟的标准

###8.2.2 SVG 的优势

与其他图像格式相比（比如 JPEG 和 GIF），使用 SVG 的优势在于：



1. SVG 图像可通过文本编辑器来创建和修改


1. SVG 图像可被搜索、索引、脚本化或压缩


1. SVG 是可伸缩的


1. SVG 图像可在任何的分辨率下被高质量地打印


1. SVG 可在图像质量不下降的情况下被放大

###8.2.3 实例(有待学习)
把 SVG 直接嵌入 HTML 页面：

        <!DOCTYPE html>
        <html>
        <body>
        
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="190">
          <polygon points="100,10 40,180 190,60 10,60 160,180"
          style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" />
        </svg>
        
        </body>
        </html>

##8.3 Canvas 与 SVG 的比较
###8.3.1 Canvas


- 依赖分辨率


- 不支持事件处理器


- 弱的文本渲染能力


- 能够以 .png 或 .jpg 格式保存结果图像


- 最适合图像密集型的游戏，其中的许多对象会被频繁重绘

###8.3.2 SVG


- 不依赖分辨率


- 支持事件处理器


- 最适合带有大型渲染区域的应用程序（比如谷歌地图）


- 复杂度高会减慢渲染速度（任何过度使用 DOM 的应用都不快）


- 不适合游戏应用

#第九章 HTML媒体
##9.1 HTML对象
###9.1.1 <object> 元素

- 所有浏览器均支持 <object> 元素

- `<object> `元素定义 HTML 文档中的嵌入式对象

- 它旨在将插件（例如 Java applet、PDF 阅读器和 Flash 播放器）嵌入网页中，但也可以用于将 HTML 包含在 HTML 中

- 实例：`<object width="100%" height="500px" data="snippet.html"></object>`

###9.1.2 `<embed>` 元素


1. 所有主要浏览器均支持 `<embed>` 元素,这是一个 HTML5 标签，在 HTML4 中是非法的，但是所有浏览器中都有效



1. `<embed>` 元素也可定义了 HTML 文档中的嵌入式对象。



1. Web 浏览器长期以来一直支持 `<embed> `元素。但是，它不属于 HTML5 之前的 HTML 规范的一部分。



1. `<embed> `元素没有结束标记。它无法包含替代文本。



1. 实例: `<embed src="audi.jpeg">`

##9.2 HTML 音频
###9.2.1 使用` <embed> `元素


1. `<embed> `标签定义外部（非 HTML）内容的容器



1. 下面的代码片段能够显示嵌入网页中的 MP3 文件：`<embed height="100" width="100" src="song.mp3" />`
2. 不同的浏览器对音频格式的支持也不同。

3. 如果浏览器不支持该文件格式，没有插件的话就无法播放该音频。

4. 如果用户的计算机未安装插件，无法播放音频。

5. 如果把该文件转换为其他格式，仍然无法在所有浏览器中播放。

###9.2.2 使用`<object>`元素


1. `<object tag>` 标签也可以定义外部（非 HTML）内容的容器。



1. 下面的代码片段能够显示嵌入网页中的 MP3 文件：`<object height="100" width="100" data="song.mp3"></object>`

###9.2.3 使用 HTML5 `<audio>` 元素


- `<audio>` 元素是一个 HTML5 元素，在 HTML 4 中是非法的，但在所有浏览器中都有效

        <audio controls="controls">
          <source src="song.mp3" type="audio/mp3" />
          <source src="song.ogg" type="audio/ogg" />
          Your browser does not support this audio format.
        </audio>

###9.2.4 最好的 HTML 解决方法
    <audio controls="controls" height="100" width="100">
      <source src="song.mp3" type="audio/mp3" />
      <source src="song.ogg" type="audio/ogg" />
    <embed height="100" width="100" src="song.mp3" />
    </audio>


1. 上面的例子使用了两个不同的音频格式。HTML5 `<audio>` 元素会尝试以 mp3 或 ogg 来播放音频


1. 如果失败，代码将回退尝试 `<embed>` 元素。

##9.3 视频
###9.3.1 使用 `<video>` 标签


1. <video> 是 HTML 5 中的新标签



1. <video> 标签的作用是在 HTML 页面中嵌入视频元素



1. 以下 HTML 片段会显示一段嵌入网页的 ogg、mp4 或 webm 格式的视频

        <video width="320" height="240" controls="controls">
          <source src="movie.mp4" type="video/mp4" />
          <source src="movie.ogg" type="video/ogg" />
          <source src="movie.webm" type="video/webm" />
           Your browser does not support the video tag.
        </video>
###9.3.2 最好的 HTML 解决方法
 

- HTML 5 + `<object> `+ `<embed>`

        <video width="320" height="240" controls="controls">
          <source src="movie.mp4" type="video/mp4" />
          <source src="movie.ogg" type="video/ogg" />
          <source src="movie.webm" type="video/webm" />
          <object data="movie.mp4" width="320" height="240">
            <embed src="movie.swf" width="320" height="240" />
          </object>
        </video>


