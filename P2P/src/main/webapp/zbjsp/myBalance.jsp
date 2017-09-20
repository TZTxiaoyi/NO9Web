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
		.help-block{
			display:none;
		}
		.input1{
	 		width:265px;
	 		height:40px;
	 	}
	 	.form-control{
	 		width:200px;
	 	}
	 	.input-group-addon{
	 		width:10px;
	 	}
	 	#bankCard{
	 		width:265px;
	 		height:40px;
	 	}
	 	
	</style>
</head>
<body>
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	  充值
	</button>
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">
	  提现
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
	       			<span>银行名称</span>
	       			<select id ="bankName" name = "bankName" class = "input1"> </select><br>
	       			<span>银行账号</span>
	       			<input type = "text" id = "bankId"  placeholder="请输入银行账号" onkeyup="value=value.replace(/[^\d]/g,'')"/><br>
	       			<span>充值金额</span>
	       			 <!-- <div class="input-group">
					      <div class="input-group-addon">$</div>
					      <input type="text" class="form-control" id="Recharge" placeholder="充值金额">
					      <div class="input-group-addon">.00</div>
				    </div> -->
	       		<input type = "text" id = "Recharge" onkeyup="value=value.replace(/[^(\d+\.\d{1,2}|\d+)$]/g,'') "/>
	       			<span  class="help-block"></span>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id = "oksRec">确定充值</button>
	      </div>
	    </div>
	  </div>
	</div><!--充值div end -->
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel">用户提现</h2>
	      </div>
	      <div class="modal-body">
	       		<div id ="zbRecharge">
	       			
	       			<span>银行账号</span>
	       			<!-- <input type = "text" id = "bankId"  placeholder="请输入银行账号" onkeyup="value=value.replace(/[^\d]/g,'')"/><br> -->	       			
	       			<select id = "bankCard"> </select><br>
	       			<span>提现金额</span>
	       			<input type = "text" id = "Recharge1" onkeyup="value=value.replace(/[^(\d+\.\d{1,2}|\d+)$]/g,'') "/>
	       			<span  class="help-block"> </span>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id = "drawMoney">确定提款</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>
	<script>
		
	
//----------------------------点击提款按钮触发事件--------------------------------------------
	$("#drawMoney").click(function(){
		if(!CheckData1()){
			alert("提款失败！！！");
			return false;
		}
		var txbalance =  $("#Recharge1").val();
		var empid = $.cookie("empid");
		var data={};
		data["txbalance"] = txbalance;
		data["empid"] = empid;
		//alert(data["txbalance"]+"    "+data["empid"]);
		$.ajax({
			//type : "post",
			url : "/P2P/zhubin/updateBankAccount.do",
			contentType : "application/json;charset=utf-8",
			data : data,
			success : function(data) {
				if(data==1){
					alert("提现成功");
					window.location.href = "myBalance.jsp";
					
				}else{
					alert("提现失败");
				}
			}
		});
	});
//------------------------------------校验函数--------------------------------------
	function CheckData1(){
		//校验提现金额
		var Recharge1 = $("#Recharge1").val();
		var money = parseFloat($.cookie("balance"));
		if((Recharge1 == "") || (Recharge1>=1000)){
			alert("提款金额不能为空或者大于1000");
			show_bankAcount_msg("#Recharge1", "error", "请填写提现金额");
			return false;
		}else if(Recharge1 > money){
			alert(money);
			alert("余额不足！");
			show_bankAcount_msg("#Recharge1", "error", "对不起，余额不足");
			return false;
		}
		else{
			show_bankAcount_msg("#Recharge1", "true", "");
		};
		return true;
	}
//--------------------显示校验效果的提示信息的函数-------------------------------
	function show_bankAcount_msg(ele,status,msg){
		//清除当前元素的父类状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success" == status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}else{
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
//------------------------------查询银行账号--------------------------------------
	$(function(){
		var empid = parseInt($.cookie("empid"));
		var da = {
				"empid" : empid
		}
		//alert(empid);
		$.ajax({
			//type : "post",
			//dataType : "json",
			url : "/P2P/zhubin/queryBankAccount.do",
			contentType : "application/json;charset=utf-8",
			//data : JSON.stringify(da),
			data :{"empid":empid},
			success : function(data){
				//alert("34333");
				$.each(data,function(index,value){
					var option = "<option>"+value.bankAccounts+"</option>";
					$("#bankCard").append(option);
				});
				
			},
			error : function(data){
				alert("error"+data);
			}
		});
	});
//------------------------------查询银行名字-------------------------------------
	$(function(){
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/zhubin/queryBankTable.do",
			contentType : "application/json;charset=utf-8",
			success : function(data){
				$.each(data,function(index,value){
					var option = "<option>"+value.bankNames+"</option>";
					$("#bankName").append(option);			
				});
			},
			error : function(data){
				alert("error"+data);
			}
		});
	});
	
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
			var empid = parseInt($.cookie("empid"));
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