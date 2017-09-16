<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>
	
	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
   	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
	<style type="text/css">
		#top{
			background:url(images/top.png) no-repeat 50% 100%;
			background-size:100% 100%;
			height:100px;
			
		}
		#spantop{
			text-align:center;
			margin-left:500px;
			margin-top:-30px;
		}
		.btn-circle.btn-xl {
			background-color:#00CCFF;
			 width: 70px;
			 height: 70px;
			 margin-top:15px;
			 padding: 20px 20px;
		 	 font-size: 24px;
		     line-height: 1.33;
			 border-radius: 35px;
		}
		
		#leftMenu{
			/* border:1px solid green;  */
			height:540px;
		}
		#right{
			/* border:1px solid blue; */
			height:540px; 
			margin-left:-10px;
			
		}
		
		
	</style>
</head>
<body>
	<div class= "container-fluid">
<!-- 标题 -->
		<div class = "row"  id = "top">
			<div class = "col-lg-12">			
				<a href= "proscenium.jsp" type="button" class="btn btn-default btn-circle btn-xl">
					<i class="glyphicon glyphicon-equalizer"></i>
					<h1 id = "spantop"> 个人中心 </h1>
				</a>			
			</div>
		</div>
<!-- 内容 -->
		<div class = "row" id = "middle">
			<div class = "col-lg-2" id ="leftMenu">
				<table class="table table-bordered  table-hover table-condensed">
				 <!--  <tr class="active"><td></td></tr> -->
				  <tr class="success"><td><button class = "btn btn-link btn-info" id = "Myfollow"><span class=" glyphicon glyphicon-plus-sign"></span> 我的发起</button></td></tr>

				  <tr class="success"><td><button class = "btn btn-link btn-info" ><span class="glyphicon glyphicon-asterisk"></span> 项目管理</button></td></tr>
				  <tr class="success"><td><button class = "btn btn-link btn-info" id="MyOrders" ><span class="glyphicon glyphicon-shopping-cart"></span> 我的订单</button></td></tr>
				  <!-- <tr class="success"><td><a href = "#"><span class="glyphicon glyphicon-leaf"></span> 我的理财卷</a></td></tr> -->
				  <tr class="active"><td><b>我的</b></td></tr>
				  <tr class="warning"><td><button class = "btn btn-link btn-info"><span class="glyphicon glyphicon-heart"></span> 我的关注</button></td></tr>
				  <tr class="warning"><td><button class = "btn btn-link btn-info" id = "myBanlance"><span class="glyphicon glyphicon-tint"></span> 账户余额</button></td></tr>
				  <!--<tr class="warning"><td>我的红包</td></tr>-->
				  <!-- <tr class="warning"><td><button class = "btn btn-link btn-info"><span class="glyphicon glyphicon-list-alt"></span> 抵用券</button></td></tr> -->
				  <tr class="active"><td><b>消息</b></td></tr>
				  <tr class="danger"><td><button class = "btn btn-link  btn-info" id="MyComment"><span class="glyphicon glyphicon-comment"></span> 我的评论</button></td></tr>
				  <tr class="danger"><td><button class = "btn btn-link  btn-info" id = "PersonalLetter"><span class="glyphicon glyphicon-envelope"></span> 我的私信</button></td></tr>
				  <tr class="active"><td><b>设置</b></td></tr>
				  <tr class="info"><td><button class = "btn btn-link btn-info" id="PersonalData" ><span class="glyphicon glyphicon-user"></span> 个人资料</button></td></tr>
				  <tr class="info"><td><button class = "btn btn-link btn-info" id = "ModifyPassword"><span class="glyphicon glyphicon-edit" ></span> 修改密码</button></td></tr>
				  <tr class="info"><td><button class = "btn btn-link btn-info" id = "DeliveryAddress"><span class="glyphicon glyphicon-map-marker"></span> 收货地址</button></td></tr>
				</table>
			</div><!-- 左菜单 -->
			<div class = "col-lg-10" id = "right">	
					<iframe id = "urlIframe" src = "" width=100% height=100% >
						
					 </iframe>	
			</div>
		</div>

		
	</div><!-- 栅格div -->
</body>
</html>
	<script>
//------------------------------------点击账户余额-------------------------------------
		$("#myBanlance").click(function(){
			$("iframe").show();
			$("#urlIframe").attr("src","zbjsp/myBalance.jsp");
		});
//---------------------------------点击我的发起按钮-----------------------------------------
		$("#Myfollow").click(function(){
			$("iframe").show();
			$("#urlIframe").attr("src","jsp/LaunchProject/MyProjects.jsp");
		});
//---------------------------------点击我的发起按钮-----------------------------------------
		$("#MyOrders").click(function(){
			$("iframe").show();
			$("#urlIframe").attr("src","MyOrders.jsp");
		});
//---------------------------------点击收货地址按钮----------------------------------------
		$("#DeliveryAddress").click(function(){
			$("iframe").show();
			$("#urlIframe").attr("src","address.jsp");
		});
//--------------------------------点击个人资料按钮----------------------------------------
		$("#PersonalData").click(function chageIframe(url){
				$("iframe").show();		
			  // $("#i1").attr("src","PersonalData.jsp");
				$("#urlIframe").attr("src","PersonalData.jsp");
			   
		});
//---------------------------------点击修改密码按钮------------------------------------------
		$("#ModifyPassword").click(function chageIframe(url){
			$("iframe").show();		
			$("#urlIframe").attr("src","account.jsp");
			
		   
		});
//--------------------------------点击我的评论按钮----------------------------------------
		$("#MyComment").click(function chageIframe(url){
			$("iframe").show();		
			$("#urlIframe").attr("src","commentary.jsp");
		   
		});
		$("#PersonalLetter").click(function chageIframe(url){
			$("iframe").show();
			$("#urlIframe").attr("src","zbjsp/personalletter.jsp");
		});
	
		  
	</script>