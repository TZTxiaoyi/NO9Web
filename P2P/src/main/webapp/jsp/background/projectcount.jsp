<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>角色管理</title>
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
<script type="text/javascript" src="js/echarts.min.js"></script>
</head>
<body>


<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-body">项目统计</div>
		</div>

		<div id="echart"  style="width: 600px;height:400px;"></div>
</div>

</body>
</html>

<script>
var myChart = echarts.init(document.getElementById("echart"));
var option={
		title:{
			text:'1111111'
		},
		tooltip:{
			
		},legend: {
	        data:['销量']
	    },
		 xAxis: {
             data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
         },
         yAxis: {},
         series: [{
             name: '销量',
             type: 'bar',
             data: [5, 20, 36, 10, 10, 20]
         }]
     };
     
myChart.setOption(option);
</script>