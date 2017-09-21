<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>盈利资金统计</title>
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


<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-body">项目统计</div>
		</div>
		<div>
			<div id=container  style="width: 49%;height:400px;float:right;"></div>
			<div id=projecttype  style="width: 49%;height:400px;"></div>
		</div>
		
</div>

</body>
</html>

<script>

$(function () {
	// 成功比率饼图
	$.ajax({
		type : "post",
		dataType : "json",
		//data:data,
		url : "/P2P/counttzt/typeFit.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		//data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			$('#container').highcharts({
		        chart: {
		        	
		        },
		        credits:{
	        		enabled: false
	        	},
		        title: {
		            text: '项目类型收入比率'
		        },
		        tooltip: {
		                  pointFormat: '{series.name}: <b>{point.y}元</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                    }
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            name:'类型详细收入',
		            data: result
		            
		        }]
		    });
		},error : function() {
			alert("error");
		}
	});
	
	// 最近一周收入支出
	
	$.ajax({
		type : "post",
		dataType : "json",
		//data:data,
		url : "/P2P/counttzt/fit.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		//data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			$('#projecttype').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: '近一周收支情况'
		        },
		        xAxis: {
		            categories:result.categories
		        },
		        yAxis: {
		            title: {	
		                text: '金额 (元)'
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