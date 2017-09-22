<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页左侧导航</title>
<link rel="stylesheet" type="text/css" href="../css/public.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/public.js"></script>
</head>

<body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			<a href="../main.jsp" target="main"><div class="line">
					<img src="../img/coin01.png" />&nbsp;&nbsp;首页
				</div></a>
			<!-- <dl class="system_log">
			<dt><img class="icon1" src="../img/coin01.png" /><img class="icon2"src="../img/coin02.png" />
				首页<img class="icon3" src="../img/coin19.png" /><img class="icon4" src="../img/coin20.png" /></dt>
		</dl> -->
			<dl class="system_log">
			<!-- 	<dt>
					<img class="icon1" src="../img/coin03.png" /><img class="icon2"
						src="../img/coin04.png" /> 系统管理<img class="icon3"
						src="../img/coin19.png" /><img class="icon4"
						src="../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../img/coin111.png" /><img class="coin22"
						src="../img/coin222.png" /><a class="cks" href="../user.jsp"
						target="main">管理员管理</a><img class="icon5" src="../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../img/coin111.png" /><img class="coin22"
						src="../img/coin222.png" /><a class="cks" href="../user.jsp"
						target="main">管理员管理</a><img class="icon5" src="../img/coin21.png" />
				</dd> -->
			</dl>
			<dl class="system_log">
				<shiro:hasPermission name="employeeEdit">
					<dt>
						<img class="icon1" src="../img/coin05.png" /><img class="icon2"
							src="../img/coin06.png" /> 人员管理<img class="icon3"
							src="../img/coin19.png" /><img class="icon4"
							src="../img/coin20.png" />
					</dt>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="employee">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a class="cks" href="../banner.jsp"
							target="main">用户管理</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="accounts">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a class="cks" href="../opinion.jsp"
							target="main">账号管理</a><img class="icon5" src="../img/coin21.png" />
					</dd>				
				</shiro:hasPermission>
				
				<shiro:hasPermission name="roleEdit">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a class="cks" href="../roletable.jsp"
							target="main">角色管理</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>	
					
				<shiro:hasPermission name="powerEdit">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a class="cks" href="../editPower.html"
							target="main">角色权限管理</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
			</dl>
			<dl class="system_log">
				<shiro:hasPermission name="project">
					<dt>
						<img class="icon1" src="../img/coin07.png" /><img class="icon2"
							src="../img/coin08.png" />项目管理<img class="icon3"
							src="../img/coin19.png" /><img class="icon4"
							src="../img/coin20.png" />
					</dt>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="onlineproject">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../project.jsp" target="main"
							class="cks">在线项目</a><img class="icon5" src="../img/coin21.png" />
					</dd>	
				</shiro:hasPermission>
				
				<shiro:hasPermission name="sinproject">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../sinproject.jsp" target="main"
							class="cks">个人（未审核）</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="oraproject">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../oraproject.jsp" target="main"
							class="cks">机构（未审核）</a><img class="icon5" src="../img/coin21.png"/>
					</dd>	
				</shiro:hasPermission>
				
				<shiro:hasPermission name="passproject">		
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../PassProject.jsp" target="main"
							class="cks">审核通过</a><img class="icon5" src="../img/coin21.png"/>
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="unpassproject">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../UnpassPro.jsp" target="main"
							class="cks">审核未通过</a><img class="icon5" src="../img/coin21.png"/>
					</dd>
				</shiro:hasPermission>		
					
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../audit.jsp" target="main"
							class="cks">审核记录查询</a><img class="icon5" src="../img/coin21.png"/>
					</dd>					
			</dl>			
			<dl class="system_log">
			
				<shiro:hasPermission name="capital">
					<dt>
						<img class="icon1" src="../img/coin11.png" /><img class="icon2"
							src="../img/coin12.png" />统计查询<img class="icon3"
							src="../img/coin19.png" /><img class="icon4"
							src="../img/coin20.png" />
					</dt>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="projectCaptail">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../projectcount.jsp" target="main"
							class="cks">项目统计</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>	
				
				<!--<shiro:hasPermission name="moneyCapital">	
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../capitalcount.jsp" target="main"
							class="cks">资金统计</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>-->		
				
				<shiro:hasPermission name="profitCapital">	
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../profitcount.jsp" target="main"
							class="cks">资金统计</a><img class="icon5" src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>		
					
			</dl>
			
			<dl class="system_log">
			
				<shiro:hasPermission name="capitalmanage">
					<dt>
						<img class="icon1" src="../img/coin17.png" /><img class="icon2"
							src="../img/coin18.png" />资金管理<img class="icon3"
							src="../img/coin19.png" /><img class="icon4"
							src="../img/coin20.png" />
					</dt>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="financingmanage">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../balance.jsp"
							target="main" class="cks">项目筹资管理</a><img class="icon5"
							src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="capitalflowmanage">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../capitaltype.jsp"
							target="main" class="cks">资金流向类型管理</a><img class="icon5"
							src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="platformmanage">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../capital.jsp"
							target="main" class="cks">平台资金管理</a><img class="icon5"
							src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="capitalgrant">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../TwoLoan.jsp"
							target="main" class="cks">项目资金发放</a><img class="icon5"
							src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="ProfitFund">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../profit.jsp"
							target="main" class="cks">盈利资金</a><img class="icon5"
							src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>
			</dl>
			
			<dl class="system_log">
			
				<shiro:hasPermission name="userdeal">
					<dt>
						<img class="icon1" src="../img/coin17.png" /><img class="icon2"
							src="../img/coin18.png" />用户交易<img class="icon3"
							src="../img/coin19.png" /><img class="icon4"
							src="../img/coin20.png" />
					</dt>
				</shiro:hasPermission>
				
				<shiro:hasPermission name="dealrecord">
					<dd>
						<img class="coin11" src="../img/coin111.png" /><img class="coin22"
							src="../img/coin222.png" /><a href="../UsersDeal.jsp"
							target="main" class="cks">交易记录</a><img class="icon5"
							src="../img/coin21.png" />
					</dd>
				</shiro:hasPermission>			
			</dl>
			
		</div>

	</div>
</body>
</html>
 