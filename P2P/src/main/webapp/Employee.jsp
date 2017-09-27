<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收货地址</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>

   <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
  <style type="text/css">
  	td{
  		width:200px;
  		text-align:center;
  	}
  	#trsize{
  		font-weight:bold;
  		font-size:20px;
  	}
  </style>
  </head>
  
  <body>
	<table id ="table" ></table>
	
		
	
</body>
</html>
	<script>
	$(function() {
		
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/zhubin/queryEmployee.do",
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				var th = "<tr id='trsize'><td>编号</td><td>用户名</td><td>真实姓名</td><td>身份证号</td><td>性别</td><td>年龄</td><td>地址</td><td>电话</td><td>账户余额</td><td>状态</td></tr>";
				$("#table").append(th);
				$.each(data,function(index, value) {
					//alert(value.empId);
					var dd = "<tr><td>"+value.empId+"</td><td>"+value.userName+"</td><td>"+value.empName+"</td><td>"+value.idCard+"</td><td>"+value.sex+"</td><td>"+value.age+"</td><td>"+value.address+"</td><td>"+value.telePhone+"</td><td>"+value.balance+"</td><td>"+value.empState+"</td></tr>"
					
					$("#table").append(dd);  
				});
			},error : function() {
					alert("error");
			} 
		});
	
	}); 
	</script>