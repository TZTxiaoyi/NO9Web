<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行家添加-有点</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="../../bootstrap/jquery/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="../../bootstrap/dist/bootstrap-table.js"></script>
<link rel="stylesheet" href="../../bootstrap/dist/bootstrap-table.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery.cookie1.4.1.js"></script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;行家添加
			</div>
		</div>
		<div class="page ">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>审核选项</span>
				</div>
				<div class="baBody">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active">
							<a href="#home" data-toggle="tab">
								个人信息审核
							</a>
						</li>
					<li><a href="#ios" data-toggle="tab">项目信息审核</a></li>
					<li><a href="#describe_pro" data-toggle="tab">项目描述审核</a></li>					
					<li><a href="#pro_return" data-toggle="tab">项目回报审核</a></li>
					</ul>
					项目序号：<span id="projectsid"></span>
					开始审批：<span id="begin_auditing"></span>
					上次审批结束：<span id="last_auditing"></span>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<table class="table table-hover">
								<tr>
									<td>审核选项</td>
									<td >审核信息</td>
									<td>
										是否通过
									</td>
								</tr>
								<tr>
									<td>机构名称</td>
									<td id="info_one"></td>
									<td>
										<label><input type="radio" name="idcard" value="VALUE1"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="idcard" value="VALUE2"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>机构代码</td>
									<td id="info_two"></td>
									<td>
										<label><input type="radio" name="username" value="VALUE3"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="username" value="VALUE4"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>法定代表人</td>
									<td id="info_three"></td>
									<td>
										<label><input type="radio" name="adress" value="VALUE5"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="adress" value="VALUE6"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>机构注册地址</td>
									<td id="info_four"></td>
									<td>
										<label><input type="radio" name="phone" value="VALUE7"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="phone" value="VALUE8"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>联系人姓名</td>
									<td id="info_five"></td>
									<td>
										<label><input type="radio" name="idcard2" value="VALUE9"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="idcard2" value="VALUE10"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>联系人手机号</td>
									<td id="info_six"></td>
									<td>
										<label><input type="radio" name="telephone" value="VALUE11"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="telephone" value="VALUE12"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>机构简称</td>
									<td id="info_seven"></td>
									<td>
										<label><input type="radio" name="abbreviation" value="VALUE13"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="abbreviation" value="VALUE14"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>机构经营地址</td>
									<td id="info_eight"></td>
									<td>
										<label><input type="radio" name="busadress" value="VALUE15"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="busadress" value="VALUE16"/>&nbsp;否</label>
									</td>
								</tr>
							</table>							
						</div>
						<div class="tab-pane fade" id="ios">
							<table class="table table-hover">
								<tr>
									<td>审核选项</td>
									<td >审核信息</td>
									<td>
										是否通过
									</td>
								</tr>
								<tr>
									<td>项目标题</td>
									<td id="detail_one"></td>
									<td>
										<label><input type="radio" name="title" value="right1"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="title" value="right2"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>筹金目的</td>
									<td id="detail_two"></td>
									<td>
										<label><input type="radio" name="goal" value="right3"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="goal" value="right4"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>项目地点</td>
									<td id="detail_three"></td>
									<td>
										<label><input type="radio" name="location" value="right5"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="location" value="right6"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>筹金金额（元）</td>
									<td id="detail_four"></td>
									<td>
										<label><input type="radio" name="money" value="right7"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="money" value="right8"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>筹金天数</td>
									<td id="detail_five"></td>
									<td>
										<label><input type="radio" name="days" value="right9"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="days" value="right10"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>项目封面</td>
									<td id="detail_six"></td>
									<td>
										<label><input type="radio" name="cover" value="right11"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="cover" value="right12"/>&nbsp;否</label>
									</td>
								</tr>								
							</table>
						</div>
						<div class="tab-pane fade" id="describe_pro">
							<table class="table table-hover">
								<tr>
									<td>审核选项</td>
									<td >审核信息</td>
									<td>
										是否通过
									</td>
								</tr>
								<tr>
									<td>项目详细地址</td>
									<td id="describe_one"></td>
									<td>
										<label><input type="radio" name="places" />&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="places" />&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>标题</td>
									<td id="describe_two"></td>
									<td>
										<label><input type="radio" name="titles" />&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="titles" />&nbsp;否</label>
									</td>
								</tr>	
								<tr>
									<td>文本</td>
									<td id="describe_three"></td>
									<td>
										<label><input type="radio" name="content" />&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="content" />&nbsp;否</label>
									</td>
								</tr>														
							</table>
						</div>
						<div class="tab-pane fade" id="pro_return">
							<table class="table table-hover">
								<tr>
									<td>审核选项</td>
									<td >审核信息</td>
									<td>
										是否通过
									</td>
								</tr>
								<tr>
									<td>回报类型</td>
									<td id="return_one"></td>
									<td>
										<label><input type="radio" name="reType" value="left1"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reType" value="left2"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>回报金额（元）</td>
									<td id="return_two"></td>
									<td>
										<label><input type="radio" name="reMoney" value="left3"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reMoney" value="left4"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>回报标题</td>
									<td id="return_three"></td>
									<td>
										<label><input type="radio" name="reTitle" value="left5"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reTitle" value="left6"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>回报内容</td>
									<td id="return_four"></td>
									<td>
										<label><input type="radio" name="reContent" value="left7"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reContent" value="left8"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>限制人数</td>
									<td id="return_five"></td>
									<td>
										<label><input type="radio" name="reLimit" value="left9"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reLimit" value="left10"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>回报时间</td>
									<td id="return_six"></td>
									<td>
										<label><input type="radio" name="reTime" value="left11"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reTime" value="left12"/>&nbsp;否</label>
									</td>
								</tr>
								<tr>
									<td>实物图</td>
									<td id="return_seven"></td>
									<td>
										<label><input type="radio" name="reImage" value="left13"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="reImage" value="left14"/>&nbsp;否</label>
									</td>
								</tr>										
							</table>
						</div>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态：<label><input
							type="radio" checked="checked" name="styleshoice1" />&nbsp;未审核</label> <label><input
							type="radio" name="styleshoice1" />&nbsp;已通过</label> <label class="lar"><input
							type="radio" name="styleshoice1" />&nbsp;不通过</label>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否推荐：<label><input
							type="radio" checked="checked" name="styleshoice2" />&nbsp;是</label><label><input
							type="radio" name="styleshoice2" />&nbsp;否</label>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<button class="btn_ok btn_yes" href="#">提交</button>
							<a class="btn_ok btn_no" href="#">取消</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 上传广告页面样式end -->
		</div>
	</div>
	<script type="text/javascript">
		var auditing = parseInt($.cookie("orga_auditing"));
		// 机构信息项目审核  
		$(function(){
			$("#begin_auditing").append((new Date()).toLocaleString());
			$("#projectsid").append(auditing);
			 
			//alert(auditing);
			var data1={};
			data1["projectsid"]=auditing;
			$.ajax({
				url: '/P2P/project/OraAuditing.do',
				type:"post",
				dataType:"json",
				data:JSON.stringify(data1),
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					$.each(data,function(index,value){
						$("#info_one").append(value.ONAME);
						$("#info_two").append(value.OCODE);
						$("#info_three").append(value.CORPORATION);
						$("#info_four").append(value.REGISTER_ADDRESS);
						$("#info_five").append(value.LINKMAN);
						$("#info_six").append(value.LINKPHONE);
						$("#info_seven").append(value.ABBREVIATION);
						$("#info_eight").append(value.BUSINESS_ADDRESS);
					})
				}
			});			
		});
		//机构项目信息审核
		$(function(){
			
					
			var dd={};
			dd["projectsid"]=auditing;
			//alert(dd);
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/indetail.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					$.each(data,function(index,value){						
						$("#detail_one").append(value.TITLE);
						$("#detail_two").append(value.GOAL);
						$("#detail_three").append(value.PROJECTS_PLACE);
						$("#detail_four").append(value.FINANCING);
						$("#detail_five").append(value.FINANCING_DAY);
						
						//$("#detail_six").append(value.FINANCING_DAY);
					})
				}
			})
		});
		//机构项目描述审核
		$(function(){			
			
			//alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;
			
			
			$.ajax({
				type:"post",
				url:"/P2P/project/describe.do",
				dataType:"json",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					$.each(data,function(index,value){					
						$("#describe_one").append(value.places);
						$("#describe_two").append(value.title);
						$("#describe_three").append(value.body);
					})
				}
			})
		});
		//机构项目回报审核
		$(function(){			
			//alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/repay.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					$.each(data,function(index,value){
						$("#return_one").append(value.VALUE);
						$("#return_two").append(value.OFFER_MONEY);
						$("#return_three").append(value.RETURN_TITLE);
						$("#return_four").append(value.RETURN_CONTENT);
						$("#return_five").append(value.LIMIT_PEOPLE);
						$("#return_six").append(value.RETURN_TIME);
						//$("return_seven").append(value.);
					});
				}
			});
		});
		//机构信息审核记录
		$(function(){			
			alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/orAuditingRecord.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					alert(data[0].VALUE1);
					if(data[0].VALUE1=="yes"){
						$("input:radio[value='VALUE1']").attr('checked','true');
					}else if(data[0].VALUE1=="no"){
						$("input:radio[value='VALUE2']").attr('checked','true');
					}
					
					if(data[0].VALUE2=="yes"){
						$("input:radio[value='VALUE3']").attr('checked','true');
					}else if(data[0].VALUE2=="no"){
						$("input:radio[value='VALUE4']").attr('checked','true');
					}
					
					if(data[0].VALUE3=="yes"){
						$("input:radio[value='VALUE5']").attr('checked','true');
					}else if(data[0].VALUE3=="no"){
						$("input:radio[value='VALUE6']").attr('checked','true');
					}
					
					if(data[0].VALUE4=="yes"){
						$("input:radio[value='VALUE7']").attr('checked','true');
					}else if(data[0].VALUE4=="no"){
						$("input:radio[value='VALUE8']").attr('checked','true');
					}
					
					if(data[0].VALUE5=="yes"){
						$("input:radio[value='VALUE9']").attr('checked','true');
					}else if(data[0].VALUE5=="no"){
						$("input:radio[value='VALUE10']").attr('checked','true');
					}
					
					if(data[0].VALUE6=="yes"){
						$("input:radio[value='VALUE11']").attr('checked','true');
					}else if(data[0].VALUE6=="no"){
						$("input:radio[value='VALUE12']").attr('checked','true');
					}
					
					if(data[0].VALUE7=="yes"){
						$("input:radio[value='VALUE13']").attr('checked','true');
					}else if(data[0].VALUE7=="no"){
						$("input:radio[value='VALUE14']").attr('checked','true');
					}
					
					if(data[0].VALUE8=="yes"){
						$("input:radio[value='VALUE15']").attr('checked','true');
					}else if(data[0].VALUE8=="no"){
						$("input:radio[value='VALUE16']").attr('checked','true');
					}
				}
			});
		});
		//机构项目审核记录
		$(function(){			
			alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/proDetail.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					alert(data[0].VALUE1);
					if(data[0].VALUE1=="yes"){
						$("input:radio[value='right1']").attr('checked','true');
					}else if(data[0].VALUE1=="no"){
						$("input:radio[value='right2']").attr('checked','true');
					}
					
					if(data[0].VALUE2=="yes"){
						$("input:radio[value='right3']").attr('checked','true');
					}else if(data[0].VALUE2=="no"){
						$("input:radio[value='right4']").attr('checked','true');
					}
					
					if(data[0].VALUE3=="yes"){
						$("input:radio[value='right5']").attr('checked','true');
					}else if(data[0].VALUE3=="no"){
						$("input:radio[value='right6']").attr('checked','true');
					}
					
					if(data[0].VALUE4=="yes"){
						$("input:radio[value='right7']").attr('checked','true');
					}else if(data[0].VALUE4=="no"){
						$("input:radio[value='right8']").attr('checked','true');
					}
					
					if(data[0].VALUE5=="yes"){
						$("input:radio[value='right9']").attr('checked','true');
					}else if(data[0].VALUE5=="no"){
						$("input:radio[value='right10']").attr('checked','true');
					}
					
					if(data[0].VALUE6=="yes"){
						$("input:radio[value='right11']").attr('checked','true');
					}else if(data[0].VALUE6=="no"){
						$("input:radio[value='right12']").attr('checked','true');
					}
				}
			});
		});
		//项目回报审核记录
		$(function(){			
			alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/repayAuditingRecord.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					alert(data[0].VALUE1);
					if(data[0].VALUE1=="yes"){
						$("input:radio[value='left1']").attr('checked','true');
					}else if(data[0].VALUE1=="no"){
						$("input:radio[value='left2']").attr('checked','true');
					}
					
					if(data[0].VALUE2=="yes"){
						$("input:radio[value='left3']").attr('checked','true');
					}else if(data[0].VALUE2=="no"){
						$("input:radio[value='left4']").attr('checked','true');
					}
					
					if(data[0].VALUE3=="yes"){
						$("input:radio[value='left5']").attr('checked','true');
					}else if(data[0].VALUE3=="no"){
						$("input:radio[value='left6']").attr('checked','true');
					}
					
					if(data[0].VALUE4=="yes"){
						$("input:radio[value='left7']").attr('checked','true');
					}else if(data[0].VALUE4=="no"){
						$("input:radio[value='left8']").attr('checked','true');
					}
					
					if(data[0].VALUE5=="yes"){
						$("input:radio[value='left9']").attr('checked','true');
					}else if(data[0].VALUE5=="no"){
						$("input:radio[value='left10']").attr('checked','true');
					}
					
					if(data[0].VALUE6=="yes"){
						$("input:radio[value='left11']").attr('checked','true');
					}else if(data[0].VALUE6=="no"){
						$("input:radio[value='left12']").attr('checked','true');
					}
					
					if(data[0].VALUE7=="yes"){
						$("input:radio[value='left13']").attr('checked','true');
					}else if(data[0].VALUE7=="no"){
						$("input:radio[value='left14']").attr('checked','true');
					}
				}
			});
		});
	</script>
</body>
</html>