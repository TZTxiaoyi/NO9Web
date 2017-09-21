/**
 * 图表设计
 * version 1.1.0
 */

/**
 * 图表标题
 * @param titleText
 * @returns title
 */
function getTitle(titleText){
	var title = {
			text: titleText
	}
	return title;
}
/**
 * 副标题
 * @param subTitleText
 * @returns subtitle
 */
function getSubTitle(subTitleText){
	var sbuTitle = {
			text : subTitleText
	}
	return sbuTitle;
}
/**
 * 图表配置
 * @param charts [line:折线图,column:柱状图,pie:饼图,errorbar:误差图,spline:曲线图,scatter:散点图]
 * @returns chart
 */
function getChart(charts){
	var chart ={
			type : charts,
			events: {
				selection: function (event) {
					var text,
					label;
					if (event.xAxis) {
						text = 'min: ' + Highcharts.numberFormat(event.xAxis[0].min, 2) + ', max: ' + Highcharts.numberFormat(event.xAxis[0].max, 2);
					} else {
						text = 'Selection reset';
					}
					label = this.renderer.label(text, 100, 120)
					.attr({
						fill: Highcharts.getOptions().colors[0],
						padding: 10,
						r: 5,
						zIndex: 8
					})
					.css({
						color: '#FFFFFF'
					})
					.add();
					setTimeout(function () {
						label.fadeOut();
					}, 1000);
				}
			},
			zoomType: 'x'
	}
	return chart;
}
/**
 * 坐标轴x轴数据
 * @returns xAxis
 */
function getXaxis(){
	var xAxis ={
			crosshair: true,
			type : "category"
	}
	return xAxis;
}
/**
 * 坐标轴y轴信息
 * @param yTitleText y轴标题
 * @returns yAxis
 */
function getYaxis(yTitleText){
	var yAxis ={
			crosshair: true,
			title:{
				text:yTitleText
			}
	}
	return yAxis;
}
/**
 * 图例设置
 * @returns legend
 */
function getLegend(){
	var legend = {
			align: 'center',
			verticalAlign: 'bottom',
			borderWidth: 0
	}
	return legend;
}
var dataList = "";

/**
 * 数据列配置
 * @param dialogId 模态框id
 * @param tableId 表格id
 * @param xTitle 
 * @param yTitle
 * @returns
 */

function getPlotOptions(dialogId,tableId,xTitle,yTitle){
	var plotOptions = {
			series: {
				cursor:'pointer',
				events: {

					click: function () {
						getToolTips();
						//alert('您点击了数据列：' + this.name);
						var datas = [];
						//var i=0;
						$.each(dataList,function(index,value){
							var dat ={};
							dat.name = value.series.name;
							dat.y = value.y;
							datas[index] = dat;
							//i++;
						});
						if(this.type !='pie'){
							getDialog(dialogId,tableId,xTitle,yTitle,datas);
						}

						
					}
				},
				point: {
					events: {
						click: function() {
							//alert('您点击的点的值是：' + this.name + '\t' + this.y);
							$("#asdspan").text(this.name);
						}
					}
				},
				dataLabels : {
					enabled : true
				},
				showInLegend: true
			},
	       
	}
	//alert(dataList);
	dataList = "";
	return plotOptions;
}
/**
 * 模态框表格
 * @param dialogId
 * @param tableId
 * @param xTitle
 * @param yTitle
 * @param datas
 * @returns
 */
function getDialog(dialogId,tableId,xTitle,yTitle,datas){
		$("#"+dialogId).dialog({
			title: '图表详情',    
			width: 600,    
			height: 350,
			closed: false,
			cache: false,    

			modal: true 
		});
		$('#'+tableId).datagrid({
			data:datas,
			pagination:true,
			rownumbers:true,
			striped:true,
			ctrlSelect:true,
			total:datas.length,
			pageSize:10,
			pageList:[5,10,15,20],
			onChangePageSize:function(pageSize){
				alert(pageSize);
			},
			columns:[[    
				{field:'name',title:xTitle,width:100},    
				{field:'y',title:yTitle,width:100},    

				]]    
		});
}
function getToolTip(){
	var tooltip = {
			followPointer: true,
			shared: true,
			//split: true,

			useHTML: true,
			formatter: function () {
				dataList = this.points;
				return false;
			}
		
			


	}
	return tooltip;
}
function getToolTips(){
	var tooltip = {
			followPointer: true,
			shared: true,
			useHTML: true,
			headerFormat:'<small>{point.key}</small><br/>',
    		pointFormatter:function(){
    			var s = this.series.name+': <b>'+this.y+'</b><br/>';
    			return s;
    		}


	}
	return tooltip;
}
/**
 * 
 * @param id 
 * @param titleText 
 * @param subTitleText 
 * @param charts 
 * @param yTitleText 
 * @param series 
 * @param drilldown 
 * @returns null
 */
/**
 * 组装所有数据并加载成图表
 * @param id 标签id
 * @param dialogId 模态框id
 * @param tableId 表格id
 * @param xTitle 表格标题
 * @param titleText 主标题信息
 * @param subTitleText 副标题信息
 * @param charts 图表类型参数
 * @param yTitleText y轴标题
 * @param series 核心数据块
 * @param drilldown 向下钻取的数据
 * @returns
 */
function getHighCharts(id,dialogId,tableId,xTitle,titleText,subTitleText,charts,yTitleText,series,drilldown){
	var json = {}
	json.legend = getLegend();
	
	json.plotOptions = getPlotOptions(dialogId,tableId,xTitle,yTitleText);

	if(!$.isEmptyObject($.trim(titleText))){
		json.title = getTitle(titleText);
	}
	if(!$.isEmptyObject($.trim(subTitleText))){
		json.subtitle = getSubTitle(subTitleText);
	}
	if(!$.isEmptyObject($.trim(charts))){
		json.chart = getChart(charts);
		if(charts=='pie'){
			json.tooltip = getToolTips();
		}else{
			json.tooltip = getToolTip();
		}
	}
	if(!$.isEmptyObject($.trim(yTitleText))){
		json.xAxis = getXaxis();
		json.yAxis = getYaxis(yTitleText);
	}
	json.series = series;
	if(!$.isEmptyObject($.trim(drilldown))){
		json.drilldown = drilldown;
	}
	json.exporting =  {
			buttons: {
				contextButton: {
					symbol: 'menu',
					symbolStrokeWidth: 1,
					symbolFill: '#bada55',
					symbolStroke: '#330033'
				}
			}
	};
	Highcharts.setOptions({
		lang:{
			printChart: '打印图表',
			downloadJPEG: '下载 JPEG 文件',
			downloadPDF: '下载 PDF   文件',
			downloadPNG: '下载 PNG  文件',
			downloadSVG: '下载 SVG  文件',
			downloadCSV: '下载 CSV  文件',
			downloadXLS: '下载 XLS   文件',
			drillUpText:"返回 {series.name}",
			loading:"加载中"
		},
		navigation: {
			menuItemStyle: {
				padding: '6px 14px'
			}
		},

		credits: {
			text: 'AAA 68 班 不 良 贷 款 管 理 系 统',
			url: 'http://localhost:9088/bankBadLoan/jsp/login.jsp'
		}
	});
	$("#"+id).highcharts(json);


}