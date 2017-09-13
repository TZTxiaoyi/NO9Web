<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="../jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../jq/jquery.cookie1.4.1.js"/></script>
   	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css"></link>
<title>我的余额</title>
	<style type="text/css">
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
		#Recharge{
			margin-left:30px;
		}
		tr{
			margin-top:30px;
		}
		#oks{
			text-align:center;
		}
	</style>
</head>
<body>
	<!-- <div>
		<button type="button" class="btn btn-default btn-circle btn-xl">
					充值
				</button>
		<div></div>
	</div> -->
	<button type="button" id = "Recharge" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">充值</button>
		<div>
			我的余额：<span id = "balances"> </span>
		</div>
	<!-- 模态框 -->	
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      	<div>
	      		<table>
	      			<th><h1>充值金额</h1></th>
	      			<tr>
	      				<td>充值金额</td>
	      				<td><input type = "text" id = "zbbalance"/></td>
	      			</tr>
	      			<tr>
	      				<td rowspan = "2">
	      					<button type="button" id = "oks" class="btn btn-success">确定充值</button>
	      				</td>
	      			</tr>
	      		</table>								
	      	</div><!-- tab上 -->
	    </div>
	  </div>
</div>
</body>
</html>
<script>
	$("#oks").click(function(){
		alert("模态框进入");
		var empid = $.cookie("empid");
		alert(empid);
		$.ajax({
			type : "post",
			
		});
	});
//-----------------------------------查询余额--------------------------------
	$(function(){
		alert("进入查询");
		var empid = $.cookie("empid");
		alert(empid);
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/zhubin/queryEmployee.do",
			contentType : "application/json;charset=utf-8",
			data:JSON.stringify(data),
			success : function(data) {
				
			}
		});
	});
</script>