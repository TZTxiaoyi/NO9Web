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
	<style>
		.table th, .table td { 
			text-align: center;
			vertical-align: middle!important;
		}
	</style>
	<script type="text/javascript">
	
	
	$(function (){
		

  $("input.mh_date").manhuaDate({
    Event : "click",//可选               
    Left : 0,//弹出时间停靠的左边位置
    Top : -16,//弹出时间停靠的顶部边位置
    fuhao : "-",//日期连接符默认为-
    isTime : false,//是否开启时间值默认为false
    beginY : 1949,//年份的开始默认为1949
    endY :2100//年份的结束默认为2049
  });
});
</script>
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;在线项目
			</div>
		</div>

		<div class="page">
			<!-- vip页面样式 -->
			<div class="vip">				
				<!-- vip 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0" id="protab">	
															
					</table>
					<div class="paging">此处是分页</div>
				</div>
				<!-- vip 表格 显示 end-->
			</div>
			<!-- vip页面样式end -->
		</div>
	</div>
	<!-- 删除弹出框  end-->
<script type="text/javascript">



//一系列操作，到service层看吧
function projectstate(data){
	
	$.ajax({
		url:"/P2P/AddState/inseProState.do",
		dataType:"json",
		type:"post",
		data:JSON.stringify(data),
		contentType:"application/json;charset=UTF-8",
		success:function(data){			
			if(data==1){
				alert("已有在审核项目");
			}else{
				$('#protab').bootstrapTable("refresh");
			}
		}
	});
}
	window.operateEvents = {
		'click #pro_auditing': function(e, value, row, index) {			 
			//alert(55);
			projectsid=parseInt(row.PROJECTSID);
			//alert(projectsid);
			var data={};
			data["projectsid"]=projectsid;
			if (!confirm("确认要审核？")) { 				
		        window.event.returnValue = false; 
		    } else{
		    	projectstate(data);
			}
		},
	}
	function marks(row,index,value){
		return ["<a type=\"button\" id=\"pro_auditing\" class=\"btn btn-warning btn-xs\">审核</a>"];
	}
	
	$('#protab').bootstrapTable({
        url: '/P2P/project/jects.do',         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: false,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
       // queryParams: oTableInit.queryParams,//传递参数（*）
      //  sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber:1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        singleSelect  : true,           // 单选checkbox 
       // search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
       // strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "organizationsrid",                     //每一行的唯一标识，一般为主键列
        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表
        columns: [[{
            checkbox: true
        }, {
            field: 'PROJECTSID',
            title: '序号',                
        }, {
        	field: 'EMPID',
            title: '发起人编号',
        } ,{
        	field: 'USERNAME',
            title: '发起人',
        } , {
        	field: 'VALUE',
            title: '项目类型',
        } , {
        	field: 'ADDTIME',
            title: '发起时间',
        } , {
        	field: 'STATE',
            title: '项目状态',
        }, {
        	field: 'APPROVER',
            title: '审批人',
        }, {
        	formatter:marks,
        	events:operateEvents,
            title: '操作',
        }]]
    });
	
</script>
</body>

<script type="text/javascript">
// 广告弹出框
$(".delban").click(function(){
  $(".banDel").show();
});
$(".close").click(function(){
  $(".banDel").hide();
});
$(".no").click(function(){
  $(".banDel").hide();
});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
    	alert("888");
        
    }
    };
// 广告弹出框 end
</script>
</html>