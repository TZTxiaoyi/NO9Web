<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>资金流向类型</title>
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
	
<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-body">资金流向类型管理</div>
		</div>

<!-- 按钮触发模态框 -->
<button class="btn btn-primary " data-toggle="modal" data-target="#addCapitaltype">
	添加类型
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="addCapitaltype" tabindex="-1" role="dialog" aria-labelledby="addCapitaltype" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">
				</button>
				<h4 class="modal-title" >
					添加类型
				</h4>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td>类型名称：</td><td> <input type="text" id="value"></td>
					</tr>
					<tr>
						<td> 备注:</td><td><input type="text" id ="remark"></td>
					</tr>
				
				</table>
				<br/>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<button id="submit" class="btn btn-primary" >
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	
	
		<!--表格  -->
		<table id="tb_departments">

		</table>
		
<!-- 编辑模态框（Modal） -->
<div class="modal fade" id="updateCapitaltype" tabindex="-1" role="dialog" aria-labelledby="updateCapitaltype" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" >
					编辑角色
				</h4>
			</div>
			<div class="modal-body">
				<table>
					<tr><td>类型序列：</td><td><span id = "updateId"></span></td></tr>
					<tr><td>原类型名称：</td><td><span id="updateName"></span></td></tr>
					<tr><td>原备注信息：</td><td><span id="updateMark"></span></td></tr>
					<tr><td>类型名称：</td><td><input type="text" id="updatevalue"></td></tr>
					<tr><td> 备注:</td> <td>	<input type="text" id ="updateremark"></td></tr>
				</table>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<button id="updateSubmit" class="btn btn-primary" >
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
</body>
</html>
<script>
$("#submit").click(function() {
	var data = {
		value : $("#value").val(),
		remark:$("#remark").val()
	};
	alert($("#value").val());
	$.ajax({
		type : "post",
		dataType : "json",
		data:data,
		url : "/P2P/capital/addCapitaltype.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			if(result.resultType=="true"){
				alert("添加成功");
				$('#updateCapitaltype').modal('hide');
			}else{
				alert("添加失败");
			}
		},error : function() {
			alert("error");
		}
	});
})
// 保存角色修改提交
 $("#updateSubmit").click(function(){
	var data = {
			key:$("#updateId").text(),
			value:$("#updatevalue").val(),
			remark:$("#updateremark").val()
	 }
	   $.ajax({
			type : "post",
			dataType : "json",
			data:JSON.stringify(data),
			url : "/P2P/capital/updateCapitaltype.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
				if(data1.resultType){
					alert("修改成功");
					$('#updataModal').modal('hide');	
					 $('#tb_departments').bootstrapTable("refresh");
				}else{
					alert("修改失败");
				} 
							
			},error : function() {
				alert("error");
			}	
		}); 
	 
 });
	$(function () {
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
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
	    $('#tb_departments').bootstrapTable({
	        url: '/P2P/capital/queryCapitaltype.do'  ,  //请求后台的URL（*）
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
	        singleSelect: false,
	        search: true,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	        strictSearch: false,
	        showColumns: true,                  //是否显示所有的列
	        showRefresh: true,                  //是否显示刷新按钮
	        minimumCountColumns: 2,             //最少允许的列数
	        clickToSelect: true,                //是否启用点击选中行
	       // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "KEY",                     //每一行的唯一标识，一般为主键列
	       // showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	       // cardView: false,                    //是否显示详细视图
	        //detailView: false,                  //是否显示父子表
	        showColumns:true, 					//是否显示列下拉框           
	        columns: [{
	            field: 'KEY',
	            title: '类型序列'
	        },{
	            field: 'VALUE',
	            title: '类型名称'
	        },{
	            field: 'REMARK',
	            title: '备注'
	        },{       
	        	title: '操作',
                events:operateEvents,
                formatter:function(value,row,index){ 
                	return ['<button class=" remove btn btn-danger " > 删除  </button>',
                	        '<button class=" updata btn btn-warning " > 编辑 </button>'
              			  ].join('');
                }
	            }
	        
	        ]
	    });
	};
	
	//绑定点击事件
	window.operateEvents = {
				 'click .updata': function (e, value, row, index) {
					 $("#updateCapitaltype").modal();
					 $("#updateId").empty();
					 $("#updateName").empty();
					 $("#updateMark").empty();
					 $("#updateId").append(row.KEY);
					 $("#updateName").append(row.VALUE);
					 $("#updateMark").append(row.REMARK);
				} ,
	 'click .remove': function (e, value, row, index) {
		 var	data={
					key:row.KEY,
					value:row.VALUE,
					remark:row.REMARK,
					state:19,
		 }
		   $.ajax({
				type : "post",
				dataType : "json",
				data:JSON.stringify(data),
				url : "/P2P/capital/updateCapitaltype.do",//要访问的后台地址  
				contentType :"application/json;charset=utf-8",
				success : function(data1) {//data为返回的数据，在这里做数据绑定  
					if(data1.resultType){
						alert("删除成功");
						 $('#tb_departments').bootstrapTable("refresh");
					}else{
						alert("删除失败");
					} 
								
				},error : function() {
					alert("error");
				}	
			}); 
	 } 
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
</script>