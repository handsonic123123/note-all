> 2021/11/23 19:47:18 

>https://www.w3cschool.cn/mybatis/f4uw1ilx.html

> MyBatis学习笔记

#序章 MyBatis概述
## 0.1 MyBatis的初生

- MyBatis 前身为 IBatis，2002 年由 Clinton Begin 发布。2010 年从 Apache 迁移到 Google，并改名为 MyBatis，2013 年又迁移到了 Github。

- MyBatis 内部封装了 JDBC，简化了加载驱动、创建连接、创建 statement 等繁杂的过程，开发者只需要关注 SQL 语句本身。

- MyBatis 支持定制化 SQL、存储过程以及高级映射，可以在实体类和 SQL 语句之间建立映射关系，是一种半自动化的 ORM 实现。

- MyBatis 是一个开源、轻量级的数据持久化框架，是 JDBC 和 Hibernate 的替代方案。

##0.2 MyBatis、Hibernate 和 JDBC

1. 和 Hibernate 相比，MyBatis 封装性低于 Hibernate，但性能优秀、小巧、简单易学、应用广泛

1. 和 JDBC 相比，MyBatis 减少了 50% 以上的代码量，并且满足高并发和高响应的要求

###0.2.1 MyBatis和Hibernate的区别

####0.2.1.1 sql 优化方面

1. Hibernate 使用 HQL（Hibernate Query Language）语句，独立于数据库。不需要编写大量的 SQL，就可以完全映射，但会多消耗性能，且开发人员不能自主的进行 SQL 性能优化。提供了日志、缓存、级联（级联比 MyBatis 强大）等特性


1. MyBatis 需要手动编写 SQL，所以灵活多变。支持动态 SQL、处理列表、动态生成表名、支持存储过程。工作量相对较大

####0.2.1.2 开发方面

1. MyBatis 是一个半自动映射的框架，因为 MyBatis 需要手动匹配 POJO 和 SQL 的映射关系。

1. Hibernate 是一个全表映射的框架，只需提供 POJO 和映射关系即可

####0.2.1.3 缓存机制比较


1. Hibernate 的二级缓存配置在 SessionFactory 生成的配置文件中进行详细配置，然后再在具体的表-对象映射中配置缓存。


1. MyBatis 的二级缓存配置在每个具体的表-对象映射中进行详细配置，这样针对不同的表可以自定义不同的缓存机制。并且 Mybatis 可以在命名空间中共享相同的缓存配置和实例，通过 Cache-ref 来实现。


1. Hibernate 对查询对象有着良好的管理机制，用户无需关心 SQL。所以在使用二级缓存时如果出现脏数据，系统会报出错误并提示。

1. MyBatis 在这一方面，使用二级缓存时需要特别小心。如果不能完全确定数据更新操作的波及范围，避免 Cache 的盲目使用。否则脏数据的出现会给系统的正常运行带来很大的隐患。


####0.2.1.4 Hibernate 优势

1. Hibernate 的 DAO 层开发比 MyBatis 简单，Mybatis 需要维护 SQL 和结果映射。

1. Hibernate 对对象的维护和缓存要比 MyBatis 好，对增删改查的对象的维护要方便。

1. Hibernate 数据库移植性很好，MyBatis 的数据库移植性不好，不同的数据库需要写不同 SQL。

1. Hibernate 有更好的二级缓存机制，可以使用第三方缓存。MyBatis 本身提供的缓存机制不佳。

####0.2.1.5  Mybatis优势
MyBatis 可以进行更为细致的 SQL 优化，可以减少查询字段。
MyBatis 容易掌握，而 Hibernate 门槛较高

####0.2.1.6应用场景

MyBatis 适合需求多变的互联网项目，例如电商项目、金融类型、旅游类、售票类项目等。

Hibernate 适合需求明确、业务固定的项目，例如 OA 项目、ERP 项目和 CRM 项目等

----------
#第一章 MyBatis 入门
----------


1. **MyBatis 是支持定制化 SQL、存储过程以及高级映射的优秀的持久层框架**
2. **MyBatis 避免了几乎所有的 JDBC 代码和手动设置参数以及获取结果集**
1. **MyBatis 可以对配置和原生Map使用简单的 XML 或注解，将接口和 Java 的 POJOs(Plain Old Java Objects,普通的 Java对象)映射成数据库中的记录**

##1.1 MyBatis的功能架构：

1. API接口层：提供给外部使用的接口API，开发人员通过这些本地API来操纵数据库。接口层一接收到调用请求就会调用数据处理层来完成具体的数据处理。


1. 数据处理层：负责具体的SQL查找、SQL解析、SQL执行和执行结果映射处理等。它主要的目的是根据调用的请求完成一次数据库操作。


1. 基础支撑层：负责最基础的功能支撑，包括连接管理、事务管理、配置加载和缓存处理，这些都是共用的东西，将他们抽取出来作为最基础的组件。为上层的数据处理层提供最基础的支撑。

##1.2 MyBatis的优缺点
###1.2.1 优点

1. 简单易学：本身就很小且简单。没有任何第三方依赖，最简单安装只要两个jar文件+配置几个sql映射文件易于学习，易于使用，通过文档和源代码，可以比较完全的掌握它的设计思路和实现。


1. 灵活：mybatis不会对应用程序或者数据库的现有设计强加任何影响。 sql写在xml里，便于统一管理和优化。通过sql基本上可以实现我们不使用数据访问框架可以实现的所有功能，或许更多。


1. 解除sql与程序代码的耦合：通过提供DAL层，将业务逻辑和数据访问逻辑分离，使系统的设计更清晰，更易维护，更易单元测试。sql和代码的分离，提高了可维护性。


1. 提供映射标签，支持对象与数据库的orm字段关系映射


1. 提供对象关系映射标签，支持对象关系组建维护


1. 提供xml标签，支持编写动态sql

###1.2.2 缺点

1. 编写SQL语句时工作量很大，尤其是字段多、关联表多时

1. SQL语句依赖于数据库，导致数据库移植性差，不能更换数据库

1. 框架还是比较简陋，功能尚有缺失，虽然简化了数据绑定代码，但是整个底层数据库查询实际还是要自己写的

1. 工作量也比较大，而且不太容易适应快速数据库修改

1. 二级缓存机制不佳

##1.3 MyBatis如何安装？

- 要使用 MyBatis， 只需将 mybatis-x.x.x.jar 文件置于 classpath 中即可

- 如果使用 Maven 来构建项目，则需将下面的 dependency 代码置于 pom.xml 文件中：

    <dependency>  
    <groupId>org.mybatis</groupId> 
     <artifactId>mybatis</artifactId>  
    <version>x.x.x</version>
    </dependency>


----------
#第二章 MyBatis XML配置
----------

> MyBatis 的配置文件包含了影响 MyBatis 行为甚深的设置（settings）和属性（properties）信息
##2.1 属性（properties）
这些属性都是可外部配置且可动态替换的，既可以在典型的 Java 属性文件中配置，亦可通过 properties 元素的子元素来传递

    <properties resource="org/mybatis/example/config.properties">
      <property name="username" value="dev_user"/>
      <property name="password" value="F2Fa3!33TYyg"/>
    </properties>

其中的属性就可以在整个配置文件中使用来替换需要动态配置的属性值。比如:

    <dataSource type="POOLED">
      <property name="driver" value="${driver}"/>
      <property name="url" value="${url}"/>
      <property name="username" value="${username}"/>
      <property name="password" value="${password}"/>
    </dataSource>
如果属性在不只一个地方进行了配置，那么 MyBatis 将按照下面的顺序来加载：

1. 在 properties 元素体内指定的属性首先被读取。

1. 然后根据 properties 元素中的 resource 属性读取类路径下属性文件或根据 url 属性指定的路径读取属性文件，
并覆盖已读取的同名属性

1. 最后读取作为方法参数传递的属性，并覆盖已读取的同名属性

因此，通过方法参数传递的属性具有最高优先级，resource/url 属性中指定的配置文件次之，最低优先级的是 properties 属性中指定的属性

##2.2 设置（settings）

这是 MyBatis 中极为重要的调整设置，它们会改变 MyBatis 的运行时行为。下表描述了设置中各项的意图、默认值

|----|----|----|----|
|设置参数|	描述|	有效值|	默认值
|cacheEnabled|	该配置影响的所有映射器中配置的缓存的全局开关|	true/false|	true
|lazyLoadingEnabled|	延迟加载的全局开关。当开启时，所有关联对象都会延迟加载。 特定关联关系中可通过设置fetchType属性来覆盖该项的开关状态|	true/false|	false
|aggressiveLazyLoading|	当启用时，对任意延迟属性的调用会使带有延迟加载属性的对象完整加载；反之，每种属性将会按需加载。	|true,false|
|multipleResultSetsEnabled	|是否允许单一语句返回多结果集（需要兼容驱动）|	true,false|	true
|useColumnLabel|	使用列标签代替列名。不同的驱动在这方面会有不同的表现， 具体可参考相关驱动文档或通过测试这两种不同的模式来观察所用驱动的结果|true,false|	true
|useGeneratedKeys	|允许 JDBC 支持自动生成主键，需要驱动兼容。 如果设置为 true 则这个设置强制使用自动生成主键，尽管一些驱动不能兼容但仍可正常工作（比如 Derby）|true,false	|False
|autoMappingBehavior	|指定 MyBatis 应如何自动映射列到字段或属性。 NONE 表示取消自动映射；PARTIAL 只会自动映射没有定义嵌套结果集映射的结果集。 FULL 会自动映射任意复杂的结果集（无论是否嵌套）|	NONE, PARTIAL, FULL|	PARTIAL
|defaultExecutorType|	配置默认的执行器。SIMPLE 就是普通的执行器；REUSE 执行器会重用预处理语句（prepared statements）； BATCH 执行器将重用语句并执行批量更新|	SIMPLE REUSE BATCH|	SIMPLE
|defaultStatementTimeout|	设置超时时间，它决定驱动等待数据库响应的秒数|	Any positive integer	|Not Set (null)
|safeRowBoundsEnabled|	允许在嵌套语句中使用分页（RowBounds）|	true,false	|False
|mapUnderscoreToCamelCase	|是否开启自动驼峰命名规则（camel case）映射，即从经典数据库列名 A_COLUMN 到经典 Java 属性名 aColumn 的类似映射|true, false|	False
|localCacheScope|MyBatis 利用本地缓存机制（Local Cache）防止循环引用（circular references）和加速重复嵌套查询。 默认值为 SESSION，这种情况下会缓存一个会话中执行的所有查询。 若设置值为 STATEMENT，本地会话仅用在语句执行上，对相同 SqlSession 的不同调用将不会共享数据|	SESSION,STATEMENT|SESSION
|jdbcTypeForNull|当没有为参数提供特定的 JDBC 类型时，为空值指定 JDBC 类型。 某些驱动需要指定列的 JDBC 类型，多数情况直接用一般类型即可，比如 NULL、VARCHAR 或 OTHER|JdbcType enumeration. Most common are: NULL, VARCHAR and OTHER|OTHER
|lazyLoadTriggerMethods|指定哪个对象的方法触发一次延迟加载|A method name list separated by commas|equals,clone,hashCode,toString
|defaultScriptingLanguage|指定动态 SQL 生成的默认语言。|A type alias or fully qualified class name.	|org.apache.ibatis.scripting.xmltags.XMLDynamicLanguageDriver
|callSettersOnNulls|指定当结果集中值为 null 的时候是否调用映射对象的 setter（map 对象时为 put）方法，这对于有 Map.keySet() 依赖或 null 值初始化的时候是有用的。注意基本类型（int、boolean等）是不能设置成 null 的|true,false|	false
|logPrefix|指定 MyBatis 增加到日志名称的前缀|Any String|	Not set
|logImpl|	指定 MyBatis 所用日志的具体实现，未指定时将自动查找。|SLF4J,LOG4J,LOG4J2,JDK_LOGGING,COMMONS_LOGGING,STDOUT_LOGGING,NO_LOGGING|Not set
|proxyFactory|指定 Mybatis 创建具有延迟加载能力的对象所用到的代理工具|CGLIB JAVASSIST|CGLIB
|vfslmpl|指定 VFS 的实现	|自定义 VFS 的实现的类全限定名，以逗号分隔|no set
|useActualParamName|允许使用方法签名中的名称作为语句参数名称。 为了使用该特性，你的项目必须采用 Java 8 编译，并且加上 -parameters 选项。（新增于 3.4.1）|true，false	|true
|configurationFactory|指定一个提供 Configuration 实例的类。 这个被返回的 Configuration 实例用来加载被反序列化对象的延迟加载属性值。 这个类必须包含一个签名为static Configuration getConfiguration() 的方法。（新增于 3.2.3）|	类型别名或者全类名|no set

> 一个配置完整的 settings 元素的示例如下：

    <settings>
      <setting name="cacheEnabled" value="true"/>
      <setting name="lazyLoadingEnabled" value="true"/>
      <setting name="multipleResultSetsEnabled" value="true"/>
      <setting name="useColumnLabel" value="true"/>
      <setting name="useGeneratedKeys" value="false"/>
      <setting name="autoMappingBehavior" value="PARTIAL"/>
      <setting name="defaultExecutorType" value="SIMPLE"/>
      <setting name="defaultStatementTimeout" value="25"/>
      <setting name="safeRowBoundsEnabled" value="false"/>
      <setting name="mapUnderscoreToCamelCase" value="false"/>
      <setting name="localCacheScope" value="SESSION"/>
      <setting name="jdbcTypeForNull" value="OTHER"/>
      <setting name="lazyLoadTriggerMethods" value="equals,clone,hashCode,toString"/>
    </settings>

##2.3 类型别名（typeAliases）
> 类型别名是为 Java 类型设置一个短的名字。它只和 XML 配置有关，存在的意义仅在于用来减少类完全限定名的冗余。例如:
    
    <typeAliases>
      <typeAlias alias="Author" type="domain.blog.Author"/>
      <typeAlias alias="Blog" type="domain.blog.Blog"/>
      <typeAlias alias="Comment" type="domain.blog.Comment"/>
      <typeAlias alias="Post" type="domain.blog.Post"/>
      <typeAlias alias="Section" type="domain.blog.Section"/>
      <typeAlias alias="Tag" type="domain.blog.Tag"/>
    </typeAliases>

> 当这样配置时，Blog可以用在任何使用domain.blog.Blog的地方。

> 也可以指定一个包名，MyBatis 会在包名下面搜索需要的 Java Bean，比如:

    <typeAliases>
      <package name="domain.blog"/>
    </typeAliases>
> 每一个在包 domain.blog 中的 Java Bean，在没有注解的情况下，会使用 Bean 的首字母小写的非限定类名来作为它的别名。 比如 domain.blog.Author 的别名为 author；若有注解，则别名为其注解值。看下面的例子：
    
        @Alias("author")
        public class Author {
            ...
        }

Mybatis已经为许多常见的 Java 类型内建了相应的类型别名。它们都是大小写不敏感的，需要注意的是**由基本类型名称重复导致的特殊处理**

|----|-----|
|别名|	映射的类型|
|_byte|	byte|
|_long|	long
|_short|	short
|_int|	int
|_integer|	int
|_double	|double
|_float|	float
|_boolean|	boolean
|string|	String
|byte|Byte
|long|	Long
|short|	Short
|int|	Integer
|integer|	Integer
|double|	Double
|float|	Float
|boolean|	Boolean
|date|Date
|decimal|	BigDecimal
|bigdecimal|	BigDecimal
|object|	Object
|map|Map
|hashmap|HashMap
|list|	List
|arraylist|	ArrayList
|collection|	Collection
|iterator	|Iterator

##2.4 类型处理器（typeHandlers）

> 无论是 MyBatis 在预处理语句（PreparedStatement）中设置一个参数时，还是从结果集中取出一个值时， 都会用类型处理器将获取的值以合适的方式转换成 Java 类型。

###2.4.1 默认的类型处理器：
|----|----|----|
|类型处理器	|Java 类型|	JDBC 类型|
|BooleanTypeHandler|	java.lang.Boolean, boolean|	数据库兼容的 BOOLEAN|
|ByteTypeHandler|	java.lang.Byte, byte|	数据库兼容的 NUMERIC 或 BYTE
|ShortTypeHandler|	java.lang.Short, short|	数据库兼容的 NUMERIC 或 SHORT INTEGER
|IntegerTypeHandler	|java.lang.Integer, int	|数据库兼容的 NUMERIC 或 INTEGER
|LongTypeHandler|java.lang.Long, long|	数据库兼容的 NUMERIC 或 LONG INTEGER
|FloatTypeHandler|	java.lang.Float, float|	数据库兼容的 NUMERIC 或 FLOAT
|DoubleTypeHandler	|java.lang.Double, double|	数据库兼容的 NUMERIC 或 DOUBLE
|BigDecimalTypeHandler	|java.math.BigDecimal|	数据库兼容的 NUMERIC 或 DECIMAL
|StringTypeHandler	|java.lang.String	|CHAR, VARCHAR
|ClobTypeHandler	|java.lang.String	|CLOB, LONGVARCHAR
|NStringTypeHandler	|java.lang.String|	NVARCHAR, NCHAR
|NClobTypeHandler	|java.lang.String	|NCLOB
|ByteArrayTypeHandler	|byte[]	|数据库兼容的字节流类型
|BlobTypeHandler|	byte[]|	BLOB, LONGVARBINARY
|DateTypeHandler|	java.util.Date|	TIMESTAMP
|DateOnlyTypeHandler|	java.util.Date|	DATE
|TimeOnlyTypeHandler|	java.util.Date|	TIME
|SqlTimestampTypeHandler|java.sql.Timestamp|	TIMESTAMP
|SqlDateTypeHandler|	java.sql.Date|	DATE
|SqlTimeTypeHandler|	java.sql.Time|	TIME
|ObjectTypeHandler|	Any	|   OTHER 或未指定类型
|EnumTypeHandler|	Enumeration Type|	VARCHAR-任何兼容的字符串类型，存储枚举的名称（而不是索引）
|EnumOrdinalTypeHandler|Enumeration Type|	任何兼容的 NUMERIC 或 DOUBLE 类型，存储枚举的索引（而不是名称）

###2.4.2 自定义类型处理器
> 你可以重写类型处理器或创建你自己的类型处理器来处理不支持的或非标准的类型:

 具体做法为：实现` org.apache.ibatis.type.TypeHandler` 接口， 或继承一个很便利的类 `org.apache.ibatis.type.BaseTypeHandler`， 然后可以选择性地将它映射到一个 JDBC 类型:

    <!-- mybatis-config.xml -->
    <typeHandlers>
      <typeHandler handler="org.mybatis.example.ExampleTypeHandler"/>
    </typeHandlers>

###2.4.3 类型处理器的使用
> 
> 通过类型处理器的泛型，MyBatis 可以得知该类型处理器处理的 Java 类型，不过这种行为可以通过两种方法改变：


1. 在类型处理器的配置元素（typeHandler element）上增加一个 javaType 属性（比如：javaType="String"）；
在类型处理器的类上（TypeHandler class）增加一个 @MappedTypes 注解来指定与其关联的 Java 类型列表。 如果在 javaType 属性中也同时指定，则注解方式将被忽略。
可以通过两种方式来指定被关联的 JDBC 类型：


1. 在类型处理器的配置元素上增加一个 javaType 属性（比如：javaType="VARCHAR"）；
在类型处理器的类上（TypeHandler class）增加一个 @MappedJdbcTypes 注解来指定与其关联的 JDBC 类型列表。 如果在 javaType 属性中也同时指定，则注解方式将被忽略

###2.4.4 对象工厂（objectFactory）

1. MyBatis 每次创建结果对象的新实例时，它都会使用一个对象工厂（ObjectFactory）实例来完成。
 
1. 默认的对象工厂需要做的仅仅是实例化目标类，要么通过默认构造方法，要么在参数映射存在的时候通过参数构造方法来实例化。 

1. 如果想覆盖对象工厂的默认行为，则可以通过创建自己的对象工厂来实现

           // ExampleObjectFactory.java
            public class ExampleObjectFactory extends DefaultObjectFactory {
              public Object create(Class type) {
                return super.create(type);
              }
              public Object create(Class type, List constructorArgTypes, List constructorArgs) {
                return super.create(type, constructorArgTypes, constructorArgs);
              }
              public void setProperties(Properties properties) {
                super.setProperties(properties);
              }
              public  boolean isCollection(Class type) {
                return Collection.class.isAssignableFrom(type);
              }}

            <!-- mybatis-config.xml -->
            <objectFactory type="org.mybatis.example.ExampleObjectFactory">
              <property name="someProperty" value="100"/>
            </objectFactory>



1. ObjectFactory 接口很简单，它包含两个创建用的方法，一个是处理默认构造方法的，另外一个是处理带参数的构造方法的。
2.  最后，setProperties 方法可以被用来配置 ObjectFactory，在初始化你的 ObjectFactory 实例后， objectFactory 元素体中定义的属性会被传递给 setProperties 方法。

##2.5 插件（plugins）

###2.5.1 四种基础插件

MyBatis 允许你在已映射语句执行过程中的某一点进行拦截调用。默认情况下，MyBatis 允许使用插件来拦截的方法调用包括：



1. Executor (update, query, flushStatements, commit, rollback, getTransaction, close, isClosed)


1. ParameterHandler (getParameterObject, setParameters)


1. ResultSetHandler (handleResultSets, handleOutputParameters)


1. StatementHandler (prepare, parameterize, batch, update, query)

通过 MyBatis 提供的强大机制，使用插件是非常简单的，只需实现 Interceptor 接口，并指定了想要拦截的方法签名即可：

            // ExamplePlugin.java
            @Intercepts({@Signature(
              type= Executor.class,
              method = "update",
              args = {MappedStatement.class,Object.class})})
            public class ExamplePlugin implements Interceptor {
              public Object intercept(Invocation invocation) throws Throwable {
                return invocation.proceed();
              }
              public Object plugin(Object target) {
                return Plugin.wrap(target, this);
              }
              public void setProperties(Properties properties) {
              }
            }
        <!-- mybatis-config.xml -->
        <plugins>
          <plugin interceptor="org.mybatis.example.ExamplePlugin">
            <property name="someProperty" value="100"/>
          </plugin>
        </plugins> 
上面的插件将会拦截在 Executor 实例中所有的 "update" 方法调用， 这里的 Executor 是负责执行低层映射语句的内部对象。

###2.5.2 NOTE 覆盖配置类

- 除了用插件来修改 MyBatis 核心行为之外，还可以通过完全覆盖配置类来达到目的。


- 只需继承后覆盖其中的每个方法，再把它传递到 sqlSessionFactoryBuilder.build(myConfig) 方法即可。


- 再次重申，这可能会严重影响 MyBatis 的行为，务请慎之又慎

##2.6 配置环境（environments）
###2.6.1 基础配置

- MyBatis 可以配置成适应多种环境，这种机制有助于将 SQL 映射应用于多种数据库之中， 

- 现实情况下有多种理由需要这么做。例如，开发、测试和生产环境需要有不同的配置；

- 或者共享相同 Schema 的多个生产数据库， 想使用相同的 SQL 映射。许多类似的用例。

- **不过要记住：尽管可以配置多个环境，每个 SqlSessionFactory 实例只能选择其一**

环境元素定义了如何配置环境：

        <environments default="development">
          <environment id="development">
            <transactionManager type="JDBC">
              <property name="..." value="..."/>
            </transactionManager>
            <dataSource type="POOLED">
              <property name="driver" value="${driver}"/>
              <property name="url" value="${url}"/>
              <property name="username" value="${username}"/>
              <property name="password" value="${password}"/>
            </dataSource>
          </environment>
        </environments>

**关键点:**



1. 默认的环境 ID（比如:default="development"）。


1. 每个 environment 元素定义的环境 ID（比如:id="development"）。


1. 事务管理器的配置（比如:type="JDBC"）。


1. 数据源的配置（比如:type="POOLED"）。


1. 默认的环境和环境 ID 是一目了然的。随你怎么命名，只要保证默认环境要匹配其中一个环境ID

###2.6.2 事务管理器（transactionManager）

在 MyBatis 中有两种类型的事务管理器（也就是 type="[JDBC|MANAGED]"）：



1. JDBC – 这个配置就是直接使用了 JDBC 的提交和回滚设置，它依赖于从数据源得到的连接来管理事务范围。


1. MANAGED – 这个配置几乎没做什么。它从来不提交或回滚一个连接，而是让容器来管理事务的整个生命周期（比如 JEE 应用服务器的上下文）。 默认情况下它会关闭连接，然而一些容器并不希望这样，因此需要将 closeConnection 属性设置为 false 来阻止它默认的关闭行为。例如:

        <transactionManager type="MANAGED">
          <property name="closeConnection" value="false"/>
        </transactionManager>

提示：如果你正在使用 Spring + MyBatis，则没有必要配置事务管理器， 因为 Spring 模块会使用自带的管理器来覆盖前面的配置。

这两种事务管理器类型都不需要任何属性。它们不过是类型别名，换句话说，你可以使用 TransactionFactory 接口的实现类的完全限定名或类型别名代替它们。

###2.6.3 数据源（dataSource）
####2.6.3.1 UNPOOLED
这个数据源的实现只是每次被请求时打开和关闭连接。虽然一点慢，它对在及时可用连接方面没有性能要求的简单应用程序是一个很好的选择。 不同的数据库在这方面表现也是不一样的，所以对某些数据库来说使用连接池并不重要，这个配置也是理想的。UNPOOLED 类型的数据源仅仅需要配置以下 5 种属性：

driver – 这是 JDBC 驱动的 Java 类的完全限定名（并不是JDBC驱动中可能包含的数据源类）。
url – 这是数据库的 JDBC URL 地址。
username – 登录数据库的用户名。
password – 登录数据库的密码。
defaultTransactionIsolationLevel – 默认的连接事务隔离级别。
作为可选项，你也可以传递属性给数据库驱动。要这样做，属性的前缀为"driver."，例如：

driver.encoding=UTF8
这将通过DriverManager.getConnection(url,driverProperties)方法传递值为 UTF8 的 encoding 属性给数据库驱动。

####2.6.3.2 POOLED

- 这种数据源的实现利用"池"的概念将 JDBC 连接对象组织起来，避免了创建新的连接实例时所必需的初始化和认证时间。 这是一种使得并发 Web 应用快速响应请求的流行处理方式。


除了上述提到 UNPOOLED 下的属性外，会有更多属性用来配置 POOLED 的数据源：

|----|-----|----|
|属性|属性值|默认值|
|poolMaximumActiveConnections | 在任意时间可以存在的活动（也就是正在使用）连接数量|10
|poolMaximumIdleConnections | 任意时间可能存在的空闲连接数|
|poolMaximumCheckoutTime | 在被强制返回之前，池中连接被检出（checked out）时间|20000 毫秒（即 20 秒）
|poolTimeToWait | 这是一个底层设置，如果获取连接花费的相当长的时间，它会给连接池打印状态日志并重新尝试获取一个连接（避免在误配置的情况下一直安静的失败）|20000 毫秒（即 20 秒）|
|poolPingQuery | 发送到数据库的侦测查询，用来检验连接是否处在正常工作秩序中并准备接受请求|默认是"NO PING QUERY SET"，这会导致多数数据库驱动失败时带有一个恰当的错误消息。
|poolPingEnabled |是否启用侦测查询。若开启，也必须使用一个可执行的 SQL 语句设置 poolPingQuery 属性（最好是一个非常快的 SQL）|false。
|poolPingConnectionsNotUsedFor | 配置 poolPingQuery 的使用频度。这可以被设置成匹配具体的数据库连接超时时间，来避免不必要的侦测|0（即所有连接每一时刻都被侦测 — 当然仅当 poolPingEnabled 为 true 时适用）


####2.6.3.3 JNDI


- 这个数据源的实现是为了能在如 EJB 或应用服务器这类容器中使用，容器可以集中或在外部配置数据源，然后放置一个 JNDI 上下文的引用。

这种数据源配置只需要两个属性：

|----|-----|
|属性|属性值|
|initial_context | 这个属性用来在 InitialContext 中寻找上下文（即，initialContext.lookup(initial_context)）。这是个可选属性，如果忽略，那么 data_source 属性将会直接从 InitialContext 中寻找|
|data_source | 这是引用数据源实例位置的上下文的路径。提供了 initial_context 配置时会在其返回的上下文中进行查找，没有提供时则直接在 InitialContext 中查找|

和其他数据源配置类似，可以通过添加前缀"env."直接把属性传递给初始上下文。比如：

    env.encoding=UTF8

##2.7 databaseIdProvider


- MyBatis 可以根据不同的数据库厂商执行不同的语句，这种多厂商的支持是基于映射语句中的 databaseId 属性。 

- MyBatis 会加载不带 databaseId 属性和带有匹配当前数据库 databaseId 属性的所有语句。 如果同时找到带有 

- databaseId 和不带 databaseId 的相同语句，则后者会被舍弃。 为支持多厂商特性只要像下面这样在 mybatis-

config.xml 文件中加入 databaseIdProvider 即可：
    
    <databaseIdProvider type="DB_VENDOR">
      <property name="SQL Server" value="sqlserver"/>
      <property name="DB2" value="db2"/>        
      <property name="Oracle" value="oracle" />
    </databaseIdProvider>   

##2.8 映射器（mappers）
 

1. MyBatis 的行为已经由上述元素配置完了，需要定义 SQL 映射语句

1. 但是首先我们需要告诉 MyBatis 到哪里去找到这些语句。

1. Java 在自动查找这方面没有提供一个很好的方法，所以最佳的方式是告诉 MyBatis 到哪里去找映射文件。

1. 你可以使用相对于类路径的资源引用， 或完全限定资源定位符（包括 file:/// 的 URL），或类名和包名等



例如下列四种配置：

        <!-- Using classpath relative resources -->
        <mappers>
          <mapper resource="org/mybatis/builder/AuthorMapper.xml"/>
          <mapper resource="org/mybatis/builder/BlogMapper.xml"/>
          <mapper resource="org/mybatis/builder/PostMapper.xml"/>
        </mappers>

        <!-- Using url fully qualified paths -->
        <mappers>
          <mapper url="file:///var/mappers/AuthorMapper.xml"/>
          <mapper url="file:///var/mappers/BlogMapper.xml"/>
          <mapper url="file:///var/mappers/PostMapper.xml"/>
        </mappers>

        <!-- Using mapper interface classes -->
        <mappers>
          <mapper class="org.mybatis.builder.AuthorMapper"/>
          <mapper class="org.mybatis.builder.BlogMapper"/>
          <mapper class="org.mybatis.builder.PostMapper"/>
        </mappers>

        <!-- Register all interfaces in a package as mappers -->
        <mappers>
          <package name="org.mybatis.builder"/>
        </mappers>


----------
#第三章  XML映射文件
----------
 

- MyBatis 的真正强大在于它的映射语句，映射器的 XML 文件就显得相对简单。


- 如果拿它跟具有相同功能的 JDBC 代码进行对比，你会立即发现省掉了将近 95% 的代码。


- MyBatis 就是针对 SQL 构建的，并且比普通的方法做的更好。

##3.1 顶级元素

- cache –  给定命名空间的缓存配置。


- cache-ref –  其他命名空间缓存配置的引用。


- resultMap –  是最复杂也是最强大的元素，用来描述如何从数据库结果集中来加载对象。


- sql –  可被其他语句引用的可重用语句块。


- insert –  映射插入语句


- update –  映射更新语句


- delete –  映射删除语句


- select –  映射查询语句

##3.1 select
select全部属性：

     <select
      id="selectPerson"
      parameterType="int"
      parameterMap="deprecated"
      resultType="hashmap"
      resultMap="personResultMap"
      flushCache="false"
      useCache="true"
      timeout="10000"
      fetchSize="256"
      statementType="PREPARED"
      resultSetType="FORWARD_ONLY">  
      SELECT * FROM PERSON WHERE ID = #{id}
    </select>  

属性一栏:

|----|----|
|属性	|描述|
|id|	在命名空间中唯一的标识符，可以被用来引用这条语句。
|parameterType|	将会传入这条语句的参数类的完全限定名或别名。这个属性是可选的，因为 MyBatis 可以通过
 |TypeHandler |推断出具体传入语句的参数，默认值为 unset。
|resultType|	从这条语句中返回的期望类型的类的完全限定名或别名。注意如果是集合情形，那应该是集合可以包含的类型，而不能是集合本身。使用 resultType 或 resultMap，但不能同时使用。
|resultMap|	外部 resultMap 的命名引用。结果集的映射是 MyBatis 最强大的特性，对其有一个很好的理解的话，许多复杂映射的情形都能迎刃而解。使用 resultMap 或 resultType，但不能同时使用。
|flushCache|	将其设置为 true，任何时候只要语句被调用，都会导致本地缓存和二级缓存都会被清空，默认值：false
|useCache|	将其设置为 true，将会导致本条语句的结果被二级缓存，默认值：对 select 元素为 true。
|timeout	|这个设置是在抛出异常之前，驱动程序等待数据库返回请求结果的秒数。默认值为 unset（依赖驱动）
|fetchSize|	这是尝试影响驱动程序每次批量返回的结果行数和这个设置值相等。默认值为 unset（依赖驱动）。
|statementType|	STATEMENT，PREPARED 或 CALLABLE 的一个。这会让 MyBatis 分别使用 StatementPreparedStatement 或 CallableStatement，默认值：PREPARED。
|resultSetType|	FORWARD_ONLY，SCROLL_SENSITIVE 或 SCROLL_INSENSITIVE 中的一个，默认值为 unset （依赖驱动）
|databaseId|	如果配置了 databaseIdProvider，MyBatis 会加载所有的不带 databaseId 或匹配当前 databaseId 的语句；如果带或者不带的语句都有，则不带的会被忽略。
|resultOrdered|	这个设置仅针对嵌套结果 select 语句适用：如果为 true，就是假设包含了嵌套结果集或是分组了，这样的话当返回一个主结果行的时候，就不会发生有对前面结果集的引用的情况。这就使得在获取嵌套的结果集的时候不至于导致内存不够用。默认值：false。
|resultSets	|这个设置仅对多结果集的情况适用，它将列出语句执行后返回的结果集并每个结果集给一个名称，名称是逗号分隔的

##3.2  insert, update 和 delete
数据变更语句 insert，update 和 delete 的实现非常接近：
    
    <insert
      id="insertAuthor"
      parameterType="domain.blog.Author"
      flushCache="true"
      statementType="PREPARED"
      keyProperty=""
      keyColumn=""
      useGeneratedKeys=""
      timeout="20">
    
    <update
      id="updateAuthor"
      parameterType="domain.blog.Author"
      flushCache="true"
      statementType="PREPARED"
      timeout="20">
    
    <delete
      id="deleteAuthor"
      parameterType="domain.blog.Author"
      flushCache="true"
      statementType="PREPARED"
      timeout="20">

属性一栏:

|----|----|
|属性	|描述|
|id|	命名空间中的唯一标识符，可被用来代表这条语句。
|parameterType|	将要传入语句的参数的完全限定类名或别名。这个属性是可选的，因为 MyBatis 可以通过 
|TypeHandler| 推断出具体传入语句的参数，默认值为 unset
|flushCache|	将其设置为 true，任何时候只要语句被调用，都会导致本地缓存和二级缓存都会被清空，默认值：true（对应插入、更新和删除语句）。
|timeout|	这个设置是在抛出异常之前，驱动程序等待数据库返回请求结果的秒数。默认值为 unset（依赖驱动）
|statementType|	STATEMENT，PREPARED 或 CALLABLE 的一个。这会让 MyBatis 分别使用 Statement，PreparedStatement 或 CallableStatement，默认值：PREPARED。
|useGeneratedKeys	|（仅对 insert 和 update 有用）这会令 MyBatis 使用 JDBC 的 getGeneratedKeys 方法来取出由数据库内部生成的主键（比如：像 MySQL 和 SQL Server 这样的关系数据库管理系统的自动递增字段），默认值：false。
|keyProperty|	（仅对 insert 和 update 有用）唯一标记一个属性，MyBatis 会通过 getGeneratedKeys 的返回值或者通过 insert 语句的 selectKey 子元素设置它的键值，默认：unset。如果希望得到多个生成的列，也可以是逗号分隔的属性名称列表。
|keyColumn|	（仅对 insert 和 update 有用）通过生成的键值设置表中的列名，这个设置仅在某些数据库（像 PostgreSQL）是必须的，当主键列不是表中的第一列的时候需要设置。如果希望得到多个生成的列，也可以是逗号分隔的属性名称列表。
|databaseId	|如果配置了 databaseIdProvider，MyBatis 会加载所有的不带 databaseId 或匹配当前 databaseId 的语句；如果带或者不带的语句都有，则不带的会被忽略。

示例:
    
    <insert id="insertAuthor">
      insert into Author (id,username,password,email,bio)
      values (#{id},#{username},#{password},#{email},#{bio})
    </insert>
    
    <update id="updateAuthor">
      update Author set
        username = #{username},
        password = #{password},
        email = #{email},
        bio = #{bio}
      where id = #{id}
    </update>
    
    <delete id="deleteAuthor">
      delete from Author where id = #{id}
    </delete>


##3.3 select key
使用selectKey 元素，Author 的 id 会被设置，然后插入语句会被调用。这给你了一个和数据库中来处理自动生成的主键类似的行为，避免了使 Java 代码变得复杂

###3.3.1 selectKey 元素描述

    <selectKey
      keyProperty="id"
      resultType="int"
      order="BEFORE"
      statementType="PREPARED">

###3.3.2 selectKey 的属性

|----|----|
|属性	|描述|
|keyProperty|	selectKey 语句结果应该被设置的目标属性。如果希望得到多个生成的列，也可以是逗号分隔的属性名称列表。
|keyColumn	|匹配属性的返回结果集中的列名称。如果希望得到多个生成的列，也可以是逗号分隔的属性名称列表。
|resultType|	结果的类型。MyBatis 通常可以推算出来，但是为了更加确定写上也不会有什么问题。MyBatis 允许任何简单类型用作主键的类型，包括字符串。如果希望作用于多个生成的列，则可以使用一个包含期望属性的 Object 或一个 Map。
|order	|这可以被设置为 BEFORE 或 AFTER。如果设置为 BEFORE，那么它会首先选择主键，设置 keyProperty 然后执行插入语句。如果设置为 AFTER，那么先执行插入语句，然后是 selectKey 元素 - 这和像 Oracle 的数据库相似，在插入语句内部可能有嵌入索引调用。
|statementType|	与前面相同，MyBatis 支持 STATEMENT，PREPARED 和 CALLABLE 语句的映射类型，分别代表 PreparedStatement 和 CallableStatement 类型

##3.4 SQL代码段
这个元素可以被用来定义可重用的 SQL 代码段，可以包含在其他语句中。它可以静态地(在加载阶段)参数化。不同的属性值可以在include实例中有所不同。 比如：

    <sql id="userColumns"> 
        ${alias}.id,${alias}.username,${alias}.password
    </sql>

这个 SQL 片段可以被包含在其他语句中，例如：

    <select id="selectUsers" resultType="map">
      select
        <include refid="userColumns"><property name="alias" value="t1"/></include>,
        <include refid="userColumns"><property name="alias" value="t2"/></include>
      from some_table t1
        cross join some_table t2
    </select>

属性值也可以用于 include refid 属性或 include 子句中的属性值，例如:

    <sql id="sometable">
      ${prefix}Table
    </sql>
    
    <sql id="someinclude">
      from
        <include refid="${include_target}"/>
    </sql>
    
    <select id="select" resultType="map">
      select
        field1, field2, field3
      <include refid="someinclude">
        <property name="prefix" value="Some"/>
        <property name="include_target" value="sometable"/>
      </include>
    </select>

##3.5 参数（Parameters）/OGNL语法
参数是 MyBatis 非常强大的元素，对于简单的做法，大概 90% 的情况参数都很少，比如：

    <select id="selectUsers" resultType="User">
      select id, username, password
      from users
      where id = #{id}
    </select>

上面的这个示例说明了一个非常简单的命名参数映射。参数类型被设置为 User，这样这个参数就可以被设置成任何内容。原生的类型或简单数据类型（比如整型和字符串）因为没有相关属性，它会完全用参数值来替代。然而，如果传入一个复杂的对象，行为就会有一点不同了。比如：

    <insert id="insertUser" parameterType="User">
      insert into users (id, username, password)
      values (#{id}, #{username}, #{password})
    </insert>

##3.6 字符串替换
默认情况下,使用#{}格式的语法会导致 MyBatis 创建预处理语句属性并安全地设置值（比如?）。这样做更安全，更迅速，通常也是首选做法，不过有时你只是想直接在 符SQL 语句中插入一个不改变的字串。比如，像 ORDER BY，你可以这样来使用：

    ORDER BY ${columnName}

以这种方式接受从用户输出的内容并提供给语句中不变的字符串是不安全的，**会导致潜在的 SQL 注入攻击，因此要么不允许用户输入这些字段，要么自行转义并检验**

##3.7 Result Maps

> 下面是个复杂的配置示例：

    <!-- Very Complex Result Map -->
    <resultMap id="detailedBlogResultMap" type="Blog">
      <constructor>
        <idArg column="blog_id" javaType="int"/>
      </constructor>
      <result property="title" column="blog_title"/>
      <association property="author" javaType="Author">
        <id property="id" column="author_id"/>
        <result property="username" column="author_username"/>
        <result property="password" column="author_password"/>
        <result property="email" column="author_email"/>
        <result property="bio" column="author_bio"/>
        <result property="favouriteSection" column="author_favourite_section"/>
      </association>
      <collection property="posts" ofType="Post">
        <id property="id" column="post_id"/>
        <result property="subject" column="post_subject"/>
        <association property="author" javaType="Author"/>
        <collection property="comments" ofType="Comment">
          <id property="id" column="comment_id"/>
        </collection>
        <collection property="tags" ofType="Tag" >
          <id property="id" column="tag_id"/>
        </collection>
        <discriminator javaType="int" column="draft">
          <case value="1" resultType="DraftPost"/>
        </discriminator>
      </collection>
    </resultMap>

> 
> 属性一览:

- constructor - 类在实例化时,用来注入结果到构造方法中

    idArg - ID 参数;标记结果作为 ID 可以帮助提高整体效能

    arg - 注入到构造方法的一个普通结果


- id – 一个 ID 结果;标记结果作为 ID 可以帮助提高整体效能


- result – 注入到字段或 JavaBean 属性的普通结果


- association – 一个复杂的类型关联;许多结果将包成这种类型

    嵌入结果映射 – 结果映射自身的关联,或者参考一个


- collection – 复杂类型的集

    嵌入结果映射 – 结果映射自身的集,或者参考一个

- discriminator – 使用结果值来决定使用哪个结果映射


- case – 基于某些值的结果映射

    嵌入结果映射 – 这种情形结果也映射它本身,因此可以包含很多相 同的元素,或者它可以参照一个外部的结果映射

**ResultMap property一览:**

|----|----|
|属性|描述|
|id	|此名称空间中的唯一标识符，可用于引用此结果映射。
|type|	一个完全特定的 Java 类名，或者一个类型别名(参见上表中的内置类型别名列表)。
|autoMapping|	如果存在，MyBatis 将启用或禁用这个 ResultMap 的自动操作。此属性覆盖全局​
|autoMappingBehavior​|默认值:未设置的。

----------
#第四章 动态SQL
----------


1. 动态 SQL 元素和使用 JSTL 或其他类似基于 XML 的文本处理器相似。


1. 在 MyBatis 之前的版本中,有很多的元素需要来了解。


1. MyBatis 3 大大提升了它们,现在用不到原先一半的元素就可以了。


1. MyBatis 采用功能强大的基于 OGNL 的表达式来消除其他元素

##4.1 if

    <select id="findActiveBlogLike"
         resultType="Blog">
      SELECT * FROM BLOG WHERE state = ‘ACTIVE’ 
      <if test="title != null">
        AND title like #{title}
      </if>
      <if test="author != null and author.name != null">
        AND author_name like #{author.name}
      </if>
    </select>

##4.2  choose, when, otherwise
    
    <select id="findActiveBlogLike"
         resultType="Blog">
      SELECT * FROM BLOG WHERE state = ‘ACTIVE’
      <choose>
        <when test="title != null">
          AND title like #{title}
        </when>
        <when test="author != null and author.name != null">
          AND author_name like #{author.name}
        </when>
        <otherwise>
          AND featured = 1
        </otherwise>
      </choose>
    </select>

##4.3 trim, where, set

    <select id="findActiveBlogLike"
         resultType="Blog">
      SELECT * FROM BLOG 
      WHERE 
      <if test="state != null">
        state = #{state}
      </if> 
      <if test="title != null">
        AND title like #{title}
      </if>
      <if test="author != null and author.name != null">
        AND author_name like #{author.name}
      </if>
    </select>

where 元素知道只有在一个以上的if条件有值的情况下才去插入"WHERE"子句。而且，若最后的内容是"AND"或"OR"开头的，where 元素也知道如何将他们去除。

如果 where 元素没有按正常套路出牌，我们还是可以通过自定义 trim 元素来定制我们想要的功能。比如，和 where 元素等价的自定义 trim 元素为：

    <trim prefix="WHERE" prefixOverrides="AND |OR ">
      ... 
    </trim>

prefixOverrides 属性会忽略通过管道分隔的文本序列（注意此例中的空格也是必要的）。它带来的结果就是所有在 prefixOverrides 属性中指定的内容将被移除，并且插入 prefix 属性中指定的内容。

    <update id="updateAuthorIfNecessary">
      update Author
        <set>
          <if test="username != null">username=#{username},</if>
          <if test="password != null">password=#{password},</if>
          <if test="email != null">email=#{email},</if>
          <if test="bio != null">bio=#{bio}</if>
        </set>
      where id=#{id}
    </update>

##4.4  foreach
foreach 元素的功能是非常强大的，它允许你指定一个集合，声明可以用在元素体内的集合项和索引变量。它也允许你指定开闭匹配的字符串以及在迭代中间放置分隔符:

    <select id="selectPostIn" resultType="domain.blog.Post">
      SELECT *
      FROM POST P
      WHERE ID in
      <foreach item="item" index="index" collection="list"
          open="(" separator="," close=")">
            #{item}
      </foreach>
    </select>

##4.5 bind
bind 元素可以从 OGNL 表达式中创建一个变量并将其绑定到上下文。比如：

    <select id="selectBlogsLike" resultType="Blog">
      <bind name="pattern" value="'%' + _parameter.getTitle() + '%'" />
      SELECT * FROM BLOG
      WHERE title LIKE #{pattern}
    </select>

##4.6 Multi-db vendor support
一个配置了"_databaseId"变量的 databaseIdProvider 对于动态代码来说是可用的，这样就可以根据不同的数据库厂商构建特定的语句。

比如下面的例子：

    <insert id="insert">
      <selectKey keyProperty="id" resultType="int" order="BEFORE">
        <if test="_databaseId == 'oracle'">
          select seq_users.nextval from dual
        </if>
        <if test="_databaseId == 'db2'">
          select nextval for seq_users from sysibm.sysdummy1"
        </if>
      </selectKey>
      insert into users values (#{id}, #{name})
    </insert>

##4.7 动态 SQL 中可插拔的脚本语言
MyBatis 从 3.2 开始支持可插拔的脚本语言，因此你可以在插入一种语言的驱动（language driver）之后来写基于这种语言的动态 SQL 查询。

可以通过实现下面接口的方式来插入一种语言：

        public interface LanguageDriver {
          ParameterHandler createParameterHandler(MappedStatement mappedStatement, Object parameterObject, BoundSql boundSql);
          SqlSource createSqlSource(Configuration configuration, XNode script, Class parameterType);
          SqlSource createSqlSource(Configuration configuration, String script, Class parameterType);
        }

一旦有了自定义的语言驱动，你就可以在 mybatis-config.xml 文件中将它设置为默认语言：

    <typeAliases>
      <typeAlias type="org.sample.MyLanguageDriver" alias="myLanguage"/>
    </typeAliases>
    <settings>
      <setting name="defaultScriptingLanguage" value="myLanguage"/>
    </settings>

除了设置默认语言，你也可以针对特殊的语句指定特定语言，这可以通过如下的 lang 属性来完成：

    <select id="selectBlog" lang="myLanguage">
      SELECT * FROM BLOG
    </select>

或者在你正在使用的映射中加上注解 @Lang 来完成：
    
        public interface Mapper {
          @Lang(MyLanguageDriver.class)
          @Select("SELECT * FROM BLOG")
          List selectBlog();
        }


----------
#第五章 Mybatis常见问题
----------
##5.1 MyBatis和ORM的区别

1. mybatis属于半orm，因为sql语句需要自己写。


1. 与其他比较标准的 ORM 框架（比如 Hibernate ）不同， mybatis 并没有将 java 对象与数据库关联起来，而是将 java 方法与 sql 语句关联起来，mybatis 允许用户充分利用数据库的各种功能，例如存储、视图、各种复杂的查询以及某些数据库的专有特性。


1. 自己写 sql 语句的好处是，可以根据自己的需求，写出最优的 sql 语句。灵活性高。但是，由于是自己写 sql 语句，导致平台可移植性不高。MySQL 语句和 Oracle 语句不同

##5.2 MyBatis实现分页功能


1.  原始方法，使用 limit，需要自己处理分页逻辑：

对于 mysql 数据库可以使用 limit ，如：

select * from table limit 5; --返回前5行

select * from table limit 0,5; --同上，返回前5行

select * from table limit 5,10; --返回6-15行
对于 oracle 数据库可以使用 rownum ，如：

--如：从表Sys_option（主键为sys_id)中从第10条记录开始检索20条记录，语句如下

SELECT * FROM (SELECT ROWNUM R,t1.* From Sys_option where rownum < 30 ) t2

Where t2.R >= 10


1.  拦截StatementHandler，其实质还是在最后生成limit语句


1. 使用PageHelper插件，这是目前比较常见的方法

##5.3 Mybatis四种分页方式

###5.3.1 数组分页

查询出全部数据，然后再list中截取需要的部分

###5.3.2 sql分页

###5.3.3 拦截器分页

###5.3.4 RowBounds分页

##5.4 MyBatis 中#{}和${}区别

1. `#{} `是预编译处理，像传进来的数据会加个" "（#将传入的数据都当成一个字符串，会对自动传入的数据加一个双引号）

1. ${} 就是字符串替换。直接替换掉占位符。$方式一般用于传入数据库对象，例如传入表名.

1. 使用 ${} 的话会导致 sql 注入。什么是 SQL 注入呢？比如 select * from user where id = ${value}


1. 如果非要用 ${} 的话，那要注意防止 SQL 注入问题，可以手动判定传入的变量，进行过滤，一般 SQL 注入会输入很长的一条 SQL 语句

## 5.5 MyBatis接口绑定的几种方式

###5.5.1 接口绑定有两种方式


1. 使用注解，在接口的方法上面添加@Select@Update等注解，里面写上对应的SQL语句进行SQL语句的绑定。


1. 通过映射文件xml方式进行绑定，指定xml映射文件中的namespace对应的接口的全路径名


##5.5.2 什么时候用注解绑定？什么时候用xml绑定？

1. 当SQL语句比较简单的时候，使用注解绑定就可以了

1. 当SQL语句比较复杂的话，使用xml方式绑定，一般用xml方式绑定比较多

##5.6 MyBatis动态sql语句(OGNL语法)


1. if

        <select id="select"
             resultType="Blog">
          SELECT * FROM BLOG
          WHERE state = ‘ACTIVE’
          <if test="title != null">
            AND title like #{title}
          </if>
        <if test="name!= null">
            AND name like #{title}
          </if>
        </select>


1. where

        <select id="select"
             resultType="Blog">
          SELECT * FROM BLOG
          <where>
              <if test="title != null">
                AND title like #{title}
              </if>
              <if test="name!= null">
                AND name like #{title}
              </if>
          <where>
        </select>

1. choose（when、otherwise） 
        
        <select id="findActiveBlogLike"
             resultType="Blog">
          SELECT * FROM BLOG WHERE state = ‘ACTIVE’
          <choose>
            <when test="title != null">
              AND title like #{title}
            </when>
            <when test="author != null and author.name != null">
              AND author_name like #{author.name}
            </when>
            <otherwise>
              AND featured = 1
            </otherwise>
          </choose>
        </select>


1. tirm

        prefix：前缀prefixoverride：去掉第一个and或者是or
        
        select * from test
        <trim prefix="WHERE" prefixoverride="AND丨OR">
              <if test="a!=null and a!=' '">AND a=#{a}<if>
              <if test="b!=null and b!=' '">AND a=#{a}<if>
        </trim>


1. set
        
        <update id="dynamicSetTest" parameterType="Blog">  
            update t_blog  
            <set>  
                <if test="title != null">  
                    title = #{title},  
                </if>  
                <if test="content != null">  
                    content = #{content},  
                </if>  
                <if test="owner != null">  
                    owner = #{owner}  
                </if>  
            </set>  
            where id = #{id}  
        </update> 


1. foreach

foreach主要用在构建in条件中

    <select id="dynamicForeachTest" resultType="Blog">  
            select * from t_blog where id in  
            <foreach collection="list" index="index" item="item" open="(" separator="," close=")">  
                #{item}  
            </foreach>  
        </select>  
open separator close

相当于是in （？，？，？）

 如果是个map怎么办

    <select id="dynamicForeach3Test" resultType="Blog">  
            select * from t_blog where title like "%"#{title}"%" and id in  
            <foreach collection="ids" index="index" item="item" open="(" separator="," close=")">  
                #{item}  
            </foreach>  
        </select>  

collection对应map的键，像这样

    List<Integer> ids = new ArrayList<Integer>();  
            ids.add(1);  
            ids.add(2);  
            ids.add(3);  
            ids.add(6);  
            ids.add(7);  
            ids.add(9);  
            Map<String, Object> params = new HashMap<String, Object>();  
            params.put("ids", ids);  

##5.7 MyBatis Like 模糊查询有几种方式

方式1：$  这种方式，简单，但是无法防止SQL注入，所以不推荐使用

    LIKE  '%${name}%'

方式2：#

    LIKE "%"#{name}"%"

方式3：字符串拼接

    AND name LIKE CONCAT(CONCAT('%',#{name},'%'))

方式4：bind标签

    <select id="searchStudents" resultType="com.example.entity.StudentEntity"
      parameterType="com.example.entity.StudentEntity">
      <bind name="pattern1" value="'%' + _parameter.name + '%'" />
      <bind name="pattern2" value="'%' + _parameter.address + '%'" />
      SELECT * FROM test_student
      <where>
       <if test="age != null and age != '' and compare != null and compare != ''">
        age
        ${compare}
        #{age}
       </if>
       <if test="name != null and name != ''">
        AND name LIKE #{pattern1}
       </if>
       <if test="address != null and address != ''">
        AND address LIKE #{pattern2}
       </if>
      </where>
      ORDER BY id
     </select>

方式5：java代码里写

param.setUsername("%CD%"); 在 java 代码中传参的时候直接写上

           <if test="username!=null"> AND username LIKE #{username}</if>

然后 mapper 里面直接写 #{} 就可以了

##5.8 通常一个mapper.XML对应一个DAO接口，DAO是否可以重载？

答：不能重载，方法名对应的 mapper.xml 文件里的一个 id，这个与方法名对应，系统会根据 namespace+id 找到对应的方法对应。

    Dao 接口即 Mapper 接口。接口的全限名，就是映射文件中的 namespace 的值；
    接口的方法名，就是映射文件中 Mapper 的 Statement 的 id 值；接口方法内的参数，就是传递给 sql 的参数。Mapper 接口是没有实现类的，当调用接口方法时，接口全限名+方法名拼接字符串作为 key 值，可唯一定位一个 MapperStatement。在 Mybatis 中，每一个、、、标签，都会被解析为一个MapperStatement 对象。

    举例：com.mybatis3.mappers.StudentDao.findStudentById，可以唯一找到 namespace 为 com.mybatis3.mappers.StudentDao 下面 id 为findStudentById 的 MapperStatement。

    Mapper 接口里的方法，是不能重载的，因为是使用 全限名+方法名 的保存和寻找策略。
    Mapper 接口的工作原理是 JDK 动态代理，Mybatis 运行时会使用 JDK动态代理为 Mapper 接口生成代理对象 proxy，代理对象会拦截接口方法，转而执行 MapperStatement 所代表的 sql，然后将 sql 执行结果返回。

##5.9 MyBatis映射文件中A标签引用B标签，如果B标签在A的后面定义，可以吗？

虽然 Mybatis 解析 Xml 映射文件是按照顺序解析的，但是，被引用的 B 标签依然可以定义在任何地方，Mybatis 都可以正确识别。

原理：
Mybatis 解析 A 标签时，发现引用了 B 标签，未解析到 B 标签，此时会把 A 标签标记为未解析状态；

继续解析下面内容，把剩下解析完之后，再解析标记为未解析的标签；

此时已解析到 B 标签，此时再解析A标签时，B标签已经存在，A 标签也就顺利解析完成

##5.10 MyBatis是否可以映射到枚举类
Mybatis 可以映射枚举类。

不单可以映射枚举类，Mybatis 可以映射任何对象到表的一列上。

映射方式为自定义一个 TypeHandler ，实现 TypeHandler 的 ​setParameter()​ 和 ​getResult()​ 接口方法。 

TypeHandler 有两个作用，一是完成从 javaType 至 jdbcType 的转换，二是完成 jdbcType 至 javaType 的转换，体现为 ​setParameter() ​和 ​getResult()​ 两个方法，分别代表设置 sql 问号占位符参数和获取列查询结果。

##5.11 MyBatis如何获取自动生成的主键id

MySQL：Mapper 文件 insert 语句设置    

    useGeneratedKeys="true" keyProperty="id"
 

Oracle：Mapper 文件 insert 语句增加
    
    <selectKey keyProperty="id" order="BEFORE" resultType="Integer">
     
        select xxx_SEQ.nextval from dual
     
    </selectKey>

##5.12 MyBatis 传递多个参数
方法一:使用map接口传递参数
    
接口:

    public List<Role> findRolesByMap(Map<String, Object> parameterMap);

xml配置：

    <select id="findRolesByMap" parameterType="map" resultType="role">
        select id, role_name as roleName,
         note from t_role where role_name like concat('%', #{roleName}, '%') and note like concat('%', #{note}, '%')
    </select>
    
方法二:使用注解传递多个参数
　
接口:

    public List<Role> findRolesByAnnotation(@Param("roleName") String rolename, @Param("note") String note);　

xml配置：

    <select id="findRolesByAnnotation" resultType="role">
        select id, role_name as roleName, 
        note from t_role where role_name like concat('%', #{roleName}, '%') and note like concat('%', #{note}, '%')
    </select>

方法三:通过Java Bean传递多个参数

接口:

    public List<Role> findRolesByBean(RoleParams roleParam);

xml配置：

    <select id="findRolesByBean" parameterType="com.xc.pojo.RoleParams" resultType="role">
        select id, role_name as roleName, 
            note from t_role where role_name like concat('%', #{roleName}, '%') and note like concat('%', #{note}, '%')
    </select>

方法四:混合使用　

接口:

    public List<Role> findByMix(@Param("params") RoleParams roleParams, @Param("page") PageParam PageParam);　

xml配置：

    <select id="findByMix" resultType="role">
        select id, role_name as roleName, note from t_role
        where role_name like concat('%', #{params.roleName}, '%') and 
        note like concat('%', #{params.note}, '%') limit #{page.start}, #{page.limit}
    </select>

##5.13 MyBatis缓存机制

缓存机制减轻数据库压力，提高数据库性能

mybatis的缓存分为两级：一级缓存、二级缓存

###5.13.1 一级缓存：
一级缓存为 ​sqlsesson​ 缓存，缓存的数据只在 SqlSession 内有效。在操作数据库的时候需要先创建 SqlSession 会话对象，在对象中有一个 HashMap 用于存储缓存数据，此 HashMap 是当前会话对象私有的，别的 SqlSession 会话对象无法访问。

具体流程：

第一次执行 select 完毕会将查到的数据写入 SqlSession 内的 HashMap 中缓存起来

第二次执行 select 会从缓存中查数据，如果 select 同传参数一样，那么就能从缓存中返回数据，不用去数据库了，从而提高了效率

注意：



1. 如果 SqlSession 执行了 DML 操作（insert、update、delete），并 commit 了，那么 mybatis 就会清空当前 SqlSession 缓存中的所有缓存数据，这样可以保证缓存中的存的数据永远和数据库中一致，避免出现差异


1. 当一个 SqlSession 结束后那么他里面的一级缓存也就不存在了， mybatis 默认是开启一级缓存，不需要配置


1.  mybatis 的缓存是基于 [namespace:sql语句:参数] 来进行缓存的，意思就是， SqlSession 的 HashMap 存储缓存数据时，是使用 [namespace:sql:参数] 作为 key ，查询返回的语句作为 value 保存的

###5.13.2 二级缓存：
二级缓存是​ mapper​ 级别的缓存，也就是同一个 namespace 的 mapper.xml ，当多个 SqlSession 使用同一个 Mapper 操作数据库的时候，得到的数据会缓存在同一个二级缓存区域

二级缓存默认是没有开启的。需要在 setting 全局参数中配置开启二级缓存

开启二级缓存步骤：

1. ​conf.xml​ 配置全局变量开启二级缓存

    <settings>
        <setting name="cacheEnabled" value="true"/>默认是false：关闭二级缓存
    <settings>


1. 在​ userMapper.xml ​中配置

          <cache eviction="LRU" flushInterval="60000" size="512" readOnly="true"/>

当前mapper下所有语句开启二级缓存

这里配置了一个 LRU 缓存，并每隔60秒刷新，最大存储512个对象，而返回的对象是只读的

若想禁用当前​select​语句的二级缓存，添加 ​useCache="false"​修改如下：

    <select id="getCountByName" parameterType="java.util.Map" resultType="INTEGER" statementType="CALLABLE" useCache="false">
具体流程：

1.当一个​ sqlseesion ​执行了一次​ select​ 后，在关闭此​ session​ 的时候，会将查询结果缓存到二级缓存

2.当另一个​ sqlsession ​执行​ select​ 时，首先会在他自己的一级缓存中找，如果没找到，就回去二级缓存中找，找到了就返回，就不用去数据库了，从而减少了数据库压力提高了性能

注意:

1、如果 ​SqlSession​ 执行了 DML 操作​（insert、update、delete）​，并 ​commit​ 了，那么 ​mybatis​ 就会清空当前​ mapper​ 缓存中的所有缓存数据，这样可以保证缓存中的存的数据永远和数据库中一致，避免出现差异

2、​ mybatis​ 的缓存是基于​ [namespace:sql语句:参数] ​来进行缓存的，意思就是，​SqlSession​ 的 ​HashMap​ 存储缓存数据时，是使用 ​[namespace:sql:参数] ​作为 ​key​ ，查询返回的语句作为 ​value​ 保存的。



