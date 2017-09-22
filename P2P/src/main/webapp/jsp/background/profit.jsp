<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>财务管理</title>
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
			<div class="panel-body">资金流水管理</div>
		</div>

<!-- 按钮触发模态框 -->
<button class="btn btn-primary " data-toggle="modal" data-target="#addProfit">
	添加款项记录
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="addProfit" tabindex="-1" role="dialog" aria-labelledby="addProfit" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">
				</button>
				<h4 class="modal-title" >
					添加一笔收入或支出记录
				</h4>
			</div>
			
			<!-- 类型 -->
			<div class="table-responsive">
				<table class="queryType-body table table-striped">
					<tr><td> 金额数量：</td><td><input type="text" id="capital"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td></tr>
					<tr>
						<td> 资金类型</td>
						<td>
							<input type="radio" name="capitaltype" checked="checked"  value="0">支出</input>
							<input type="radio" name="capitaltype"  value="1">收入</input>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<button id="submit" class="btn btn-primary" >
					确认提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	
		<!--表格  -->
		<table id="tb_departments">

		</table>
		
</div>		
</body>
</html>
<script>
var data={}
$("#submit").click(function(){
	if($('input:radio:checked').val()==1){
		  data={
				  capitalflow:$("#capitalflow").val(),
					capital: $("#capital").val()
		};
		  alert(1111111);
	}else{
		  data={
				capitalflow:$("#capitalflow").val(),
				capital: -$("#capital").val()
		};
	}
	 $.ajax({
			type : "post",
			dataType : "json",
			data:JSON.stringify(data),
			url : "/P2P/profit/addProfit.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
				if(data1.result){
					alert("添加成功");
					$('#addProfit').modal('hide');	
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
    TypeInit();
});
/* function formatOperat(row,index,value){
      return ["<input type=\"radio\" name=\"name"+index.EVAID+"\" value=\"5\" />"];
} */
TypeInit=function(){
	
	  $.ajax({
			type : "post",
			dataType : "json",
			//data:JSON.stringify(data),
			url : "/P2P/capital/queryCapitaltype.do",//要访问的后台地址  
			contentType :"application/json;charset=utf-8",
			success : function(data1) {//data为返回的数据，在这里做数据绑定  
			 var b="";
				$.each(data1,function(key,val){
						b=b+"<option value="+val.KEY+" >"+val.VALUE+"</option>";  
				}); 
				b="<tr><td>资金去向类型</td><td><select  id='capitalflow' name='capitalflow'>"+b+"</select></td></tr>";
			$(".queryType-body").append(b); 
			}
		
		}); 
};
var TableInit = function () {
var oTableInit = new Object();
//初始化Table
oTableInit.Init = function () {
    $('#tb_departments').bootstrapTable({
        url: '/P2P/profit/queryProfit.do'  ,  //请求后台的URL（*）
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
        uniqueId: "PROFITID",                     //每一行的唯一标识，一般为主键列
       // showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
       // cardView: false,                    //是否显示详细视图
        //detailView: false,                  //是否显示父子表
        showColumns:true, 					//是否显示列下拉框           
        columns: [{
            field: 'PROFITID',
            title: '资金流水序列'
        },{
            field: 'PROJECTSID',
            title: '项目序列'
        },{
            field: 'VALUE',
            title: '支入或支出类型'
        },{
            field: 'CAPITAL',
            title: '金额'
        },{
            field: 'OPERATOR',
            title: '操作人'
        },{
            field: 'TIME',
            title: '时间'
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

var ButtonInit = function () {
	var oInit = new Object();
	var postdata = {};
	oInit.Init = function () {
	    //初始化页面上面的按钮事件
	};
		return oInit;
};
</script>