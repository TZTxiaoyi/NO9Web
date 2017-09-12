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

  <script type="text/javascript" src="../../jq/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="../../jq/jquery.cookie1.4.1.js"></script>
  <script type="text/javascript" src="../../bootstrap/js/bootstrap.js"></script>
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css" type="text/css"></link>
  <script type="text/javascript" src="../../bootstrap/dist/bootstrap-table.js"></script>
  <link rel="stylesheet" href="../../bootstrap/dist/bootstrap-table.css" type="text/css"></link>
  </head>
  
  <body>
	<div class="panel-body" style="padding-bottom:0px;">
              
		
        <!-- <input type="button" class="saveprojects" value="个人发起众筹"/>
        <input type="button" class="saveprojects" value="机构发起众筹"/> -->
        <table id="tb_departments">
        	
        </table>
    </div>
  </body>
</html>
<script>
	
	$(".saveprojects").click(function(){
		var launchtype=1;
		if(this.value=="个人发起众筹"){
			launchtype=2;	
		}
		alert("ddd");	
		var time = new Date().Format("yyyy-MM-dd hh:mm:ss");  
		alert(time);
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/ProjectsController/SaveProjects.do",
			data:{"empid":22,"originatortype":0,"addtime":time,"projectsstate":3,"launchtype":launchtype},
			success:function(data){
				alert(data);
				if(data=="success"){
					window.location.href = 'http://localhost:9088/P2P/jsp/LaunchProject/ProjectsLaunch.jsp';
				}				
			}
		})
		
	})
	
	$(function () {
		alert("1");
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
    	alert("2");
        $('#tb_departments').bootstrapTable({
            url: 'http://localhost:9088/P2P/ProjectsController/AllProjects.do',         //请求后台的URL（*）
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
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "PROJECTSID",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                field: 'PROJECTSID',
                title: '项目信息'
            },{
                field: 'ADDTIME',
                title: '创建时间'
            },{
                field: 'PROJECTSSTATE',
                title: '项目状态'
            },{
                field: 'ORIGINATORTYPE',
                title: '发起类别'
            },{
            	title: '操作',
            	events:operateEvents,
            	formatter: function(row,value,index){
                	return ["<input class=\"editbtn btn btn-default\" type=\"button\" name=\""+value.PROJECTSID+"\" value=\"编辑\" /><input class=\"delectbtn btn btn-default\" type=\"button\" name=\""+value.PROJECTSID+"\" value=\"删除\" />"];
                }
            }]
        });
    };
    
    window.operateEvents={
    		"click .editbtn":function(e,value,row,index){
					alert(row.PROJECTSID);
					var projectsid=row.PROJECTSID;
					$.cookie('projectsid', projectsid,{path:"/"});
					alert("dd");
					window.location.href = "http://localhost:9088/P2P/jsp/LaunchProject/ProjectsLaunch.jsp";
					
					
    		},"click .delectbtn":function(e,value,row,index){
    			
    			
    		}
    		
    		
    }
    $(".editbtn").click(function(){
    	alert("789");
    	//var projects=$(this).name();
    	alert(projects);
    })
    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            empid:100032
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
//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
	Date.prototype.Format = function (fmt) { //author: meizz 
 		var o = {
     		"M+": this.getMonth() + 1, //月份 
     		"d+": this.getDate(), //日 
     		"h+": this.getHours(), //小时 
     		"m+": this.getMinutes(), //分 
     		"s+": this.getSeconds(), //秒 
     		"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     		"S": this.getMilliseconds() //毫秒 
 		};
 		if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 		for (var k in o)
 		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 		return fmt;
	} 
var time1 = new Date().Format("yyyy-MM-dd");

</script>

