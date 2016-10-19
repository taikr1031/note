JAVA环境变量：
JAVA_HOME："C:\Program Files\Java\jdk1.6.0_29"
PATH：在“变量值”文本框的起始位置添加“%JAVA_HOME%\bin;”
CLASSPATH：在“变量值”文本框的起始位置添加“.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;”

动态列转行录入：whcyit-payment   com.whcyit.tobacco.payment.salaryofyear.model.PerforSalaryBase.java

Map<String, Object> params = ConstructUtils.map("parent.id", null, "createdBy", personId);

Map<String, Object> paramMap
for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
	setParam(entry.getKey(), entry.getValue());
}

并发随机数：double u = ThreadLocalRandom.current().nextDouble();

//  Ibatis分页（用于非DB2数据库分页）
public PaginationSupport<Map> query(Map<String, Object> map, int pageNum) throws SQLException {
	int totalCount = (Integer) sqlMapClient.queryForObject("Record.queryCount", map);
	int minResult =  totalCount < ((pageNum -1) * 20) ? totalCount : ((pageNum -1) * 20);
	int maxResult =  totalCount < ((pageNum) * 20) ? totalCount : ((pageNum) * 20);
	ListIterator<Map> listIterator = sqlMapClient.queryForList("Record.query", map, minResult, maxResult).listIterator(minResult);
	List<Map> list = new ArrayList<Map>();
	for (Iterator<Map> iterator = listIterator; iterator.hasNext();) {
		Map vo = (Map) iterator.next();
		list.add(vo);
	}
	PaginationSupport ps = new PaginationSupport(pageNum, 20, totalCount);
	ps.setItems(list);
	ps.setTotalCount(totalCount);
	return ps;
}
	
public void initCompanySystemParamValue() {
		ClassPathResource cr = new ClassPathResource("/client.properties"); // 会重新加载spring框架
		Properties pros = new Properties();
		Map<String, String> proxyParamMap = new HashMap<String, String>();
		try {
			pros.load(cr.getInputStream());
			companySystemParamValueService.delete("11421201", "04", "0401");
			// 银行结算参数-全省集中
			proxyParamMap.put("BANK_SERVER_NAME",
					saveCompanySystemParamValue(companySystemParamValueService, "BANK_SERVER_NAME", (String) pros.get("tcp.server"), "04", "0401"));
		} catch (IOException ex) {
			Loggers.business.info("资源文件不存在");
		}
	}
<-- IO,File -->
//输入流或文件写入文件
InputStream ins = new FileInputStream(new File("d:/JH1421140020110121"));
Writer write = new FileWriter(new File("d:/JH1421140020110121==="));
IOUtils.copy(ins, write);
write.close();  
ins.close();  

// 读取 properties 文件
public void initCompanySystemParamValue() {
	ClassPathResource cr = new ClassPathResource("/client.properties"); // 会重新加载spring框架
	Properties pros = new Properties();
	try {
		pros.load(cr.getInputStream());
		System.out.println((String) pros.get("tcp.server"));
	} catch (IOException ex) {
		Loggers.business.info("资源文件不存在");
	}
}


// List 循环删除
for (Iterator iterator = details.iterator(); iterator.hasNext();) {
	FlowInstanceDetail flowInstanceDetail = (FlowInstanceDetail) iterator.next();
	iterator.remove();
}


List<User> users = getPersistenceManager().findBy(User.class, "name", userName);
if(users.iterator().hasNext()) 
	result = users.iterator().next();


long long = NumberUtils.toLong(String str)

for(int i=0,len=list.size();i<len;i++)

//获得当前时间戳
System.out.println(System.currentTimeMillis()); //1356622080064
System.out.println(new Timestamp(new Date().getTime()).toString()); //2012-12-27 23:28:00.066

//通过时间字符串获得时间
String dateStr = "2012-01-01 11:11:11";
DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = DateUtil.newDate(dateStr);
System.out.println(df.format(date)); //"2012-01-01 00:00:00"
//获得当前日期字符串
System.out.println(DateUtil.nowDate()); //“2012-01-01”

Calendar cal = Calendar.getInstance();
cal.set(Calendar.MONTH, MapUtils.getIntValue(params, "startMonth") - 1);
cal.add(Calendar.MONTH, -3);
params.put("year", cal.get(Calendar.YEAR));
params.put("startMonth", cal.get(Calendar.MONTH) + 1);
    
//获得当前时间减6个月的日期时间字符串
String dateTime = DateFormatUtils.format(DateUtils.addMonths(new Date(), -6), "yyyy-MM-dd HH:mm:ss");

//List转换Array
List<String> list = new ArrayList<String>();
String[] stringArr = list.toArray(new String[list.size()]);

String[] disposableBeanNames = StringUtils.toStringArray(this.disposableBeans.keySet());

public String[] queryAttachmentIdsByFileId(String fileId){
		List<StandandFileDetail> list = queryFileDetailByFileId(fileId);
		String[] ids = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			ids[i] = list.get(i).getAttachment().getId();
		}
		return ids;
	}
	
function print(clientcode){
	var url="http://<%=request.getServerName()%>:<%=request.getServerPort() %>/Reports/pages/ViewReports.jsp?raq=public/collectinfo/R_031.raq&clientcode="+clientcode + "&statdate=" + $F('queryParameter.collectDate');
  window.open(url,null);
}

public List<ProcessStep> queryProcessStep(String flowId) {
	return this.getPersistenceManager().findBy(getEntityClass(), "process.id", flowId, "status", true);
}
	
//Hibernate EventListener
public class HibernateUpdateEventListener implements PreUpdateEventListener, PostUpdateEventListener {
	private static final long serialVersionUID = 3045761136919334027L;
	public boolean onPreUpdate(PreUpdateEvent event) {
		System.out.println("onPreUpdate before: " + getStateValueByPropName(event.getOldState(), event.getPersister().getPropertyNames(), "name"));
		changeState(event.getState(), event.getPersister().getPropertyNames(), "name", "---");
		Process entity = (Process) event.getEntity();
		System.out.println("onPreUpdate after: " + getStateValueByPropName(event.getState(), event.getPersister().getPropertyNames(), "name"));
		return false;
	}
	public void onPostUpdate(PostUpdateEvent event) {
		System.out.println("onPostUpdate before: " + getStateValueByPropName(event.getState(), event.getPersister().getPropertyNames(), "name"));
		System.out.println("onPostUpdate after: " + getStateValueByPropName(event.getState(), event.getPersister().getPropertyNames(), "name"));
	}
	protected void changeState(Object[] state, String[] propNames, String propName, Object value) {
		int index = ArrayUtils.indexOf(propNames, propName);
		if (index != -1)
			state[index] = value;
	}
	protected Object getStateValueByPropName(Object[] state, String[] propNames, String propName) {
		if (state != null && state.length > 0) {
			int index = ArrayUtils.indexOf(propNames, propName);
			return state[index];
		}
		return null;
	}
}
//补充说明：在修改监听方法onPostUpdate(PostUpdateEvent event)中，event.getOldState()有时得不到值，保存时把update改为merge方法就可以正常得到。 
//CommonsContext.xml
<bean id="callcenter.updateEvent" class="com.whcyit.tobacco.callcenter.bank.api.HibernateUpdateEventListener" />
<bean id="callcenter.sessionFactory" class="com.whcyit.framework.persistence.hibernate.enhance.EnhanceLocalSessionFactoryBean">
	<property name="eventListeners">
    <map>
      <entry key="pre-update" value-ref="callcenter.updateEvent" />
      <entry key="post-update" value-ref="callcenter.updateEvent" />
    </map>
  </property>
</bean>

ArticleTransferBean.java
private DataSource getDatasource(String ip, String databaseName, String user, String pwd) {
  String driverClassName = "net.sourceforge.jtds.jdbc.Driver";
  StringBuilder urlBuilder = new StringBuilder();
  urlBuilder.append("jdbc:jtds:sqlserver://");
  urlBuilder.append(ip);
  if(StringUtils.isNotBlank(databaseName)) {
    urlBuilder.append("/");
    urlBuilder.append(databaseName);
  }
  String url = urlBuilder.toString();
  ComboPooledDataSource ds = new ComboPooledDataSource();
  try {
    ds.setDriverClass(driverClassName);
    ds.setJdbcUrl(url);
    ds.setUser(user);
    ds.setPassword(pwd);
  } catch(Exception e) {
    throw new RuntimeException("创建数据源失败，失败原因：" + e.getMessage());
  }
  return ds;
}
  

/********************************************MAVEN***************************************************/
Eclipse Maven环境搭建：
1、Subclipse (Required)	        1.6.18
2、Maven Integration for Eclipse   1.0.100.20110804-1717
3、Maven Integration for WTP	    0.14.0.20110928-2045
4、Maven SCM handler for Subclipse	0.13.0.201107071330
	Name：Maven SCM handler for Subclipse
	Location：https://repository.sonatype.org/content/sites/forge-sites/m2eclipse-subclipse/0.13.0/N/0.13.0.201107071330

http://10.68.0.170/svn/devplus/
http://10.68.0.170/svn/devplus/source/trunk/devplus-parent/
http://10.68.0.170/svn/devplus/source/sandbox/platform-sic/

Eclipse 安装javaHL:
方法一：
sudo apt-get install libsvn-java
2.编辑eclipse.ini
在-vmargs下增加：
-Djava.library.path=/usr/lib/jni
方法二：http://cncomkyle.iteye.com/blog/1333374

http://subclipse.tigris.org/update_1.6.x
http://subclipse.tigris.org/update_1.8.x (支持Subversion 1.7.x)

StartExplorer官方地址：http://startexplorer.sourceforge.net/
Update Site:http://startexplorer.sourceforge.net/update 


