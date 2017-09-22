<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部-有点</title>
<link rel="stylesheet" type="text/css" href="../css/public.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/public.js"></script>

<script type="text/javascript" src="../../../bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../../bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript"
	src="../../../bootstrap/dist/bootstrap-table.js"></script>

<link rel="stylesheet" href="../../../bootstrap/dist/bootstrap-table.css"
	type="text/css"></link>

</head>

<body>
	<!-- 头部 -->
	<div class="head">
		<div class="headL">
			<img class="headLogo" src="../img/headLogo.png" />
		</div>
		<div class="headR">
			<p class="p1">
				欢迎,员工
				${empid }
			</p>
			<p class="p2">
				<button class="btn btn-primary " >
					退出登录
			</button>
			</p>
		</div>
	</div>



</body>
<script>

$(".btn-primary").click(function() {
	if (!confirm("确认退出当前账号？")) { 				
	    window.event.returnValue = false; 
	} else{
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/ProWeb/esclogin.do",//要访问的后台地址  
			success : function(result) {//data为返回的数据，在这里做数据绑定  
				var topWindow=window.top;
				topWindow.location.href = "http://localhost:9088/P2P/jsp/background/log.jsp";
			},error : function() {
				alert("error");
			}
		});
	}

});

</script>
</html>