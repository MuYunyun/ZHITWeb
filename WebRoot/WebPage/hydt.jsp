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
<link type="text/css" rel="stylesheet" href="css/base.css" />
<link type="text/css" rel="stylesheet" href="css/css.css" />
<link href="css/con_fenyex.css" type="text/css" rel="stylesheet" />
<link href="css/pagination.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="js/jquery1.42.min.js" ></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js" ></script>
 <script type="text/javascript" src="js/jquery.scroll.js"></script>	
</head>

<body>

<!--header -->
<div id="header">
  <div class="w1190"><img src="image/head.gif" /></div>
</div>

<!--menu -->
<div id="menu" class="clearfix ofw mb15">
  <ul>
    <li><a href="index.jsp">网站首页 </a></li>
    <li><a href="xhgk.jsp">协会概况</a></li>
    <li><a href="hydt.jsp?Cat=8" class="current">行业动态</a></li>
    <li><a href="hyzz.jsp">会员组织</a></li>
    <li><a href="zxfw.jsp?Cat=17">咨询服务</a></li>
  </ul>
</div>
 
 <div class="w1190 clearfix ofw">

  <!--left -->
  <div class="col">
    <div class="sub_nav mb15">
      <div class="nav_heading">
        <h2>行业动态</h2>
      </div>
      <ul class="toptab tabl">

      </ul>
    </div>     
     <div class="sub_news">
        <div class="nav_heading">
           <h2>热点资讯</h2>
         </div>
         <ul class="hot">  
         </ul>
    </div>  
  </div>

<!--right -->
  <div class="main">
    <div class="box-header clearfix ovr ">
      <div class="biaoti"><!-- <h2>协会动态</h2> --></div>
       <div class="location"><!-- <p class="tree">您的位置：<a href="index.jsp">首页</a>&gt;<a href="hydt.jsp">行业动态</a>&gt;协会动态</p> --></div>
    </div>
    
       <div class="news_list neirong">
	   </div>
                    
                    <!--分页 -->
                    <!-- -->
     <div class="tc mt15">
           <div id="Pagination" class="pagination">这里显示分页</div>
     </div>
 </div>
  
</div>

<!-- footer-->
<div class="ofw clearfix  mt15 box" id="footer">
  <div class="w1190 tc">CopyRight&nbsp;&nbsp;主办单位：镇海区信息技术协会<br /></div>
</div>

<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript">

var url = window.location.search;
if(url.indexOf("?")!=-1){
	var str = url.substr(5);
}
var hmf = str-8;    //和数据库中对应;
$(function(){
	$.ajax({
		type:"post",
	     url:"../getCatlogServ?parentId=2",
	     async:false,
	     dataType: "json",
	     success: function (data) {
	    	 for(var i=0;i<data.length;i++){
	    		 $(".tabl").append('<li><a><span></span>'+data[i].text+'</a></li>');
	    	}
	    	 $(".tabl li:eq("+hmf+") a").addClass('cur');    
	    	 $(".tabl li a").click(function(){
	    			$(".toptab a").removeClass('cur');
	    		    $(this).addClass('cur');
	    		    var index = $(".tabl li a").index(this);
	    		    var id = data[index].id;
	    	       
	    		 $(function(){
	    			 $.ajax({
	    				 type:"post",
	    				 url:"../getCatlogByCatId?Cat="+id,
	    				 async:false,
	    			     dataType:"json",
	    			     success:function(data){
	    			    	  $(".biaoti").empty();
	    		        	  $(".location").empty();
	    		              $(".neirong").empty();
	    		              $(".pagination").empty();
	    			    	  $(".biaoti").append('<h2>'+data.text+'</h2>');
	        	    	      $(".location").append('<p class="tree">您的位置：<a href="index.jsp">首页</a>&gt;<a href="hydt.jsp">行业动态</a>&gt;'+data.text+'</p>');
	        	    	      
	        	    	      var pageSize =6;     //每页显示多少条记录
	        	    	      var total;           //总共多少记录
	        	    	       $(function() {
	        	    	          Init(0);     
	        	    	              $("#Pagination").pagination(total, {    //total不能少        
	        	    	                   callback: PageCallback,            
	        	    	                   prev_text: '上一页',             
	        	    	                   next_text: '下一页',              
	        	    	                   items_per_page: pageSize,              
	        	    	                   num_display_entries: 4,        
	        	    	                   num_edge_entries: 1,
	        	    	                   link_to:"javascript:void(0)"         
	        	    	               });             
	        	    	              function PageCallback(index, jq) {  //前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。         
	        	    	                   Init(index);          
	        	    	              }
	        	    	          });
	        	    	       
	        	    	       function Init(pageIndex){      //参数是点击的页面数
	        	    	           $.ajax({
	        	    	      	    type: "post",
	        	    	            url:"../getContentPaixuServ?Cat="+id+"&rows="+pageSize+"&page="+pageIndex,
	        	    	            async: false,
	        	    	            dataType: "json",
	        	    	            success: function (data) {
	        	    	          	    $(".neirong").empty();
	        	    	          	    total = data.total;    //当前栏目下的总数
	        	    	          	    var array = data.rows;  
	        	    	      	        for(var i=0;i<array.length;i++){
	        	    	      	        	var info=array[i];
	        	    	      	        	if(info.refPic != null){
	        	    	      	        	$(".neirong").append('<dl><h3><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'" >'+info.caption+'</a></h3><dt><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'"><img src="<%=basePathPic%>'+info.refPic+'" alt="'+info.caption+' width="150" height="95""></a></dt>  <dd class="shortdd">'+info.text+'</dd><span>发布时间：'+info.createDate+'</span></dl>') 
	        	    	      	        	}else{
	        	    	      	        	$(".neirong").append('<dl ><h3><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'">'+info.caption+'</a></h3><dd class="shortdd">'+info.text+'</dd><span>发布时间：'+info.createDate+'</span></dl>');
	        	    	      	        	};
	        	    	      	     }   	
	        	    	            },
	        	    	            error: function () {
	        	    	                alert("请求超时，请重试！");
	        	    	            }
	        	    	      	});  
	        	    	      };
	        	    	      
	        	    	      
	    			     }
	    			 })
	    		 })
	    		    
	    		    
	    		    
	    		    
	    	 })	  
	     },
	     error: function () {
	         alert("请求超时，请重试！");
	     }
	})
})

	    	     


</script>


<script type="text/javascript">



//待会做这块，首页点击应该传一个参数过来
    $(function(){                     //您的位置
    	$.ajax({
    		type:"post",
    		url:"../getCatlogByCatId?Cat="+str,
    	    async:false,
    	    dataType:"json",
    	    success:function(data){
    	    	$(".biaoti").append('<h2>'+data.text+'</h2>');
    	    	$(".location").append('<p class="tree">您的位置：<a href="index.jsp">首页</a>&gt;<a href="hydt.jsp">行业动态</a>&gt;'+data.text+'</p>');
    	    },
    	error:function(){
    		alert("请求超时，请重试！");
    	}
    	})
    })


var pageSize =6;     //每页显示多少条记录
var total;           //总共多少记录
 $(function() {
    Init(0); //注意参数，初始页面默认传到后台的参数，第一页是0;    
        $("#Pagination").pagination(total, {   //total不能少        
             callback: PageCallback,            
             prev_text: '上一页',             
             next_text: '下一页',              
             items_per_page: pageSize,              
             num_display_entries: 4,        //连续分页主体部分显示的分页条目数
             num_edge_entries: 1,           //两侧显示的首尾分页的条目数 
         });             
        function PageCallback(index, jq) {     //前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。  
             Init(index);      
        }
    });
 
 function Init(pageIndex){      //这个参数就是点击的那个分页的页数索引值，第一页为0，上面提到了，下面这部分就是AJAX传值了。
     $.ajax({
	    type: "post",
      url:"../getContentPaixuServ?Cat="+str+"&rows="+pageSize+"&page="+pageIndex,
      async: false,
      dataType: "json",
      success: function (data) {
    	    $(".neirong").empty();
/*     	    total = data.total; */
    	    var array = data.rows;
	        for(var i=0;i<array.length;i++){
	        	var info=array[i];
	        	
	        	if(info.refPic != null){
	        	$(".neirong").append('<dl><h3><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'" >'+info.caption+'</a></h3><dt><a href="sjjm.jsp?ContentId='+info.contentId+'" title="'+info.caption+'" ><img src="<%=basePathPic%>'+info.refPic+'" alt="'+info.caption+' width="150" height="95""></a></dt>  <dd class="shortdd">'+info.text+'</dd><span>发布时间：'+info.createDate+'</span></dl>') 
	        	}else{
	        	$(".neirong").append('<dl ><h3><a href="'+info.CntURL+'?ContentId='+info.contentId+'" title="'+info.caption+'" >'+info.caption+'</a></h3><dd class="shortdd">'+info.text+'</dd><span>发布时间：'+info.createDate+'</span></dl>');
	        	};
	     }   	
      },
      error: function () {
          alert("请求超时，请重试！");
      }
	});  
};




$(function(){
    $.ajax({
	    type: "post",
     url:"../Hot",    
     dataType: "json",
     success: function (data) {         //热点
    	 for(var i=0;i<10;i++){
    		 $(".hot").append('<li><span class="n'+(i+1)+'"></span><a href="'+data[i].CntURL+'?ContentId='+data[i].contentId+'">'+data[i].caption+'<span>('+data[i].createDate+')</span></a></li>');
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