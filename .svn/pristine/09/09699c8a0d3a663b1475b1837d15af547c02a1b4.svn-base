<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>日志列表</title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<link rel="stylesheet" href="style/layui/css/layui.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
  </head>
  <style type="text/css">
  	body {padding-top: 5px;overflow:hidden;}
  	.layui-table-page {
      text-align: right;
      padding-right: 26px;
    }
  </style>
  <body>
  	<form class="layui-form layui-col-md11" style="margin: 0px 0px 10px 0px;" method="post" action="">
 		<div class="layui-inline" >
			<input type="text" id="title" name="title" placeholder="标题" autocomplete="off" class="layui-input" style="width: 120px">
		</div>	
		<div class="layui-inline" style="width: 100px">
	      <select name="type" id="type" lay-filter="">
	        <option value="" selected="">全部</option>
	        <option value="1">工作</option>
	        <option value="2">个人</option>
	      </select>
	    </div>

		<div class="layui-inline">
			<input class="layui-input" placeholder="开始时间" name="startTime" id="startTime" style="width: 150px">
		</div>
		-
		<div class="layui-inline">
			<input class="layui-input" placeholder="结束时间" name="endTime" id="endTime" style="width: 150px">
		</div>
		 <button class="layui-btn" lay-submit lay-filter="search">查询</button>
		 <button type="button" onclick="restForm();" class="layui-btn layui-btn-primary">重置</button>
 	</form>
 	
 	
	<div style="height: 90%; width: 100%; margin-left: 0%; clear: both;">
      <table class="layui-table" id="listTable" lay-filter="listTable" lay-data="{url:'blogWorkRecordController/getBlogWorkRecordList.do',height:'full-90'}" >
        <thead>
          <tr>
            <th lay-data="{field:'title',fixed:'left',width:200}">标题</th>
            <th lay-data="{field:'recordTime',width:200}">日志时间</th>
            <th lay-data="{field:'type',templet:'#typefun',width:120}">类型</th>
            <th lay-data="{field:'content'}">内容</th>
          </tr>
        </thead>
      </table>
    </div>
</body>
</html>
<script type="text/html" id="typefun">
{{#  if(d.type == 1){ }}工作日志{{#  } }}
{{#  if(d.type == 2){ }}个人日志{{#  } }}
</script>
<script src="style/layui/layui.js"></script>
<script src="style/common/http.json.js"></script>
<script type="text/javascript">

var basePath = "<%=basePath%>";

//table全局参数
var tableOption = {
	method : "post",
	response : {
		statusName : "status",
		statusCode : 200,
		msgName : "hint",
		countName : "total",
		dataName : "data"
	},
	text : {
		none : "暂无相关数据"
	},
	cellMinWidth : 80,
	page : true, //分页
	limit : 20
//每页数量
};

layui.use([ 'laydate', 'form', 'table' ], function() {

	var laydate = layui.laydate;
	var form = layui.form;
	var table = layui.table;

	table.set(tableOption);
	table.init("listTable", {
		id : "listTable"
	});
	
	//执行一个laydate实例
	laydate.render({
		elem : '#startTime', //指定元素
		calendar : true, //是否显示公历重要节日
		//istime : true, //是否开启时间选择
		istoday : true, //是否显示今天
		type: 'date',
		format : "yyyy-MM-dd",
		
	});
	
	//执行一个laydate实例
	laydate.render({
		elem : '#endTime', //指定元素
		calendar : true, //是否显示公历重要节日
		//istime : true, //是否开启时间选择
		istoday : true, //是否显示今天
		type: 'date',
		format : "yyyy-MM-dd",
		
	});
	//监听一个指定的表单提交
	form.on('submit(search)', function(data) {//表单提交的对象
		//layer.msg(JSON.stringify(data.field));//显示表单提交的数据
		//console.log(data);	
		table.reload('listTable', {
		    where: data.field, 
		    page: {curr : 1 } //重新从第 1 页开始
		});
		return false;//取消提交表单
	});

});

function restForm(){
	
	$("#title").val("");
	$("#type").val("");
	$("#startTime").val("");
	$("#endTime").val("");
	
}
</script>
