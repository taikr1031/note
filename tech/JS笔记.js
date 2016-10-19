jQuery.getJSON(url,[data],[callback])	该函数是简写的 Ajax 函数，等价于：
$.ajax({
  url: url,
  data: data,
  success: callback,
  dataType: json
});
发送到服务器的数据可作为查询字符串附加到 URL 之后。如果 data 参数的值是对象（映射），那么在附加到 URL 之前将转换为字符串，并进行 URL 编码。
传递给 callback 的返回数据，可以是 JavaScript 对象，或以 JSON 结构定义的数组，并使用 $.parseJSON() 方法进行解析。


try {
    console.log("some message");
    ...
} catch (e) {
    console.error(e.message);
}     


var num = bar * scale = 0.8999999999999; 解决办法：var num = Math.round(bar * scale * 100) / 100;

var v = 1.2345;
Math.round(new Number(v).toFixed(2));

//解决jQuery和Prototype的$冲突：先载入Prototype.js，后载入jQuery.js
<script type="text/javascript">
	jQuery.noConflict(); //将变量$的控制权让渡给prototype.js
	alert(jQuery('#qtyDiv').html());
</script>

window.location.reload();  

function fillColumn(evt) {
	var obj = document.getElementsByName('article.param3')[0];
	obj.options.length = 0; //清空下拉框的所有选项
	bf.remoteCall("com.whicss.business.cms.basichome.service.IEmarketForumColumnService.queryAll", [{}, '', true], function(reply) { //方法参数类型：Map, String, boolean
    fillSelect(obj, reply.getResult(), "id", "name");
	});
}

window.event.srcElement.tagName

//根据不同的浏览器类型设置不同的样式值
$$('tr.hideCtrlsRow').each(function(el){
	el.style.display = (document.all ? "block" : "table-row");
});

//在 FRAME 中获取 FRAMESET 中其他 FRAME 中的元素值
var flag = parent.frames['rightFrame'].document.getElementById('flag').value;

//获取一组CHECKBOX框是否至少选中一个
1、
var chks = $$('input[type="checkbox"][name="chk"]').select(function(i){return i.checked;});
2、
if(!CheckBoxOperator.isCheck($A(document.getElementsByName('lineArray')))) {
  alert('请选择');
  return;
}

function fillSelectNotChooseText(obj, values, vn, ln, wparent) {
  var doc = document;
  obj.options.length = 0;
  if(wparent) doc = wparent.document;
  for(var i = 0; i < values.length; i++) {
    obj.options.add(createOption(values[i][ln], values[i][vn], doc));
  }
}

//showModelWindow
showModelWindow('选择指标', '${contextPath}/supply/propertyCigPut/queryIndexItemList.do' + param, 600, 350, null, false, {useLocation: true, useTop:10});
showModelWindow('添加卷烟', url, 650, 400, null, false, {closeCallback: toQuery});
showModelWindow('选择客户', url, 950, 400, null, false, {closeCallback: function(){
  $('queryForm').submit();
}});

//TABLE 循环减行
for(var i = table.rows.length - 1; i > -1; i--){
	var row = table.rows[i];
	table.removeChild(row);
	row == null;
}

//Ajax.Request
function ajaxRequest() {
	var url = '<c:url value="/data/verifyData/extract.do"/>';
	var params = new Object(); 
	params['queryParameter.beginDate'] = $F('queryParameter.beginDate');
	params['queryParameter.endDate'] = $F('queryParameter.endDate');
	params['queryParameter.countys'] = getCheckboxValues('queryParameter.countys', true);
	new Ajax.Request(url,	{ method: 'post',
													parameters : params,
				             			evalScripts: true,
				             			onFailure: function(request) {
				               			alert('失败！');
				             			},
						             	onComplete: function(transport) {
														$('queryForm').target="extractResultFrame";
														window.location.href = "<c:url value = '/pages/data/Table.jsp'/>";
						         		}});
}


<input id="qtyOrder" name="details[${ROWCOUNT-1}].qtyOrder" value="${vo.qtyOrder}" type="text" onkeyup="onlyDigital(this);" class="textfield"/>
function checkMultiSameIdTextInputIsAllEmpty(domId) {
	var qtys = $$('input[id=' + domId + ']');
	var isAllEmpty = false;
	qtys.each(function(node){
		if(node.value != null && node.value != ''){
			isAllEmpty = true;
			throw $break; 
		}
	});
	return isAllEmpty;
}

function onlyDigital(obj){
	obj.value = obj.value.replace(/\D/g,'');
}
//获取checkbox的值，isArray 为true代表返回数组格式，为false代表返回字符串格式
function getCheckboxValues(checkboxName, isArray) {
	var temp = '';
	var checkboxArray = document.getElementsByName(checkboxName);
	for (var i = 0; i < checkboxArray.length; i++) {
		if(checkboxArray[i].checked)
			temp += checkboxArray[i].value + ',';
	}
	if(temp.length>1)
		temp = temp.substr(0, (temp.length - 1));
	if(isArray)
		return temp.split(',');
	else
		return temp;
}

//获得表格中最后一行第一个单元格中第一个元素中的值
	var rowsNum = $(tableId).rows.length;
	var maxOrderNo = $(tableId).rows[rowsNum - 1].cells[0].childNodes[1].value;

//在JS中获得服务器端某个集合大小
	alert('${fn:length(list)}');
	alert('${receiveCarForm.car.details.size()}');

//each 循环中止跳出：throw $break;

//prototype
	var checkboxs = $$('input[id=checkPut]');
	var checkboxs = $$('input[type=checkbox]');

//比较结束日期不能大于开始日期
	function compareBeginAndEnd(startDate, endDate){
		var bDate = new Date(startDate.replace(/-/g,"/"));
		var eDate = new Date(endDate.replace(/-/g,"/"));
		if(bDate > eDate){
			alert("结束时间必须大于开始时间");
			return;
		}
	}

//通过 name 属性引用表单中的元素
	var form = $('queryForm');
	var input = form['details[1].isUse'];
	alert($F(input));

//显示值(== !=)和等价值(=== !==)，对 false 比较时，要用等价值

//JS类型检查
	if(typeof arr == 'string') {}
	if(arr.constructor == String) {}

//JS作用域
	<>作用域是由函数划分，而不时由块来(block)划分(比如while,if或for语句中间)的。
	//设置全局变量 foo，并设置为 'teset'
	var foo = 'test';
	//在 if 块中
	if(true) {
		//将 foo 设置为 'new test'
		//注意，现在还在全局作用域中
		var foo = 'new test';
	}
	alert(foo == 'new test');
	//创建一个会修改变量 foo 的新函数
	function test() {
		var foo = 'old test';
	}
	//然而在调用时，foo 只在函数作用域内起作用
	test();
	//foo 还是等于 'new test'
	alert(foo == 'new test');

	<>所有全局作用域的变量都是 window 对象的属性
	//一个全局作用域的变量
	var test = 'test';
	alert(window.test == 'test');

	<>如果变量没有显示定义，就是全局的。虽然它可能只在这个函数内使用
	function test() {
		foo = 'test';
	}
	test();
	alert(window.foo == 'test');

//给原型添加属性的结果是由该原型实例化的每个对象都会获得这些属性，也就使这些属性公有化了
//原型式继承
User.prototype = new Person();

//JS事件在2个阶段中执行：捕捉和冒泡

//打印JS对象所有属性的值，数组需循环调用本方法
function dump_obj(myObject) { 
  var s = ""; 
  for (var property in myObject) { 
   s = s + "\n "+property +": " + myObject[property] + ','; 
  } 
  document.write('{' + s + '}, ');
  alert(s); 
}  

//Buffalo
var bf = new Buffalo('<c:url value="/bfapp"/>', false); //异步：true （默认），同步：false
function changeWeek(){
	var flag = true;
	var obj = {};  
	obj[Buffalo.BOCLASS] = "com.whicss.tobacco.collectinfo.storage.model.DataConfirm";  
  obj["corpCode"] = '<c:out value="${dataConfirmForm.entity.status}" />';
  obj["confirmCorp"]     = '<c:out value="${dataConfirmForm.entity.confirmCorp}" />';
  obj["statYear"]  = $F('entity.statYear').substring(0, 4);
  obj["weekId"]  = parseInt($F('weekId'));
  bf.remoteCall("com.whicss.tobacco.collectinfo.storage.service.IDataConfirmService.query", [obj], function(reply) {
	  result = reply.getResult();
	  if(result.length > 0){
		  alert("本周已确认！");
		  flag = false;
	  } else {
		  flag = true;
	  }
  });
  return flag;
}
  
getResponse().getOutputStream().print("<html><head>");
			getResponse().getOutputStream().print("<script type='text/javascript' src='/whcyit-leafpay/js/zTree/js/jquery-1.4.4.min.js'></script>");
			getResponse().getOutputStream().print("<script type='text/javascript' src='/whcyit-leafpay/js/blockUI/jquery.blockUI.js'></script>");
			getResponse().getOutputStream().print("<script type='text/javascript'>jQuery.noConflict();</script>");
			getResponse().getOutputStream().print("<script type='text/javascript'>function unblock() {alert('unlock!!!'); jQuery.unblockUI();};</script>");
			getResponse().getOutputStream().print("</head><body onload='unblock();'></body></html>");
			getResponse().getOutputStream().print("<script type='text/javascript'>alert('unlock!!!'); jQuery.unblockUI(); alert('unlock123!!!'); </script>");
			System.out.println("-----------");
			getResponse().getOutputStream().flush();
			getResponse().getOutputStream().close();
