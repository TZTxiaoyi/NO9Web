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

  <script type="text/javascript" src="../jq/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="../jq/jquery.cookie1.4.1.js"></script>
  <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css"></link>
  <script type="text/javascript" src="../bootstrap/dist/bootstrap-table.js"></script>
  <link rel="stylesheet" href="../bootstrap/dist/bootstrap-table.css" type="text/css"></link>
  <script type="text/javascript" src="../bootstrap/fileinput/js/fileinput.js"></script>
  <script type="text/javascript" src="../bootstrap/fileinput/css/fileinput.css"></script>
  <script type="text/javascript" src="../bootstrap/fileinput/js/locales/zh.js"></script>
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
  				<b>创建您的项目信息</b>
  				<hr>
  				<form class="form-horizontal" method="post"
                    action="<%=basePath%>DescribeContrller/UpdateDescribe.do">
				<div>
					<div id="Relevantdata">
						
						<div class="form-group">
							
						   <label for="" class="col-sm-2 control-label">设置封面：</label>
						   <div class="col-sm-3">
						    <div id="Cover"></div>
        					<input type="file" class="myFile"  style="position:absolute;left:0;bottom:0;font-size:34px; opacity:0;width:92;height:34">
						   </div>
						   
						   
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">项目标题：</label>
						   <div class="col-sm-8">
						    	<input type="text" id="title" name="title" class="form-control" placeholder="给自己的项目取个响亮的名字吧！注意不要超过40个汉字哦"><br>
						   </div>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">筹款目的：</label>
						   <div class="col-sm-8">
						    	<textarea class="form-control" rows="3" id="goal" name="goal" placeholder="一句话简单介绍下你的项目吧！"></textarea> 
						   </div>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">筹资金额：</label>
						   <div class="col-sm-8">
						   	
						    	<input type="text" id="financing" name="financing" class="form-control" placeholder="输入你需要筹资的金额">
						   </div><span id="formspan">元</span>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">筹资天数：</label>
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
	
	$(function(){
		var projectsid=$.cookie('projectsid');
		
		var input="<input type=\"hidden\" name=\"projectsid\" value=\""+projectsid+"\"/>"; 
		$("#Relevantdata").append(input);
		alert(projectsid);
		var data={};
		data["projectsid"]=projectsid;
		
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/DescribeContrller/AllDescribe.do",
			data:data,
			success:function(data){
				alert(data);
				//var json=JSON.parse(data);
				var cover="<img src=\"http://localhost:9088/P2P/images/"+data[0].COVER+"\" style=\"width:350px;height:250px\">";
				
				$("#title").val(data[0].TITLE);
				$("#goal").val(data[0].GOAL);
				$("#financing").val(data[0].FINANCING);
				$("#financing_day").val(data[0].FINANCING_DAY);
				$("#Cover").append(cover);
				 
			}
		})
		
	})
	//图片上传
	$(".myFile").fileinput({
	    language : 'zh',
	    uploadUrl : "http://localhost:9088/P2P/DescribeContrller/SaveCover.do",//上传地址
	    uploadAsync : true,//异步上传
	    autoReplace : true,//是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
	    showCaption:false,//是否显示简介
	    showUpload:false, //是否显示上传按钮
	    showRemove:false, //显示移除按钮
	    showPreview:false,//是否显示预览区域
	    dropZoneEnabled: false,//是否显示拖拽区域
	    maxFileCount : 1,//上传数量
	    allowedFileExtensions : [ "jpg", "png", "gif","txt" ],
	    uploadExtraData: function(){
	    	var projectsid=$.cookie('projectsid');
	    	return { "projectsid":projectsid}
	    } ,
	    browseClass : "btn btn-primary", //按钮样式 
	    previewFileIcon : ""
	}).on("filebatchselected", function(event, files) {
			
			$(this).fileinput("upload");
			
    	}).on("fileuploaded", function (event, data) {  
        	$.each(data,function(index,value){
        		if(value.flag==0){
        			$("#Cover").html("");
        			alert("上传成功");
        			url="<img src=\"http://localhost:9088/P2P/images/"+value.url+"\" style=\"width:350px;height:250px\">";
        			$("#Cover").append(url);
        		}
        	})
        	
     });
</script>