<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的评论</title>
	<!-- <script type="text/javascript" src="jq/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
   	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> -->
   	
   	
   	<script type="text/javascript" src="bootstrap/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="bootstrap/dist/bootstrap-table.js"></script>
	<link rel="stylesheet" href="bootstrap/dist/bootstrap-table.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.cookie1.4.1.js"></script>
   	<style type="text/css">
	   	
   		/* #trsize{
	  		font-weight:bold;
	  		font-size:20px;
	  	}
	  	td{
	  		width:200px;
	  		text-align:center;
	  	} */
   	</style>
</head>
<body>
	
	
	<table id = "div" class="table table-bordered"></table>
	
	
</body>
</html>
	<script>
	
	$(function () {
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	});

	function marks(row,index,value){
		//<a class=\"button border-main deletebtn\" COMMENTARY_ID=\"COMMENTARY_ID\" id=\"delete"+value.COMMENTARY_ID+">删除</a>
		return ["<a type=\"button\" id=\"COMMENTARY_ID\" class=\"btn btn-warning btn-xs deletebtn\">删除</a>"]
	}
	var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
	    $('#div').bootstrapTable({
	        url: '/P2P/zhubin/queryCommentary.do'  ,  //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        toolbar: '#toolbar',                //工具按钮用哪个容器
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        sortable: true,                     //是否启用排序
	        sortOrder: "desc",                   //排序方式
	        queryParams: oTableInit.queryParams,//传递参数（*）
	        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
	        pageNumber:1,                       //初始化加载第一页，默认第一页
	        pageSize: 2,                       //每页的记录行数（*）
	        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	        singleSelect: false,
	        search: true,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	        strictSearch: false,
	        showColumns: true,                  //是否显示所有的列
	       // showRefresh: true,                  //是否显示刷新按钮
	        minimumCountColumns: 2,             //最少允许的列数
	        clickToSelect: true,                //是否启用点击选中行
	       // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "COMMENTARY_ID",                     //每一行的唯一标识，一般为主键列
	       // showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	       // cardView: false,                    //是否显示详细视图
	        //detailView: false,                  //是否显示父子表
	        showColumns:true, 				//是否显示列下拉框           
	        columns: [{
	            checkbox:true
	        },{
	            field: 'COMMENTARY_ID',
	            title: '编号ID',width:100,
	        },{
	            field:'PROTYPENAME',
	            title: '项目类型名称'
	        },{
	            field: 'EMPNAME',
	            title: '用户名'
	        },{
	        	field: 'CONTENT',
	            title: '评论内容'
	        },{
	            field: 'TIME',
	            title: '评论时间'
	        }, {
	        	formatter:marks,
	        	//events:operateEvents,
	            title: '操作',
	        }]
	    });
	};





	//得到查询的参数
	oTableInit.queryParams = function (params) {
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
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

//----------------------------------------------------------------------------
		/* $(function(){
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
		}); */
		//----------------------------------
		$("#div").on("click",".deletebtn",function(){
			var name = $(this).parents("tr").find("td:eq(1)").text();
			
			//弹出是否确认删除对话框
			if(confirm("确认删除["+name+"]吗？")){
				//确认，发送ajax请求删除
				$.ajax({
					url : "zhubin/deleteCommentary.do",
					type : "post",
					data:{"COMMENTARY_ID":name},
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
	</script>