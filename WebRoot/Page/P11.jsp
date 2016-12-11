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
  <table id="user11" class="easyui-datagrid" style="width:1310px;height:600px;border:1px solid black;"
    data-options="title:'政策法规', iconCls:'icon-edit',striped:true,pagination:true,pageSize:10,autoRowHeight:false,rownumbers:true,singleSelect:false,selectOnCheck:true,checkOnSelect:true,
    url:'../Manage?Cat=11&Id=<%=userId %>',method:'post',toolbar:'#tb11'">
   <thead>
   <tr>
   <th data-options="checkbox:true"></th>
   <th data-options="field:'caption',width:200,align:'center'">文章标题</th>
   <th data-options="field:'createDate',width:150,align:'center'">上传日期</th>
   <th data-options="field:'showName',width:100,align:'center'">上传者</th>
   <th data-options="field:'times',width:60,align:'center'">阅读次数</th>
<!--    <th data-options="field:'source',width:110,align:'center'">文章来源</th>
   <th data-options="field:'text',width:200,align:'center'">文章内容</th> -->
   <th data-options="field:'refPic',width:130,align:'center'">上传小图</th>
   <th data-options="field:'pic',width:130,align:'center'">上传大图</th>
   <th data-options="field:'hot',width:60,align:'center'">是否热点</th>
   <th data-options="field:'contentId',width:100,align:'center',formatter:for11_1">操作</th>
   </tr>
   </thead>
   </table>
   </div>
     <div id="tb11">
<a href="#" class="easyui-linkbutton" onclick="addCom11()" data-options="iconCls:'icon-add',plain:true">增加</a>
<a href="#" class="easyui-linkbutton" onclick="btn11_111()" data-options="iconCls:'icon-edit',plain:true">编辑</a>
<a href="#" class="easyui-linkbutton" onclick="deletedata()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
   <div id="window11" class="easyui-dialog" style="width:800px; height:500px;padding:10px;font-size:14px;"data-options="buttons:'#order11_btn',modal:true,closed:true, title:'添加协会动态'">
   <form id="form11" method="post" enctype="multipart/form-data">
        <div style="text-align:center"><b style="font-size:20px;">添加政策法规</b></div>
		<div style="padding-top:5px;padding-bottom:10px">
		<input name="CatlogId" type="hidden" id="catlogId"/>
		<input name="AuthorId" type="hidden" id="authorId"/>
		<label>文章标题：</label>
	    <input name="Caption" style="width:250px;color:green;border:1px solid green;margin-top:10px" class="easyui-validatebox" 
	    data-options="required:true" />
        &nbsp;&nbsp;
        <label>文章来源：</label>
        <input name="Source" style="width:150px;color:green;border:1px solid green" class="easyui-validatebox" 
	    data-options="required:true" />
        </div>
                
        <textarea id="container11" name="Text" style="height:210px"></textarea>
        
        <div style="padding-top:12px;padding-bottom:10px;">
       <label style="width:100px">是否热点:</label>
        <input name="Hot" type="radio" value="1"/>是 
        <input name="Hot" type="radio" value="0"/>否 
        </div> 
                
        <div>
        <div style="float:left">
	      <input type=button value="上传图片" onclick=j.click() style="border: 1px solid green;margin-right:2px"><input type=file name="RefPic" id=j style="display: none;" onchange="ye111.value=value"><input name=ye111 style="color: green;border: 1px solid green;width:100px" placeholder="可上传图片">
	      <input name="Pic" style="display:none" />
	    </div>
        </div>
         
     <div id="order11_btn">
	    <a onclick="add11()" class="easyui-linkbutton" data-options="iconCls:'icon-save'" 
	        onclick="">保存</a>
	    <a href="javascript:void(0)" onclick="close11()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" 
	        onclick="">关闭</a>
	 </div>
  </form>
</div>

<!-- 编辑框 -->
 <div id="window11_1" class="easyui-dialog" style="width:800px; height:500px;padding:10px;font-size:14px;"data-options="buttons:'#order11_btn',modal:true,closed:true, title:'编辑协会动态',url:'../Sjym'">
   <form id="form11_1" method="post" enctype="multipart/form-data">
        <div style="text-align:center"><b style="font-size:20px;">编辑政策法规</b></div>
		<div style="padding-top:5px;padding-bottom:10px">
        <input name="ContentId" type="hidden" id="contentId"/>
		<label>文章标题：</label>
	    <input name="Caption" style="width:250px;color:green;border:1px solid green;margin-top:10px" class="easyui-validatebox" 
	    data-options="required:true" />
        &nbsp;&nbsp;
        <label>文章来源：</label>
        <input name="Source" style="width:150px;color:green;border:1px solid green" class="easyui-validatebox" 
	    data-options="required:true" />
        </div>
                
        <textarea id="container_11" name="Text" style="height:210px"></textarea>
        
        <div style="padding-top:12px;padding-bottom:10px;">
       <label style="width:100px">是否热点:</label>
        <input name="Hot" type="radio" value="1"/>是 
        <input name="Hot" type="radio" value="0"/>否 
        </div> 
                
        <div>
        <div style="float:left">
	      <input type=button value="上传图片" onclick=j.click() style="border: 1px solid green;margin-right:2px"><input type=file name="RefPic" id=j style="display: none;" onchange="ye112.value=value"><input name=ye112 style="color: green;border: 1px solid green;width:100px " placeholder="可上传图片">
          <input name="Pic" style="display:none" />	    
	    </div>
        </div>
         
     <div id="order11_btn">
	    <a onclick="btn11_11()" class="easyui-linkbutton" data-options="iconCls:'icon-save'" 
	        onclick="">保存</a>
	    <a href="javascript:void(0)" onclick="close11_1()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" 
	        onclick="">关闭</a>
	 </div>
  </form>
</div>

   <script type="text/javascript">
	function addCom11(){
		$('#window11').dialog('open');
	}
	
	function close11(){
		$('#window11').dialog('close');
	}
	function close11_1(){
		$('#window11_1').dialog('close');
	}
	function add11(){
	 $('#form11').form('submit', {
	            url: '../addContentServ',
	            onSubmit: function () {
	                return $(this).form('validate');
	            },
	            success: function (result) {
	               $('#window11').dialog('close');
	               update11();
	            }
	        });
	}

    function for11_1(value,rowData,rowIndex)
    {
		return '<a onclick="btn11_1('+value+')" href="javascript:void(0)">编辑</a>'+"/"+
		'<a onclick="btn11_2('+value+')" href="javascript:void(0)">删除</a>';
	}
	
    
    //侧面的编辑
    function btn11_1(con)
    {   
    	$("#user11").datagrid('selectRow',con);
	    var row=$("#user11").datagrid('getSelected');
    	if(row){
    	$('#window11_1').dialog('open');
    	/* $('#form11_1').form('clear'); */
    	$('#form11_1').form('load',{Caption:row.caption,Source:row.source,ye112:row.refPic,ye112:row.pic,Hot:row.hot});
    	ue2.setContent(row.text);
    	$('#contentId').val(con);
    	}else{
    		$.messager.alert('提示','请先选中一条内容!','warning');
    	}
    	}
    
    //顶上的编辑
    function btn11_111()
    {   
	    var row=$("#user11").datagrid('getSelected');
	    if(row){
    	var con=row.contentId;
    	$('#window11_1').dialog('open');
    	$('#form11_1').form('load',{Caption:row.caption,Source:row.source,ye112:row.refPic,ye112:row.pic,Hot:row.hot});
    	ue2.setContent(row.text);
    	$('#contentId').val(con);
    	}else{
    		$.messager.alert('提示','请先选中一条内容!','warning');
    	}
    	}
    
    function btn11_11(){
    	$('#form11_1').form('submit', {
            url: '../updateContentServ',
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (result) {
               $('#window11_1').dialog('close');
               update11();
            }
        });
    }
    
    function btn11_2(t){
		$.messager.confirm('确认信息', '确认删除？', function(r){
			if (r){
				$.post('../deleteContentServ?contentId='+t, function (result) {
                        if (result) {
                        	$.messager.alert('发生错误', '未知错误，可能是该社区已经被删除，请刷新', 'error');
                        } else {
                            $.messager.alert('提示', '删除数据成功！', 'info');
                        }
                    });
             update11();
			}
		});
}
	function update11()
	{
		$('#user11').datagrid('load');
	}
	
//批量删除
function deletedata() {  
        //返回选中多行  
        var selRow = $('#user11').datagrid('getSelections');
        //判断是否选中行  
        if (selRow.length==0) {  
            $.messager.alert("提示", "请选择要删除的行！", "info");  
            return;  
        }else{     
            var conID="";  
            //批量获取选中行的评估模板ID  
            for (i = 0; i < selRow.length;i++) {  
                if (conID =="") {  
                    conID = selRow[i].contentId;
                } else {  
                    conID = selRow[i].contentId + "," + conID;  
                }                 
            } 
            
          
            $.messager.confirm('提示', '是否删除选中数据?', function (r) {  
  
                if (!r) {  
                    return;  
                }  
                //提交  
                $.ajax({  
                    type: "POST",  
                    async: false,  
                    url: "../deleteContentServ?contentId=" + conID,  
                    data: conID,  
                    success: function (result) {  
                        if (result.indexOf("t") <= 0) {  
                            $('#user11').datagrid('clearSelections');  
                            $.messager.alert("提示", "恭喜您，信息删除成功！", "info");  
                            $('#user11').datagrid('reload');  
                        } else {  
                            $.messager.alert("提示", "删除失败，请重新操作！", "info");  
                            return;  
                        }  
                    }  
                });  
            });  
  
        }  
    };  
	
	
    </script>
    <script type="text/javascript">
    var ue = UE.getEditor('container11');//ueditor 实体化  
    var ue2 = UE.getEditor('container_11');
    </script>
    <script type="text/javascript">
    $('#catlogId').val('11');
    $('#authorId').val(<%=userId %>);
    </script>
   </body>
</html>
