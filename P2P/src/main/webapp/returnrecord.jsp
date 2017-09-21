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
 		.addressId,#disnone{
 			display:none;
 		}
 		#mod{
 			margin-top:10px;
 			margin-bottom:10px;
 			margin-left:120px;
 			margin-right:120px;
 			font-size:20px;
 		}
 		#mod div{
 			margin-top:15px;
 		}
 	</style>
 	
  </head>
  
  <body>
  	
  	<ul id="myTab" class="nav nav-tabs"  role="tablist">
	  <li role="presentation" class="active"><a href="#tab1" data-toggle="tab">待回报</a></li>
	  <li role="presentation"><a href="#tab2" data-toggle="tab">已回报</a></li>
	  <li role="presentation"><a href="#tab3" data-toggle="tab">回报中</a></li>
	</ul>
  	<div id="tab" class="tab-content">
		 <table id="tab1" class="table table-hover table-striped tab-pane fade in active"></table> 
		 <table id="tab2" class="table table-hover table-striped tab-pane fade"></table>
		 <table id="tab3" class="table table-hover table-striped tab-pane fade"></table>
	</div>
	<!-- 回报按钮点击事件 -->
	<div class="media media-y margin-big-bottom"></div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss=modal>×</button>
					<div class="text-center margin-big padding-big-top">
						<h2>确认回报地址</h2>
					</div>
				</div>
				<div id="mod">
					<div>
						<input id="ord" type="text" class="form-control" placeholder="请输物流单号"> 
					</div>
					<div>
						姓名：<span id="name"></span>
					</div>
					<div>
						电话：<span id="tel"></span>
					</div>
					<div>
						邮编：<span id="code"></span>
					</div>
					<div>
						地址：<span id="ress"></span>
					</div>
					<div>
						<button type="button" class="btn btn-info btn-group-lg" id="sure">
							确认
						</button>
						
					</div>
				</div>
				<div id="disnone">
					<div>
						地址id：<span id="ressid"></span>
					</div>
					<div>
						支持人id：<span id="supid"></span>
					</div>
					<div>
						订单id：<span id="ordid"></span>
					</div>
				</div>
			</div>
		</div>
	</div>			
  </body>
</html>
<script>
	/*
		页面加载自动加载等待回报的
	*/
	$(function(){
		waitback();
		alreadyback();
		backing();
	}) 
	// 通过名称选取标签页
	//$('#myTab a[href="#tab1"]').tab('show')

	// 选取第一个标签页
	//$('#myTab a:first').tab('show')

	// 选取最后一个标签页
	//$('#myTab a:last').tab('show')

	// 选取第三个标签页（从 0 开始索引）
	//$('#myTab li:eq(2) a').tab('show')
	/*
		等待回报按钮点击事件
	*/
	$("#wait").click(function(){
		waitback();
	})
	/*
		已回报按钮的点击事件
	*/
	 $("#already").click(function(){
		alreadyback();
	})
	/*
		回报中按钮的点击事件
	*/
	 $("#backing").click(function(){
		backing();
	}) 
	/*
		等待回报ok
	*/
	function waitback(){
		$("#tab1").html("");
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
				
					
					var th="<thead><tr><td></td><td>订单序号</td><td>支持者</td><td>支持项</td><td>回报金额</td><td>回报项</td><td>数量</td><td>支持时间</td><td></td></tr></thead>";
					$("#tab1").append(th);
					var i=1;
					$.each(data,function(index,value){
						alert(value.ADDRESS);
						var tr="<tbody><tr><td>"+i+"</td><td id=\"orderback"+value.ORD_ID+"\">"+value.ORD_ID+"</td><td>"+value.USERNAME+
						"</td><td>"+value.PAYMONEY+"</td><td>"+value.OFFER_MONEY+"</td><td>"+value.RETURN_TITLE+"</td><td>"+value.FRACTION+
						"</td><td>"+value.TIME+"</td><td><a id=\"back"+value.ORD_ID+"\" class=\"button border-info return\" data-toggle=\"modal\" data-target=\"#myModal\">"+ 
						"<span class=\"icon-trash-o\"></span>回报</a></td><td id=\"addressback"+value.ORD_ID+"\" class=\"addressId\">"+value.ADDRESS+"</td>"+
						"<td class=\"addressId\" id=\"empidback"+value.ORD_ID+"\">"+value.EMPID+"</td></tr></tbody>";
						
						$("#tab1").append(tr);
						i++;
						
					});
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	/*
		已回报
	*/
	function alreadyback(){
		$("#tab2").html("");
		var pid=$.cookie('pid');
		//var empid=$.cookie('empid');
		data={};
		//data["empid"]=empid;
		data["projectsid"]=pid;
		$.ajax({
			type : "post",
			dataType : "json",
			url : "OrdersWeb/selectalreadyback.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(data) {//data为返回的数据，在这里做数据绑定
					var th="<thead><tr><td></td><td>订单序号</td><td>支持者</td><td>支持项</td><td>回报金额</td><td>回报项</td><td>数量</td><td>支持时间</td><td></td></tr></thead>";
					$("#tab2").append(th);
					var i=1;
					$.each(data,function(index,value){
						var tr="<tbody><tr><td>"+i+"</td><td>"+value.ORD_ID+"</td><td>"+value.USERNAME+
						"</td><td>"+value.PAYMONEY+"</td><td>"+value.OFFER_MONEY+"</td><td>"+value.RETURN_TITLE+
						"</td><td>"+value.FRACTION+"</td><td>"+value.TIME+"</td></tr></tbody>";
						
						$("#tab2").append(tr);
						i++;
						
					});
				
			},
			error : function() {
				alert("error");
			}
		});
	}
	/*
		回报中
	*/
	function backing(){
		$("#tab3").html("");
		var pid=$.cookie('pid');
		//var empid=$.cookie('empid');
		data={};
		//data["empid"]=empid;
		data["projectsid"]=pid;
		$.ajax({
			type : "post",
			dataType : "json",
			url : "OrdersWeb/selectback.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(data) {//data为返回的数据，在这里做数据绑定
					
					var th="<thead><tr><td></td><td>订单序号</td><td>支持者</td><td>支持项</td><td>回报金额</td><td>回报项</td><td>数量</td><td>支持时间</td><td></td></tr></thead>";
					$("#tab3").append(th);
					var i=1;
					$.each(data,function(index,value){						
						var tr="<tbody><tr><td>"+i+"</td><td>"+value.ORD_ID+"</td><td>"+value.USERNAME+
						"</td><td>"+value.PAYMONEY+"</td><td>"+value.OFFER_MONEY+"</td><td>"+value.RETURN_TITLE+
						"</td><td>"+value.FRACTION+"</td><td>"+value.TIME+"</td></tr></tbody>";
							
						$("#tab3").append(tr);	
						i++;
					
					});
			
			},
			error : function() {
				alert("error");
			}
		});
	}
	/*
		回报按钮点击事件
	*/
	$("#tab").on('click',".return",function (){
		var back=$(this).attr("id");
		var addressId=$("#address"+back).html();//收货地址id
		var supid=$("#empid"+back).html();//支持人id
		var ordid=$("#order"+back).html();//订单id
		data={
				address:addressId,
				ordid:ordid
		};
		$.ajax({
			type : "post",
			dataType : "json",
			url : "OrdersWeb/selectAdress.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(data){//data为返回的数据，在这里做数据绑定
				$("#name").html(data[0].NAME);//收货人
				$("#tel").html(data[0].PHONE);//收货电话
				$("#code").html(data[0].POSTCODES);//收货邮编
				$("#ress").html(data[0].ADDRESSINFO);//收货地址
				$("#ressid").html(addressId);//收货地址id
				$("#supid").html(supid);//支持人id
				$("#ordid").html(ordid);//订单id
			},
			error : function() {
				alert("error");
			}
		});
	})
	/*
		插入汇报记录表
	*/
	$("#sure").click(function(){
		var data={
				sponsor_id:$.cookie('empid'),//发起人id
				support_id:$("#supid").html(),//支持人id
				ord_id:$("#ordid").html(),//订单id
				addressid:$("#ressid").html(),//收货地址id
				logistics:$("#ord").val()//订单号	
		}
		if($("#ord").val()==""){
			alert("请输入订单号");
		}else{
		$.ajax({
			type : "post",
			dataType : "json",
			url : "return/insertProBack.do",
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data),
			success : function(data){//data为返回的数据，在这里做数据绑定
				
				alert("已回报");
				$('#myModal').modal('hide');
				waitback();
				alreadyback();
				backing();
			},
			error : function() {
				alert("error");
			}
		});
		}
	})
</script>
