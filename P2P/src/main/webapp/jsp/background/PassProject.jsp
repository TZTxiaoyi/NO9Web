<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员管理-有点</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<!-- <script type="text/javascript" src="js/page.js" ></script> -->

	<script type="text/javascript" src="../../bootstrap/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="../../bootstrap/dist/bootstrap-table.js"></script>
	<link rel="stylesheet" href="../../bootstrap/dist/bootstrap-table.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.cookie1.4.1.js"></script>
	<script type="text/javascript">
	
  $("input.mh_date").manhuaDate({
    Event : "click",//可选               
    Left : 0,//弹出时间停靠的左边位置
    Top : -16,//弹出时间停靠的顶部边位置
    fuhao : "-",//日期连接符默认为-
    isTime : false,//是否开启时间值默认为false
    beginY : 1949,//年份的开始默认为1949
    endY :2100//年份的结束默认为2049
});
</script>
<style>
		.table th, .table td { 
			text-align: center;
			vertical-align: middle!important;
		}
	</style>
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;意见管理
			</div>
		</div>

		<div class="page">
			<!-- vip页面样式 -->
			<div class="vip">
				
				<!-- vip 表格 显示 -->
				<div class="conShow">
					
					<a id="orauditing" class="btn btn-warning">查看审核</a>		
					<table border="1" cellspacing="0" cellpadding="0" id="protab">
						
					</table>
					<div class="paging">此处是分页</div>
				</div>
				<!-- vip 表格 显示 end-->
			</div>
			<!-- vip页面样式end -->
		</div>
	</div>
<script type="text/javascript">	
	$(function(){
		passproject();
	});
	function projectstate(dd){
		$.ajax({					
			type:"post",
			dataType:"json",
			url:"/P2P/project/upSinProStateEnd.do",
			data:JSON.stringify(dd),
			contentType:"application/json;charset=UTF-8",
			success:function(data){
				
				 $('#protab').bootstrapTable("refresh");

				
			}					
		});
	}
	window.operateEvents = {
			'click #see_record': function (e, value, row, index) {
				var dd={};
				
				projectsid=parseInt(row.PROJECTSID);
				
				dd["projectsstate"]=84;
				dd["projectsid"]=projectsid;
				if (!confirm("确认要发布项目？")) { 				
			        window.event.returnValue = false; 
			    } else{
			    	projectstate(dd);
				}
				
			},'click #orauditing': function (e, value, row, index) {
				
				projectsid=parseInt(row.PROJECTSID);
				var dd={};
				dd["projectsid"]=projectsid;
				$.cookie('orga_auditing', projectsid);
				$.ajax({
						url:"/P2P/AddState/selProType.do",
						dataType:"json",
						type:"post",
						data:JSON.stringify(dd),
						contentType:"application/json;charset=UTF-8",
						success:function(data){				
							
							/* if(data==1){
								window.location.replace("Selauditing.jsp");
							}else{ */
								window.location.replace("SelOrauditing.jsp");
							/* } */
						}
					});
				
			}
		}
	/* $("#orauditing").click(function() {
		var ss = $("#protab").bootstrapTable('getSelections');
		var dd1 = parseInt(ss[0].PROJECTSID);
		
		
		$.cookie('orga_auditing', dd1);
		//var auditing = $.cookie("orga_auditing");
		//alert(auditing);
		var dd={};
		dd["projectsid"]=dd1;
		$.ajax({
				url:"/P2P/AddState/selProType.do",
				dataType:"json",
				type:"post",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){				
					
					if(data==1){
						window.location.replace("Selauditing.jsp");
					}else{
						window.location.replace("SelOrauditing.jsp");
					}
				}
			});
		
	}); */
	 function marks(row,index,value){
		if (index.PROJECTSSTATE==11){
			return ["审核通过"];
		}else{
			return ["审核不通过"];
		}
	} 
	 function buttons(row,index,value){
		 if(index.PROJECTSSTATE==11){
			 return ["<a type=\"button\" id=\"see_record\" class=\"btn btn-warning btn-xs\">发布项目</a>"]
		 }else if(index.PROJECTSSTATE==88){
			 return ["<a type=\"button\" id=\"orauditing\" class=\"btn btn-warning btn-xs\">查看审核</a>"]

		 }
	 }
	function passproject() {				
		$('#protab').bootstrapTable({			
			url : '/P2P/AddState/selPassProject.do', //请求后台的URL（*）			
			method : 'post', //请求方式（*）
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : false, //是否启用排序
			sortOrder : "asc", //排序方式
			//queryParams: oTableInit.queryParams,//传递参数（*）
			//sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
			singleSelect  : true,           // 单选checkbox 
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
			// search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			// strictSearch: true,
			showColumns : true, //是否显示所有的列
			showRefresh : true, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行
			height : 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "organizationsrid", //每一行的唯一标识，一般为主键列
			showToggle : true, //是否显示详细视图和列表视图的切换按钮
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
			columns : [ [ {
				checkbox : true
			}, {
				field : 'PROJECTSID',  
				title : '项目序号',
			}, {
				field : 'EMPID',
				title : '审批人',
			}, {
				field : 'RECORDTABLE_BEGINTIME',
				title : '审批开始时间',
			}, {
				field : 'RECORDTABLE_ENDTIME',
				title : '审批结束时间',
			}, {
				field : 'EMPIDS',
				title : '发起人',
			}, {
				//field:'PROJECTSSTATE',
				formatter:marks,
				title : '状态',
			}, {
				formatter:buttons,
				events:operateEvents,
				title : '操作',
			}]]
		});
	};
</script>
</body>
</html>