Spring是通过NameSpaceHandler来解析配置文件中的标签的。
for (Method method : instance.getClass().getMethods()) { 	//获取对象的所有方法
	method.getParameterTypes().length; 											//获取方法参数数量
	Modifier.isPublic(method.getModifiers());								//获取方法是否是public
}

List twoList = Collections.unmodifiableList(oneList);	//一个不可修改的List

负载均衡【LoadBalance.java】：
	类注解@SPI 说明可以基于 Dubbo 的扩展机制进行自定义的负责均衡算法实现，默认是随机算法；
	方法注解@Adaptive 说明能够生成设配方法；
	RandomLoadBalance: 随机访问策略，按权重设置随机概率，是默认策略
	
dubbo的扩展机制和java的SPI机制非常相似，但是又增加了如下功能：
1 可以方便的获取某一个想要的扩展实现，java的SPI机制就没有提供这样的功能
2 对于扩展实现IOC依赖注入功能：
	举例来说：接口A，实现者A1、A2。接口B，实现者B1、B2。
	现在实现者A1含有setB()方法，会自动注入一个接口B的实现者，此时注入B1还是B2呢？都不是，而是注入一个动态生成的接口B的实现者B$Adpative，该实现者能够根据参数的不同，自动引用B1或者B2来完成相应的功能
3 对扩展采用装饰器模式进行功能增强，类似AOP实现的功能
	
	
	
Spring可扩展Schema:
	1.设计配置属性和 JavaBean
		com.alibaba.dubbo.config.ApplicationConfig.java
	2.编写 XSD 文件
		dubbo-config/dubbo-config-spring/src/main/resources/META-INF/dubbo.xsd
	3.编写 NamespaceHandler 和 BeanDefinitionParser 完成解析工作
		com.alibaba.dubbo.config.spring.schema.DubboNamespaceHandler.java
			com.alibaba.dubbo.config.ApplicationConfig.java
			com.alibaba.dubbo.config.ModuleConfig.java
			...
		com.alibaba.dubbo.config.spring.schema.DubboBeanDefinitionParser.java
	4.编写 spring.handlers 和 spring.schemas 串联起所有部件
		dubbo-config/dubbo-config-spring/src/main/resources/META-INF/spring.handlers
		dubbo-config/dubbo-config-spring/src/main/resources/META-INF/spring.schemas
	5.在 Bean 文件中应用
		dubbo-demo/dubbo-demo-provider/src/main/resources/META-INF/spring/dubbo-demo-provider.xml
			<dubbo:application name="demo-provider" owner="programmer" organization="dubbox"/>

			
1. com.alibaba.dubbo.monitor.simple.SimpleMonitor.java:
	public static void main(String[] args) {
		com.alibaba.dubbo.container.Main.main(args);
	}
		
2. com.alibaba.dubbo.common.extension.ExtensionLoader.java:
	/**
   * 返回缺省的扩展点名，如果没有设置缺省则返回<code>null</code>。
   */
  public String getDefaultExtensionName() {
    getExtensionClasses();
    return cachedDefaultName;
  }
	
	
	

/** edu-service-user **/
//DubboProvider.java
	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
	context.start();
//spring-context.xml => dubbo-provider.xml => spring-mybatis.xml
<dubbo:service interface="wusc.edu.facade.user.service.PmsUserFacade" ref="pmsUserFacade" />
//PmsUserFacadeImpl.java	@Service("pmsUserFacade")		普通service


dubbo://10.68.19.135:20880/wusc.edu.facade.user.service.PmsUserFacade?anyhost=true&application=gw-service-user&dubbo=2.5.3&interface=wusc.edu.facade.user.service.PmsUserFacade&methods=updateUserPwd,update,listPage,getById,findUserByUserNo,deleteUserById,create&pid=1732&side=provider&timestamp=1481589840566