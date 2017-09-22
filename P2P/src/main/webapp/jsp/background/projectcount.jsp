<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>项目统计</title>
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
			<div id=projecttype  style="width:100%;height:400px; float:left;"></div>
			<div id=container  style="width: 50%;height:400px;float:right;"></div>
			<div id="repay" style="width:50%;height:400px; "></div>
			
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
		url : "/P2P/counttzt/projectrate.do",//要访问的后台地址  
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
		            text: '所有项目比率'
		        },
		        tooltip: {
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
		            name:'所有项目比率',
		            data: result
		            
		        }]
		    });
		},error : function() {
			alert("error");
		}
	});
	
	// 最近一周新增项目
	
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
	
	//订单回报状态比例
	$.ajax({
		type : "post",
		dataType : "json",
		//data:data,
		url : "/P2P/counttzt/repay.do",//要访问的后台地址  
		contentType :"application/json;charset=utf-8",
		//data:JSON.stringify(data),
		success : function(result) {//data为返回的数据，在这里做数据绑定  
			 $('#repay').highcharts({
			        chart: {
			            plotBackgroundColor: null,
			            plotBorderWidth: null,
			            plotShadow: false,
			            spacing : [100, 0 , 40, 0]
			        },
			        title: {
			            floating:true,
			            text: '订单回报状态比率'
			        },
			        tooltip: {
			            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
			                },
			                point: {
			                    events: {
			                        mouseOver: function(e) {  // 鼠标滑过时动态更新标题
			                            // 标题更新函数，API 地址：https://api.hcharts.cn/highcharts#Chart.setTitle
			                            chart.setTitle({
			                                text: e.target.name+ '\t'+ e.target.y + '单'
			                            });
			                        }
			                        //, 
			                        // click: function(e) { // 同样的可以在点击事件里处理
			                        //     chart.setTitle({
			                        //         text: e.point.name+ '\t'+ e.point.y + ' %'
			                        //     });
			                        // }
			                    }
			                },
			            }
			        },
			        series: [{
			            type: 'pie',
			            innerSize: '80%',
			            name: '市场份额',
			            data:result
			        }]
			    }, function(c) {
			        // 环形图圆心
			        var centerY = c.series[0].center[1],
			            titleHeight = parseInt(c.title.styles.fontSize);
			       		c.setTitle({
			            y:centerY + titleHeight/2
			        }); 
			        chart = c;
			    });
		},error : function() {
			alert("error");
		}
	});
	
});
</script>