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
					<li><a href="#pro_title" data-toggle="tab">项目描述审核</a></li>					
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
									<td>身份证号</td>
									<td id="info_one"></td>
									<td>
										<label><input type="radio" name="idcard" value="VALUE1"  flag="40" id="aaaa"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="idcard" value="VALUE2"  flag="41"/>&nbsp;否</label>							
									</td>
								</tr>
								<tr>
									<td>发起人姓名</td>
									<td id="info_two"></td>
									<td>
										<label><input type="radio" name="originatorname" value="VALUE3"  flag="40" />&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="originatorname" value="VALUE4"  flag="41" />&nbsp;否</label>						
									</td>
								</tr>
								<tr>
									<td>地址</td>
									<td id="info_three"></td>
									<td>
										<label><input type="radio" name="adress" value="VALUE5"  flag="40"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="adress" value="VALUE6" flag="41" />&nbsp;否</label>
										
									</td>
								</tr>
								<tr>
									<td>电话</td>
									<td id="info_four"></td>
									<td>
										<label><input type="radio" name="telephone" value="VALUE7"  flag="40"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="telephone" value="VALUE8"  flag="41" />&nbsp;否</label>
										
										
									</td>
								</tr>
								<tr>
									<td>身份证正面</td>
									<td id="info_five"></td>
									<td>
										<label><input type="radio" name="cardimage1" value="VALUE9"  flag="40"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="cardimage1" value="VALUE10"  flag="41"/>&nbsp;否</label>										
									</td>
								</tr>
								<tr>
									<td>身份证反面</td>
									<td id="info_six"></td>
									<td>
										<label><input type="radio" name="cardimage2" value="VALUE11"  flag="40"/>&nbsp;是</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label><input type="radio" name="cardimage2" value="VALUE12"  flag="41"/>&nbsp;否</label>
									</td>
								</tr>
							</table>
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态：<label><input
									type="radio" checked="checked" name="styleshoice1" />&nbsp;未审核</label> <label><input
									type="radio" name="styleshoice1" />&nbsp;已通过</label> <label class="lar"><input
									type="radio" name="styleshoice1" />&nbsp;不通过</label>
							</div>
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否推荐：<label><input
									type="radio" checked="checked" name="styleshoice2" />&nbsp;是</label><label><input
									type="radio" name="styleshoice2" />&nbsp;否</label><br>
									<a type="button" class="btn btn-info" id="save_sinpro">保存</a>
							</div>							
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
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态：<label><input
									type="radio" checked="checked" name="styleshoice1" />&nbsp;未审核</label> <label><input
									type="radio" name="styleshoice1" />&nbsp;已通过</label> <label class="lar"><input
									type="radio" name="styleshoice1" />&nbsp;不通过</label>
							</div>
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否推荐：<label><input
									type="radio" checked="checked" name="styleshoice2" />&nbsp;是</label><label><input
									type="radio" name="styleshoice2" />&nbsp;否</label><br>
									<button type="button" class="btn btn-info" id="save_two">保存</button>
							</div>
						</div>						
						<div class="tab-pane fade" id="pro_title">
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
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态：<label><input
									type="radio" checked="checked" name="styleshoice1" />&nbsp;未审核</label> <label><input
									type="radio" name="styleshoice1" />&nbsp;已通过</label> <label class="lar"><input
									type="radio" name="styleshoice1" />&nbsp;不通过</label>
							</div>
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否推荐：<label><input
									type="radio" checked="checked" name="styleshoice2" />&nbsp;是</label><label><input
									type="radio" name="styleshoice2" />&nbsp;否</label><br>
									<button type="button" class="btn btn-info">保存</button>
							</div>
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
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态：<label><input
									type="radio" checked="checked" name="styleshoice1" />&nbsp;未审核</label> <label><input
									type="radio" name="styleshoice1" />&nbsp;已通过</label> <label class="lar"><input
									type="radio" name="styleshoice1" />&nbsp;不通过</label>
							</div>
							<div class="bbD">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否推荐：<label><input
									type="radio" checked="checked" name="styleshoice2" />&nbsp;是</label><label><input
									type="radio" name="styleshoice2" />&nbsp;否</label><br>
									<button type="button" class="btn btn-info" id="save_four">保存</button>
							</div>
						</div>
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
		var auditing=$.cookie("project_auditing");
		$(function(){
			$("#begin_auditing").append((new Date()).toLocaleString());
			$("#projectsid").append(auditing);
			 
			//alert(auditing);
			var data1={};
			data1["projectsid"]=auditing;
			$.ajax({
				url: '/P2P/project/sinAuditing.do',
				type:"post",
				dataType:"json",
				data:JSON.stringify(data1),
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					$.each(data,function(index,value){
						var img1="<img src='"+value.CARDIMAGE1+"'>";
						var img2="<img src='"+value.CARDIMAGE2+"'>";
						$("#info_one").append(value.IDCARD);
						$("#info_two").append(value.ORIGINATORNAME);
						$("#info_three").append(value.ADDRESS);
						$("#info_four").append(value.TELEPHONE);
						$("#info_five").append(img1);
						$("#info_six").append(img2);
					})
				}
			});			
		})
		$(function(){
			var auditing=parseInt($.cookie("project_auditing"));
					
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
		$(function(){			
			var auditing=parseInt($.cookie("project_auditing"));
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
		$(function(){
			var auditing=parseInt($.cookie("project_auditing"));
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
		$(function(){
			var auditing=parseInt($.cookie("project_auditing"));
			//alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/singleAu.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					//alert(data[0].VALUE1);
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
				}
			});
		});
		$(function(){
			var auditing=parseInt($.cookie("project_auditing"));
			//alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/proDetail.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					//alert(data[0].VALUE1);
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
			//alert("ssdd:"+auditing);
			var dd={};
			dd["projectsid"]=auditing;			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/repayAuditingRecord.do",
				data:JSON.stringify(dd),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					//alert(data[0].VALUE1);
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
		//修改项目状态
	$(function(){
		var dd={};
		dd["projectsid"]=auditing;			
		$.ajax({
			type:"post",
			dataType:"json",
			url:"/P2P/project/upSinProState.do",
			data:JSON.stringify(dd),
			contentType:"application/json;charset=UTF-8",
			success:function(data){					
				alert(data);
			}
		});
	});
		//个人信息审核记录，先删除原有数据记录，再进行插入记录
		$("#save_sinpro").click(function(){
			//alert(8888);
			var data={};
			/* if($("input:radio[value='VALUE1']").is(':checked')){
				alert("aaaa");
			} */
			
			data["projectsid"]=auditing;
			if($("input:radio[value='VALUE1']").is(':checked')){
				data["idcard"]=40;
			}else if($("input:radio[value='VALUE2']").is(':checked')){
				data["idcard"]=41;
			}else{
				data["idcard"]=42;
			}
			//alert("sss:"+data.idcard);
			if($("input:radio[value='VALUE3']").is(':checked')){
				data["originatorname"]=40;
			}else if($("input:radio[value='VALUE4']").is(':checked')){
				data["originatorname"]=41;
			}else{
				data["originatorname"]=42;
			}
			
			if($("input:radio[value='VALUE5']").is(':checked')){
				data["address"]=40;
			}else if($("input:radio[value='VALUE6']").is(':checked')){
				data["address"]=41;
			}else{
				data["address"]=42;
			}

			if($("input:radio[value='VALUE7']").is(':checked')){
				data["telephone"]=40;
			}else if($("input:radio[value='VALUE8']").is(':checked')){
				data["telephone"]=41;
			}else{
				data["telephone"]=42;
			}

			if($("input:radio[value='VALUE9']").is(':checked')){
				data["cardimage1"]=40;
			}else if($("input:radio[value='VALUE10']").is(':checked')){
				data["cardimage1"]=41;
			}else{
				data["cardimage1"]=42;
			}

			if($("input:radio[value='VALUE11']").is(':checked')){
				data["cardimage2"]=40;
			}else if($("input:radio[value='VALUE12']").is(':checked')){
				data["cardimage2"]=41;
			}else{
				data["cardimage2"]=42;
			}
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/inseSinAudi.do",
				data:JSON.stringify(data),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					alert(data);
				}
			});
		});
		//项目信息审核记录，先删除原有记录，再进行插入数据记录
		$("#save_two").click(function(){
			var data={};
			/* if($("input:radio[value='VALUE1']").is(':checked')){
				alert("aaaa");
			} */
			
			data["projectsid"]=auditing;
			if($("input:radio[value='right1']").is(':checked')){
				data["title"]=40;
			}else if($("input:radio[value='right2']").is(':checked')){
				data["title"]=41;
			}else{
				data["title"]=42;
			}
			//alert("sss:"+data.idcard);
			if($("input:radio[value='right3']").is(':checked')){
				data["goal"]=40;
			}else if($("input:radio[value='right4']").is(':checked')){
				data["goal"]=41;
			}else{
				data["goal"]=42;
			}
			
			if($("input:radio[value='right5']").is(':checked')){
				data["projects_place"]=40;
			}else if($("input:radio[value='right6']").is(':checked')){
				data["projects_place"]=41;
			}else{
				data["projects_place"]=42;
			}

			if($("input:radio[value='right7']").is(':checked')){
				data["financing"]=40;
			}else if($("input:radio[value='right8']").is(':checked')){
				data["financing"]=41;
			}else{
				data["financing"]=42;
			}

			if($("input:radio[value='right9']").is(':checked')){
				data["financing_day"]=40;
			}else if($("input:radio[value='right10']").is(':checked')){
				data["financing_day"]=41;
			}else{
				data["financing_day"]=42;
			}

			if($("input:radio[value='right11']").is(':checked')){
				data["cover"]=40;
			}else if($("input:radio[value='right12']").is(':checked')){
				data["cover"]=41;
			}else{
				data["cover"]=42;
			}
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/inProAuRecord.do",
				data:JSON.stringify(data),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					alert(data);
				}
			});
		});
		//回报审核记录，先删除原有数据，再进行插入
		$("#save_four").click(function(){
			var data={};
			/* if($("input:radio[value='VALUE1']").is(':checked')){
				alert("aaaa");
			} */
			
			data["projectsid"]=auditing;
			if($("input:radio[value='left1']").is(':checked')){
				data["return_type"]=40;
			}else if($("input:radio[value='left2']").is(':checked')){
				data["return_type"]=41;
			}else{
				data["return_type"]=42;
			}
			//alert("sss:"+data.idcard);
			if($("input:radio[value='left3']").is(':checked')){
				data["offer_money"]=40;
			}else if($("input:radio[value='left4']").is(':checked')){
				data["offer_money"]=41;
			}else{
				data["offer_money"]=42;
			}
			
			if($("input:radio[value='left5']").is(':checked')){
				data["return_title"]=40;
			}else if($("input:radio[value='left6']").is(':checked')){
				data["return_title"]=41;
			}else{
				data["return_title"]=42;
			}

			if($("input:radio[value='left7']").is(':checked')){
				data["return_content"]=40;
			}else if($("input:radio[value='left8']").is(':checked')){
				data["return_content"]=41;
			}else{
				data["return_content"]=42;
			}

			if($("input:radio[value='left9']").is(':checked')){
				data["limit_people"]=40;
			}else if($("input:radio[value='left10']").is(':checked')){
				data["limit_people"]=41;
			}else{
				data["limit_people"]=42;
			}

			if($("input:radio[value='left11']").is(':checked')){
				data["return_time"]=40;
			}else if($("input:radio[value='left12']").is(':checked')){
				data["return_time"]=41;
			}else{
				data["return_time"]=42;
			}
			
			if($("input:radio[value='left13']").is(':checked')){
				data["image"]=40;
			}else if($("input:radio[value='left14']").is(':checked')){
				data["image"]=41;
			}else{
				data["image"]=42;
			}
			$.ajax({
				type:"post",
				dataType:"json",
				url:"/P2P/project/inProReturn.do",
				data:JSON.stringify(data),
				contentType:"application/json;charset=UTF-8",
				success:function(data){					
					alert(data);
				}
			});
		});
	</script>
</body>
</html>