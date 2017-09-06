<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
	
</head>
<body>
	账号：<input type="text" id="accounts">
	密码：<input type="password" id="passwords">
	<input id="login"type ="button" value="登录"> 
	<input id="register" type ="button" value="注册">
	
	<script>
	$("#register").click(function() {
		var data = {
			accounts : $("#accounts").val(),
			passwords : $("#passwords").val(),
		};
	
		alert($("#accounts").val());
		$.ajax({
			type : "post",
			dataType : "json",
			data:data,
			url : "/P2P/ProWeb/register.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
				alert(data1);
			}
		});
	})
	
	$("#login").click(function() {
		var data = {
				accounts : $("#accounts").val(),
				passwords : $("#passwords").val(),
			};
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/ProWeb/login.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(result) {//data为返回的数据，在这里做数据绑定  
				alert(result.resultType);
				if(result.resultType=="true"){
					alert("登陆成功");
					alert(result.result);
					alert(result.result[0].EMPID);
				}else{
					alert(result.resultType);
				} 
					
			},
			error : function() {
				alert("error");
			}
		});
	})
	</script>
</body>
</html>