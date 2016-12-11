<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要入会</title>
<link type="text/css" rel="stylesheet" href="css/base.css" />
<link type="text/css" rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="JS/jquery1.42.min.js"></script>
<script type="text/javascript" src="JS/jquery.SuperSlide.2.1.1.js"></script>
</head>

<body>

<!--header -->
<div id="header">
  <div class="w1190"><img src="image/head.gif" /></div>
</div>

<!--menu -->
<div id="menu" class="clearfix ofw mb15">
  <ul>
    <li><a href="index.jsp">网站首页 </a> </li>
    <li><a href="xhgk.jsp">协会概况</a> </li>
    <li><a href="hydt.jsp?Cat=8">行业动态</a> </li>
    <li><a href="hyzz.jsp">会员组织</a> </li>
    <li><a href="zxfw.jsp">咨询服务</a> </li>
  </ul>
</div>
 
 <div class="w1190 clearfix ofw">
 <!--left -->
  <div class="col">
     <div class="sub_nav mb15">
      <div class="nav_heading">
        <h2>协会概况</h2>
      </div>
      <ul>
        <li class="bdrn"><a href="xhgk.jsp"><span></span>协会介绍</a></li>
        <li><a href="xhgk_1.jsp"><span></span>协会章程</a></li>
        <li><a href="xhgk_2.jsp"><span></span>组织机构</a></li>
      </ul>
    </div>      
   <div class="sub_icon icon_btn">
<a href="zxwyh.jsp" class="btn-icon btn-zx">咨询委员会</a> 
<a href="wyrh.jsp" class="btn-icon btn-wy">我要入会</a>  
</div>      
    </div>
     
     <!--right -->
  <div class="main">
    <div class="box-header clearfix ovr">
      <h2>我要入会</h2>
      <p class="tree">您的位置：<a href="index.jsp">首页</a>&gt;<a href="xhgk.jsp">协会概况</a>&gt;我要入会</p>
    </div>
    
     <form id="form" action="../Biaodan" method:"post"> 
      <div class="memRBox">
        <div class="Editbox">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
            <tr>
              <th width="150"><i>*</i>公司（单位）名称：</th>
              <td colspan="3"><input class="inputbox w600" placeholder="请输入.." type="text" name="Caption" maxlength="50" required></td>
            </tr>
            <tr >
              <th><i>*</i>联系人：</th>
              <td width="260"><input class="inputbox w215" placeholder="请输入.." type="text"  name="Contact" maxlength="10" required></td>
              <th width="105"> 职务：</th>
              <td><input class="inputbox w215" placeholder="请输入.." type="text" name="Post"  maxlength="10"></td>
            </tr>
            <tr >
              <td colspan="4" class="li"></td>
            </tr>
        
            <tr>
              <th><i>*</i>电话：</th>
              <td><input class="inputbox w215" placeholder="请输入.." type="text" name="Tel"  maxlength="20" required></td>
              <th><i>*</i>手机：</th>
              <td><input class="inputbox w215" placeholder="请输入.." type="text" name="Mobile"  maxlength="11" required></td>
            </tr>
            <tr>
              <th>传真：</th>
              <td><input class="inputbox w215" placeholder="请输入.." type="text" name="Fax" maxlength="20"></td>
              <th><i>*</i>电子邮箱：</th>
              <td><input class="inputbox w215" placeholder="请输入.." type="text" name="Email" maxlength="40" required></td>
            </tr>
             <tr >
              <td colspan="4" class="li"></td>
            </tr>
                <tr>
              <th>备注：</th>
              <td colspan="3"><textarea name="Memo" cols="" rows="" class="txt_write" style=" width:600px; height:80px;" placeholder="有关企业状况、产品及技术、以及加入镇海区信息技术协会之外其他相关组织的情况：.."></textarea></td>
            </tr>
            <tr>
			    <td></td>
			    <td colspan="3" id="form2"><input id="BtnSave" style="cursor:pointer;" class="btn_zc w235" value="确认提交" type="submit" onclick="doFind()"></td>
			</tr>
          </table>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- <script>
	 function doFind(){
	 alert("dd");
	$.ajax({
             cache: true,
             type: "POST",
             url:"../Biaodan",
             data:$('#form').serialize(),// 你的formid
             async: false,
             error: function(request) {
                 alert("Connection error");
             },
             success: function(data) {
                 alert("dd")
             }
         });
	 }

	</script>  -->

<!-- footer-->
<div class="ofw clearfix  mt15 box" id="footer">
  <div class="w1190 tc">CopyRight&nbsp;&nbsp;主办单位：镇海区信息技术协会<br /></div>
</div>


</body>
</html>