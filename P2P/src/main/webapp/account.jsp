<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
 	<script type="text/javascript" src="jq/jquery.cookie1.4.1.js"/></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
   	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
 	

 	
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
 	.help-block{
 		margin-left:390px;
 		margin-top:-32px;
 	}
 	</style>
</head>
<body>
	<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</h1><hr>
	<div>
		
		<span>原始密码：</span><input type = "text" id ="password" placeholder="请输入原密码"/>
			<a id = "zhubins" class="help-block"> </a><br>
		&nbsp;<span>新&nbsp;密&nbsp;码：</span>&nbsp;<input type = "text" name = "pass" id = "pass" placeholder="请输入6-16位字符或数字"/>
			<a class="help-block"> </a><br>
		<span>确认密码：</span><input type = "text" name = "newpass" id = "newpass" placeholder="请重新输入新密码"/>
			<a class="help-block"> </a><br>
		<input type = "button" value = "确定 " id ="submit" class = "btn btn-danger"/>
	</div>
</body>
</html>
	<script>
		$("#password").blur(function(){
			var a = $("#password").val();

			var b = $.cookie("oldpassword");//获取账号
			if(a != b){
				show_acount_msg("#password", "error", "*与原始密码不一致,请重新输入");
				$('input[name=pass]').attr("readonly","readonly");
				$('input[name=newpass]').attr("readonly","readonly");
			}else{
				show_acount_msg("#password", "true", "");
				$('input[name=pass]').removeAttr("readonly");
				$('input[name=newpass]').removeAttr("readonly");			
			}
		});
//----------------------点击按钮提交事件-----------------------------
		$("#submit").click(function(){
			if(!CheckData()){
				alert("格式错误");
				return false;
			}else{
				var data = {
					"passwords":$("#pass").val(),
					 "empid" :parseInt($.cookie("empid")) 					
				}	
				$.ajax({
					type : "post",
					//dataType : "json",
					url : "zhubin/updateAccount.do",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					success : function(data) {								
						alert("更新成功");						 
						$.cookie('account', '', { expires: -1 });
						$.cookie('account1', '', { expires: -1 });
						//tiaozhuan
						window.top.location.href="http://localhost:9088/P2P/proscenium.jsp";						 						
					},
					error : function() {
						alret("error");
					}
				});
				
			}
			
		});
		//---------校验数据函数----------
		function CheckData(){
			var NewPass = $("#pass").val();
			var b = $.cookie("oldpassword");
			//必须同时包含数字字母和字符6~16位
			var regNewPass = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regNewPass.test(NewPass)){
				show_acount_msg("#pass", "error", "*密码必须同时包含数字字母和字符6~16位");
				return false;
			}else if(NewPass == b){
				show_acount_msg("#pass", "error", "*新密码不能与原密码相同")
				return false;
			}
			else{
				show_acount_msg("#pass", "true", "");
			};
			//校验新密码
			var againNewPass = $("#newpass").val(); 
			if(againNewPass != NewPass){
				show_acount_msg("#newpass", "error", "*两次密码不一致");
				return false;
			}else{
				show_acount_msg("#newpass", "true", "");
			}
			return true;
		}
//--------------------显示校验效果的提示信息的函数-------------------------------
		function show_acount_msg(ele,status,msg){
			//清除当前元素的父类状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("a").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("a").text(msg);
			}else{
				$(ele).parent().addClass("has-error");
				$(ele).next("a").text(msg);
			}
		}
	</script>