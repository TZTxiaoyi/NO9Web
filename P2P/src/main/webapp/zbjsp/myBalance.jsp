<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的余额</title>
	<script type="text/javascript" src="../jq/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../jq/jquery.cookie1.4.1.js"></script>
   	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css"></link>
	<script type="text/javascript" src="../bootstrap/dist/bootstrap-table.js"></script>
  	<link rel="stylesheet" href="../bootstrap/dist/bootstrap-table.css" type="text/css"></link>
	<style type="text/css">
		#zbbal{
			font-size:48px;
			font-family:"楷体";
			margin-top:200px;
			margin-left:300px;
		}	
		#zbRecharge{
			font-size:24px;
			font-family:"楷体";
		}
		#borderdiv{
  		width:100%;
  		height:40px;
  		border-bottom:5px solid #F0F0F0;
  		}
		.help-block{
			display:none;
		}
		.input1{
	 		width:265px;
	 		height:40px;
	 	}
	 	.form-control{
	 		width:200px;
	 	}
	 	.input-group-addon{
	 		width:10px;
	 	}
	 	#bankCard{
	 		width:265px;
	 		height:40px;
	 	}
	</style>
</head>
<body>
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	  充值
	</button>
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">
	  提现
	</button>
	
	<div id = "zbbal">
		我的余额：<span id = "balance"> </span>&nbsp;元
	</div>
	<div>
		<div id="borderdiv"><b>交易记录 <!-- <input type="button" class="btn btn-info saveprojects" value="个人发起众筹"/> --></b>
        	
        <!-- <input type="button" class="btn btn-info saveprojects" value="机构发起众筹"/> --> 
        </div> 
		<table id="AccountRecord">
		
		</table>
	</div>
	
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel">账户充值</h2>
	      </div>
	      <div class="modal-body">
	       		<div id ="zbRecharge">
	       			<span>银行名称</span>
	       			<select id ="bankName" name = "bankName" class = "input1"> </select><br>
	       			<span>银行账号</span>
	       			<input type = "text" id = "bankId"  placeholder="请输入银行账号" onkeyup="value=value.replace(/[^\d]/g,'')"/><br>
	       			<span>充值金额</span>
	       			 <!-- <div class="input-group">
					      <div class="input-group-addon">$</div>
					      <input type="text" class="form-control" id="Recharge" placeholder="充值金额">
					      <div class="input-group-addon">.00</div>
				    </div> -->
	       		<input type = "text" id = "Recharge" onkeyup="value=value.replace(/[^(\d+\.\d{1,2}|\d+)$]/g,'') "/>
	       			<span  class="help-block"></span>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id = "oksRec">确定充值</button>
	      </div>
	    </div>
	  </div>
	</div><!--充值div end -->
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h2 class="modal-title" id="myModalLabel">用户提现</h2>
	      </div>
	      <div class="modal-body">
	       		<div id ="zbRecharge">
	       			
	       			<span>银行账号</span>
	       			<!-- <input type = "text" id = "bankId"  placeholder="请输入银行账号" onkeyup="value=value.replace(/[^\d]/g,'')"/><br> -->	       			
	       			<select id = "bankCard"> </select><br>
	       			<span>提现金额</span>
	       			<input type = "text" id = "Recharge1" onkeyup="value=value.replace(/[^(\d+\.\d{1,2}|\d+)$]/g,'') "/>
	       			<span  class="help-block"> </span>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id = "drawMoney">确定提款</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>
	<script>
		
	
//----------------------------点击提款按钮触发事件--------------------------------------------
	$("#drawMoney").click(function(){
		if(!CheckData1()){
			alert("提款失败！！！");
			return false;
		}
		var txbalance =  $("#Recharge1").val();
		var empid = $.cookie("empid");
		var data={};
		data["txbalance"] = txbalance;
		data["empid"] = empid;
		//alert(data["txbalance"]+"    "+data["empid"]);
		$.ajax({
			//type : "post",
			url : "/P2P/zhubin/updateBankAccount.do",
			contentType : "application/json;charset=utf-8",
			data : data,
			success : function(data) {
				if(data==1){
					alert("提现成功");
					window.location.href = "myBalance.jsp";
					
				}else{
					alert("提现失败");
				}
			}
		});
	});
//------------------------------------校验函数--------------------------------------
	function CheckData1(){
		//校验提现金额
		var Recharge1 = $("#Recharge1").val();
		var money = parseFloat($.cookie("balance"));
		if((Recharge1 == "") || (Recharge1>=1000)){
			alert("提款金额不能为空或者大于1000");
			show_bankAcount_msg("#Recharge1", "error", "请填写提现金额");
			return false;
		}else if(Recharge1 > money){
			alert(money);
			alert("余额不足！");
			show_bankAcount_msg("#Recharge1", "error", "对不起，余额不足");
			return false;
		}
		else{
			show_bankAcount_msg("#Recharge1", "true", "");
		};
		return true;
	}
//--------------------显示校验效果的提示信息的函数-------------------------------
	function show_bankAcount_msg(ele,status,msg){
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
//------------------------------查询银行账号--------------------------------------
	$(function(){
		var empid = parseInt($.cookie("empid"));
		var da = {
				"empid" : empid
		}
		//alert(empid);
		$.ajax({
			//type : "post",
			//dataType : "json",
			url : "/P2P/zhubin/queryBankAccount.do",
			contentType : "application/json;charset=utf-8",
			//data : JSON.stringify(da),
			data :{"empid":empid},
			success : function(data){
				//alert("34333");
				$.each(data,function(index,value){
					var option = "<option>"+value.bankAccounts+"</option>";
					$("#bankCard").append(option);
				});
				
			},
			error : function(data){
				alert("error"+data);
			}
		});
	});
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
	
//----------------------------------------------点击确定充值按钮-----------------------------------------------------
	$("#oksRec").click(function(){
		//var addalter = $(this).attr("id");
		//var balance1 = $("#balance").html();
		var balance = $("#Recharge").val();
		var empid = $.cookie("empid");
		var balances = $.cookie("balance");
		//alert(balances +"+"+balance);
		//alert(empid);
		var data = {
				"empid" : parseInt($.cookie("empid")),
				"balance" :parseFloat($("#Recharge").val()),
				"balances" : parseFloat($.cookie("balance"))
		}
		$.ajax({
			type : "post",
			url : "http://localhost:9088/P2P/zhubin/updateEmployee.do",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			success : function(data) {
				if(data=="true"){
					alert("充值成功");
				}
				window.location.href = "myBalance.jsp";
			},
			error : function(data){
				alert("error"+data);
			}
		});
	});
//--------------------------------------------查询余额-------------------------------------------------------------
		$(function(){
			var empid = parseInt($.cookie("empid"));
			//alert(empid);
			var data = {
					"empid" : $.cookie("empid"),	
			}
			$.ajax({				
				type : "post",
				dataType : "json",
				url : "/P2P/zhubin/queryEmployee.do",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				success : function(data) {
					var sp = data[0].balance;
					$("#balance").html(sp);
					$.cookie("balance",$("#balance").html(),{path:"/"});
					//alert(sp);
				},
				error : function(data){
					alert("error error"+data);
				}
			});
		}); 
		
//--------------------------------------------交易记录-------------------------------------------------------------
var Empid1 = parseInt($.cookie("empid"));
$(function () {
		alert("1");
	    //1.初始化Table
	    var oTable = new TableInit();
	    alert("55");
	    oTable.Init();
	    alert("54");
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	});
	/* function formatOperat(row,index,value){
          return ["<input type=\"radio\" name=\"name"+index.EVAID+"\" value=\"5\" />"];
	} */

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#AccountRecord').bootstrapTable({
            url: 'http://localhost:9088/P2P/zhubin/AllTransactionRecord.do',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示所有的列
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: false,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "TRAID",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                field: 'TIME',
                title: '时间'
            },{
                field: 'VALUE',
                title: '交易详情'
            },{
                field: 'MONEY',
                title: '金额'
            }]
        });
    };
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        		EmpId:Empid1
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};
	</script>