<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="user" value="${sessionScope.currentUser}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>首页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="style/layui/css/layui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
</head>
<style type="text/css">
</style>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">BLOG</div>
			<!-- 头部区域 -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
					</dl>
				</li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">${user.name} 
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">基本资料</a>
					</dd>
					<dd>
						<a href="">安全设置</a>
					</dd>
				</dl>
				</li>
				<li class="layui-nav-item"><a href="">退朝</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域 -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed">
						<a class="" href="javascript:;">日志管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">新增日志</a>
							</dd>
							<dd>
								<a href="javascript:;">查看日志</a>
							</dd>
							<dd>
								<a href="javascript:;">日志列表</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;">系统帮助</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">联系我们</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div class="layui-tab layui-tab-brief" lay-filter="demo" lay-allowclose="true">
				<ul class="layui-tab-title ">
					<li class="layui-this" lay-id="11">新增日志</li>
					<li lay-id="22">日志列表</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<iframe id="demoAdmin" src="jsp/blog/add.jsp" frameborder="0" style="width: 100%; height: 300px;"></iframe> 
					</div>
					<div class="layui-tab-item">内容2</div>
				</div>
			</div>
		</div>

		<div class="layui-footer">
			<div class="layui-main">
				<!-- 底部固定区域 -->
				<font face="verdana" color="#009688" style="margin-right: 10px"><span id="showtime"></span></font>
				<font face="verdana" color="#393D49"><span id="showaddress"></span></font>
				<!-- © blog.l2you.com -->
				<a href="mailto:mail.zhouwenjian@qq.com" hidden>&nbsp;联系作者</a>
			</div>
		</div>
	</div>
<script src="style/layui/layui.js"></script>
<script src="style/common/showtime.js"></script>
<script src="style/common/showaddress.js"></script>

<script>
var basePath = "<%=basePath%>";

layui.use('element', function(){
  var element = layui.element;
});

</script>
</body>
</html>
