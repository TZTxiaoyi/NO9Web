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
 	
 		#head{
 			height:60px;
 			width:100%;
 			line-height:1.6;
 			background-color: #E4E4E4;
 		}
 		#img{
 			margin:10px;
 		}	
 		#log_img{
			display:none;
		}
		#log_img button{
			border:0px;
		}
		#log_reg{
			margin-top:12px;
			margin-left:10px;
		}
		#moddel>div{
        	margin:30px;
        }
        #myModal1 h4{
			text-align:left;
		}
        	.loginform input {
			width: 240px;
			height: 40px;
		}
		
		
		.loginform span{
			font-size:18px;
			white-space:nowrap;
		}
		.loginform div {
			margin-left:20%;
			width: 350px;
			height: 40px;
			margin-top:30px;
		}
        #center{
        	background:#E4E4E4;
        }
        #sup{
        	margin-top:50px;
        	margin-bottom:50px;
        	margin-left:150px;
        	margin-right:150px;
        	font-size:20px;
        }
        
        #retcontent{
        	color:gray;
        }
        #return>div:hover{
 			border:2px solid  #3ED0EA;
 		}
        #ret{
        	border:2px solid  gray;
        	padding-left:10px;
        	margin-right:10px;
        }
        #retsup{
        	float:right;
        	margin-right:50px;
        	margin-top:-50px;
        }
 	</style>
 	
  </head>
  
  <body>
  
  	<!-- 头部 -->
  	<div id="head">
  		<!-- 头部-head -->
        
        <div class="container">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div id="img">
                    <a href="index.jsp"><img src="images/logo.png" alt="" width="100" height="50" /></a>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
				<ul class="nav navbar-nav pull-right">
                	<li><a href="proscenium.jsp">主页</a></li>
					<li><a href="#">公益众筹</a></li>
                	<li><a href="our-causes-detail.html">奖励众筹</a></li>
					<li><a href="gallery.html">APP</a></li>
					<li>
						<div id="log_reg">
	                		<a data-toggle="modal" data-target="#myModal">登录</a>
	                		<span>|</span>
	          				<a data-toggle="modal" data-target="#myModal1">注册</a>
                 		</div>
                 		<div id="log_img" class="dropdown">
                 			
                 			<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
   								 <img src="images/touxiang.png" width="30px" height="30px" class="img-circle"/>
    							 <span class="caret"></span>
  							</button>
	                 		<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							    <li><a href="#">用户<span id="user"></span></a></li>
							    <li><a href="#">我的理财</a></li>
							    <li><a href="#">我的订单</a></li>
							    <li><a href="#">我的关注</a></li>
							    <li><a href="#">我的发起</a></li>
							    <li><a href="#">我的红包</a></li>
							    <li><a href="#">消息</a></li>
							    <li><a href="#">设置</a></li>
							    <li><a id="exit">退出</a></li>
							  </ul>
	                		
                 		</div>
                 	</li>
                 </ul>
			</div>
		</div>
  	</div>
  	
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
							src="images/passcode.jpg" alt="" width="100" height="32"
							class="passcode" style="height:43px;cursor:pointer;"
							onclick="this.src=this.src+'?'">

					</div>
					<div>
						<button type="button" class="btn btn-info btn-group-lg"id="login">
							登录
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
						<input placeholder="手机号/用户名/邮箱" type="text" id="accounts1" name ="userdata.account"/> 
						<br/><span id="loginuser"></span>
					</div>
					<div>
						<input placeholder="输入密码" type="password" id="passwords1"
						name ="userdata.pwd"/><br/> <span id="aa2"></span>
					</div>
					<div>
						<input placeholder="再次输入密码" type="password" id="pswords"/> 
						<br/><span id="aa3"></span>
					</div>
					<div>
						<button type="submit" id="register" class="btn btn-info btn-group-lg" >注册</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container" id="center">
			<div class="col-md-3 col-sm-3 col-xs-12"></div>
			<div class="container" id="center">
				<div id="sup">
					<p>请选择支持项</p>
					<div id="return"></div>
				</div>
				
				
			</div>
		</div>
	</div>
  </body>
</html>
<script>
	/*
		注册按钮点击事件
	*/
	$("#register").click(function() {
		
		var data = {
			accounts : $("#accounts1").val(),
			passwords : $("#passwords1").val(),
		};
		$.ajax({
			type : "post",
			dataType : "json",
			data:data,
			url : "/P2P/ProWeb/register.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
				login(data);
				/* $("#user").append(data1.resultEmployee[0].USERNAME);
				$("#log_reg").hide();
				$("#log_img").show();
				$('#myModal1').modal('hide');
				$.cookie('account1', act1) //存入值 */
			}
		});
	});
	/*
		登陆按钮点击事件
	*/
	$("#login").click(function() {
		var data = {
				accounts : $("#accounts").val(),
				passwords : $("#passwords").val(),
			};
		login(data);
	});
	/*
		注册登录调用函数
	*/
	function login(data){
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/ProWeb/login.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(result) {//data为返回的数据，在这里做数据绑定  
				
				if(result.resultType=="true"){
					$("#user").append(result.resultEmployee[0].USERNAME);
					$("#userid").append(result.resultEmployee[0].EMPID);
					$("#log_reg").hide();
					$("#log_img").show();
					$('#myModal').modal('hide');
					$('#myModal1').modal('hide');
					$.cookie('account', result.resultEmployee[0].USERNAME);
					$.cookie('empid',result.resultEmployee[0].EMPID);
				}else{
					alert("用户名和密码不匹配");
				}
					
			},
			error : function() {
				alert("error");
			}
		});
	}
	/*
		页面加载
	*/
	$(function(){
		var pid=$.cookie('pid');
		var data={};
		data["projectsid"]=parseInt(pid);
		$.ajax({
			type : "post",
			dataType : "json",
			url : "return/selectProReturn.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(data) {//data为返回的数据，在这里做数据绑定  
				$.each(data,function(index,value){
					var cont="<div id=\"ret\"><div><h2>￥"+value.OFFER_MONEY+"</h2><input id=\"retsup\" class=\"btn btn-info\" type=\"button\" value=\"支持￥"+
					value.OFFER_MONEY+"\"/></div><h4>"+value.RETURN_TITLE+"</h4><p id=\"retcontent\">"+value.RETURN_CONTENT+"</p></div>";
					$("#return").append(cont);
				});	
			},
			error : function() {
				alert("error");
			}
		});
	})
</script>
