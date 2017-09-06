<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的评论</title>
	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
   	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
   	<style type="text/css">
   		#trsize{
	  		font-weight:bold;
	  		font-size:20px;
	  	}
	  	td{
	  		width:200px;
	  		text-align:center;
	  	}
   	</style>
</head>
<body>

	
	<table id = "div" class="table table-bordered"></table>
	
	
</body>
</html>
	<script>
		$(function(){
			$.ajax({
				type : "post",
				dataType : "json",
				url : "zhubin/queryCommentary.do",
				contentType : "application/json;charset=utf-8",
				success : function(data){
					 var th = "<tr id='trsize'><td>编号</td><td>项目类型名称</td><td>用户名</td><td>评论内容</td><td>评论时间</td><td>操作</td></tr>";
					$("#div").append(th);
					$.each(data,function(index,value){
						//alert(value.COMMENTARY_ID);
						var dd = "<tr class='table table-bordered table-striped' height=30><td>"
						+value.COMMENTARY_ID+"</td><td id=\"namealert"+value.COMMENTARY_ID+"\">"
						+value.PROTYPENAME+"</td><td id=\"empalert"+value.COMMENTARY_ID+"\">"
						+value.EMPNAME+"</td><td id=\"contentalert"+value.COMMENTARY_ID+"\">"
						+value.CONTENT+"</td><td id=\"timealert"+value.COMMENTARY_ID+"\">"
						+value.TIME+"</td><td><a class=\"button border-main deletebtn\" COMMENTARY_ID=\""+value.COMMENTARY_ID+"\" id=\"delete"+value.COMMENTARY_ID+"><span class=\"icon-edit\"></span>删除</a></td></tr>"
						$("#div").append(dd); 
					});
					
				},
				error : function(){
					alert("error");
				}
			});
		});
		//----------------------------------
		$("#div").on("click",".deletebtn",function(){
			var name = $(this).parents("tr").find("td:eq(1)").text();
			var id = $(this).attr("COMMENTARY_ID");
			alert("编号是"+id);
			//弹出是否确认删除对话框
			if(confirm("确认删除["+name+"]吗？")){
				//确认，发送ajax请求删除
				$.ajax({
					url : "zhubin/deleteCommentary.do",
					type : "post",
					data:{"COMMENTARY_ID":id},
					success : function(result){
						alert(result);
						window.location.reload();
					},
					error : function(){
						alert("error");
						
					}
					
					
				});
			}
		})
		//----------------------新增------------------
		
	</script>