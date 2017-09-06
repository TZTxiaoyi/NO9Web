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
  	<script type="text/javascript" src="jq/jquery.cookie1.4.1.js"></script>
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
        h4{
        	text-align:center;
        	color:#000000;
        }
        h5{
        	text-align:center;
        	color: #8B8B8B;
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
    	.loginform div {
			margin-left:20%;
			width: 350px;
			height: 40px;
			margin-top:30px;
		}
		
		.loginform input {
			width: 240px;
			height: 40px;
		}
		
		
		.loginform span{
			font-size:18px;
			white-space:nowrap;
		}
	
		#forget{
			margin-left:50px;
			color:red;
			text-align:left;
		}	
		#log_reg{
			margin-top:12px;
			margin-left:10px;
		}
		#log_img{
			display:none;
		}
		#log_img button{
			border:0px;
		}
		#myModal1 h4{
			text-align:left;
		}
 	</style>
 	
  </head>
  
  <body>
  
  	<!-- 头部 -->
  	<div id="head">
  		<!-- 头部-head -->
  		
  		<div class="container">
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
        <!-- 头部-footer -->
        
        <div class="container">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div id="img">
                    <a href="index.jsp"><img src="images/logo.png" alt="" width="100" height="50" /></a>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
				<ul class="nav navbar-nav pull-right">
                	<li><a href="proscenium.jsp">主页</a></li>
					<li><a href="#">公益众筹</a></li>
                	<li><a href="our-causes-detail.html">奖励众筹</a></li>
					<li><a href="gallery.html">APP</a></li>
					<li>
						<div id="log_reg">
	                		<a data-toggle="modal" data-target="#myModal">登录</a>
	                		<span>|</span>
	          				<a data-toggle="modal" data-target="#myModal1">注册</a>
                 		</div>
                 		<div id="log_img" class="dropdown">
                 			
                 			<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
   								 <img src="images/touxiang.png" width="30px" height="30px" class="img-circle"/>
    							 <span class="caret"></span>
  							</button>
	                 		<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							    <li><a href="#">用户<span id="user"></span></a></li>
							    <li><a href="#">我的理财</a></li>
							    <li><a href="#">我的订单</a></li>
							    <li><a href="#">我的关注</a></li>
							    <li><a href="#">我的发起</a></li>
							    <li><a href="#">我的红包</a></li>
							    <li><a href="#">消息</a></li>
							    <li><a href="#">设置</a></li>
							    <li><a id="exit">退出</a></li>
							  </ul>
	                		
                 		</div>
                 	</li>
                 </ul>
			</div>
		</div>
  	</div>
  	
  	<!-- 登录Modal -->

	<div class="media media-y margin-big-bottom"></div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss=modal>×</button>
					<div class="text-center margin-big padding-big-top">
						<h1>登录</h1>
					</div>
				</div>
				<div class="loginform">
					<div>
						<input placeholder="手机号/用户名/邮箱" type="text" id="accounts"
							 name ="zbud.account"/> 
							 <span ></span>
					</div>
					<div>
						<input placeholder="输入密码" type="password" id="passwords"
							 name ="zbud.pwd"/> <span
							id="aaa2"></span>
					</div>
					<div class="field">
						<input type="text" class="input input-big" name="code" width="100" onblur="paBlur1()"
							placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" /> <img
							src="images/passcode.jpg" alt="" width="100" height="32"
							class="passcode" style="height:43px;cursor:pointer;"
							onclick="this.src=this.src+'?'">

					</div>
					<div>
						<button type="button" class="btn btn-info btn-group-lg"id="login">
							登录
						</button>
						<a href="" id="forget">忘记密码？</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 用户注册模态框 -->

	<div class="media media-y margin-big-bottom"></div>
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss=modal>×</button>
					<h4 class="modal-title margin-big padding-big-top"
						id="myModalLabel">

						如有账号， <a href="proscenium.jsp">请登录</a>
					</h4>
				</div>
				<div class="loginform">
					<div>
						<input placeholder="手机号/用户名/邮箱" type="text" id="accounts1" name ="userdata.account"/> 
						<br/><span id="loginuser"></span>
					</div>
					<div>
						<input placeholder="输入密码" type="password" id="passwords1"
						name ="userdata.pwd"/><br/> <span id="aa2"></span>
					</div>
					<div>
						<input placeholder="再次输入密码" type="password" id="pswords"/> 
						<br/><span id="aa3"></span>
					</div>
					<div>
						<button type="submit" id="register" class="btn btn-info btn-group-lg" >注册</button>
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
			 		<a href='pro_details.jsp'><img src="images/tudou.png" alt="" style="height: 300px;width: 100%"></a>
			 			<div class="carousel-caption">
			 				<h3></h3>
			 				<p></p>
			 			</div>
			 	</div>
 				<div class="item">
 					<a href='pro_details.jsp'><img src="images/liangshi.png" alt="" style="height: 300px;width: 100%"></a>
 					<div class="carousel-caption">
 						<h3></h3>
 						<p></p>
 					</div>
 				</div>
 				<div class="item">
					 <a href='pro_details.jsp'><img src="images/zishahu.png" alt="" style="height: 300px;width: 100%"></a>
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
	/*
		页面加载时自动加载项目
	*/
	$(function(){
		var data={};
		$.ajax({
			type:"post",
			dataType:"json",
			url:"pro/selectPro.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){	 
				$.each(data,function(index,value){
					/* var moddel="<div class=\"col-md-3 col-sm-3 col-xs-12\"><a href='pro_details.jsp?title="+value.TITLE+"&&img="+value.COVER+"&&pid="+value.PROJECTSID+"'><img src=\"images/"
					+value.COVER+"\" alt=\"\" width=\"300\" height=\"260\"><h4>"+value.TITLE+"</h4><hr/><h5>"+value.GOAL+"</h5></a>"
					+"<div class=\"progress\">"
					+"<div class=\"progress-bar progress-bar-success\" style=\"width: 90%;\">"
					+"<span>已完成90%</span></div></div></div>";
					$("#moddel").append(moddel); */
					var moddel="<div class=\"col-md-3 col-sm-3 col-xs-12\"><a href='pro_details.jsp' class=\"img\" pid="+value.PROJECTSID+"><img src=\"images/"
					+value.COVER+"\" alt=\"\" width=\"300\" height=\"260\"><h4>"+value.TITLE+"</h4><hr/><h5>"+value.GOAL+"</h5></a>"
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
	});
	$("#moddel").on('click',".img",function(){
		var pid=$(this).attr("pid");
		alert(pid);
		$.cookie('pid', pid);
	})
	/*
		注册按钮点击事件
	*/
	$("#register").click(function() {
		
		var data = {
			accounts : $("#accounts1").val(),
			passwords : $("#passwords1").val(),
		};
		$.ajax({
			type : "post",
			dataType : "json",
			data:data,
			url : "/P2P/ProWeb/register.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
				login(data);
				/* $("#user").append(data1.resultEmployee[0].USERNAME);
				$("#log_reg").hide();
				$("#log_img").show();
				$('#myModal1').modal('hide');
				$.cookie('account1', act1) //存入值 */
			}
		});
	});
	/*
		登陆按钮点击事件
	*/
	$("#login").click(function() {
		var data = {
				accounts : $("#accounts").val(),
				passwords : $("#passwords").val(),
			};
		login(data);
	});
	/*
		注册登录调用函数
	*/
	function login(data){
		alert(data.accounts);
		alert(data.passwords);
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/ProWeb/login.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(result) {//data为返回的数据，在这里做数据绑定  
				
				if(result.resultType=="true"){
					$("#user").append(result.resultEmployee[0].USERNAME);
					$("#userid").append(result.resultEmployee[0].EMPID);
					$("#log_reg").hide();
					$("#log_img").show();
					$('#myModal').modal('hide');
					$('#myModal1').modal('hide');
					$.cookie('account', result.resultEmployee[0].USERNAME);
					$.cookie('empid',result.resultEmployee[0].EMPID);
				}else{
					alert("用户名和密码不匹配");
				}
					
			},
			error : function() {
				alert("error");
			}
		});
	}
	/*
		页面加载时查看cookie里的值
	*/
	$(function(){
		$("#userid").append($.cookie("empid"));
		var account1=$.cookie("account1");
		var account=$.cookie("account");
		if(account!=null){
			$("#user").append(account);
			$("#log_reg").hide();
			$("#log_img").show();
		}
		if(account1!=null){
			$("#user").append(account1);
			$("#log_reg").hide();
			$("#log_img").show();
		} 
	})
	/*
		退出按钮点击事件
	*/
	$("#exit").click(function(){
		window.location.href="proscenium.jsp";
		 
		$("#log_reg").show();
		$("#log_img").hide();
		$.cookie('account', '', { expires: -1 });
		$.cookie('account1', '', { expires: -1 });
		 
	})
</script>
