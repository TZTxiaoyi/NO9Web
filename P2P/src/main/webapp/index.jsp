<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
  	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
 	
 	<style>
 		#head-right li{
 			float:left;
 			margin:10px;
 			list-style: none;
 			
 		}
 		#head-right li i{
 			
 			margin-right:5px;
 		}
 		#head-right li span{
 			color:#FFFFFF;
 		}
 		#head{
 			height:60px;
 			width:100%;
 			line-height:1.6;
 			background-color: #000000;
 		}
 		#head form{
 			margin-top:20px;
 		}
 		#img{
 			margin:10px;
 		}
 		#moddel>div{
        	margin:30px;
        }
        #moddel p{
        	text-align:center;
        	fint-size:20px;
        }
        #footer{  
	        clear: both;  
	        display: block;  
	        text-align: center;   
	        margin: 0px auto;  
	       
	        bottom: 0px;  
	        width: 100%;  
    	} 
    	#footer-head{
    		background-color:red;
    		height:50;
    	}
    	#footer-head a{
    		line-height:4.0;
    		font-size:15px;
    		color:#FFFFFF;
    		margin-right:10px;
    	}	
 	</style>
 	
  </head>
  
  <body>
  	<!-- 头部 -->
  	<div id="head">
  		<!-- 头部-head -->
  		<div class="container">
  			<div class="row">
		  		<div class="col-md-5 col-sm-5 col-xs-12">
		        	<div>
		            	<form>
		                    <input type="search" name="search" placeholder="Search....." />
		                    <a type="button"><span class="glyphicon glyphicon-search"></span></a>
		                </form> 
		            </div>
		        </div>
		        <div class="col-md-7 col-sm-7 col-xs-12">
		        	<div id="head-right">
		            	<ul>
		                	<li><a href="#"><i class="glyphicon glyphicon-envelope"></i><span>admin@yahoo.com</span></a></li>
		                	<li><a href="#"><i class="glyphicon glyphicon-earphone"></i><span>080.0444.333</span></a></li>
		                    <li><a href="#"><i class="glyphicon glyphicon-map-marker"></i><span>Street 222, South Africa</span></a></li>
		                </ul>
		            </div>
		        </div>
	    	</div>
        </div>
        <!-- 头部-footer -->
        <div class="container">
       		<div class="row">
            	<div class="col-md-3 col-sm-3 col-xs-12">
                	<div id="img">
                    	<a href="index.jsp"><img src="images/logo.png" alt="" width="100" height="50" /></a>
                    </div>
                </div>
            	<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="navbar-collapse collapse">
                    	<ul class="nav navbar-nav pull-right">
                        	<li><a href="index.jsp">主页</a></li>
							<li><a href="#">公益众筹</a></li>
                        	<li><a href="our-causes-detail.html">奖励众筹</a></li>
							<li><a href="gallery.html">APP</a></li>
                        	<li><a href="about-us.html">登录</a></li>
                       		<li><a href="contact-us.html">注册</a></li>
                       	</ul>
                    </div>
				</div>
			</div>
		</div>
  	</div>
  	<!-- 中间-->
  	<div>
  		<!-- 中间上部——轮播图片 -->	
  		<div id="slidershow" class="carousel slide" data-ride="carousel">
 			<!-- 设置图片轮播的顺序 -->
 			<ol class="carousel-indicators">
				<li class="active" data-target="#slidershow" data-slide-to="0"></li>
				<li data-target="#slidershow" data-slide-to="1"></li>
				<li data-target="#slidershow" data-slide-to="2"></li>
 			</ol>
			<!-- 设置轮播图片 -->
			<div class="carousel-inner">
				<div class="item active">
			 		<a href="##"><img src="images/tudou.png" alt="" style="height: 300px;width: 100%"></a>
			 			<div class="carousel-caption">
			 				<h3></h3>
			 				<p></p>
			 			</div>
			 	</div>
 				<div class="item">
 					<a href="##"><img src="images/liangshi.png" alt="" style="height: 300px;width: 100%"></a>
 					<div class="carousel-caption">
 						<h3></h3>
 						<p></p>
 					</div>
 				</div>
 				<div class="item">
					 <a href="##"><img src="images/zishahu.png" alt="" style="height: 300px;width: 100%"></a>
					 <div class="carousel-caption">
					 	<h3></h3>
					 	<p></p>
					 </div>
				</div>
 			</div>
			<!-- 设置轮播图片控制器 -->
			<a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
			 	<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		<!-- 中间底部——动态添加数据库项目 -->
		<div id="moddel" class="container">
           <div class="row">
           	
        </div>
  	</div>
  	<!-- 尾部-->
  	<div id="footer">
	  	<div class="container">
		    <div class="footer_nav" id="footer-head">
		        <a href="/">网站首页</a>
		        <a href='/NewsList/69.html' target='_blank' title='关于我们'>关于我们</a>
		        <a href='/NewsList/70.html' target='_blank' title='政策法规'>政策法规</a>
		        <a href='/PublicDonation/71.html' target='_blank' title='捐赠方式'>捐赠方式</a>
		        <a href='/NewsList/73.html' target='_blank' title='联系方式'>联系方式</a>
		    </div>
		    <h6>
		     	   版权所有：中华慈善总会[京ICP备09059580号-5] 盗版必究<img src='http://www.beian.gov.cn/img/ghs.png' width='15px' height='15px'>
				<a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010202007331" target="_blank" style="color:#c3c2c2">京公网安备 11010202007331号</a><br/>
				地址：北京市西城区二龙路甲33号新龙大厦 咨询电话：010-66083260  邮政编码：100032 <br/>
				技术支持：北京厚普聚益科技有限公司<br/>
			</h6>
	  	</div>
  	</div>
  </body>
</html>
<script>
$(function(){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"pro/selectPro.do",
		contentType:"application/json;charset=utf-8",
		//data:JSON.stringify(data),
		success:function(data){	 
			$.each(data,function(index,value){
				//alert(value.COVER);
				var moddel="<div class=\"col-md-3 col-sm-3 col-xs-12\"><img src=\"images/"
				+value.COVER+"\" alt=\"\" width=\"300\" height=\"260\"><p>"+value.GOAL+"</p>"
				+"<div class=\"progress\">"
				+"<div class=\"progress-bar progress-bar-success\" style=\"width: 90%;\">"
				+"<span>已完成90%</span></div></div></div>";
				$("#moddel").append(moddel);
			})
		},
		error:function(){
			alret("error");
		}
	});
})
</script>
