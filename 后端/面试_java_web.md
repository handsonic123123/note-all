##  一、  Java web部分

### 1、什么是Servlet

- Servlet是一种服务器端的Java应用程序，具有独立于平台和协议的特性，可以生成动态的Web页面。 它承担处理客户请求（Web浏览器或其他HTTP客户程序）与服务器响应（HTTP服务器上的数据库或应用程序）的工作。 
- Servlet是位于Web 服务器内部的服务器端的Java应用程序，与传统的从命令行启动的Java应用程序不同，Servlet由Web服务器进行加载，该Web服务器必须包含支持Servlet的Java虚拟机。

### 2、说一说Servlet的生命周期? 

- 构造方法
- init(ServletConfig)
  - 要么在第一次访问的时候创建
  - 要么随着tomcat的运行而创建
  - 只初始化一次
- service(ServletRequest,ServletResponse)
  - 每次请求都会执行
- destory()
  - 在tomcat关闭时才执行

### 3、Servlet的基本架构 

- Servlet的框架是由两个Java包组成:javax.servlet和javax.servlet.http。 在javax.servlet包中定义了所有的Servlet类都必须实现或扩展的的通用接口和类，在javax.servlet.http包中定义了支持HTTP[通信协议](http://baike.so.com/doc/1420003.html)的HttpServlet类。
- Servlet的框架的核心是javax.servlet.Servlet接口，所有的Servlet都必须实现这一接口。在[Servlet接口](http://baike.so.com/doc/5500918.html)中定义了5个方法,其中有3个方法代表了Servlet的生命周期： 
  - init方法,负责初始化Servlet对象
  - service方法,负责相应客户的请求
  - destory方法,当Servlet对象退出生命周期时,负责释放占有的资源 
- Servlet被设计成请求驱动（根据请求来调用Servlet）。Servlet的请求可能包含多个数据项,当Web容器接收到某个Servlet请求时,Servlet把请求封装成一个HttpServletRequest对象,然后把对象传给Servlet的对应的服务方法.
- HTTP的请求方式包括DELETE,GET,OPTIONS,POST,PUT和TRACE,在HttpServlet类中分别提供了相应的服务方法,它们是doDelete(),doGet(),doOptions(),doPost(), doPut()和doTrace().不过目前很多服务器只支持get和post请求，所以通常自定义的Servlet中只需要重写doPost和doGet方法即可。

### 4、服务器如何响应Web客户请求？

　　HttpServlet容器响应Web客户请求流程如下： 
 　　1）Web客户向Servlet容器发出Http请求； 
 　　2）Servlet容器解析Web客户的Http请求； 
 　　3）Servlet容器创建一个HttpRequest对象，在这个对象中封装Http请求信息； 
 　　4）Servlet容器创建一个HttpResponse对象； 
 　　5）Servlet容器调用HttpServlet的service方法，把HttpRequest和HttpResponse对象作为service方法的参数传给HttpServlet对象； 
 　　6）HttpServlet调用HttpRequest的有关方法，获取HTTP请求信息； 
 　　7）HttpServlet调用HttpResponse的有关方法，生成响应数据； 
 　　8）Servlet容器把HttpServlet的响应结果传给Web客户。

### 5、Servlet API中forward() 与sendRedirect ()的区别？（就是请求转发和重定向的区别） ？

- 相同点：
  - 都能跳转到其它页面

- 不同点：
  - 转发请求只发出一次请求，而重定向发出多次请求
  - 转发request对象是同一个,而重定向request对象是多个
  - 转发地址栏不变,而重定向地址栏改变
  - 转发的"/"是相对于项目,而重定向的"/"相对于WEB容器
  - 转发只能转发到项目资源,而重定向可以是项目资源也可以是外部资源 

- 请求转发有两种写法

```java
//forward 一去不回头，在转发之后向控制台(System.out.println)仍然会输出，但out.println("xxx")不会在页面上输出
request.getRequestDispatcher("/xx").forward(request,response);
//include 一去还回头，在转发之后向控制台(System.out.println)仍然会输出，但out.println("xxx")也会在页面上输出
request.getRequestDispatcher("/xx").include(request,response);
```

### 6、 什么情况下调用doGet()和doPost()？ 

Jsp页面中的form表单标签里的method属性为get时调用doGet()，为post时调用doPost()。 

### 7、 request对象的几个常用方法:

| 方法名称                                  | 说明                                                         |
| ----------------------------------------- | ------------------------------------------------------------ |
| String getParameter(String name)          | 根据页面表单组件名称获取页面提交数据                         |
| String[] getParameterValues(String name)  | 获取一个页面表单组件对应多个值时的用户的                                                             请求数据 |
| void setCharacterEncoding(String charset) | 指定每个请求的编码，在request.getParameter()方法之前进行设定，可以用于解决中问乱码问题 |
| getRequestDispatcher(String path)         | 返回一个Javax.servlet.RequestDispatcher对                                              象，该对象返回一个Javax.servlet.RequestDispatcher对                                                                            象，该对象的forward方法用于转发请求 |
| setAttribute(String name,Object)          | 设置名字为name的request的参数值                              |
| getAttribute(String name)                 | 返回由name指定的属性值                                       |
| getAttributeNames()                       | 返回request对象所有属性的名字集合，结果是一                                                                  个枚举的实例 |

### 8、什么是Jsp

- JSP（Java Server Pages, JSP）是由Sun公司提倡，许多公司共同参与一同建立起来的一种动态网页技术标

  准，它在动态网页建设中有强大的而特别的功能，它具有跨平台性，易维护性，易管理性等优点。

### 9、 JSP的执行过程? 

- 翻译阶段：
  - 当Web服务器接收到JSP请求时，首先会对JSP文件进行翻译，将编写好的JSP文件通过JSP引擎转换成可识别的Java源代码。

- 编译阶段：
  - 经过翻译后的JSP文件相当于我们编写好的Java源文件，此时仅有Java源文件是不够的，必须要将Java源文件编译成可执行的字节码文件。所以Web容器处理JSP请求的第二阶段就是执行编译。

- 执行阶段：
  - Web容器接收了客户端的请求后，经过翻译和编译两个阶段，生成了可被执行的二进制字节码文件，此时就进入执行阶段。当执行结束后，会得到处理请求的结果，Web 容器又会再把生成的结果页面返回到客户端用户面前显示。

- 注意:只有第一次请求JSP页面或者JSP页面内容修改后访问才会执行翻译阶段和编译阶段，所有JSP的执行效率并不低，只是第一次访问页面时会稍微慢一点

### 10、 JSP页面七大组成元素？

- 静态内容
- 指令
- 表达式
- 小脚本
- 声明
- 标准动作
- 注释等

### 11、 JSP页面三大指令？

- page指令
- include指令
- taglib指令

### 12、page指令常用属性？

| 属性        | 描述                                                         |
| ----------- | ------------------------------------------------------------ |
| language    | 指定JSP页面使用的脚本语言，默认为“Java”                      |
| import      | 通过该属性来引用脚本语言中使用到的类文件                     |
| contentType | 用来指定JSP页面所采用的编码格式，默认                                                                   为“text/html;charset=GBK” |

### 13、JSP有哪些内置对象?作用分别是什么? 分别有什么方法？ 

- JSP共有以下9个内置的对象： 
  - request 用户端请求，此请求会包含来自GET/POST请求的参数 
  - response 网页传回用户端的回应 
  - pageContext 网页的属性是在这里管理 
  - session 与请求有关的会话期 
  - application servlet 正在执行的内容 
  - out 用来传送回应的输出 
  - config servlet的构架部件 
  - page JSP网页本身 
  - exception 针对错误网页，未捕捉的例外 
- 常用方法
  - request表示HttpServletRequest对象。它包含了有关浏览器请求的信息，并且提供了几个用于获取cookie, header, 和session数据的有用的方法。 
  - response表示HttpServletResponse对象，并提供了几个用于设置送回 浏览器的响应的方法（如cookies,头信息等） 
  - out对象是javax.jsp.JspWriter的一个实例，并提供了几个方法使你能用于向浏览器回送输出结果。 
  - pageContext表示一个javax.servlet.jsp.PageContext对象。该对象提供了对JSP页面内所有的对象及名字空间（就是四大作用域空间，如page空间、request空间、session空间、application空间）的访问，也就是说他可以访问到当前请求对应session中保存的信息，也可以取当前应用所在的application的某一属性值，它相当于页面中所有功能的集大成者，包装了通用的servlet相关功能的方法。 
  - session表示一个请求的javax.servlet.http.HttpSession对象。Session可以存贮用户的状态信息 
  - applicaton 表示一个javax.servle.ServletContext对象。这有助于查找有关servlet引擎和servlet环境的信息 
  - config表示一个javax.servlet.ServletConfig对象。该对象用于存取servlet实例的初始化参数。 
  - page表示从该页面产生的一个servlet实例 

### 14、JSP有哪些标准动作?作用分别是什么? 

JSP主要共有以下几种基本动作 

- jsp:include：在页面被请求的时候引入一个文件。 

- jsp:useBean：寻找或者实例化一个JavaBean。 

- jsp:setProperty：设置JavaBean的属性。 

- jsp:getProperty：输出某个JavaBean的属性。 

- jsp:forward：把请求转到一个新的页面。 

- jsp:plugin：根据浏览器类型为Java插件生成OBJECT或EMBED标记

### 15、JSP中动态Include与静态Include的区别？ 

动态Include用`<jsp:include>`动作实现

静态Include用`include指令`实现

相同点:

- 都可以包含一个页面

不同点:

- include指令包含的属性为file，而include动作包含的属性为page

- include指令属性于静态包含，而include动作属性动态包含

- include指令是在编译成servlet之前，把两个jsp合并成了一个jsp,所以最终生成了一个servlet，这种方式称为静态合并

  而include动作是编译成两个servlet，只在运行的内容把内容合并过来，这种方式称为动态合并

- include指令只能包含页面，不能传参给页面

  而include动作是两个servlet，所以可以能过`<jsp:param>`赋参给包含页面，注如果是中文，要在包含的页面处理乱码

### 16、JSP和Servlet有哪些相同点和不同点，他们之间的联系是什么？ 

- JSP是Servlet技术的扩展，本质上是Servlet的简易方式，更强调应用的外表表达。
- JSP编译后是"类servlet"。
- Servlet和JSP最主要的不同点在于，Servlet的应用逻辑是在Java文件中，并且完全从表示层中的HTML里分离开来。而JSP的情况是Java和HTML可以组合成一个扩展名为.jsp的文件。
- JSP侧重于展示内容，Servlet主要用于控制逻辑。 

### 17、如何实现servlet的单线程模式

- 通过page指令设置<%@ page isThreadSafe="false"%>，默认Servlet支持多线程模式，即有多个客户端同时请求同一个Servlet，服务器上的Servlet只会产生一个实例，但是会启动多个线程来响应客户请求，但是这样会导致线程安全问题，编程时建议不要在Servlet中定义成员属性来共享数据，以避免出现数据同步的问题。

### 18、在JSP中如何实现页面跳转？

- 使用javascript中的window.location.href=”要跳转的页面”。

- 在超链接中:href=”location=要跳转的页面”，例如<a href="index.jsp">首页</a>。

- form表单中提交：action=”要跳转的页面”。

- 使用jsp内置对象request或response，执行请求转发或重定向来实现页面跳转

### 19、在servlets和JSP之间能共享session对象吗？

- 当然可以，session作用域中的内容，可以在多个请求中共享数据。

- 例如可以在Servlet中通过request.getSession()来得到HttpSession对象，然后将相应数据存储到该session对

  象中，在其它jsp页面上都可以通过内置对象session来获取存入的值,即使这些页面是通过重定向方式跳转过去

  的，也可以得到值。

- Session本来就是用来保障在同一客户端和服务器之间多次请求之间的数据能够共享的一种机制。

### 20、什么是Cookie？

- Cookie，有时也用其复数形式cookies，指某些网站为了辨别用户身份、进行session跟踪而储存在用户本地终端上的数据（通常经过加密）。

- Cookie是由服务器端生成，发送给客户端浏览器的，浏览器会将其保存成某个目录下的文本文件。

### 21、如何设置cookie在某一时间后过期？

使用cookie的setMaxAge方法设置cookie的有效时间

代码如下：

```java
Cookie ipAddrCookie = new Cookie("cookieName",|cookieValue");
//单位为秒 
ipAddrCookie.setMaxAge(6010);
```

### 22、在JSP中如何设置Cookie？

```java
Cookie ipAddrCookie = new Cookie("cookieName",|cookieValue");
```

其中cookieName为Cookie对象的名称,未来获取Cookie的时候需要使用。cookieValue为Cookie

对象的值也就是储存用户的信息如用户名、 密码等。

### 23、Cookie的应用场景？

- 对特定对象的追踪，如访问者的访问次数，最后访问时间、路径等

- 统计网页浏览记录。

- 在Cookie有效期内，记录用户登入信息。

- 实现各种个性化服务，如针对不同用户喜好以不同的风格展示不同的内容

- 提示：由于Cookie保存在客户端，所以使用Cookie存在一定的风险，所以不建议在Cookie中保存比较重要或

  敏感的内容。

### 24、cookie与session有什么区别?

- session是客户端和服务器端保存用户信息，cookie是在客户端保存用户信息。

- session中保存的是对象，cookie保存的是字符串。

- session对象随会话结束而关闭，cookie可以长期保存在客户端

- cookie通常用于保存不重要的用户信息，重要的信息使用session保存。

### 25、什么是MVC设计模式

​       MVC模式是一种流行的软件的设计模式,MVC模式将应用程序实现分为3个不同的基本部分.模型,视图和控制器.

​       模型(Model):表示数据和业务处理.在MVC的三个部件中,模型拥有最多的处理任务.被模型返回的数据是中立的,就是说模型与数据格式无关,这样一个模型能为多个视图提供数据,由于应用于模型的代码只需写一次就可以被多个视图重用,所以减少了代码的重复性.对应的组件是java Bean(java类).

​       视图(view): 是用户看到并与之交互的界面.MVC一个最大的好处就是它能为应用程序处理很多不同的视图,在视图中其实没有真正的处理发生,不管这些数据是什么,作为视图来讲,它只是作为一种输出数据并允许用户操作的方式.对应的组件是JSP或HTML文件.视图提供可交互的界面,向客户显示模型数据.

​       控制器(Controller): 接收用户的输入并调用模型组件去完成用户的请求。当用户提交一个请求时,控制器本身不做执行业务处理.它只是接收请求并决定调用哪个模型组件去处理请求,然后确定用哪个视图来显示模型处理返回的数据.对应的组件可以是Servlet. 控制器响应客户的请求,根据客户的请求来操作模型,并把模型的响应结果经由视图展现给客户.

  MVC最重要的特点就是把显示和数据分离,提高代码的可重用性.

  MVC的处理过程:

​       首先控制器接收用户的请求,并决定应该调用哪个模型来处理,然后模型处理用户的请求并返回数据,最后控制器确定相应的视图将模型返回的数据呈现给用户.

### 26、MVC设计模式的优缺点：

1)优点：

​       各司其职、互不干涉；

​       有利于开发中的分工；       

​       有利于组建的重用；

2)缺点：

​       系统结构和实现复杂；

​       视图与控制器过于紧密；

​       不适用于小型甚至中型应用程序；

### 27、Web应用的目录结构:

​       _____________________________________________________________________

​         目录                         说明

​         /                              Web应用的根目录，该目录下的所有文件对客户端都可以访问                                           包括JSP、HTML

​              

​         /WEB-INF                存放应用程序所使用的各种资源，该目录及其子目录对客户                                                 端都是不可以访问的，其中包括web.xml（部署表述符）

 

​         /WEB-INF/classes      存放应用的所有class文件

 

​         /WEB-INF/lib           存放Web应用使用的JAR文件

​       _____________________________________________________________________ 

### 28、Tomcat的目录结构:

​       _____________________________________________________________________

​         目录           说明

 

​         /bin            存放各种平台下用于启动和停止Tomcat的脚本文件

​         /conf          存放Tomcat服务器的各种配置文件，其中最重要的文件时server.xml

​         /lib             存放Tomcat服务器所需的各种JAR文件

​         /logs           存放Tomcat的日志文件

​         /temp          Tomcat运行时用于存放临时文件

​         /webapps     Web应用的发布目录

​         /work         Tomcat把由JSP生成的Servler放于此目录下

​       _____________________________________________________________________

### 29、Tomcat工作原理？

Tomcat是Servlet运行环境（容器），每个Servlet执行init(),service(),destory()。

下面以分析Tomcat Server处理一个http请求的过程来解释Tomcat原理。

假设来自客户的请求为：http://localhost:8080/wsota/wsota_index.jsp

1)   请求被发送到本机端口8080，被在那里侦听的Coyote HTTP/1.1 Connector获得

2)   Connector把该请求交给它所在的Service的Engine来处理，并等待来自Engine的回应

3)   Engine获得请求localhost/wsota/wsota_index.jsp，匹配它所拥有的所有虚拟主机Host

4)   Engine匹配到名为localhost的Host（即使匹配不到也把请求交给该Host处理，因为该Host被定义为该Engine的默认主机）

5)   localhost Host获得请求/wsota/wsota_index.jsp，匹配它所拥有的所有Context

6)   Host匹配到路径为/wsota的Context（如果匹配不到就把该请求交给路径名为""的Context去处理）

7)   path="/wsota"的Context获得请求/wsota_index.jsp，在它的mapping table中寻找对应的servlet

8)   Context匹配到URL PATTERN为.jsp的servlet，对应于JspServlet类

9)   构造HttpServletRequest对象和HttpServletResponse对象，作为参数调用JspServlet的doGet或doPost方法

10)  Context把执行完了之后的HttpServletResponse对象返回给Host

11)  Host把HttpServletResponse对象返回给Engine

12)  Engine把HttpServletResponse对象返回给Connector

13)  Connector把HttpServletResponse对象返回给客户browser

### 30、什么是URL：

​       URL，是英文Uniform Resource Locator 的缩写，意思是统一资源定位符，是标准的互联网行资源（图片，Javacript脚本文件等）的地址，是用于完整的描述Internet上网页和其他资源的地址的一种标识方法。简单的说，URL就是我们常说的网址.

### 31、 什么是Session机制

 会话的跟踪，就是session机制，Session机制是一种服务器端的机制，服务器使用一种类似于散列表(HashTable)的结构来保存信息，主要用于在整个会话请求过程中共享数据。

Session机制的实现原理：

1)      当程序需要为某个客户端的请求创建session的时候，服务器首先检查这个客户端的请求里是否包含一个session标识，即称为sessionid

2)      如果包含sessionid则说明该客户端创建过session，服务器就会按照sessionid把这个session检索出来使用，如果检索不到，会创建一个新的session对象，并生成一个新的与此session关联的sessionid。

3)      如果客户端请求不包含sessionid，则为此客户端创建一个session并生成一个于此session相关联的sessionid

Sessionid传递的方式有两种：

Cookie方式：服务器分配的sessionid将作为Cookie发送给浏览器，浏览器保存这个Cookie。当再次发送Http请求时，浏览器将Cookie随请求一起发送，服务器从请求对象中读取sessionid，再根据sessionid找到对应的HttpSession对象。

URL重写：当cookie被人禁止的时候，我们就可以使用Url重写的方式把sessionid传递回服务器。就是把sessionid附加在URL路径的后面。附加的方式有两种：一种是作为URL路径的附加信息，一种是作为查询字符串附加在URL后面。

### 32、四种会话跟踪技术

由于HTTP事务是无状态的，因此必须采取特殊措施是服务器在系列事务期间能继续确定和记住特定用户，这就是会话跟踪的概念。

实现此功能有四种实现技术：

1、  用隐藏表单域（<input type="hidden">）

​       非常适合不需要大量数据存储的会话应用。

2、URL重写

​       URL可以在后面附加参数，和服务器的请求一起发送，服务器根据相应的参数来判断是否为同一个客户端发送的请求，一般可以直接使用HTTP会话API执行URL重写，会自动附加相应的sessionid，该技术主要使用场景是客户端的浏览器禁用cookie导致session无法使用的情况。

3、Cookie技术

​              服务器通过cookie对象来保存session对象的id，用来保证客户端每次发送请求过来都会带上sessionid以保证服务器可以识别不同客户端的请求，是session机制实现的前提，如果用户禁用cookie就只能使用url重写来保证sessionid的传递了。

4、Session技术

​              根据session对象的sessionid（唯一标识）即可识别不同的客户端请求

### 33、Web应用中的四大作用域（注意不要和四种会话跟踪技术搞混淆了）

​          page是代表与一个页面相关的对象和属性。一个页面由一个编译好的 Java Servlet 类（可以带   有任何的 include 指令，但是没有 include 动作）表示。这既包括 servlet 又包括被编译成 servlet 的 JSP 页面
​        request是代表与Web 客户机发出的一个请求相关的对象和属性。一个请求可能跨越多个页面，涉及多个Web 组件（由于 forward 指令和 include 动作的关系）
​        session是代表与用于某个 Web 客户机的一个用户体验相关的对象和属性。一个 Web 会话可以也经常会跨越多个客户机请求
​        application是代表与整个Web 应用程序相关的对象和属性。这实质上是跨越整个 Web 应用程序，包括多个页面、请求和会话的一个全局作用域

### 34、B/S与C/S的联系与区别

C/S是Client/Server的缩写。服务器通常采用高性能的PC、工作站或小型机，并采用大型数据库系统，如Oracle、Sybase、MySQL或 SQL Server。客户端需要安装专用的客户端软件。

B/Ｓ是Brower/Server的缩写，客户机上只要安装一个浏览器（Browser），如Netscape Navigator或Internet Explorer，服务器安装Oracle、Sybase、MySQL或 SQL Server等数据库。在这种结构下，用户界面完全通过WWW浏览器实现，一部分业务逻辑在前端实现，但是主要业务逻辑在服务器端实现。浏览器通过Ｗeb Server同数据库进行数据交互。

### 35、http协议有几种提交方式

常用的有get()、post()两种

### 36、什么是EL表达式

​       EL全称 Expression Language ，是一种借鉴了JS和XPath的表达式语言，它定义了一系列隐含对象和操作符，开发人员能方便的访问页面的上下文， 以及不同作用域的对象，无需嵌入java代码，即使开发人员不懂java代码，也能轻松编写JSP程序。

​       EL表达式的语法：${表达式} 

### 37、EL隐式对象有哪些？

1）.作用域访问对象

​           pageScope           与页面作用域（page）中属性相关联的Map类

​              requestScope        与请求作用域（request）中属性相关联的Map类

​              sessionScope        与会话作用域（session）中属性相关联的Map类

​              applicationScope    与应用程序作用域（application）中属性相关联的Map类             

​       使用例子：request.setAttribute("Student",stu);当使用EL表达式访问某个属性值时候，应该指定查找范围，如${requestScope.Student}如果不指定查找范围，会按照page->request->session->application的顺序查找

​         注意：必须将对象保存在作用域中，才可以用EL表达式访问对象。

2）.参数访问对象

​         param      按照参数名称访问单一请求值的Map对象

​            paramValues 按照参数名称访问数组请求值的Map对象

​       参数访问对象是和页面输入参数有关的隐式对象，通过它们可以得到用户的请求参数：

​       比如登录页面表单有个表单项 <input type="text" name="userName">提交用户名，

​       在登录处理页面可以通过 ${param.userName} 访问它

3）.JSP隐式对象

​         pageContext  提供对页面信息的JSP内置对象的访问

### 38、什么是JSTL

JSTL 全称 java server pages Standard Tag Library JSP标准标签库，它包含了我们在开发JSP页面经常用到的一组标准标签

### 39、JSTL迭代标签使用？

​            <c:forEach var="变量名" items="被迭代的集合对象" varStatus="statu" begin="" end="" step="1">

​            </c:forEach>

​            其中：用 statu.index获得等同for的循环变量i一样。

var 是 对当前成员的引用

​                 beigin 表示开始位置 默认为0 。 可省略

​                 end  表示结束位置，可省略

​                 step表示步长，默认为1，可以省略

​            也可以指定循环次数来循环，

​            如：<c:forEach var ="变量名" varStatus="statu" begin="0" end="10" >

​                代码块   

​               </c:forEach>

​              通过begin 和end 指定循环次数

### 40、 Filter 基本工作原理

​       当在 web.xml 中配置了一个 Filter 来对某个 Servlet 程序进行拦截处理时，这个 Filter 就成了 Servlet 容器与该 Servlet 程序的通信线路上的一道关卡，该 Filter 可以对 Servlet 容器发送给 Servlet 程序的请求和 Servlet 程序回送给 Servlet 容器相应进行拦截，可以决定是否将请求继续传递给 Servlet 程序，以及对请求和相应信息是否进行修改。

在一个 web 应用程序中可以注册多个 Filter 程序，每个 Filter 程序都可以对一个或一组 Servlet 程序进行拦截。

若有多个 Filter 程序对某个 Servlet 程序的访问过程进行拦截，当针对该 Servlet 的访问请求到达时，web 容器将把多个 Filter 程序组合成一个 Filter 链(过滤器链)。Filter 链中各个 Filter 的拦截顺序与它们在应用程序的 web.xml 中映射的顺序一致。2021/12/10 8:37:22 2021/12/10 8:37:24 