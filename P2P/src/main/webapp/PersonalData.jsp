<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人资料</title>

 	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
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
 	#bank{
 		width:160px;		
 	}
 	
</style>
</head>

<body>
<table id ="table" ></table>
	<div class="container-fluid">
		<div class="col-md-4">
			<button id = "data"  type="button" class="btn btn-warning">基本资料</button>
			<button id = "name"  type="button" class="btn btn-warning">实名认证</button>
			<button id ="card"  type="button" class="btn btn-info">绑定银行卡</button>
			<hr>
		</div>
		<div class=" col-md-offset-2" id = "content">
		<table id = "dataTable">
			<tr>
				<td><span>用户名：</span></td>
				<td><input type = "text" id = "UserName" placeholder="用户名"/></td>
			</tr>
			<tr>
				<td><span>性别：</span></td>
				<td><input type = "radio" name = "sex" value="1" checked/>男
					<input type = "radio" name = "sex" value = "0" />女 
				</td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input type = "text" id = "Age" placeholder="年龄" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
			</tr>
			<tr>
				<td id = "rightfloat">地址：</td>
				<td><input type = "text" id = "Address" placeholder="地址"/></td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td><input type ="text" id = "TelePhone"placeholder="联系电话" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
			</tr>
			<tr>
				<td  colspan = 2 >
					
					<input type = "button" id="submit" value = "提交" class = "btn btn-danger"/>
				</td>
			</tr>
		</table>
		
		
		<table id = "nameTable">
			<tr>
				<td>真实姓名：</td>
				<td><input type ="text"  id = "realName"/></td>
			</tr>
			<tr>
				<td>身份证号：</td>
				<td><input type = "text" id = "idCard"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type ="button" id = "submitName" value = "提交" class = "btn btn-danger"/>
				</td>
			</tr>
				
		</table>
		<table id = "cardTable">
			<tr>
				<td>账户ID：</td>
				<td><input type = "text" name = "bankAccountId" id="bankAccountId"/></td>
			</tr>
			<tr>
				<td>用户id：</td>
				<td><input type = "text" name = "empId" id="empId"/></td>
			</tr>
			<tr>
				<td>银行账号：</td>
				<td><input type = "text" name = "bankAccounts" id="bankAccounts"/></td>
			</tr>
			<tr>
				<td>银行名称</td>
				<td><select id ="bank" name = "bankName" id = "bankName">
					<option>中国银行</option>
					<option>农村信用社</option>
					<option>中国建设银行</option>
					<option>中国邮政储蓄</option>
				</select></td>
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
		$("#submitCard").click(function(){
			alert("-----");
			
			/*  $.ajax({
				type : "post",
				url : "/P2P/zhubin/saveBankAccount.do",
				data : {"bankAccountId" : id},
				success : function(data){
					alert("data"+data);
				},
				error : function(data){
					alert("data"+data);
				}
			});  */
			 $.ajax({
				type : "post",
				//dataType : "json",
				url : "/P2P/zhubin/addBankAccount.do",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				success : function(data){
					alert("ok");
				},
				error : function(data){
					alert("error"+data);
				}
			}); 
		});
	//-----------------------------------------------------------
		$("#card").click(function(){
			//var id = $(this).attr("BANK_ACCOUNT_ID");
			var id = $("#BANK_ACCOUNT_ID").html();
			
			//alert(id);
			$.ajax({
				type : "post",
				dataType : "json",
				url : "/P2P/zhubin/queryBankAccount.do",
				contentType : "application/json;charset=utf-8",
				success : function(data){
					alert("chen");
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
			
			
			
			
			//alert("-------"+data["userName"]);
			
			$.ajax({
				type : "post",
				dataType : "json",
				url : "zhubin/queryEmployee.do",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				success : function(data){
					//alert("ok");
					//alert(data);
				},
				error : function(){
					alert("error");
					//alert(data);
				}
			});
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