<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的余额</title>
	<script type="text/javascript" src="../jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../jq/jquery.cookie1.4.1.js"></script>
   	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css"></link>
	<style type="text/css">
		#zbbal{
			font-size:48px;
			font-family:"楷体";
			margin-top:200px;
			margin-left:300px;
		}	
		#zbRecharge{
			font-size:24px;
			font-family:"楷体";
		}
	</style>
</head>
<body>
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	  充值
	</button>
	
	<div id = "zbbal">
		我的余额：<span id = "balance"> </span>&nbsp;元
	</div>
	
	
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel">账户充值</h2>
	      </div>
	      <div class="modal-body">
	       		<div id ="zbRecharge">
	       			<span>充值金额</span>
	       			<input type = "text" id = "Recharge"  onkeyup="value=value.replace(/[^\d]/g,'')"/>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id = "oksRec">确定充值</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
	<script>
//----------------------------------------------点击确定充值按钮-----------------------------------------------------
	$("#oksRec").click(function(){
		//var addalter = $(this).attr("id");
		//var balance1 = $("#balance").html();
		var balance = $("#Recharge").val();
		var empid = $.cookie("empid");
		var balances = $.cookie("balance");
		//alert(balances +"+"+balance);
		//alert(empid);
		var data = {
				"empid" : parseInt($.cookie("empid")),
				"balance" :parseFloat($("#Recharge").val()),
				"balances" : parseFloat($.cookie("balance"))
		}
		$.ajax({
			type : "post",
			url : "http://localhost:9088/P2P/zhubin/updateEmployee.do",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			success : function(data) {
				if(data=="true"){
					alert("充值成功");
				}
				window.location.href = "myBalance.jsp";
			},
			error : function(data){
				alert("error"+data);
			}
		});
	});
//--------------------------------------------查询余额-------------------------------------------------------------
		$(function(){
			var empid = $.cookie("empid");
			//alert(empid);
			var data = {
					"empid" : $.cookie("empid"),					
			}
			$.ajax({				
				type : "post",
				dataType : "json",
				url : "/P2P/zhubin/queryEmployee.do",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				success : function(data) {
					var sp = data[0].balance;
					$("#balance").html(sp);
					$.cookie("balance",$("#balance").html(),{path:"/"});
					//alert(sp);
				},
				error : function(data){
					alert("error error"+data);
				}
			});
		});
	</script>