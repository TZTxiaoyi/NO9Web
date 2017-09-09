<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!--    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet"></link> -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
	<script type="text/javascript" src="bootstrap/jquery/jquery-2.1.3.min.js"></script>
   <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	#top{
		
		width:auto;
		height:100px;
		margin-left:20px;
		background-color:#BBB8BC;		
		background:url(image/top.png) no-repeat 50% 100%;
		background-size:100% 100%;
	}
	#top span{
		font-size:40px;
		text-align:center;
	}
	#menu{
		
		width:198px;
		height:auto;
		background-color:#BBB8BC;
		
		margin-left:20px;
		margin-top:-5px;
	}
	#right{
		
		width:auto;
		height:520px;
		margin-left:218px;
		margin-top:-522px;
		
	}
	#menu_top{
		
		height:auto;
		margin-top:5px;
		
	}
	 a{
		text-decoration:none;
		color:black;
		
	}
	#menu_middle{
		
		height:auto;
		margin-top:25px;
	}
	#menu_center{
		
		height:auto;
		margin-top:25px;
	}
	#menu_buttom{
		
		height:auto;
		margin-top:25px;
	}
	iframe{
		display:none;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div id = "top">
				<span>个人中心</span>
			</div>
			<div id = "menu">
				<div id = "menu_top">
					&nbsp;&nbsp;<a href = "#"><span class=" glyphicon glyphicon-plus-sign"></span> 我的发起</a><br>
					&nbsp;&nbsp;<a href = "#"><span class="glyphicon glyphicon-asterisk"></span> 项目管理</a><br>
					&nbsp;&nbsp;<a href = "#"><span class="glyphicon glyphicon-shopping-cart"></span> 我的订单</a><br>
					&nbsp;&nbsp;<a href = "#"><span class="glyphicon glyphicon-leaf"></span> 我的理财卷</a><br>
				</div>
				<div id = "menu_middle">
					<b>我的</b><br>
					
					<button class = "btn btn-link btn-info"><span class="glyphicon glyphicon-heart"></span> 我的关注</button><br>
					<button class = "btn btn-link btn-info"><span class=" 	glyphicon glyphicon-tint"></span> 账户余额</button><br>
					<button class = "btn btn-link btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> 我的订单</button><br>
					<button class = "btn btn-link btn-info"><span class="glyphicon glyphicon-list-alt"></span> 抵用券</button><br>
				</div>
				<div id = "menu_center">
					<b>消息</b><br>
					<button class = "btn btn-link  btn-info" id="MyComment"><span class="glyphicon glyphicon-comment"></span> 我的评论</button><br>
					<button class = "btn btn-link  btn-info"><span class="glyphicon glyphicon-envelope"></span> 我的私信</button><br>
				</div>
				<div id = "menu_buttom">
					<b>设置</b>    <br>
					 
					<button class = "btn btn-link btn-info" id="PersonalData" ><span class="glyphicon glyphicon-user"></span> 个人资料</button><br>
					<button class = "btn btn-link btn-info" id = "ModifyPassword"><span class="glyphicon glyphicon-edit" ></span> 修改密码</button><br>
					<button class = "btn btn-link btn-info" id = "DeliveryAddress"><span class="glyphicon glyphicon-map-marker"></span> 收货地址</button><br>
				</div>
			</div><!-- menu[div -->
			<div id = "right" >
				
				<iframe id = "urlIframe" src = "" width=100% height=100%></iframe>
				
				
			</div><!-- right[div -->
			
		</div><!-- row [ div -->
	</div>
</body>
</html>
<script>
//----------------------点击个人资料按钮---------------
	/* $("#PersonalData").click(function(){
		$("iframe").show();	
		$("#i1").src=PersonalData.jsp;
		window.location.href = "#right";

	}); */
//----------------------点击收货地址按钮-------------------
	$("#DeliveryAddress").click(function(){
		$("iframe").show();
		$("#urlIframe").attr("src","address.jsp");
	});
	//-----------------------点击个人资料按钮-----------
	$("#PersonalData").click(function chageIframe(url){
			$("iframe").show();		
		  // $("#i1").attr("src","PersonalData.jsp");
			$("#urlIframe").attr("src","PersonalData.jsp");
		   
	});
	//----------------点击修改密码按钮----------------
	$("#ModifyPassword").click(function chageIframe(url){
		$("iframe").show();		
		$("#urlIframe").attr("src","account.jsp");
	   
	});
	//--------------------点击我的评论按钮-----------------------
	$("#MyComment").click(function chageIframe(url){
		$("iframe").show();		
		$("#urlIframe").attr("src","commentary.jsp");
	   
	});
	
		  
		   
		  
		
</script>