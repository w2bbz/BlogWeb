<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>登陆</title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<link rel="stylesheet" href="style/layui/css/layui.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
  </head>
  <style type="text/css">
  .layui-input-block{margin:20px}
  </style>
  <body>
  	<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
	<!--[if lt IE 9]>
	  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	<![endif]--> 
  
	<div class="layui-container">
		<div class="layui-row" style="height: 25%">
			
		</div>
		<div class="layui-row" style="">

			<div class="layui-col-md4 layui-col-md-offset3">
			
				<form id="form" class="layui-form" action="" method="post">
					<div class="layui-form-item">
						<!-- <label class="layui-form-label" style="text-align: center;">账号</label> -->
						
						<div class="layui-input-block" >
							<input type="text" name="account" required lay-verify="required"
								placeholder="请输入账号" autocomplete="off" class="layui-input" style="text-align:center;">
						</div>
					</div>
					
					<div class="layui-form-item">
						<!-- <label class="layui-form-label" style="text-align: center;">密码</label> -->
						<div class="layui-input-block" >
							<input type="text" name="password" required lay-verify="required"
								placeholder="请输入密码" autocomplete="off" class="layui-input" style="text-align:center;">
						</div>
					</div>

					<div class="layui-form-item" >
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-fluid" type="button" lay-submit lay-filter="formBlog">登陆</button>
						</div>
					</div>

				</form>

			</div>
			
		</div>
	</div>
</body>
</html>
<script src="style/layui/layui.js"></script>
<script src="style/common/http.json.js"></script>

<script type="text/javascript">
var basePath = "<%=basePath%>";
var form;
layui.use(['form'], function() {

	
	form = layui.form;
	
	//监听提交
	form.on('submit(formBlog)', function(data) {
		//layer.msg(JSON.stringify(data.field));
		submit();
		return false;
	});
});


function submit() {
	
	var form = $("#form");
	
	doSubmitForm(basePath+"systemService/login.do",form,function(rs){
		//console.log(rs);
		if(rs.state=="200"){
			window.location.href = basePath+rs.data.message;
		}else{
			layer.msg(rs.data.message, {
				icon: 5,
				time: 1000
			});
		}
		
	});
}

$("input[name=password]").keypress(function(e){
	
    var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
    
    if (eCode == 13){
    	submit();
    }
})
</script>
