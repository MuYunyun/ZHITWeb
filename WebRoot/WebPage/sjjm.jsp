<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePathPic = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/images/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>协会概况</title>
<link type="text/css" rel="stylesheet" href="css/sjjm.css" />
<link type="text/css" rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
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
   <div class="sub_news">
      <div class="nav_heading">
        <h2>热点资讯</h2>
      </div>
      <ul id="hotnews_comm_left" class="hot">
		        
      </ul>
    </div>  
    </div>
    
    
   
      <!--right -->
  <div class="main">
    <div class="box-header clearfix ovr">
      <h2>信息正文</h2>
      <p class="tree">您的位置：<a href="index.jsp">首页</a>&gt;<a href="hydt.jsp">行业动态</a><a>&gt;正文</p>
    </div>
    <div class="box-content">
					<h1 class="right-title mt15 mb25 caption"></h1>
					<div class="right-time neir"><!-- 发布时间:2016-03-22 14:12<i></i>阅读次数:39<i></i>作者:超级管理员<i></i>文章来源:智能制造协会<i></i> --></div>
	</div>
                <div class="content">
      
      <p style="text-align:center" class="tupian ">
	<!-- 插入图片 -->
</p>
      <p class="neirong" style="text-indent:0.9em">   
      <!-- 写内容 -->
	　 </p>
    </div>
  <!--相关新闻 -->
    
  </div>
</div>



<!-- footer-->
<div class="ofw clearfix  mt15 box" id="footer">
  <div class="w1190 tc">CopyRight&nbsp;&nbsp;主办单位：镇海区信息技术协会<br /></div>
</div>

<%String c = request.getParameter("ContentId");%>>
<script type="text/javascript">
$(function(){
       $.ajax({
	    type:"post",
        url:"../Sjym?Con=<%=c%>",    
        dataType:"json",
        async:false,
        success:function (data) {
                var d = data.Pic;
                if(d!=null){
                 $(".caption").append(data.Caption);	
                 $(".neir").append('发布时间:'+data.CreateDate+'<i></i>阅读次数:'+data.Times+'<i></i>作者:'+data.ShowName+'<i></i>文章来源:'+data.Source+'<i></i>')
                 $(".tupian").append('<img src="<%=basePathPic%>'+data.Pic+'" title="'+data.Caption+'" alt="'+data.Caption+'" width="610" height="330"/>');
	             $(".neirong").append(data.Text);
	        }else{
	        	 $(".caption").append(data.Caption);
	             $(".neir").append('发布时间:'+data.CreateDate+'<i></i>阅读次数:'+data.Times+'<i></i>作者:'+data.ShowName+'<i></i>文章来源:'+data.Source+'<i></i>')
                 $(".neirong").append(data.Text);
	        };
	        },
	     error: function () {
            alert("请求超时，请重试！");
        }
	});  
});

$(function(){
    $.ajax({
	    type: "post",
     url:"../Hot",    
     dataType: "json",
     success: function (data) {         //热点
    	 for(var i=0;i<10;i++){
    		 $(".hot").append('<li><span class="n'+(i+1)+'"></span><a href="sjjm.jsp?ContentId='+data[i].contentId+'">'+data[i].caption+'<span>('+data[i].createDate+')</span></a></li>');
    	    }
          },
     error: function () {
         alert("请求超时，请重试！");
     }
	});
});
</script>

</body>
</html>