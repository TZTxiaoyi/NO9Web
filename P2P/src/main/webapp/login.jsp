<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
 	<style>
 		
		.loginform div {
			margin-left:15%;
			width: 350px;
			height: 40px;
			margin-top:30px;
		}
		
		input {
			width: 240px;
			height: 40px;
		}
		
		
		.loginform span{
			font-size:18px;
			white-space:nowrap;
		}
	
		#forget{
			margin-left:50px;
			color:red;
			text-align:left;
		}
 	</style>	
</head>
<body>
<a data-toggle="modal" data-target="#myModal">登录</a>
<a data-toggle="modal" data-target="#myModal1">注册</a>
<!-- 登录Modal -->

	<div class="media media-y margin-big-bottom"></div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss=modal>×</button>
					<div class="text-center margin-big padding-big-top">
						<h1>登录</h1>
					</div>
				</div>
				<div class="loginform">
					<div>
						<input placeholder="手机号/用户名/邮箱" type="text" id="accounts"
							 name ="zbud.account"/> 
							 <span ></span>
					</div>
					<div>
						<input placeholder="输入密码" type="password" id="passwords"
							 name ="zbud.pwd"/> <span
							id="aaa2"></span>
					</div>
					<div class="field">
						<input type="text" class="input input-big" name="code" width="100" onblur="paBlur1()"
							placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" /> <img
							src="image/passcode.jpg" alt="" width="100" height="32"
							class="passcode" style="height:43px;cursor:pointer;"
							onclick="this.src=this.src+'?'">

					</div>
					<div>
						<button type="button" class="btn btn-info btn-group-lg" id="login">登录
						</button>
						<a href="" id="forget">忘记密码？</a>
					</div>
				</div>
			</div>
		</div>
	</div>


<!-- 用户注册模态框 -->

	<div class="media media-y margin-big-bottom"></div>
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss=modal>×</button>
					<h4 class="modal-title margin-big padding-big-top"
						id="myModalLabel">

						如有账号， <a href="proscenium.jsp">请登录</a>
					</h4>
				</div>
				<div class="loginform">
					<div>
						<input placeholder="手机号/用户名/邮箱" type="text" id="accounts" name ="userdata.account"/> 
						<br/><span id="loginuser"></span>
					</div>
					<div>
						<input placeholder="输入密码" type="password" id="passwords"
						name ="userdata.pwd"/><br/> <span id="aa2"></span>
					</div>
					<div>
						<input placeholder="再次输入密码" type="password" id="passwords"/> 
						<br/><span id="aa3"></span>
					</div>
					<div>
						<button type="submit" id="register" class="btn btn-info btn-group-lg" >注册</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
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