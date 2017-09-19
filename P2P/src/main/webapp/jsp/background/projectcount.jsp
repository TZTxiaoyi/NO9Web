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

<script src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
 <script src="http://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/js/modules/exporting.js"></script>
<script src="http://cdn.hcharts.cn/libs/highcharts-export-csv/export-csv.js"></script>
<script src="http://code.highcharts.com/modules/drilldown.js"></script>  
 <script src="http://code.highcharts.com/modules/data.js"></script> 
</head>
<body>


<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-body">项目统计</div>
		</div>

		<div id=container  style="width: 600px;height:400px;"></div>
</div>

</body>
</html>

<script>
$(function () {
    $('#container').highcharts({
        chart: {
        },
        title: {
            text: '所有项目成功比率'
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
            name: '浏览器访问量占比',
            data: [
                ['Firefox',   45.0],
                ['IE',       26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari',    8.5],
                ['Opera',     6.2],
                ['其他',   0.7]
            ]
        }]
    });
});

</script>