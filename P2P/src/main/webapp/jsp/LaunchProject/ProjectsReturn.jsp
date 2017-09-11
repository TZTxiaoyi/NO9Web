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
  <script type="text/javascript" src="../../bootstrap/fileinput/js/fileinput.js"></script>
  <script type="text/javascript" src="../../bootstrap/fileinput/css/fileinput.css"></script>
  <script type="text/javascript" src="../../bootstrap/fileinput/js/locales/zh.js"></script>
  <style>
  	body
  {
  background-color:#F0F0F0;
  
  }
  #colpadding{
  	margin:100px auto;
  	padding:100px;
  	background-color:#FFFFFF;
  	width:900px;
  }
  #inputpadding{
  	margin:0 auto;
  	width:80%;
  	
  }
  #filediv{
  	width:300px;
  }
  #formspan{
  	height:34px;
  	line-height:34px; 
  }
  
  textarea{ resize:none;}
  </style>
  </head>
  <body>
  	
  			<div  id="colpadding">
  				<b>设置你的回报信息</b>
  				<hr>
  				
  				<form class="form-horizontal">
				<div>
					<div id="Relevantdata">
						
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">支持金额：</label>
						   <div class="col-sm-8">
						    	<input type="text" id="title" name="title" class="form-control" placeholder="给自己的项目取个响亮的名字吧！注意不要超过40个汉字哦"><br>
						   </div>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">回报标题：</label>
						   <div class="col-sm-8">
						    	<textarea class="form-control" rows="3" id="goal" name="goal" placeholder="一句话简单介绍下你的项目吧！"></textarea> 
						   </div>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">回报内容：</label>
						   <div class="col-sm-8">
						   	
						    	<input type="text" id="financing" name="financing" class="form-control" placeholder="输入你需要筹资的金额">
						   </div><span id="formspan">元</span>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">人数上限：</label>
						   <div class="col-sm-8 ">
						   
						    	<input type="text" id="financing_day" name="financing_day" class="form-control" placeholder="输入你要筹资时间周期">
						   		
						   </div><span id="formspan">天</span>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">回报时间：</label>
						   <div class="col-sm-8 ">
						   
						    	<input type="text" id="financing_day" name="financing_day" class="form-control" placeholder="输入你要筹资时间周期">
						   		
						   </div><span id="formspan">天</span>
  						</div>
  					</div>
					
				</div>
				<input  class="btn btn-info" type="submit" value="下一步" style="position:relative;top:150;left:45%;width:100px">
			</form>
			</div>
			
	</body>
</html>
<script>
</script>
