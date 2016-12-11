<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    <title>登录界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css" href="WebPage/css/login.css" >
  </head>
  
  <body>
    <div class = cent>
  <h1 class="hy">&nbsp;</h1>
   
     <form id="form" border="1" method="post" action="LoginServ">
        <div class = "toum">
	    <table class="yangs">
	     <tr><td class="text">账  号</td><td ><input class="shadow" type="text" style="padding:10px 6px" name="username" /></td></tr>
		 <tr><td class="text">密  码</td><td ><input class="shadow" type="password" style="padding:10px 6px" name="password" /></td></tr>
		 <tr><td class="text">验证码</td><td><input type="text" name="yz" class="yz shadow" style="padding:10px 6px"><div class="yzm"><img src="WebPage/verifyCode.jsp"></div></td></tr>
		<tr><td>&nbsp;</td><td><input type="submit" value="" class="submit"/></td>
	   </table>
       </div>
       </form>
       
       </div>
  </body>
</html>
