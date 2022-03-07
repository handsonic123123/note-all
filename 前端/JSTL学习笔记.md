> JSTL学习笔记
#序章 JSTL简介
##0.1 JSTL是什么？

1. JSTL（JSP Standard Tag Library，核心标签库）是 JSP 标签的集合，它封装了 JSP 应用的通用核心功能。

1. JSP 标签是一组与 HTML 标签相似，但又比 HTML 标签强大的功能标签。JSTL 用来简化 JSP 开发，可以使我们不用嵌入 Java 代码就能够开发出复杂的 JSP 页面。

##0.2 JSTL标签分类

JSTL 包含 5 类标签库，这 5 类标签库基本覆盖了 Web 开发中的所涉及的技术展示：

1. core 标签库

1. fmt 标签库

1. fn 标签库

1. XML 标签库

1. SQL 标签库

###0.3 JSTL的下载和使用

1. 使用 JSTL 需要引入 JSTL 的 JAR 包和标签库描述符文件（扩展名为 .tld），标签库描述符文件内包含标签库中所有标签的定义、标签名、功能类及各种属性。

        JATL JAR 包官方下载网址：https://tomcat.apache.org/taglibs/standard/
        JATL JAR 包本站下载地址：jstl.zip

    ***tips：本文使用的 JSTL 1.2，如果你使用的是 JSTL 1.1 或之前的版本，需要导入 jstl.jar 和 standard.jar 两个包***

1. 使用 taglib 指令导入标签库描述符文件，例如要使用 JSTL 核心标签库，需要在 JSP 页面的上方增加如下指令：

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

taglib 指令通过 uri 属性引入某个标签库的配置文件，JSP 页面中通过 prefix 属性指定的前缀即可访问该标签库中的某个标签功能

----------
#第一章 核心标签
----------
JSTL 核心（core）标签是最常用的 JSTL 标签，导入核心标签库的语法如下：

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

##1.1 <c:out>	

**将表达式的结果输出到页面中，类似于 <％= ...％>**

JSP <c:out> 标签语法如下：

    <c:out value="表达式" [default="表达式"] [escapeXml="<true|false>"] />


- value：指定要输出的内容


- default：可选项，指定输出的默认值


- escapeXml：可选项，默认为 true。表示是否转换特殊字符，如将<转换为&lt;，>转换为&gt;等
##1.2 <c:set>	

**在指定范围内设置变量或属性值**

JSP <c:set> 标签语法如下：

    <c:set var="varname" value="表达式" [scope="request|page|session|application"] />
    或
    <c:set var="varname" [scope="request|page|session|application"]>表达式</c:set>

- var：定义变量或属性名称

- value：变量或属性值

- scope：可选项，表示属性的作用域，默认为 page

##1.3 <c:if>	

**类似于 Java if 语句，用于条件判断**

JSP <c:if> 标签语法如下：

    <c:if test="判断条件" [var="varname"] [scope="request|page|session|application"] >
       代码块
    </c:if>
其中：
test：指定判断条件，返回值为 boolean
var：可选项，判断条件的执行结果
scope：可选项，执行结果的作用域
##1.4 <c:choose>	
类似于 Java switch 关键字，为 <c:when>和<c:otherwise> 的父标签
##1.4.1 <c:when>	
<c:choose> 的子标签，用来判断条件是否成立
##1.4.2 <c:otherwise>	
<c:choose> 的子标签，当所有的 <c:when> 标签判断为 false 时被执行

JSP <c:choose>、<c:when>和<c:otherwise>标签语法如下：

        <c:choose>
            <c:when test="表达式1">
                // 表达式1为true时执行的代码块
            </c:when>
            <c:when test="表达式2">
                // 表达式2为true时执行的代码块
            </c:when>
            <c:otherwise>
                // 表达式都为false时执行的代码块
            </c:otherwise>
        </c:choose>



1. <c:choose> 是父标签，相当于 Java Switch；


1. <c:when> 和 <c:otherwise> 是 <c:choose> 的子标签，可以有 0 个或多个。<c:when> 相当于 Java case，

1. <c:otherwise> 相当于 Java default；

##1.5 <c:forEach>	
类似于 Java for，用于迭代集合中的信息

JSP <c:forEach> 标签的语法如下：

    <c:forEach [var="varname"] [varStatus="varstatusName"] [begin="开始"] [end="结束"] [step="step"]>
        Java程序或HTML代码
    </c:forEach>
    或
    <c:forEach item="collection" [var="varname" [varStatus="varstatusName"] [begin="开始"] [end="结束"] [step="step"]]>
        Java程序或HTML代码
    </c:forEach>


- items：要被循环的信息，可以是数组、Java 集合等；


- var：可选项，指定迭代之的别名；


- varStatus：可选项，当前迭代的状态信息；


- begin：可选项，迭代开始的元素，起始下标为 0；


- end：可选项，迭代结束的元素；


- step：可选项，迭代的步长；

##1.6 <c:forTokens>
类似于 Java split，用于分隔字符串
##1.7 <c:remove>	
用于删除数据
##1.8 <c:catch>	
用于捕获异常
##1.9 <c:import>	
用来导入静态或动态文件
##1.10 <c:param>	
用来传入参数
##1.13 <c:redirect>	
用于将当前页面重定向至另一个 URL
##1.14 <c:url>	
用于将 URL 格式化为一个字符串


----------
#第二章 格式化标签
----------
JSTL 格式化（fmt）标签可以通过很简单的方式转换数字、日期，导入格式化标签库的语法如下:

    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

##2.1 <fmt:requestEncoding>	
设置请求数据的字符编码
##2.2 <fmt:setLocale>	
用于设置用户本地化环境
##2.3 <fmt:bundle>	
绑定资源
##2.4 <fmt:message>	
用来从指定的资源文件中调用信息
##2.5 <fmt:setBundle>	
绑定资源
##2.6 <fmt:formatNumber>	
用于格式化数字、百分比和货币
##2.7 <fmt:parseNumber>	
用于解析数字、货币和百分比
##2.8 <fmt:formatDate>	
用于使用不同的方式格式化日期
##2.9 <fmt:parseDate>	
用于把字符串类型的日期转换成日期数据类型
##2.10 <fmt:timeZone>	
用于指定时区
##2.11 <fmt:setTimeZone>	
用于设定默认时区


----------
#第三章 SQL标签
----------


- JSTL SQL 标签提供了许多操作数据库（MySQL、Oracle、SQL Server 等）的标签


- 虽然在大型的网站中不建议使用这种标签库，但在小型网站中经常会用到。导入 SQL 标签库的语法如下

        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

##3.1 <sql:setDataSource>	
用来在 JSP 页面中配置数据源
##3.2 <sql:query>	
查询数据库中的数据
##3.3 <sql:update>	
更新数据库中的数据
##3.4 <sql:dateParam>	
提供日期和时间的动态值
##3.5 <sql:transaction>	
事务管理
##3.6 <sql:param>	
设置 SQL 语句中的动态值


----------
#第四章 函数标签
----------  
JSTL 函数（fn）标签大部分是通用的字符串处理函数，导入函数标签库的语法如下：

    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

##4.1 fn:contains()	
用于判断一个字符串是否包含指定的字符串，区分大小写
##4.2 fn:containsIgnoreCase()	
用于判断一个字符串是否包含指定的字符串，不区分大小写
##4.3 fn:endsWith()	
用于判断一个字符串是否以指定的后缀结尾
##4.4 fn:escapeXml()	
用于转义 HTML/XML 中的字符
##4.5 fn:indexOf()	
用于返回字符串在指定字符串中的开始位置
##4.6 fn:join()	
用来将数组中的所有元素利用指定的分隔符来连接成一个字符串
##4.7 fn:length()	
用于返回指定字符串的长度
##4.8 fn:split()	
用于将字符串用指定的分隔符分隔为一个子串数组
##4.9 fn:startsWith()	
用于判断一个字符串是否以指定的前缀开头
##4.10 fn:substring()	
用来返回指定字符串的子字符串
##4.11 fn:substringAfter()	
用来返回字符串中指定子字符串后面的部分
##4.12 fn:substringBefore()	
用来返回字符串中指定子字符串前面的部分
##4.13 fn:toLowerCase()	
用来将指定字符串中的所有字符转为小写
##4.14 fn:toUpperCase()	
将指定字符串中的所有字符转为大写
##4.15 fn:trim()	
用来删除指定字符串两端的空格


----------
#第五章 自定义标签
----------
##5.1 SimpTagSupport
##5.2 TLD文件
可以使用一个标签处理类 定义多个不同的标签
不可以定义多个多个同名的标签

##
