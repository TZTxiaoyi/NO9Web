<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收货地址</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="jq/jquery.cookie1.4.1.js"/></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>

   <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	body{
  		  .size(100%; 100%); 
  	}
  	td{
  		width:200px;
  		text-align:center;
  	}
  	#trsize{
  		font-weight:bold;
  		font-size:26px;
  	}
  	input{
  		width:300px;
		height:40px;
		font-size:24px;
		color:#A8A8A8;
  	}
  	#modalform div{
  		margin-top:15px;
  		font-size:22px;
  	}
  </style>
  </head>
  
  <body>
    <a href = "addAddress.jsp">
    	<button class = "btn btn-danger btn-block active" id= "addadd">
    		<span class = "glyphicon glyphicon-plus"></span>  添加地址 
    	</button>
    </a>
	<table id ="table"  class="table table-bordered">
	
	</table>	
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">×</button>
						<div class="text-center margin-big padding-big-top">
							<h2>修改地址</h2><span id="addressId"></span>
						</div>
						<div id="modalform">
							
							<div>
								<span>收货人姓名</span><input type="text" class="personNum" id="aname" />
							</div>
							<div>
								<span>&nbsp;手&nbsp;机&nbsp;号&nbsp;&nbsp;</span>
								 <input type = "text" id="aphone" onkeyup="value=value.replace(/[^\d]/g,'')">
							</div>
							<div>
								<span>&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;编 &nbsp;&nbsp;&nbsp;</span>
								<input type="text" id="acodes"class="tableName" onkeyup="value=value.replace(/[^\d]/g,'')"/>
							</div>
							<div>
								<span>&nbsp;&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址&nbsp;&nbsp;&nbsp;</span><input type="text" id="aaddress" class="tableName" />
							</div>	
						</div>
					</div>
					<div class="modal-footer" id="alter">
						<button type="button"
							class="btn btn-warning btn-default modal-alterbtn"
							data-dismiss="modal">确定更改</button>
	
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>
<script>
	$(function() {
//------------------------------查询地址----------------------------------------	
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/P2P/zhubin/queryAddress.do",
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				var th = "<tr id='trsize'><td>地址编号</td><td>收货人姓名</td><td>联系方式</td><td>邮编</td><td>详细地址</td><td>操作</td></tr>";
				$("#table").append(th);
				$.each(data,function(index, value) {
					var dd = "<tr class='table table-bordered table-striped  table-hover' height='50'><td>"
					+ value.addressId
					+ "</td><td id=\"namealter"+value.addressId+"\">"
					+ value.name
					+ "</td><td id=\"phonealter"+value.addressId+"\">"
					+ value.phone
					+ "</td><td id=\"codesalter"+value.addressId+"\">"
					+ value.postCodes
					+ "</td><td id=\"infoalter"+value.addressId+"\">"
					+ value.addressInfo
					+ "</td><td><a class=\"button border-main alterbtn\" addressId=\""+value.addressId+"\" id=\"alter"+value.addressId+
				   	"\"data-toggle=\"modal\" data-target=\"#myModal\">"+ 
				   	"<span class=\"icon-edit\"></span>修改</a>&nbsp;&nbsp;<a class=\"button border-main deletebtn\" addressId=\""+value.addressId+"\" id=\"delete"+value.addressId+
				   	">"+ 
				   	"<span class=\"icon-edit\"></span>删除</a></td></tr>";
					$("#table").append(dd);
				});
			},error : function() {
					alert("error");
			}
		});

	});
//-------------------修改地址-------------------------------	
	$("#table").on('click', ".alterbtn", function() {
		var addressId=$(this).attr("addressId");
		var addalter = $(this).attr("id");
		//alert(addressId);
		var goodname = $("#name" + addalter).html();//收货人姓名
		var goodphone = $("#phone" + addalter).html();//手机号
		var goodcodes = $("#codes" + addalter).html();//邮编
		var goodinfo = $("#info" + addalter).html();//详细地址
		$("#addressId").html(addressId);
		$("#aname").val(goodname);
		$("#aphone").val(goodphone);
		$("#acodes").val(goodcodes);
		$("#aaddress").val(goodinfo);
	});
	$("#alter").click(function() {
		var data = {};
		data["AddressId"]= $("#addressId").html();
		data["Name"] = $("#aname").val();
		data["Phone"] = parseInt($("#aphone").val());
		data["postCodes"] = parseInt($("#acodes").val());
		data["AddressInfo"] = $("#aaddress").val();
		window.location.reload();
		$.ajax({
			type : "post",
			dataType : "json",
			url : "zhubin/updateAddress.do",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			success : function(data) {								
				window.location.reload();
				alert("ok");				
			},
			error : function() {
				alret("error");
			}
		});
	})

//------------------------------删除地址--------------------------------------
	$("#table").on("click",".deletebtn",function(){
		var name = $(this).parents("tr").find("td:eq(1)").text();
		var id = $(this).attr("addressId");
		//alert("收货人的Id是"+id);
		//alert("收货人的名字是"+name);
		//弹出是否确认删除对话框
		if(confirm("确认删除["+name+"]吗？")){
			//确认，发送ajax请求删除
			$.ajax({
				url : "zhubin/deleteAddress.do",
				type : "post",
				data:{"addressId":id},
				success : function(result){
					//alert("");
					window.location.reload();
				},
				error : function(){
					alert("error");					
				}								
			});
		}
	});
	
</script>
