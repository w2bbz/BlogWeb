<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>新增日志</title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<link rel="stylesheet" href="style/layui/css/layui.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
  </head>
  <style type="text/css">
  	body {padding-top: 20px;}
  </style>
  <body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">
				<form id="form" class="layui-form" action="" style="width: 100%">
					<div class="layui-form-item">
						<label class="layui-form-label">标题</label>
						<div class="layui-input-block">
							<input type="text" name="title" required lay-verify="required"
								placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">日期</label>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" name="recordTime"
								id="recordTime">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">内容</label>
						<div class="layui-input-block">
							<textarea name="content" placeholder="请输入内容"
								class="layui-textarea"></textarea>
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="formBlog">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>
</body>
</html>
<script src="style/layui/layui.js"></script>

<script type="text/javascript">

	var basePath = "<%=basePath%>";

	layui.use(['laydate','form'], function() {

		var laydate = layui.laydate;
		var form = layui.form;
		
		//执行一个laydate实例
		laydate.render({
			elem : '#recordTime', //指定元素
			calendar : true, //是否显示公历重要节日
			istime : true, //是否开启时间选择
			istoday : true, //是否显示今天
			format : "yyyy-MM-dd HH:mm:ss"
		});
		
		//监听提交
		form.on('submit(formBlog)', function(data) {
			//layer.msg(JSON.stringify(data.field));
			upload();
			return false;
		});
	});
	
	
	function upload() {
		
		var form = $("#form");
		$.ajax({
			type : "POST",
			url : basePath+"/blogWorkRecordService/addBlogWorkRecord.do",
			dataType : "JSON",
			data : form.serialize(),
			processData : false,	
			async : true,
			success : function(rs) {
				//console.log(rs);
				if(rs=="true"){
					layer.alert("提交成功", {
						icon: 6
					}, function() {
						//close();
					});
				}else{
					layer.msg("提交失败", {
						icon: 5,
						time: 1000
					});
				}
			},
			error:function(req, status, error){
				alert(req.status + "," + req.readyState + "," + status + "\n" + error);
			}
		});
	}
</script>
