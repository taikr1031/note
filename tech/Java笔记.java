//动态列转行录入：whcyit-payment   com.whcyit.tobacco.payment.salaryofyear.model.PerforSalaryBase.java

//并发随机数：double u = ThreadLocalRandom.current().nextDouble();

//生成UUID
UUID.randomUUID().toString();

//线程每间隔10秒定时执行
public class GenHtml {
	/**
   * 启动生成静态Html的线程
   */
  public void startGenStaticHtml() {
    Thread t = new GenHtmlThread();
    t.start();
  }
	
	private class GenHtmlThread extends Thread {
		public void run() {
			while (true) {
				try {
					//1：休息
					Thread.sleep(10000L);
				} catch (Exception err) {
					err.printStackTrace();
				}
				//2：调用生成
				genStaticHtml();
			}
		}
	}
}

//根据Thread状态判断是否启动
if (threadObject.getState() == Thread.State.NEW) {
	threadObject.start();
}
		
//List 循环删除
for (Iterator iterator = details.iterator(); iterator.hasNext();) {
	FlowInstanceDetail flowInstanceDetail = (FlowInstanceDetail) iterator.next();
	iterator.remove();
}

//获得当前时间戳
System.out.println(System.currentTimeMillis()); //1356622080064
System.out.println(new Timestamp(new Date().getTime()).toString()); //2012-12-27 23:28:00.066

Calendar cal = Calendar.getInstance();
long END = org.rrd4j.core.Util.getTimestamp(cal);
cal.add(Calendar.DATE, -1);
long START = org.rrd4j.core.Util.getTimestamp(cal) + 3 * 60;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
System.out.println("start=" + START + "   " + sdf.format(Util.getCalendar(START).getTime()));
System.out.println("end=" + END + "   " + sdf.format(Util.getCalendar(END).getTime()));
		
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
