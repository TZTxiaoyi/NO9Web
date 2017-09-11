<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的私信</title>
	<script type="text/javascript" src="../jq/jquery-3.2.1.min.js"></script>
   	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css"></link>
	<style type="text/css">
		#trsize{
	  		font-weight:bold;
	  		font-size:26px;
	  	}
	  	td{
	  		width:200px;
	  		text-align:center;
	  	}
	  	
	</style>
</head>
<body>
	<div>
	<nav>
		<!-- <ul class="nav nav-tabs">
 		   <li role="presentation" class="active"><a href="#">收到的私信</a></li>
 		   <li role="presentation"><a href="#">发出的私信</a></li>
		</ul> -->
		<ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">收到的私信</a></li>
		    <li role="presentation"><a href="#profile" type="button" class="btn btn-link" aria-controls="profile" role="tab" data-toggle="tab">发出的私信</a></li>
		</ul>
	</nav>
		<div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home"><table id="home1"> </table></div>
		    <div role="tabpanel" class="tab-pane" id="profile"><table id = "profile1"> </table></div>
		  </div>
	</div>
</body>
</html>
	<script>
		
//=====================================================================
		$(function(){
			$.ajax({
				type : "post",
				url : "/P2P/zhubin/queryNewszb.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				//data : JSON.stringify(data),
				success : function(data){
					//alert("ok+"+data);
					if(data == ""){
						$("#home1").append("<h1>暂无收到的私信</h1>").css("color","green");
						
					}else{
						var tr = "<tr id='trsize'><td>ID</td><td>发送用户</td><td>类型</td><td>内容</td><td>时间</td><td>操作</td></tr>";
						$("#home1").append(tr);
						$.each(data,function(index,value){
							var td = "<tr class='table table-bordered table-striped  table-hover' height='50'><td>"+value.NEW_ID+"</td><td>"
							+value.EMPNAME+"</td><td>"
							+value.NEWTYPE+"</td><td>"
							+value.CONTENT+"</td><td>"
							+value.TIME+"</td><td><a class=\"button border-main deletebtn\" newid=\""+value.newid+"\" id=\"delete"+value.newid+
						   	">"+ 
						   	"<span class=\"icon-edit\"></span>删除</a></td></tr>";
						   	$("#home1").append(td);
						});  
					}
				},
				error : function(data){
					alert("error+"+data);
				}
			});
//===============================================================
			
		});
		
		$(function(){
			$.ajax({
				type : "post",
				url : "/P2P/zhubin/queryNewszb.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				//data : JSON.stringify(data),
				success : function(data){
					//alert("ok+"+data);
					if(data == ""){
						$("#profile1").append("<h1>暂无发出的私信</h1>").css("color","green");
						
					}else{
						var tr = "<tr id='trsize'><td>ID</td><td>接收用户</td><td>类型</td><td>内容</td><td>时间</td><td>操作</td></tr>";
						$("#profile1").append(tr);
						$.each(data,function(index,value){
							var td = "<tr class='table table-bordered table-striped  table-hover' height='50'><td>"+value.NEW_ID+"</td><td>"
							+value.EMPNAME+"</td><td>"
							+value.NEWTYPE+"</td><td>"
							+value.CONTENT+"</td><td>"
							+value.TIME+"</td><td><a class=\"button border-main deletebtn\" newid=\""+value.newid+"\" id=\"delete"+value.newid+
						   	">"+ 
						   	"<span class=\"icon-edit\"></span>删除</a></td></tr>";
						   	$("#profile1").append(td);
						});  
					}
				},
				error : function(data){
					alert("error1+"+data);
				}
			});
		});
	</script>