<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
   Object name = request.getSession().getAttribute("name");
   Object userId = request.getSession().getAttribute("userid");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="easyui/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/highcharts.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script type="text/javascript" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="utf8-jsp/ueditor.all.js"></script>
	<style type="text/css">
		.right{float:right;margin-right: 55px;margin-top: 54px;font-size: 15px;}
	</style>
	</head>
  <body class="easyui-layout">
    <div data-options="region:'north'" style="height:110px;background:url(images/head1.png)">
    	<!-- <img src="images/logo.png" style="margin:10px;margin-left:40px;"> -->
    	<div class="right">
                        欢迎<span style="color:red;"><%=name %></span>&nbsp;&nbsp;&nbsp;
    		<a href="../login.jsp">注销</a>
    	</div>
    </div>
	<div data-options="region:'west', title:'管理菜单' " style="width:200px;">
	<div id="aa" class="easyui-accordion" data-options="fit:true,border:false">
    <div title="行业动态" style="overflow:auto;padding:10px;">
	<ul id="t2" class="easyui-tree" data-options="
					url: '../getCatlogServ?parentId=2',
					animate: true,
					onClick: function(node){addTab(node)}"></ul>
    </div>
    <div title="会员组织" style="overflow:auto;padding:10px;">
<ul id="t3" class="easyui-tree" data-options="
					url: '../getCatlogServ?parentId=3',
					animate: true,
					onClick: function(node){addTab(node) }"></ul>
    </div>
    <div title="咨询服务" style="overflow:auto;padding:10px;">
<ul id="t4" class="easyui-tree" data-options="
					url: '../getCatlogServ?parentId=4',
					animate: true,
					onClick: function(node){addTab(node) }"></ul>
    </div>
    </div>
</div>
	<div data-options="region:'center'">
	<div id="tab" class="easyui-tabs" data-options="fit:true,border:false">
	<div title="开始页面" data-options="closable:'true'" style="height:500px; width:700px;text-align:center">
	<img src="images/zhuye.jpg" width="100%" height="100%" />
	</div>
	</div>
	</div>
	  <script type="text/javascript">
	function addTab(node){
	if($('#tab').tabs('exists',node.text)){
			$('#tab').tabs('select',node.text);
		}
        else{
	$('#tab').tabs('add',{
    title:node.text,
    closable:true,
   	href:node.attributes.CatURL
});
		}
		}
	</script>
  </body>
</html>
