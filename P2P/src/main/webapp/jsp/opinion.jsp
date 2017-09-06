<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../jq/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css"
	type="text/css"></link>
<script type="text/javascript" src="../bootstrap/dist/bootstrap-table.js"></script>
<link rel="stylesheet" href="../bootstrap/dist/bootstrap-table.css"
	type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
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
			<!-- opinion 页面样式 -->
			<table id="tb_departments">

			</table>
			<!-- 页面样式end -->
		</div>
	</div>
	
	<!-- 模态框（Modal） -->
<div class="modal fade" id="queryEmployee" tabindex="-1" role="dialog" aria-labelledby="queryEmployee" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					查询拥有人信息
				</h4>
			</div>
			<div class="modal-body">
			
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


	<!-- 编辑账号模态框（Modal） -->
<div class="modal fade" id="queryAccounts" tabindex="-1" role="dialog" aria-labelledby="queryAccounts" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" >
					编辑账号信息
				</h4>
			</div>
			<div class="table-responsive">
				<table class="queryAccounts-body table table-striped">
					
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<button id="submitAccounts" class="btn btn-primary" >
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
</body>
</html>
<script>
$(function () {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
});
/* function formatOperat(row,index,value){
      return ["<input type=\"radio\" name=\"name"+index.EVAID+"\" value=\"5\" />"];
} */

var TableInit = function () {
var oTableInit = new Object();
//初始化Table
oTableInit.Init = function () {
    $('#tb_departments').bootstrapTable({
        url: '/P2P/back/queryAccountsTable.do'  ,  //请求后台的URL（*）
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
        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "ACCOUNTSID",                     //每一行的唯一标识，一般为主键列
       // showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
       // cardView: false,                    //是否显示详细视图
        //detailView: false,                  //是否显示父子表
        showColumns:true, 					//是否显示列下拉框
        columns: [{
            field: 'ACCOUNTSID',
            title: '账号序列'
       		},{       
            field: 'ACCOUNTS',
            title: '账号',
            },{       
            field: 'EMPID',
            title: '拥有人序列',
            },{       
            field: 'ROLENAME',
            title: '角色',
            }, {
            field: 'VALUE',
            title: '账号状态',
   			 },{
                title: '操作',
                events:operateEvents,
                formatter:function(value,row,index){ 
                	return ['<button class=" selectinfo btn btn-primary " > 查询个人信息  </button>',
                	        '<button class=" updata btn btn-warning " > 编辑 </button>'
              			  ].join('');
                }
            }
          ]
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
 $("#submitAccounts").click(function(){
	var  data={
			accountsid:$("#ACCOUNTSID").text(),
			empid:$("#EMPID").text(),
			accounts:$("#ACCOUNTS").text(),
		accountsstate:$("#ACCOUNTSSTATE").val(),
		roleid:$("#ROLEID").val()
	};
	 $.ajax({
			type : "post",
			dataType : "json",
			data:JSON.stringify(data),
			url : "/P2P/back/updateAccounts.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
				if(data1.resultType){
					alert("修改成功");
					$('#queryAccounts').modal('hide');	
					 $('#tb_departments').bootstrapTable("refresh");
				}else{
					alert("修改失败");
				} 
							
			},error : function() {
				alert("error");
			}	
		});
	 
 });
window.operateEvents = {
        'click .selectinfo': function (e, value, row, index) {
            var data= {
     		empid:$('#tb_departments').bootstrapTable('getRowByUniqueId', row.EMPID).EMPID,
            }   
        	$("#queryEmployee").modal();
            $(".modal-body").empty();
        	 $.ajax({
     			type : "post",
     			dataType : "json",
     			data:JSON.stringify(data),
     			url : "/P2P/back/queryEmployee.do",//要访问的后台地址  
     			contentType :"application/json;charset=utf-8",
     			success : function(data1) {//data为返回的数据，在这里做数据绑定  
					var a="拥有人序列号:"+data1[0].EMPID+"</br>用户名:"+data1[0].USERNAME+
					"</br>真实名:"+data1[0].EMPNAME+"</br>身份证号:"+data1[0].IDCARD+"</br>性别:"+data1[0].SEX+"</br>年龄:"
					+data1[0].AGE+"</br>地址:"+data1[0].ADDRESS+"</br>电话:"+data1[0].TELEPHONE+"</br>账户余额:"+data1[0].BALANCE
					+"</br>状态:"+data1[0].EMPSTATE;
					
					$(".modal-body").append(a);
     			}
     		});
        
		   },
			 'click .updata': function (e, value, row, index) {
				$("#queryAccounts").modal();
			    $(".queryAccounts-body").empty();
				  $.ajax({
						type : "post",
						dataType : "json",
						//data:JSON.stringify(data),
						url : "/P2P/back/queryRoleTable.do",//要访问的后台地址  
						contentType :"application/json;charset=utf-8",
						success : function(data1) {//data为返回的数据，在这里做数据绑定  
						 var b="";
						 var c="";
							$.each(data1,function(key,val){
								if(row.ROLENAME==val.ROLENAME){
									b=b+"<option value="+val.ROLEID+" selected='selected'>"+val.ROLENAME+"</option>";  
								}else{
									b=b+"<option value="+val.ROLEID+">"+val.ROLENAME+"</option>";  
								}
							}); 
							if(row.VALUE=='可用'){
								c="<option value= 2 selected='selected'>可用</option><option value= 3 >冻结</option>";
							}else{
								c="<option value= 2>可用</option><option value= 3 selected='selected'>冻结</option>";
							}
						var a ="<tr><td>账号序列</td><td id='ACCOUNTSID'>"+row.ACCOUNTSID+"</td></tr>"+
								"<tr><td>账号</td><td id='ACCOUNTS'>"+row.ACCOUNTS+"</td></tr>"+
								"<tr><td>拥有人序列</td><td id='EMPID'>"+row.EMPID+"</td></tr>"+
								"<tr><td>拥有人序列</td><td><select  id='ROLEID' name='ROLEID'>"+b+"</select></td></tr>"+
								"<tr><td>账号状态</td><td><select id='ACCOUNTSSTATE' name='ACCOUNTSSTATE'>"+c+"</select></td></tr>"
								
						$(".queryAccounts-body").append(a); 
						}
					
					}); 
			
			} 
    };
</script>