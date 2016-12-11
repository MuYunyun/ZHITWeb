<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
   Object name = request.getSession().getAttribute("name");
   Object userId = request.getSession().getAttribute("userid");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    <title>社区管理界面</title>
	<meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 	<script type="text/javascript" src="easyui/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="utf8-jsp/ueditor.all.js"></script>
    
  </head>
  <body>
  <div style="padding:10px;">
  <table id="user8" class="easyui-datagrid" style="width:1310px;height:600px;border:1px solid black;"
    data-options="title:'协会动态', iconCls:'icon-edit',striped:true,pagination:true,pageSize:10,autoRowHeight:false,rownumbers:true,singleSelect:false,selectOnCheck:true,checkOnSelect:true,
    url:'../Manage?Cat=8&Id=<%=userId %>',method:'post',toolbar:'#tb8'">
   <thead>
   <tr>
   <th data-options="field:'refPic',width:130,align:'center'">上传小图</th>
   <th data-options="field:'pic',width:130,align:'center'">上传大图</th>
   <th data-options="field:'contentId',width:100,align:'center',formatter:for8_1">操作</th>
   </tr>
   </thead>
   </table>
   </div>
   <div id="window8" class="easyui-dialog" style="width:800px; height:500px;padding:10px;font-size:14px;"data-options="buttons:'#order8_btn',modal:true,closed:true, title:'添加协会动态'">
   <form id="form8" method="post" enctype="multipart/form-data">
        <div style="text-align:center"><b style="font-size:20px;">添加协会动态</b></div>
		<div style="padding-top:5px;padding-bottom:10px">
		<input name="CatlogId" type="hidden" id="catlogId"/>
		<input name="AuthorId" type="hidden" id="authorId"/>
		<label>文章标题：</label>
	    <input name="Caption" style="width:200px;" class="easyui-validatebox" 
	    data-options="required:true" />
        &nbsp;&nbsp;
        <label>文章来源：</label>
	    <input name="Source" style="width:200px;" class="easyui-validatebox" 
	    data-options="required:true" />
        </div>
                
        <!-- <textarea id="container8" name="Text" style="height:140px"></textarea> -->
                
        <div style="padding-top:12px;padding-bottom:10px;">
        <div style="float:left">
		  <label style="float:left;width:70px;">缩略图：</label>
	      <div style="margin-left:70px"><input type="file" name="RefPic" id="doc" /></div>
	    </div>
	    <div>
          <label style="float:left;width:70px;">文章配图：</label>
	      <div style="padding-left:394px"><input type="file" name="Pic" id="doc1" /></div>
        </div>
        </div>
        
        <div><label style="width:100px">是否热点:</label>
        <input name="Hot" type="radio" value="1"/>是 
        <input name="Hot" type="radio" value="0"/>否
        </div>
        
     <div id="order8_btn">
	    <a onclick="add8()" class="easyui-linkbutton" data-options="iconCls:'icon-save'" 
	        onclick="">保存</a>
	    <a href="javascript:void(0)" onclick="close8()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" 
	        onclick="">关闭</a>
	 </div>
  </form>
</div>

<script type="text/javascript">
	function addCom8(){
		$('#window8').dialog('open');
	}
	
	function close8(){
		$('#window8').dialog('close');
	}
	function close8_1(){
		$('#window8_1').dialog('close');
	}
	function add8(){
	 $('#form8').form('submit', {
	            url: '../FileImageUploadServlet',
	            onSubmit: function () {
	                return $(this).form('validate');
	            },
	            success: function (result) {
	               $('#window8').dialog('close');
	               $.messager.alert('提示','添加成功!','info');
	               update8();
	               }
	        });
	}

	function update8()
	{
		$('#user8').datagrid('load');
	}
    </script>
  </body>
</html>
