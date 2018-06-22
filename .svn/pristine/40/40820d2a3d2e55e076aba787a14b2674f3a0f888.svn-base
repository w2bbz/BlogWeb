<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>查看日志</title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<link rel="stylesheet" href="style/layui/css/layui.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
  </head>
  <style type="text/css">
 
  </style>
  <body>
	<div class="layui-container" style="margin: 10px 0px 0px 0px;">
		<div class="layui-row">
			<div class="layui-col-md12 layui-col-md-offset1" style="margin: 0px;">

				<ul class="layui-timeline" id="LAY_BLOG" >

				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script src="style/layui/layui.js"></script>

<script type="text/javascript">
var basePath = "<%=basePath%>";

layui.use(['flow'], function() {
	
	var flow = layui.flow;
	flow.load({
		elem : '#LAY_BLOG', //流加载容器
		done : function(page, next) { //执行下一页的回调
			var lis = [];
			$.getJSON(basePath+"blogWorkRecordController/getBlogWorkRecordList.do?page="+page, function(res){
		       	
				for (var i = 0; i < res.data.length; i++) {
					lis.push(getBlog(res.data[i]))
				}
				
		        next(lis.join(''), page < (res.total/10+1));    
		      
			});
		}
	});
});

function getBlog(data){

	var html="<li class='layui-timeline-item'><i class='layui-icon layui-timeline-axis'></i><div class='layui-timeline-content layui-text'><h3 class='layui-timeline-title' >"+data.title+"<span class='layui-badge layui-bg-gray' style='margin-left:10px;'>"+(data.type==2?'个人':'工作')+"</span><span class='layui-badge-rim' style='margin-left:10px;'>"+data.recordTime+"</span></h3><blockquote class='layui-elem-quote'>"+data.content+"</blockquote></div></li>"	
	return html;
}
</script>
