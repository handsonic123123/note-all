> EL表达式
#背景


1. 在JSP 页面中，经常使用 JSP 表达式来输出变量或者页面之间传递的参数，大大降低了页面的可读性。


1. 为了简化 JSP 页面，JSP 2.0 新增了 EL（Expression Language）表达式语言。

3. EL 提供了更为简洁、方便的形式来访问变量和参数，简化 JSP 页面代码，使开发者的逻辑变得更加清晰 。


----------
#第一章 EL表达式的语法
----------
##1.1 EL 表达式语法如下：
            ${EL表达式}



1. EL 表达式语法以**${**开头，以**}**结束，中间为合法的表达式



1. EL 表达式定义了许多运算符，如算术运算符、比较运算符、逻辑运算符等，使用这些运算符，可以使 JSP 页面更加简洁

###1.1.1 示例
${param.name} 表示获取参数 name 的值，等同于` <%=request.getParameter('name') %>`

##1.2 EL算术运算符
算术运算符用来进行加、减、乘、除和求余，EL 表达式算术运算符如下：

|----|----|----|----|
|EL算术运算符	|说明|范例	|结果
|+	|加	|${5+2}|	7
|-	|减	|${5-2}|	3
|*	|乘	|${5*2}|	10
|/ 或 div|	除|	${5/2}|	2
|% 或 mod	|求余|	${5%2}|	1|


1. EL 的+运算符与 Java 的+运算符不一样，它无法实现两个字符串的连接运算。如果该运算符连接的两个值不能转换为数值型的字符串，则会拋出异常；反之，EL 会自动将这两个字符转换为数值型数据，再进行运算

1. EL 表达式中还可以使用 ( ) 改变优先级，例如：${2+3*2} 等于 8，${(2+3)*2} 等于 10

##1.3 EL比较运算符
比较运算符用来实现两个表达式的比较，进行比较的表达式可以是数值型或字符串

|----|----|
|EL比较运算符	|说明	
|== 或 eq|	等于	
|!= 或 ne|	不等于	
|< 或 lt|	小于	
|> 或 gt|	大于	
|<= 或 le|	小于等于
|>= 或 ge|	大于等于	

##1.4 EL其它运算符

###1.4.1 **. 和 [ ]**

.和[ ]是 EL 中最常用的运算符，用来访问 JavaBean 中的属性和隐式对象的数据。一般情况下，.用来访问 JavaBean 属性或 Map 类型的值，[ ]用来访问数组或者列表的元素。

###1.4.2 empty

empty 用来判断 EL 表达式中的对象或者变量是否为空。若为空或者 null，返回 true，否则返回 false

###1.4.3 条件运算符

EL 表达式中，条件运算符的语法和 Java 的完全一致:

        ${条件表达式?表达式1:表达式2}

##1.5  EL运算符优先级
在 EL 表达式中，多种运算符混合运算时，优先级如下表所示（由高至低，由左至右）。

|----|----|
|序号|	优先级
|1|	[]  .
|2|	()
|3|	-（负）、not、! 、empty
|4|	* 、 / 、 div 、% 、mod
|5|	+、-（减）
|6|	<、>、<=、>=、lt、gt、le、ge
|7|	==、!-、eq、ne
|8|	&&、and
|9|	or
|10|	${A?B:C}


----------
#第二章 EL内置对象
---------
##2.1 禁用EL表达式
禁用 EL 表达式有以下 3 种方法

1. 禁用单个EL表达式
在 EL 表达式前加 \

         \${2+3}

2）禁用当前页面的EL表达式

将 page 指令中的 isELIgnored 属性设置为 true

        <%@ page isELIgnored="true" %>

3）禁用整个Web应用的EL表达式

在 web.xml 中配置 <el-ignored> 元素

        <jsp-property-group>
            <url-pattern>*jsp</url-pattern>
            <el-ignored>false</el-ignored>
        </jsp-propery-group>


##2.2 EL内置对象
EL 表达式内置对象如下：

|----|----|
|内置对象|	说明
|pageScope|	获取 page 范围的变量
|requestScope|	获取 request 范围的变量
|sessionScope|	获取 session 范围的变量
|applicationScope|	获取 application 范围的变量
|param|	相当于 request.getParameter(String name)，获取单个参数的值
|paramValues|	相当于 request.getParameterValues(String name)，获取参数集合中的变量值
|header|	相当于 request.getHeader(String name)，获取 HTTP 请求头信息
|headerValues|	相当于 request.getHeaders(String name)，获取 HTTP 请求头数组信息
|initParam	|相当于 application.getInitParameter(String name)，获取 web.xml 文件中的参数值
|cookie|	相当于 request.getCookies()，获取 cookie 中的值
|pageContext|	表示当前 JSP 页面的 pageContext 对象|


1. EL 表达式可以输出 4 种属性范围的内容


1. 如果在不同的属性范围中设置了同一个属性名称，则按照 page、request、session、application 的顺序依次查找


1. 也可以指定要取出哪一个范围的变量，例如：`${pagesScope.name}`，表示取出 page 范围的 name 变量。

##2.3 通过EL访问数据

1. 通过EL提供的”[]”和”.”运算符可以访问数据。通常情况下这两个运算符是等价的，可以相互代替。

1. 当对象的属性名中包含一些特殊的符号(-或.)时，就只能使用[]来访问对喜爱那个的属性。

3. 例如userInfo[user−id]是正确的，而{userInfo.user-name}是错误的

##2.4 示例
###2.4.1 获取数组元素(只能使用[]，不能用.)

    <%  
           String[] str = {"一号" , "二号" , "三号" , "四号" , "五号"};  
      
           request.setAttribute("user",str);  
    %>  
    <%  
           String[] str1 =(String[])request.getAttribute("user");  
      
           for(int i=0; i < str1.length; i++){  
      
                  request.setAttribute("rt",i);  
    %>  
           rt:{user[rt] }<br>  
    <% }%>  
     

###2.4.2 List集合元素的获取(只能使用[]，不能用.)

    <%  
           List<String> list = newArrayList<String>();  
      
           list.add("一号");  
      
           list.add("二号");  
      
           list.add("三号");  
      
           session.setAttribute("user",list);  
    %>  
      
    <%  
           List<String> list1 =(List<String>)session.getAttribute("user");  
           for(int i = 0 ; i < list1.size() ;i++){  
                  request.setAttribute("rt",i);  
    %>  
      
           rt:{user[rt] }<br>  
      
    <%  }%>  