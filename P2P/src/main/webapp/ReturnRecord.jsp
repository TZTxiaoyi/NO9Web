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
 
 	</style>
 	
  </head>
  
  <body>

  	<table id="tab" class="table table-hover table-striped">

		  
	</table>			
  </body>
</html>
<script>
	$(function(){
		var pid=$.cookie('pid');
		//var empid=$.cookie('empid');
		data={};
		//data["empid"]=empid;
		data["projectsid"]=pid;
		$.ajax({
			type : "post",
			dataType : "json",
			url : "OrdersWeb/selectOrders.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(data) {//data为返回的数据，在这里做数据绑定
				var th="<thead><tr><td>订单序号</td><td>支持者</td><td>支持项</td><td>数量</td><td>支持时间</td><td></td></tr></thead>";
				$("#tab").append(th);
				$.each(data,function(index,value){
					var tr="<tbody><tr><td>"+value.ORD_ID+"</td><td>"+value.USERNAME+
					"</td><td>"+value.PAYMONEY+"</td><td>"+value.FRACTION+
					"</td><td>"+value.ORDER_TIME+"</td><td><a class=\"button border-info deskbtn\">"+ 
					"<span class=\"icon-trash-o\"></span>回报</a></td></tr></tbody>";
					
					$("#tab").append(tr);
				});
			},
			error : function() {
				alert("error");
			}
		});
	})
</script>
