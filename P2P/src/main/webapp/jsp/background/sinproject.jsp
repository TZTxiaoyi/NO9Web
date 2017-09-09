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

<script type="text/javascript"
	src="../../bootstrap/jquery/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<script type="text/javascript"
	src="../../bootstrap/dist/bootstrap-table.js"></script>
<link rel="stylesheet" href="../../bootstrap/dist/bootstrap-table.css"
	type="text/css"></link>
<script type="text/javascript" src="js/jquery.cookie1.4.1.js"></script>
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
					<a type="button" id="detail"  class="btn btn-info" data-toggle="modal" data-target="#myModal">信息</a>
					<a type="button" id="describe" class="btn btn-danger" data-toggle="modal" data-target="#myModal1">描述</a>
					<a type="button" id="auditing" class="btn btn-warning">审核</a>		
					<table border="1" cellspacing="0" cellpadding="0" id="protab">
						
					</table>
					<div class="paging">此处是分页</div>
				</div>
				<!-- vip 表格 显示 end-->
			</div>
			<!-- vip页面样式end -->
		</div>

	</div>

	<!-- 项目详情模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目描述</h4>
				</div>
				<div class="modal-body" id="div_span">
					项目标题：<span id=pro_title></span>;&nbsp;&nbsp;&nbsp;&nbsp;
					筹金目的：<span id=pro_goal></span>;<br>
					项目地点：<span id=pro_place></span>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					筹金金额：<span id=pro_money></span>;<br>
					筹金天数：<span id=pro_day></span>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					项目封面：<span id=pro_img></span><br> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="del_span">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 项目 描述模态框-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">项目信息</h4>
				</div>
				<div class="modal-body">
					项目地址：<span id="place"></span><br>
					标题：<span id="title"></span><br>
					文本：<span id="bodys"></span><br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
<!-- $.cookie('cookieName', 'cookieValue') //存入值 $.cookie("cookieName") -->
	<script type="text/javascript">
	$("#auditing").click(function(){
		var ss=$("#protab").bootstrapTable('getSelections');				
		var dd1=parseInt(ss[0].PROJECTSID);
		//alert(dd1);
		$.cookie('project_auditing',dd1);
		var auditing=$.cookie("project_auditing");
		//alert(auditing);
		 window.location.replace("auditing.jsp");
	});
	$("#detail").click(function(){
		$("#pro_title").html("");
		$("#pro_goal").html("");
		$("#pro_place").html("");
		$("#pro_money").html("");
		$("#pro_day").html("");	
		var ss=$("#protab").bootstrapTable('getSelections');	
		//var dd=JSON.stringify(ss);			
		var dd1=parseInt(ss[0].PROJECTSID);
		//alert(dd1);
		var dd={};
		dd["projectsid"]=dd1;
		//alert(dd);
		$.ajax({
			type:"post",
			dataType:"json",
			url:"/P2P/project/indetail.do",
			data:JSON.stringify(dd),
			contentType:"application/json;charset=UTF-8",
			success:function(data){
				$.each(data,function(index,value){
					var title=value.TITLE;
					var goal=value.GOAL;
					var place=value.PROJECTS_PLACE;
					var financing=value.FINANCING;
					var days=value.FINANCING_DAY;		
					$("#pro_title").append(title);
					$("#pro_goal").append(goal);
					$("#pro_place").append(place);
					$("#pro_money").append(financing);
					$("#pro_day").append(days);
				})
			}
		})
	})
	//项目描述，将数据打印到模态框中
		$("#describe").click(function(){
			$("#place").html("");
			$("#title").html("");
			$("#bodys").html("");
			var ss=$("#protab").bootstrapTable('getSelections');	
			//var dd=JSON.stringify(ss);			
			var dd2=parseInt(ss[0].PROJECTSID);
			alert(dd2);
			var dd={};
			
			dd["projectsid"]=dd2;
			$.ajax({
				type:"post",
				url:"/P2P/project/describe.do",
				dataType:"json",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					$.each(data,function(index,value){
						var place=value.places;
						var title=value.title;
						var body=value.body;
						$("#place").append(place);
						$("#title").append(title);
						$("#bodys").append(body);
					})
				}
			})
		});
	$(function (){	
	$('#protab').bootstrapTable({
        url: '/P2P/project/pro.do',         //请求后台的URL（*）
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
       // search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
       // strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "originatorid",           //每一行的唯一标识，一般为主键列
        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表
        columns: [[{
            checkbox: true
        }, {
            field: 'ORIGINATORID',
            title: '序号',                
        }, {
        	field: 'PROJECTSID',
            title: '项目序号',
        } ,{
        	field: 'IDCARD',
            title: '身份证号',
        } , {
        	field: 'ORIGINATORNAME',
            title: '发起人姓名',
        } , {
        	field: 'ADDRESS',
            title: '地址',
        } , {
        	field: 'TELEPHONE',
            title: '电话',
        } , {
        	field: 'PROTYPENAME',
            title: '项目类型',
        } ,{
        	formatter:mark,
            title: '身份证正面',
        } ,{
        	field: 'CARDIMAGE2',
            title: '身份证反面',
        },{
        	field: 'STATE',
            title: '项目状态',
        }]]
    });
	function mark(row,index,value){
		return ["<img src='"+index.CARDIMAGE1+"'>"];
	}
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