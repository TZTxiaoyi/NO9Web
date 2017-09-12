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
			background-color:#F9F9F9;
		}
		#log_reg{
			margin-top:12px;
			margin-left:10px;
		}
		#img{
 			margin:10px;
 		}
 		#center{
 			background-color:#F9F9F9;
 			margin-top:20px;
 		}
 		h2,h3{
 			text-align:center;
 		}
 		h3{
 			border:2px solid  #A8A8A8;
 		}
 		#hr{
 			
 			border:1px dashed #A8A8A8;"
 		}
 		body{
 			position: relative;
 		}
 		#navbar{
 			margin-top:10px;
 			margin-left:10px;
 		}
 		
	 	h3 {
			border:0px;
			color:#CC99FF;
			position: relative;
			text-align: center;
		}
		
		h3:before {
			content: "";
			border-top: 1px solid #A8A8A8;
			display: block;
			position: absolute;
			width: 40%;
			top: 10px;
			left: 0
		}
	
		h3:after {
			content: "";
			border-top: 1px solid #A8A8A8;
			display: block;
			position: absolute;
			width: 40%;
			top: 10px;
			right: 0
		}
 		#sup{
 			margin-left:25px;
 		}
 		#sup span{
 			font-size:30;
 		}
 		#sup input{
 			width:400px;
 			height:50px;
 			font-size:20px;
 		}
 		#sup>div{
 			margin-top:30px;
 		}
 		#progress{
 			width:90%;
 		}
 		.textarea{
 			margin-top:15px;
 			margin-left:100px;
 			width:520px;
 			height:80px;
 		}
 		.fabu{
 			float:right;
 			margin-right:40px;
 			margin-top:15px;
 		}
 		.ment{
 			
 			height:150px;
 			background-color:#E7FEFE;
 		}
 		b{
 			font-size:15px;
 		}
 		
 		#supportinput{
 			margin-bottom:10px;
 			margin-top:10px;
 			width:95%;
 		}
 		.money span{
 			font-size:25px;
 			margin-right:5px;
 		}
 		.money p{
 			font-size:13px;
 		}
 		.money b{
 			font-size:13px;
 		}
 		.money hr{
 			color:#C3C3C3;
 		}
 		#supinput{
 			width:90%;
 			margin:10px;
 			font-size:20px;
 		}
 		.money{
 			border-bottom:4px solid #CFCFCF;
 			
 		}
 		
 	
 		#right-bottom p{
 			color:#797979;
 			padding-left:20px;
 		}
 		#right-bottom div{
 			padding-left:30px;
 		}
 		#right-bottom{
 			border:4px solid #CFCFCF;
 		}
 		#right-bottom span{
 			color:#509CE9;
 			padding-right:5px;
 		}
 		#tel{
 			font-size:25px;
 			padding-left:20px;
 		}
 		#log_img{
			display:none;
		}
		#log_img button{
			border:0px;
		}
		#myModal1 h4{
			text-align:left;
		}
		.loginform div {
			margin-left:20%;
			width: 350px;
			height: 40px;
			margin-top:30px;
		}
		
		.loginform input {
			width: 240px;
			height: 40px;
		}
		
		
		.loginform span{
			font-size:18px;
			white-space:nowrap;
		}
		#log_reg{
			margin-top:12px;
			margin-left:10px;
		}
		#pid{
			display:none;
		}
		#userid{
			display:none;
		}
		#progress{
			width:400px;
		}
		#pinglun{
			border:0px;
			margin-top:15px;
		}
		a{ 
			text-decoration:none
		} 
		#plcenter{
			margin-left:45px;
		}
		#pltime{
			color:gray;
			margin-left:45px;
		}
		#plback{
			float:right;
		}
		.detail{
			margin-left:50px;
			margin-right:50px;
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
        	margin-top:-40px;
        }
       
        #selfless{
        	border:2px solid  gray;
        	padding-left:10px;
        	margin-right:10px;
        	padding-top:20px;
        	padding-bottom:20px;
        }
        #selfless:hover{
        	border:2px solid  #3ED0EA;
        }
        #sup_money{
        	font-size:25px;
        }
 	</style>
 	
  </head>
  
  <body data-spy="scroll" data-target="#navbar-example">
  	<!-- 头部 -->
	<div id="head">
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
							    <li><a href="#">用户<span id="user"></span><span id="userid"></span></a></li>
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
  	
	<!-- 中间 -->
	<div>
		<div class="container" id="center">
			<!-- 中间*标题 -->
			<div>
				<h2 id="title">
				<%-- <%
				String title=(String)request.getParameter("title");
				String ss=new String(title.getBytes("ISO-8859-1"),"utf-8");
				out.print(ss);
				%> --%>
				</h2>
			</div>
			<hr id="hr"/>
			<!-- 中间*图片 -->
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-7 col-sm-7 col-xs-12" id="headimg">
					<%-- <%
					String img=(String)request.getParameter("img");
					%>
					<img src="images/<%=img%>" alt="" width="100%" height="400px"> --%>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12" id="sup">
					<div>限制人数<span id="limitsup"></span></div>
					<div>已筹款<span id="raise"></span></div>
					<div id="progress">
				
					</div>
    
					<div>
						<a href="support.jsp" id="supinput" type="button" class="btn btn-info">支持此项目</a>
					</div>
				</div>
			</div>
			<div id="fenge"></div>
			<div id="navbar" class="col-md-4 col-sm-4 col-xs-12">
                <nav  class="navbar navbar-default">  
                	<ul class="nav navbar-nav pull-right" role="tablist">
	                	<li><a href="#detail" aria-controls="detail">项目详情</a></li>
						<li><a href="#update" aria-controls="update">项目更新</a></li>
	                	<li><a href="#comment" aria-controls="#comment">评论</a></li>
						<li><a href="#support" aria-controls="#support">支持记录</a></li>
                	</ul>
                </nav>
             </div>
              <div class="row">
                 <div class="col-md-8 col-sm-8 col-xs-12" data-spy="scroll" data-target="#navbar" >  
                    
                    <div class="h3"><h3 id="update">项目更新</h3> </div>
                    <div class="detail" style="width:auto;" id="detailUpdate">  
                        
                    </div>  
                    <div class="h3"><div></div><h3 id="comment">评论</h3><div></div></div>  
                    <div class="detail" style="width:auto;" id="detailSubmit">
                    	
	  				    <div style="width:auto;" class="ment"> 
	  				    	<span id="plimg"></span> 
							<input type="text" class="textarea" value="说点什么吧。。。"/> 
		                    <input type="button" class="btn btn-info fabu"  value="发布">
	                    </div>  
	                    <div >                  
	                    <div id="pinglun">
	                    	
	                    </div>
	                 	</div> 
                    </div>
                    <div class="h3"><h3 id="support">支持记录</h3> </div> 
                    <div class="detail" style="width:auto;" id="detailSupport">  
                        
                    </div>  
                </div>  
                <div class="col-md-4 col-sm-4 col-xs-12" id="center-support">
                	
                	
		  			<div id="selfless">

	                    <p>感谢您的无私奉献，这份支持将助我们的梦想飞的更高更远。</p>
	                    <div class="wszcWrap siteIlB_box" id="wszcWrap">
	                        <a href="javascript:;" class="cur btn_ALink">¥1</a>
	                        <a href="javascript:;" class="btn_ALink">¥5</a>
	                        <a href="javascript:;" class="btn_ALink">¥10</a>
	                    </div>
	                    <div>
	                        <span>其他<b>¥</b></span>
	                        <input type="text" maxlength="8"/>
	                        
	                    </div>
	          			<input id="supportinput" type="button" class="btn btn-info" value="立即支持">			
		  			</div>
	  				<div id="return"></div>
		  					
	            	  
	            	<!-- <input id="supinput" type="button" class="btn btn-info" value="支持此项目"> -->
	            	<a href="support.jsp" id="supinput" type="button" class="btn btn-info">支持此项目</a>
	            	<div id="right-bottom">
	            		<div id="tel">联系我们</div>
	            		<p><span class="glyphicon glyphicon-user"></span>发起人</p>
	            		<div id="originatorname"></div>
	            		<hr/>
	            		<p><span class="glyphicon glyphicon-map-marker"></span>联系地址</p>
	            		<div id="address">受到广泛的好</div>
	            		<hr/>
	            		<p><span class="glyphicon glyphicon-earphone"></span>联系电话</p>
	            		<div id="telphon"></div>
	            	</div>
            	</div> 
               
			</div>
		</div>
	</div>
	<!-- 尾部 -->
	<div></div>
  </body>
  </html>
  <script>
   $('body').scrollspy({ target: '#navbar-example' }) 
   
  /*
  	项目评论时发布按钮的点击事件
  */
   $(".fabu").click(function(){
	   	var data = {};
        var time = new Date().Format("yyyy-MM-dd hh:mm:ss");  
		data["empid"] = parseInt($("#userid").text());
		data["projectsid"]=parseInt($.cookie('pid'));
		data["content"]=$(".textarea").val();
		data["time"]=time;
		if($("#userid").text()==""){
			alert("请先登录");
		}else if(data["content"]=="说点什么吧。。。"){
			alert("请发表你的评论");
		}else{
		    $.ajax({
				type:"post",
				dataType:"json",
				url:"comm/savecomm.do",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				success:function(data){	 
					alert("success");
				},
				error:function(){
					alret("error");
				}
			});
		}
   })
   /*
		评论查询
	*/
	$(function(){
		var account=$.cookie("account");
		$.ajax({
			type:"post",
			dataType:"json",
			url:"comm/selectcomm.do",
			contentType:"application/json;charset=utf-8",
			//data:JSON.stringify(data),
			success:function(data){	 
				
				var pl="<div id=\"plhead\"><a><img src=\"images/touxiang.png\" width=\"40px\" height=\"40px\" class=\"img-circle\"/>"+
					"&nbsp;&nbsp;<span>"+data[0].USERNAME+"</span></a></div><div id=\"plcenter\">"+data[0].CONTENT+"</div><div id=\"pltime\">"+
					data[0].TIME+"</div></div>";
				$("#pinglun").append(pl);
			},
			error:function(){
				alret("error");
			}
		});
	})
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
					$("#userid").append(result.resultEmployee[0].EMPID);
					$("#user").append(result.resultEmployee[0].USERNAME);
					$("#log_reg").hide();
					$("#log_img").show();
					$('#myModal').modal('hide');
					$('#myModal1').modal('hide');
					$.cookie('account', result.resultEmployee[0].USERNAME)
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
		页面加载时查看cookie里的值
	*/
	$(function(){
		$("#userid").append($.cookie("empid"));
		var account1=$.cookie("account1");
		var account=$.cookie("account");
		var touxiang="<a><img src=\"images/touxiang.png\" width=\"40px\" height=\"40px\" class=\"img-circle\"/>"+
		"&nbsp;&nbsp;<span>"+account+"</span></a>";
		if(account!=null){
			$("#user").append(account);
			$("#log_reg").hide();
			$("#log_img").show();
			$("#plimg").append(touxiang);
		}
		if(account1!=null){
			$("#user").append(account1);
			$("#log_reg").hide();
			$("#log_img").show();
			$("#plimg").append(touxiang);
		} 
		
	})
	//对多位小数进行四舍五入
	//num是要处理的数字  v为要保留的小数位数
	function decimal(num,v){
		var vv = Math.pow(10,v);
		return Math.round(num*vv)/vv;
	}
	/*
		页面加载时自动加载项目封面图片
	*/
	$(function(){
		var pid=$.cookie('pid');
		var data={};
		data["projectsid"]=parseInt(pid);
		$.ajax({
			type:"post",
			dataType:"json",
			url:"pro/selectPro.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){	
				
				var targeMoney=data[0].TARGE_MONEY;
				var raiseMoney=data[0].RAISE_MONEY;
				var bart=(raiseMoney/targeMoney)*100;
				var aa=decimal(bart,2)
				var bar="<div class=\"progress\">"
					+"<div class=\"progress-bar progress-bar-success\" style=\"width:"+aa+"%;\">"
					+"<i>已完成"+aa+"%</i></div></div>";
				var img="<img src=\"images/"+data[0].COVER+"\" alt=\"\" width=\"100%\" height=\"400px\">";
				$("#headimg").append(img);
				$("#title").append(data[0].TITLE);
				$("#progress").append(bar);
				$("#raise").append(raiseMoney);
				
			},
			error:function(){
				alret("error");
			}
		});
	});
	/*
		查询发起人类型（个人/机构）
	*/
	$(function(){
		var pid=$.cookie('pid');
		var data={};
		data["projectsid"]=parseInt(pid);
		$.ajax({
			type:"post",
			dataType:"json",
			url:"project/selectProject.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				 var originatortype=data[0].ORIGINATORTYPE;
				if(originatortype==9){
					//个人
					originator(pid);
				}else if(originatortype==10){
					//机构
					Organizations(pid);
				} 
			},
			error:function(){
				alret("error");
			}
		});
	})
	//个人originator
	function originator(pid){
		var data={};
		data["projectsid"]=pid;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"InitiatorWeb/selectOriginator.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				$("#originatorname").append(data[0].ORIGINATORNAME);
				$("#address").append(data[0].ADDRESS);
				$("#telphon").append(data[0].TELEPHONE);
			},
			error:function(){
				alret("error");
			}
		});
	}
	//机构Organizations
	function Organizations(pid){
		var data={};
		data["projectsid"]=pid;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"InitiatorWeb/selectOrganizations.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				$("#originatorname").append(data[0].LINKMAN);
				$("#address").append(data[0].BUSINESS_ADDRESS);
				$("#telphon").append(data[0].LINKPHONE);
			},
			error:function(){
				alret("error");
			}
		});
	}
	/*
		页面加载时自动加载项目详情
	*/
	$(function(){
		var pid=$.cookie('pid');
		var data={};
		data["projectsid"]=parseInt(pid);
		$.ajax({
			type:"post",
			dataType:"json",
			url:"detal/selectProDetal.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){	 
				$.each(data,function(index,value){
					
					var detail="<div class=\"h3\"><h3>"+value.TITLE+"</h3></div>"+
							"<div><p>"+value.BODY+"</p></div>"+
							"<div><img src='images/"+value.URL+
							"' width=\"650px\" height=\"400px;\"/></div>";
					$("#detailUpdate").append(detail);
				})
			},
			error:function(){
				alret("error");
			}
		});
	})
	/*
		页面加载显示右侧support项
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
				var limitsup=0;
				$.each(data,function(index,value){
					var cont="<div id=\"ret\"><div><p id=\"sup_money\">￥"
					+value.OFFER_MONEY+"</p><input id=\"retsup\" class=\"btn btn-info\" type=\"button\" value=\"支持￥"+
					value.OFFER_MONEY+"\"/></div><h4>"+value.RETURN_TITLE+
					"</h4><p id=\"retcontent\">"+value.RETURN_CONTENT+"</p></div>";
					$("#return").append(cont);
					var limit=parseInt(value.LIMIT_PEOPLE);//限制人数转换int类型
					limitsup=limitsup+limit;//限制人数相加
					
				});	
				$("#limitsup").append(limitsup);//限制人数添加到指定位置
			},
			error : function() {
				alert("error");
			}
		});
	})
	/*
		退出按钮点击事件
	*/
	$("#exit").click(function(){
		window.location.href="pro_details.jsp"; 
		$("#log_reg").show();
		$("#log_img").hide();
		$.cookie('account', '', { expires: -1 });
		$.cookie('account1', '', { expires: -1 });
		 
	})
	//对Date的扩展，将 Date 转化为指定格式的String
	//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
	//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
	//例子： 
	//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
	//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
	Date.prototype.Format = function (fmt) { //author: meizz 
 		var o = {
     		"M+": this.getMonth() + 1, //月份 
     		"d+": this.getDate(), //日 
     		"h+": this.getHours(), //小时 
     		"m+": this.getMinutes(), //分 
     		"s+": this.getSeconds(), //秒 
     		"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     		"S": this.getMilliseconds() //毫秒 
 		};
 		if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 		for (var k in o)
 		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 		return fmt;
	} 
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
				var th="<tr><td>订单序号</td><td>支持者</td><td>支持项</td><td>数量</td><td>支持时间</td><td></td></tr>";
				$.each(data,function(index,value){
					var tr="<tr><td>"+value.ORD_ID+"</td><td>"+value.USERNAME+
					"</td><td>"+value.PAYMONEY+"</td><td>"+value.FRACTION+
					"</td><td>"+value.ORDER_TIME+"</td><td><a class=\"button border-info deskbtn\">"+ 
					"<span class=\"icon-trash-o\"></span>回报</a></td></tr>";
					$("#tab").append(tr);
				});
			},
			error : function() {
				alert("error");
			}
		});
	})
	</script>