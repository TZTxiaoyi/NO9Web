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
	-->]
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
  /* 	body
  {
  background-color:#F0F0F0;
  
  } */
  #colpadding{
  	background-color:#FFFFFF;
  	width:800px;
  }  
 /*  #inputpadding{
  	margin:0 auto;
  	width:80%;
  	
  } */
 /*  #filediv{
  	width:300px;
  } */
  #formspan{
  	position:relative;
  	top:-26;
  	left:100%;
  	
  }
  .form-group{
  	width:500px;
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
						   <div class="col-sm-6">
						    	<input type="text" id="title" maxlength="10" name="title" class="form-control" placeholder="给自己的项目取个响亮的名字吧！注意不要超过10个汉字" ><br>
						   </div>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">筹款目的：</label>
						   <div class="col-sm-6">
						    	<textarea class="form-control" maxlength="75" rows="3" id="goal" name="goal" placeholder="一句话简单介绍下你的项目吧！注意不要超过75个汉字"></textarea> 
						   </div>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">筹资金额：</label>
						   <div class="col-sm-3">
						   	
						    	<input type="text" id="financing" name="financing" class="form-control" placeholder="输入你需要筹资的金额，最低5000元最高不超过1亿元" >
						   </div><span id="formspan">元</span>
  						</div>
  						<div class="form-group">
  							<label for="" class="col-sm-2 control-label">筹资天数：</label>
						   <div class="col-sm-6 ">
						   
						    	<input type="text" id="financing_day"  name="financing_day" class="form-control" placeholder="输入你要筹资时间周期，10~50天" >
						   	
						   </div><span id="formspan">天</span>	
  						</div>
  					</div>
					
				</div>
				<input id="wewr"  class="btn btn-info"  value="保存" style="position:relative;top:20;width:100px">
			</form>
			</div>
			
	</body>
</html>
<script>
	$("#financing_day").blur(function(){
		
		
	})
	$("#wewr").click(function(){
			var projectsid=$.cookie('projectsid');
			var title=$("#title").val();
			
			var goal=$("#goal").val();
			
			var financing=$("#financing").val();
		
			var financing_day=$("#financing_day").val();
			
			var data ={};
			data["projectsid"]=parseInt(projectsid);
			data["title"]=title;
			data["goal"]=goal;
			data["financing"]=parseInt(financing);
			data["financing_day"]=parseInt(financing_day);
			$.ajax({
				type:"post",
				url:"http://localhost:9088/P2P/DescribeContrller/UpdateDescribe.do",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				success:function(data){
					if(data="success"){
						window.location.href = 'http://localhost:9088/P2P/jsp/LaunchProject/ProjectsIndetail.jsp';
						
					}else {
						alert("保存失败");
					}
					
				}
			})
	})
	$(function(){
		var projectsid=$.cookie('projectsid');
		
		var input="<input type=\"hidden\" name=\"projectsid\" value=\""+projectsid+"\"/>"; 
		$("#Relevantdata").append(input);
		
		var data={};
		data["projectsid"]=projectsid;
		
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/DescribeContrller/AllDescribe.do",
			data:data,
			success:function(data){
				
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
        			url="<img src=\"http://localhost:9088/P2P/images/"+value.url+"\" class=\"img-responsive\" style=\"width:350px;height:250px\">";
        			$("#Cover").append(url);
        		}
        	})
        	
     });
	
</script>