<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站首页</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery1.42.min.js" ></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js" ></script>
 <script type="text/javascript" src="js/jquery.scroll.js"></script>
 <script type="text/javascript">
$(function(){
       $.ajax({
	    type: "post",
        url:"../Pic",    //图片
        dataType: "json",
        async:false,
        success: function (data) {
            var c = 0;
            for(var i=0;i<data.length;i++){
	        var info=data[i];
	        	 if(info.pic != null) {
	
	        	$(".tupian").append('<li><a href="'+info.CntURL+'?ContentId='+info.contentId+'" target="_blank" title="'+info.caption+'"><img src="../images/'+info.pic+'" /></a></li>');
	        	 $(".tpwenzi").append('<li><a href="'+info.CntURL+'?ContentId='+info.contentId+'">'+info.caption+'</a></li>'); 
                c++;
	        	if(c == 5){break;} 
	        	}
	        }

            jQuery(".banner").slide({ titCell:".num li", mainCell:".pic",effect:"fold", autoPlay:true,trigger:"click",
     			startFun:function(i){
     				 jQuery(".banner .txt li").eq(i).animate({"bottom":0}).siblings().animate({"bottom":-55});
     			}
     		});
        },
	});  
}); 
</script>   
</head>

<body>

<!--header -->
<div id="header">
  <div class="w1190"><img src="image/head.gif" /></div>
</div>

<!--menu -->
<div id="menu" class="clearfix ofw mb15">
  <ul>
    <li><a href="index.jsp" class="current">网站首页 </a> </li>
    <li><a href="xhgk.jsp">协会概况</a> </li>
    <li><a href="hydt.jsp?Cat=8">行业动态</a> </li>
    <li><a href="hyzz.jsp">会员组织</a> </li>
    <li><a href="zxfw.jsp?Cat=17">咨询服务</a> </li>
  </ul>
</div>

<!--main -->
<div class="w1190 ofw clearfix">
  <div class="w280 mr15 fl">
    <div class="box box-tz in_new p15 ">
      <div class="title">热点资讯</div>
      <ul class="zixun">
<!-- 	            <li><span>2016-03-30</span><a href="sjjmy.jsp" target="_blank" title="关于成立《宁波智能制造》杂志编委会的通知">关于成立《宁波智能制造》杂志编委会的通知</a></li> -->

      </ul>
    </div>
  </div>
  
  <!--slide -->
  <div class="fl">
    <div class="banner">
      <ul class="pic tupian">
	    	<!--<li><a href="sjjmw.jsp" target="_blank" title="李克强会见德国总统：“中国制造2025”和德国“工业4.0”战略对接"><img src="image/plane2.jpg" /></a></li> -->
	  </ul>
       <div class="txt-bg"></div>
      <div class="txt">
        <ul class="tpwenzi">
<!-- 		      <li><a href="sjjmw.jsp">宁波市智能制造协会成立</a></li> -->
		          </ul>
      </div> 
      <ul class="num">
	  	          <li><a></a></li>
	  	          <li><a></a></li>
	  	          <li><a></a></li>
	  	          <li><a></a></li>
	  	          <li><a></a></li>
       	        </ul>
    </div>

  </div>
  <div class="w270 fr"> 
  <div class="box box-tzr in_news p15 ">
      <div class="title">通知文件</div>
      <div id="net" style="overflow:hidden;height:253px;width:240px;">
      <div id=net_1>
      <ul class="tongzhi">
	            <!-- <li><span>2016-03-30</span><a href="sjjmy.jsp" target="_blank" title="关于成立《宁波智能制造》杂志编委会的通知">关于成立《宁波智能制造》杂志编委会的通知</a></li> -->
	 </ul>
      </div>
      <div id=net_2></div>
      </div>
    </div>
  </div>
   </div>

<script type="text/javascript">
var speed=50; 
var net = document.getElementById("net");
var net_1 = document.getElementById("net_1");
var net_2 = document.getElementById("net_2");

net_1.innerHTML+=net_1.innerHTML;
net_2.innerHTML = net_1.innerHTML;    //克隆net_2为net_1
function Marquee(){
    if(net_2.offsetTop-net.scrollTop<=0)    //当滚动至net_1与net_2交界时
        net.scrollTop-=net_1.offsetHeight    //net跳到最顶端
    else{
        net.scrollTop++     //如果是横向的 将 所有的 height top 改成 width left
    }
}
var MyMar = setInterval(Marquee,speed);        //设置定时器
net.onmouseover = function(){clearInterval(MyMar)}    //鼠标经过时清除定时器达到滚动停止的目的
net.onmouseout = function(){MyMar = setInterval(Marquee,speed)}    //鼠标移开时重设定时器
</script>



<div class="w1190 ofw clearfix">
  <div class="w280 mr15 fl mt15 mb15">
    <div class="box in_news p15 hei">
      <div class="intit mb15 newtn"><a href="hydt.jsp?Cat=11">更多</a><span>政策法规</span></div>
      <div ><img src="image/zhengce.gif"  height="80" width="250px"></div>
      <ul class="mt10 zhengce">
      		       
      </ul>
    </div>
  </div>
 

   
<div class="w440 fl mt15">
    <div class="box in_news pl15 pr15 pb15 ">
      <div class="intitn mt15"><a href="hydt.jsp?Cat=8">更多</a></div>
      <div class="toptab ofw clearfix newtn"><a href="hydt.jsp?Cat=8" class="on"><span>协会动态</span></a><a href="hydt.jsp?Cat=10"><span>行业资讯</span></a>
      </div>
      
      <div class="box-content">
        <div class="contab">
		          <div class="newstop">
            <h1 class="biaoti"><!-- <a href="sjjmy.jsp" target="_blank" title="模具材料的渗碳和渗氮表面处理工艺">模具材料的渗碳和渗氮表面处理工艺</a> --></h1> 
             <p class="neirong"> <!-- <a href="sjjmw.jsp" target="_blank" title="模具材料的渗碳和渗氮表面处理工艺"><i>[详情]</i>渗碳必须用低碳钢或低碳合金钢，可分为固体、液体、气体渗碳三种。应用较广泛的气体渗碳，加热温度900-950℃。渗碳深度主要取决于保温时间，一般按每小时韧性。</a> --></p>
          </div>
		            <ul class="in_news xiehui">
		              <!-- <li><span>2016-04-12</span><a href="sjjmw.jsp" target="_blank" title="模具材料的渗碳和渗氮表面处理工艺"><i>协会动态&nbsp;&nbsp;|&nbsp;&nbsp;</i>模具材料的渗碳和渗氮表面处理工艺</a></li> -->
		            
          </ul>
        </div>
  
        <div class="contab" style="display: none">
                   <div class="newstop">
            <h1 class="hangye"><!-- <a href="sjjmw.jsp" target="_blank" title="2016第三届亚太国际3D打印产业展览会邀请函"> 2016第三届亚太国际3D打印产业展览会邀请函</a> --></h1>
            <p class="hyneirong"><!-- <a href="sjjmw.jsp" target="_blank" title="模具材料的渗碳和渗氮表面处理工艺"><i>[详情]</i>指导单位：商务部流通促进中心、广东省商务厅、广东省经信委　　主办单位：广东省三维打印技术创新应用协会、广州里外展览策划有限公司　　承办单位：广州里外展览策划有限公司　　支持单位：中国工业设...</a> --></p>
          </div>
		            <ul class="in_news hyzx">
                     <!-- <li><span>2016-03-22</span><a href="sjjmw.jsp" target="_blank" title="关于举办宁波均胜智能制造装备及应用交流会的邀请函"><i>行业资讯&nbsp;&nbsp;|&nbsp;&nbsp;</i>关于举办宁波均胜智能制造装备及应用交流会的邀请函</a></li>
		        <li><span>2016-01-22</span><a href="sjjmy.jsp" target="_blank" title="2016第三届亚太国际3D打印产业展览会邀请函"><i>行业资讯&nbsp;&nbsp;|&nbsp;&nbsp;</i>2016第三届亚太国际3D打印产业展览会邀请函</a></li> -->
		 </ul>
        </div>
      </div>
    </div>
  </div>
  
  
  
  <div class="w440 fr ofw">
    <div class="box in_pros pt15 pr5 pl15 pr15 mt15">
      <div class="intit mb15"><a href="zxfw_1.jsp">更多</a><span>典型案例</span></div>
      <ul class=" clearfix ofw">
              
		 <li><a href="sjjmw.jsp" target="_blank" title="这辆婴儿车，同时还是一辆自行车"><img src="image/pic1.gif" width="130" height="102"><span>这辆婴儿车，同时还是一辆自行车</span></a></li>
		       
		 <li><a href="sjjmy.jsp" target="_blank" title="预防酒驾的自行车锁"><img src="image/pic2.gif" width="130" height="102"><span>预防酒驾的自行车锁</span></a></li>
		       
		 <li><a href="sjjmw.jsp" target="_blank" title="禅意悬浮盆景"><img src="image/pic3.gif" width="130" height="102"><span>禅意悬浮盆景</span></a></li>
		       
		 <li><a href="sjjmy.jsp" target="_blank" title="压力测试球"><img src="image/pic4.gif" width="130" height="102"><span>压力测试球</span></a></li>
		       
		 <li><a href="sjjmw.jsp" target="_blank" title="新式概念车会分身：可变2个摩托车"><img src="image/pic5.gif" width="130" height="102"><span>新式概念车会分身：可变2个摩托车</span></a></li>
		       
		 <li><a href="sjjmy.jsp" target="_blank" title="3D打印的衣服3D打印的衣服"><img src="image/pic6.gif" width="130" height="102"><span>3D打印的衣服3D打印的衣服</span></a></li>
		      </ul>
    </div>
  </div>


<!--链接 -->
<div class="w1190 ofw clearfix">
  <div class="box pt15 pl15 pr15 pb10">
    <!--会长单位 -->
     <div class="link mb5 ">
      <div class="link_line"></div>
      <div class="link_tit"><a href="hyzz.jsp"><span>会长单位</span></a></div>
    </div>
    </div>
    <div class=" clearfix">
  <ul class="ad_postion ofw">
  	 
     <li class="mr17"><a href="http://www.joyson.cn/" target="_blank" title="宁波均胜电子股份有限公司"><img src="image/sj1.gif" /></a></li>
		
	 <li class="mr17"><a href="http://www.hision.com.cn/" target="_blank" title="宁波海天精工股份有限公司"><img src="image/sj2.gif" /></a></li>
		
	 <li class="mr17"><a href="http://www.cwbearing.com.cn/" target="_blank" title="宁波慈兴轴承有限公司"><img src="image/sj3.gif" /></a></li>
		
	 <li class="mr17"><a href="http://www.airtac.com/" target="_blank" title="宁波亚德客自动化工业有限公司"><img src="image/sj4.gif" /></a></li>
		
	 <li class="mr17"><a href="http://www.phase.com.cn" target="_blank" title="宁波菲仕运动控制技术有限公司"><img src="image/sj5.gif"/></a></li>
		
	 <li ><a href="http://www.helimould.com/" target="_blank" title="宁波合力模具科技股份有限公司"><img src="image/sj6.gif" /></a></li>
		
	 </ul>
</div>
    
    <div class="box p15">
    <!--理事单位 -->
    <div class="link mb5">
      <div class="link_line"></div>
      <div class="link_tit "><a href="hyzz_1.jsp"><span>理事单位</span></a></div>
    </div>
    <div class="link_a">
		<a href="http://www.pm-china.com/" target="_blank" title="东睦新材料集团股份有限公司">东睦新材料集团股份有限公司</a>
	<span>|</span>	<a href="http://www.jianxin.com/" target="_blank" title="建新赵氏集团有限公司">建新赵氏集团有限公司</a>
	<span>|</span>	<a href="http://www.aomate.com.cn/" target="_blank" title="宁波澳玛特高精冲压机床股份有限公司">宁波澳玛特高精冲压机床股份有限公司</a>
	<span>|</span>	<a href="http://www.nbbqd.com/" target="_blank" title="宁波百琪达自动化设备有限公司">宁波百琪达自动化设备有限公司</a>
	<span>|</span>	<a href="http://www.wtoo.com.cn/" target="_blank" title="宁波达尔轴承有限公司">宁波达尔轴承有限公司</a>
	<span>|</span>	<a href="http://www.nbdeli.com/" target="_blank" title="宁波得力文具有限公司">宁波得力文具有限公司</a>
	<span>|</span>	<a href="http://www.dechang-motor.com/" target="_blank" title="宁波德昌电机制造有限公司">宁波德昌电机制造有限公司</a>
	<span>|</span>	<a href="http://www.fzmould.com/" target="_blank" title="宁波方正汽车模具有限公司">宁波方正汽车模具有限公司</a>
	<span>|</span>	<a href="http://www.fatocn.com/" target="_blank" title="宁波飞图自动技术有限公司">宁波飞图自动技术有限公司</a>
	<span>|</span>	<a href="http://www.ngtb.cn/" target="_blank" title="宁波更大集团有限公司">宁波更大集团有限公司</a>
	<span>|</span>	<a href="http://www.nbut.cn/" target="_blank" title="宁波工程学院">宁波工程学院</a>
	<span>|</span>	<a href="http://www.saikesi.com/" target="_blank" title="宁波广天赛克思液压有限公司">宁波广天赛克思液压有限公司</a>
	<span>|</span>	<a href="http://www.china-huashuotooling.com/" target="_blank" title="宁波华朔模具机械有限公司 ">宁波华朔模具机械有限公司 </a>
	<span>|</span>	<a href="http://www.nbhx-trim.com.cn/" target="_blank" title="宁波华翔特雷姆汽车饰件有限公司">宁波华翔特雷姆汽车饰件有限公司</a>
	<span>|</span>	<a href=" http://hongxie.com/" target="_blank" title="宁波宏协离合器有限公司">宁波宏协离合器有限公司</a>
	</div>

		 <!--会员单位 -->
    <div class="link mt15 mb15">
      <div class="link_line"></div>
      <div class="link_tit "><a href="hyzz_2.jsp"><span>会员单位</span></a></div>
    </div>
    <div class="link_a">
		<a href="" target="_blank" title="宁波长晟电子科技有限公司">宁波长晟电子科技有限公司</a>
	<span>|</span>	<a href="http://" target="_blank" title="卓力电器集团有限公司">卓力电器集团有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波新思维数控设备有限公司">宁波新思维数控设备有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波市奥特曼自动化设备有限公司">宁波市奥特曼自动化设备有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="浙江金瑞薄膜材料有限公司">浙江金瑞薄膜材料有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="浙江捷能汽车零部件有限公司">浙江捷能汽车零部件有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波正庄发展有限公司">宁波正庄发展有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波市宇华电器有限公司">宁波市宇华电器有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波富乐礼机器人科技有限公司">宁波富乐礼机器人科技有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波沧泓智能科技有限公司">宁波沧泓智能科技有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波泰鸿机电有限公司">宁波泰鸿机电有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波新甬城数控自动化设备有限公司">宁波新甬城数控自动化设备有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波天工智造工业技术有限公司">宁波天工智造工业技术有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波天波港联电子有限公司">宁波天波港联电子有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波欧菱电梯配件有限公司">宁波欧菱电梯配件有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波柏人艾电子有限公司">宁波柏人艾电子有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="君禾泵业股份有限公司">君禾泵业股份有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波碧彩实业有限公司">宁波碧彩实业有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波市鄞州永林电子电器有限公司">宁波市鄞州永林电子电器有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波三邦超细纤维有限公司">宁波三邦超细纤维有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波升谱光电半导体有限公司">宁波升谱光电半导体有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波韦尔德斯凯勒智能科技有限公司">宁波韦尔德斯凯勒智能科技有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波康福特健身器械有限公司">宁波康福特健身器械有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波百加百测控设备有限公司">宁波百加百测控设备有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="国家气动产品质量监督检验中心">国家气动产品质量监督检验中心</a>
	<span>|</span>	<a href="" target="_blank" title="宁波考比锐特汽车科技有限公司">宁波考比锐特汽车科技有限公司</a>
	<span>|</span>	<a href="" target="_blank" title="宁波飞羚电器有限公司">宁波飞羚电器有限公司</a>
	</div>
    <!--友情链接 -->
    <div class="link mb15 mt15">
      <div class="link_line"></div>
      <div class="link_tit "><span>友情链接</span></div>
    </div>

    <div class="link_a">
		<a href="http://www.nbeic.gov.cn" target="_blank" title="宁波市经信委">宁波市经信委</a>
	<span>|</span>	<a href="http://nbsa1.nbsme.gov.cn/" target="_blank" title="宁波文具行业协会">宁波文具行业协会</a>
	<span>|</span>	<a href="http://www.nbzyjlr.com/" target="_blank" title="宁波市职业经理人协会">宁波市职业经理人协会</a>
	<span>|</span>	<a href="http://www.nbpmia.com/" target="_blank" title="宁波市塑料行业协会">宁波市塑料行业协会</a>
	<span>|</span>	<a href="http://www.0574ne.cn/" target="_blank" title="宁波市企业家协会">宁波市企业家协会</a>
	<span>|</span>	<a href="http://www.mould.gov.cn/" target="_blank" title="宁波市模具行业协会">宁波市模具行业协会</a>
	<span>|</span>	<a href="http://www.nbdz.org/" target="_blank" title="宁波电子行业协会">宁波电子行业协会</a>
	<span>|</span>	<a href="宁波市企业信息化促进会" target="_blank" title="宁波市企业信息化促进会">宁波市企业信息化促进会</a>
	<span>|</span>	<a href="http://www.nbfa.com.cn/" target="_blank" title="宁波市铸造行业协会">宁波市铸造行业协会</a>
	<span>|</span>	<a href="http://www.nbeeia.cn/" target="_blank" title="宁波市电工电气行业协会">宁波市电工电气行业协会</a>
	<span>|</span>	<a href="http://www.fastener-cn.net/" target="_blank" title="宁波紧固件工业协会">宁波紧固件工业协会</a>
	<span>|</span>	<a href="http://www.nbhpsa.cn/" target="_blank" title="宁波市液压气动密封件行业协会">宁波市液压气动密封件行业协会</a>
	<span>|</span>	<a href="宁波缝制机械行业协会" target="_blank" title="宁波缝制机械行业协会">宁波缝制机械行业协会</a>
	<span>|</span>	<a href="http://www.nbjdw.net.cn/" target="_blank" title="宁波家电协会">宁波家电协会</a>
	<span>|</span>	<a href="http://www.nbaia.cn/" target="_blank" title="宁波市汽车零部件产业协会">宁波市汽车零部件产业协会</a>
	<span>|</span>	<a href="http://www.nbpmia.com/" target="_blank" title="宁波市塑料机械行业协会">宁波市塑料机械行业协会</a>
	<span>|</span>	<a href="http://www.nb-hw.com/" target="_blank" title="宁波市五金制品协会">宁波市五金制品协会</a>
	<span>|</span>	<a href="http://nhrca.org/" target="_blank" title="宁波市人力资源服务行业协会">宁波市人力资源服务行业协会</a>
	<span>|</span>	<a href="http://www.9peak.com/" target="_blank" title="九峰网">九峰网</a>
	<span>|</span>	<a href="http://www.mould.org.cn" target="_blank" title="中国压铸模具网">中国压铸模具网</a>
	<span>|</span>	<a href="http://www.cmpc.cc" target="_blank" title="易模网">易模网</a>
	<span>|</span>	<a href="http://www.hejin360.com/" target="_blank" title="全锌网">全锌网</a>
	<span>|</span>	<a href="http://www.001cndc.com/" target="_blank" title="中华压铸网">中华压铸网</a>
	</div>
  </div>
</div>
</div>
<!-- footer-->
<div class="ofw clearfix  mt15 box" id="footer">
  <div class="w1190 tc">CopyRight&nbsp;&nbsp;主办单位：镇海区信息技术协会<br /></div>
</div>
<script type="text/javascript">
    $(function(){
       $.ajax({
	    type: "post",
        url:"../Tongzhi?Cat=9",          //通知文件
        dataType: "json",
        success: function (data) {
	        for(var i=0;i<9;i++){
	        	var info=data[i];
	        	$(".tongzhi").append('<li><span>'+info.createDate+'</span><a href="'+info.CntURL+'?ContentId='+info.contentId+'" target="_blank" title="'+info.caption+'">'+info.caption+'</a></li>');
	            }
        },
        error: function () {
            alert("请求超时，请重试！");
        }
	});  
});

  $(function(){
       $.ajax({
	    type: "post",
        url:"../Tongzhi?Cat=11",    //政策法规
        dataType: "json",
        success: function (data) {
	        for(var i=0;i<5;i++){
	        	var info=data[i];
	        	$(".zhengce").append('<li><a href="'+info.CntURL+'?ContentId='+info.contentId+'" target="_blank" title="'+info.caption+'">'+info.caption+'</a></li>');
	        }
        },
        error: function () {
            alert("请求超时，请重试！");
        }
	});  
});        

$(function(){
       $.ajax({
	    type: "post",
        url:"../Tongzhi?Cat=8",    //协会动态
        dataType: "json",
        success: function (data) {
                $(".biaoti").append('<a href="'+data[0].CntURL+'?ContentId='+data[0].contentId+'" target="_blank" title="'+data[0].caption+'">'+data[0].caption+'</a>');
	            $(".neirong").append('<a href="'+data[0].CntURL+'?ContentId='+data[0].contentId+'" target="_blank" title="'+data[0].caption+'"><i>[详情]</i>'+data[0].text+'</a>');
	        for(var i=1;i<6;i++){
	        	var info=data[i];
	        	$(".xiehui").append('<li><span>'+info.createDate+'</span><a href="'+info.CntURL+'?ContentId='+info.contentId+'" target="_blank" title="'+info.caption+'"><i>协会动态&nbsp;&nbsp;|&nbsp;&nbsp;</i>'+info.caption+'</a></li>');
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
        url:"../Tongzhi?Cat=10",    //行业资讯
        dataType: "json",
        success: function (data) {
                $(".hangye").append('<a href="'+data[0].CntURL+'?ContentId='+data[0].contentId+'" target="_blank" title="'+data[0].caption+'">'+data[0].caption+'</a>');
	            $(".hyneirong").append('<a href="'+data[0].CntURL+'?ContentId='+data[0].contentId+'" target="_blank" title="'+data[0].caption+'"><i>[详情]</i>'+data[0].text+'</a>');
	        for(var i=1;i<6;i++){
	        	var info=data[i];
	        	$(".hyzx").append('<li><span>'+info.createDate+'</span><a href="'+info.CntURL+'?ContentId='+info.contentId+'" target="_blank" title="'+info.caption+'"><i>行业资讯&nbsp;&nbsp;|&nbsp;&nbsp;</i>'+info.caption+'</a></li>');
	        }
        },
        error: function () {
            alert("请求超时，请重试！");
        }
	});  
});

$(function(){
       $.ajax({
	    type: "post",
        url:"../Hot",    //热点资讯
        dataType: "json",
        success: function (data) {
	        for(var i=0;i<10;i++){
	        	var info=data[i];
	        	$(".zixun").append('<li><span>'+info.createDate+'</span><a href="'+info.CntURL+'?ContentId='+info.contentId+'" target="_blank" title="'+info.caption+'">'+info
	        	.caption+'</a></li>');
	        }
        },
        error: function () {
            alert("请求超时，请重试！");
        }
	});  
});


</script> 
<script>
    $(".toptab a").mouseover(function(){
		$(this).addClass('on').siblings().removeClass('on');
		var index = $(this).index();
		/* number = index; */
		$('.box-content .contab').hide();
		$('.box-content .contab:eq('+index+')').show();
	});
</script>

</body>
</html>
