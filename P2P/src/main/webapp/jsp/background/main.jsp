<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页引用-有点</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
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

<script src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
 <script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/drilldown.js"></script>  
 <script src="http://code.highcharts.com/modules/data.js"></script> 
 <script src="js/HighCharts.js"></script> 
</head>

<body>
	<div id="pageAll">
		<div class="page">
			<!-- main页面样式 -->
			<div class="indexL">
				<div id=projecttype  style="width:100%;height:600px; "></div>
			</div>
			<!-- main页面样式end -->
		</div>
	</div>
</body>
</html>
<script>
$(function(){
	$.ajax({
		type : "post",
		dataType : "json",
		//data:data,
		url : "/P2P/counttzt/projcettime.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		//data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			$('#projecttype').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: '近一周新增项目数量图'
		        },
		        xAxis: {
		            categories:result.categories
		        },
		        yAxis: {
		            title: {
		                text: '项目数量 (个)'
		            }
		        },
		        plotOptions: {
		            line: {
		                dataLabels: {
		                    enabled: true          // 开启数据标签
		                },
		                enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
		            }
		        },
		        series: result.series
		    });
		},error : function() {
			alert("error");
		}
	});
});

</script>