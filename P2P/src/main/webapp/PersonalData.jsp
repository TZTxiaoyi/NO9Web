<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人资料</title>

 	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
 	<script type="text/javascript" src="jq/jquery.cookie1.4.1.js"/></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>

   <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
	input {
		margin:10px;
	}
	hr{
 		border:1px solid gray;
 	}
 	#cardTAble,#nameTable,#dataTable{
 		display:none;
 	}
 	#content{
 		margin-top:70px;
 		
 	}
 	#bankName{
 		width:210px;
 		font-size:20px;
 		text-align:center;	
 	}
 	.dataTd1{
 		font-size:32px;
 	}
 	.input1{
 		width:200px;
 		height:40px;
 	}
</style>
</head>

<body>
<table id ="table" ></table>
	<div class="container-fluid">
		<div class="col-md-4">
			<button id = "data"  type="button" class="btn btn-warning">基本资料</button>
			
			<button id ="card"  type="button" class="btn btn-info">绑定银行卡</button>
			<hr>
		</div>
		<div class=" col-md-offset-2" id = "content">
		<table id = "dataTable">
			<tr>
				<td class = "dataTd1">用户名</td>
				<td><input type = "text" id = "UserName" placeholder="用户名" class = "input1"/><span  class="help-block"></span></td>
			</tr>
			<tr>
				<td class = "dataTd1">真实姓名</td>
				<td><input type ="text"  id = "realName"placeholder="真实姓名" class = "input1"/><span  class="help-block"></span></td>
			</tr>
			<tr>
				<td class = "dataTd1">身份证号</td>
				<td><input type = "text" id = "idCard" placeholder="身份证号" class = "input1"/><span  class="help-block"></span></td>
			</tr>
			<tr>
				<td class = "dataTd1">&nbsp;性&nbsp;别</td>
				<td><input type = "radio" name = "sex" value="男" checked class = "dataTd1"/>男
					<input type = "radio" name = "sex" value = "女"  class = "dataTd1"/>女 
				</td>
			</tr>
			<tr>
				<td class = "dataTd1">&nbsp;年&nbsp;龄</td>
				<td><input type = "text" id = "Age" placeholder="年龄" class = "input1" onkeyup="value=value.replace(/[^\d]/g,'')"/>
					<span  class="help-block"></span>
				</td>
			</tr>
			<tr>
				<td id = "rightfloat" class = "dataTd1">&nbsp;地&nbsp;址</td>
				<td><input type = "text" class = "input1" id = "Address" placeholder="地址"/><span class="help-block"></span></td>
			</tr>
			<tr>
				<td class = "dataTd1">&nbsp;电&nbsp;话</td>
				<td><input type ="text" class = "input1" id = "TelePhone" placeholder="联系电话" onkeyup="value=value.replace(/[^\d]/g,'')"/>
					<span  class="help-block"> </span>
				</td>
			</tr>			
			<tr>
				<td  colspan = "2">					
					<input type = "button" id="submitData" value = "提交" class = "btn btn-danger"/>
				</td>
			</tr>
		</table>
		
		
		<table id = "cardTable">
			
			<tr>
				<td class = "dataTd1">银行账号</td>
				<td><input type = "text" name = "bankAccounts" id="bankAccounts" class = "input1" placeholder="请输入银行账号" onkeyup="value=value.replace(/[^\d]/g,'')"/>
					<span  class="help-block"></span>
				</td>
			</tr>
			<tr>
				<td class = "dataTd1">银行名称</td>
				<td>
					<select id ="bankName" name = "bankName" class = "input1"> </select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type = "button" id="submitCard" value = "提交" class = "btn btn-danger"/>

				</td>
			</tr>
		</table>
		
		</div>
	</div>
</body>
</html>
	<script>

	
//----------------------点击提交基本资料按钮-----------------------------------
	$("#submitData").click(function(){
		//alert("个人资料按钮");
		if(!checkData2()){
			alert("不能提交");
			return false;
		}
		var UserName = $("#UserName").val();
		var Sex = $("input:radio:checked").val();
		var Age = $("#Age").val();
		var Address = $("#Address").val();
		var TelePhone = $("#TelePhone").val();
		var realName = $("#realName").val();
		var idCard = $().val("#idCard");
		var empId = $.cookie("empid");
		var account =  $.cookie("account");
		alert(empId+"______"+account);
		var data = {
				UserName : $("#UserName").val(),
				Sex : $("input:radio:checked").val(),
				Age : $("#Age").val(),
				Address : $("#Address").val(),
				TelePhone : $("#TelePhone").val(),
				EmpName : $("#realName").val(),
				idCard : $("#idCard").val(),
		}
		$.ajax({
			type : "post",
			url : "/P2P/zhubin/addEmployee.do",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			success : function(data){
				alert("添加成功");
				 window.top.location.href="http://localhost:9088/P2P/proscenium.jsp";
				
			},
			error : function(data){
				alert("error"+data);
			}
		});
	});
//---------------------校验基本资料函数--------------------------------------
	function checkData2(){
		//拿到要校验的数据			
		var UserName =$("#UserName").val();
		//校验姓名
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,6})/
		if(!regName.test(UserName)){
			show_acount_msg("#UserName", "error", "用户名格式错误");
			return false;
		}else{
			show_acount_msg("#UserName", "success", "");
		}
		//校验真实姓名
		var realName =$("#realName").val();
		var regNameReal = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,6})/
		if(!regNameReal.test(realName)){
			show_acount_msg("#realName", "error", "真实姓名填写错误");
			return false;
		}else{
			show_acount_msg("#realName", "success", "");
		}
		//校验身份证号
		var idCard =$("#idCard").val();
		var regIdCard = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		if(!regIdCard.test(idCard)){
			show_acount_msg("#idCard", "error", "身份证号格式错误！");
			return false;
		}else{
			show_acount_msg("#idCard", "success", "");
		}
		//校验年龄(1-120)
		var Age =$("#Age").val();
		var regAge = /^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
		if(!regAge.test(Age)){
			show_acount_msg("#Age", "error", "请正确填写年龄！");
			return false;
		}else{
			show_acount_msg("#Age", "success", "");
		}
		//校验地址（6-100个字符或2-50个汉字）
		var Address =$("#Address").val();
		var regAddress = /(^[a-zA-Z0-9_-]{6,100}$)|(^[\u2E80-\u9FFF]{2,50})/;
		if(!regAddress.test(Address)){
			show_acount_msg("#Address", "error", "请正确填写地址！");
			return false;
		}else{
			show_acount_msg("#Address", "success", "");
		}
		//校验手机号（11位数字）
		 var TelePhone = $("#TelePhone").val();
		var regTelePhone = /^1[34578]\d{9}$/
		if(!regTelePhone.test(TelePhone)){
			show_acount_msg("#TelePhone", "error", "手机号格式不正确！");
			return false;
		}else{
			show_acount_msg("#TelePhone", "success", "");
		} 
		return true;
	}
//--------------------显示校验效果的提示信息的函数-------------------------------
	function show_acount_msg(ele,status,msg){
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
//--------------------------点击银行卡的聚焦失焦、事件-----------------------------------
	/* $("#bankAccounts").focus(function(){
		$("#bankAccounts").css("background-color","white");
	});
	$("#bankAccounts").blur(function(){
		var bankAccounts = $("#bankAccounts").val();
		var regbank = /^[0-9]{16,21}$/;
		if(bankAccounts == /^[0-9]{16,21}$/){
			$("#bankAccounts").css("background-color","white");
		}else{
			alert("red");
			$("#bankAccounts").css("background-color","red");
		}
		
	}); */
	
//------------------------------------校验函数--------------------------------------
		function CheckData1(){
			var bankAccounts = $("#bankAccounts").val();
			var reg = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!bankAccounts.test(reg)){
				show_acount_msg("#bankAccounts", "error", "银行卡账号格式错误");
				return false;
			}else if(bankAccounts == ""){
				show_acount_msg("#bankAccounts", "error", "请输入银行卡账号")
				return false;
			}
			else{
				show_acount_msg("#bankAccounts", "true", "");
			};
			return true;
		}
		
		
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
//---------------------------绑定银行卡提交按钮------------------------------------
		$("#submitCard").click(function(){
				var bankAccounts = $("#bankAccounts").val();
				var bankName = $("#bankName").val();
				var empId = $.cookie("empid");
				/*	url : "/P2P/zhubin/saveBankAccount.do",
					*/
				var data = {
						"empId" : parseInt(empId),
						"bankAccounts" : $("#bankAccounts").val(),
						"bankName" : bankName
				}
				//alert(empId);
				 $.ajax({
					type : "post",
					//dataType : "json",
					url : "/P2P/zhubin/addBankAccount.do",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					success : function(data){
						alert("银行卡绑定成功");
						// window.location.reload();
						 window.top.location.href="http://localhost:9088/P2P/newHome.jsp";
					},
					error : function(data){
						alert("error"+data);
					}
				}); 
			
		});

		
//---------------------------------------------------------------	
		$(function(){			
			var data = {};
			data["UserName"] = $("#UserName").val();
			data["EmpName"] = $("#EmpName").val();
			data["IdCard"] = $("#IdCard").val();
			data["Sex"] = $("input:radio:checked").val();
			data["Age"] = $("#Age").val();
			data["Address"] = $("#Address").val();
			data["TelePhone"] = $("#TelePhone").val();
			data["Balance"] = $("#Balance").val();
			data["EmpState"] = $("#EmpState").val(); 
		}); 
	//----------------切换按钮--------------------------------------------
	function clickbtn(){
		$("#nameTable,#cardTable,#dataTable").hide();
		
	}	
		$("#data").click(function(){
			clickbtn();
			$("#dataTable").show();
		});
		$("#name").click(function(){
			clickbtn();
			$("#nameTable").show();
		});
		$("#card").click(function(){
			clickbtn();
			$("#cardTable").show();
		});  
		
	</script>