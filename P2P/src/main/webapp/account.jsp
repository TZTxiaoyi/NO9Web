<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
	<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
   	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
 	
 	<style type="text/css">
 	div{
 		margin-left:100px;
 		margin-top:40px;
 		
 	}
 	input{
 		margin:10px;
 		font-size:22px;
 		
 	}
 	span{
 		font-size:22px;
 		font-weight:bold;
 	}
 	#submit{
 		width:100px;
 		margin-left:130px;
 	}
 	hr{
 		border:1px solid gray;
 	}
 	</style>
</head>
<body>
	<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</h1><hr>
	<div>
		
		<span>原始密码：</span><input type = "text" id ="password"/><br>
		&nbsp;<span>新&nbsp;密&nbsp;码：</span>&nbsp;<input type = "text" id = "pass" /><br>
		<span>确认密码：</span><input type = "text" id = "newpass"/><br>
		<input type = "button" value = "确定 " id ="submit" class = "btn btn-danger"/>
	</div>
</body>
</html>