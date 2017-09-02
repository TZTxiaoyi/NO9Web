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
 
  </style>
  </head>
  
  <body>
  	
  			<div  id="colpadding">
				<div>
					
					<h3>个人众筹资料</h3><br>
					<div id="inputpadding">
						<input type="text" class="form-control" placeholder="输入中文姓名"><br>
						<input type="text" class="form-control" placeholder="二代身份证，输入数字或字母"><br>
						<input type="text" class="form-control" placeholder="手机号，输入纯数字"><br>
					</div>
					<h3>你要创建的项目类型</h3><br>
					<div id="projecttype">
						
					</div>
					<h3>上传相关资料</h3><br>
					<div id="Relevantdata">
						<div class="form-group">
						   <label for="" class="col-sm-2 control-label">身份证正面</label>
						   <div class="col-sm-10">
        					<input type="file" class="myFile"  style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
						   </div>
  						</div>
  						<div class="form-group">
						   <label for="" class="col-sm-2 control-label">身份证反面</label>
						   <div class="col-sm-10">
        					<input type="file" class="myFile"  style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
						   </div>
  						</div>
  					</div>
					
					<h3>选择平台渠道费</h3><br>
					<div id="Relevantdata">
						<input type="radio" name="Cost" value="1.5" checked>渠道费 1.5% (用于支付给第三方支付机构，如众筹项目不成功，则不收取该笔费用。)
					</div>
				</div>

			</div>
	</body>
</html>
<script>
	$(function(){
		alert("dsd");
		$.ajax({
			type:"post",
			dataType:"json",
			url:"http://localhost:9088/P2P/ProjectsController/AllProjectsType.do",
			success:function(data){
				$.each(data,function(index,value){
					var ddd="<input type=\"radio\" name=\"protype\" value=\""+value.PROTYPEID+"\">"+value.PROTYPENAME;
					$("#projecttype").append(ddd);
					
					
				})
				
			}
		})
		
	})
	//图片上传
	$(".myFile").fileinput({
	    language : 'zh',
	    uploadUrl : "http://localhost:9088/P2P/ProjectsController/uploadFile.do",//上传地址
	    uploadAsync : true,//异步上传
	    autoReplace : true,//是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
	   // showCaption:false,//是否显示简介
	    showUpload:false, //是否显示上传按钮
	    showRemove:false, //显示移除按钮
	    dropZoneEnabled: false,//是否显示拖拽区域
	    maxFileCount : 1,//上传数量
	    allowedFileExtensions : [ "jpg", "png", "gif","txt" ],
	    browseClass : "btn btn-primary", //按钮样式 
	    previewFileIcon : ""
	}).on("filebatchselected", function(event, files) {
			alert("1");
			$(this).fileinput("upload");
			alert("2");
    	}).on("fileuploaded", function (event, data) {  
    		
        	$.each(data,function(index,value){
        		alert(index);
        		alert(value.success);
        		
        	})
     });
</script>