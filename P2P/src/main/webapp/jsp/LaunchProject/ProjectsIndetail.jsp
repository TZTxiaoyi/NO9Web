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
  				
  				<form class="form-horizontal">
				<div>
					<div id="Relevantdata">
	
  					</div>
					
				</div>
				<input id="upda"  class="btn btn-info" type="button" value="下一步" style="position:relative;top:150;left:45%;width:100px">
			</form>
			 <input id="addpicture" type="button" value="添加图片模块" class="btn btn-info"  >
  				<input id="addtext" type="button" value="添加文本模块" class="btn btn-info" id="addtext" > 
			</div>
			
	</body>
</html>
<script>
	$(function(){
		var projectsid=parseInt($.cookie('projectsid'));
		alert(projectsid);
		var data={};
		data["projectsid"]=projectsid;
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/IndetailContrller/AllIndetail.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				$.each(data,function(index,value){
					if (value.TEXTID!=undefined){
						var text="<div class=\"form-group\"><label for=\"\" class=\"font-normal\">添加文本：</label><div class=\"col-sm-8 input-group\"><input type=\"text\"  index=\""+value.PLACES+"\" name=\"title\" class=\"form-control\" value=\""+value.TITLE+"\" placeholder=\"我需要更多的支持\"><br><textarea class=\"form-control\" index=\""+value.PLACES+"\" name=\"body\"  rows=\"3\"  placeholder=\"告诉支持者，你美妙的梦想或残酷的现实，为什么需要大家的支持\">"+value.BODY +"</textarea> </div></div>";
						$("#Relevantdata").append(text);
					}else if(value.PHOTOID!=undefined){
						var photo="<div class=\"form-group\"><label for=\"\" class=\"col-sm-2 control-label\">添加图片：</label><div class=\"col-sm-3\"> <div id=\"Cover"+value.PLACES+"\"><img src=\"http://localhost:9088/P2P/images/"+value.URL+"\" style=\"width:350px;height:250px\"></div><input type=\"file\" class=\"myFile\" index=\""+value.PLACES+"\"  style=\"position:absolute;left:0;bottom:0;font-size:34px; opacity:0;width:92;height:34\"></div> </div>";
						$("#Relevantdata").append(photo);
					}
					initialindex=value.PLACES;
					
					indexq=value.PLACES;
					alert("index:"+index);
					initphoto();
				})
				
			}
			
		})
		
	})
	var initialindex=0;
	var indexq=0;
	
	$("#upda").click(function(){
		var projectsid=parseInt($.cookie('projectsid'));
		alert(projectsid);
		var data={};
		var index={};
		var title={};
		var body={}
		var photo={};
		$('input[name=\"title\"]').each(function(){
			//alert($(this).attr("index"));
			var indexv="index"+$(this).attr("index");
			index[indexv]=parseInt($(this).attr("index"));
			title[indexv]=$(this).val();
			
		})
		$('textarea[name=\"body\"]').each(function(){
			//alert($(this).attr("index"));
			var indexv="index"+$(this).attr("index");
			index[indexv]=parseInt($(this).attr("index"));
			body[indexv]=$(this).val();
		})
		
		data["index"]=index;
		data["title"]=title;
		data["body"]=body;
		data["projectsid"]=projectsid;
		alert(initialindex);
		data["initialindex"]=initialindex;
		//data["photo"]=photo;
		updateIndetail(data);
	})
	function updateIndetail(data){
		alert("8787");
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/IndetailContrller/SvaeText.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				
				
			}
			
		})
		
	}
	$("#addtext").click(function(){
		alert("initialindex:"+initialindex);
		alert("indexq:"+indexq);
		indexq=indexq+1;
		alert(indexq);
		var addtext="<div class=\"form-group\"><label for=\"\" class=\"col-sm-2 control-label\">添加文本：</label><div class=\"col-sm-8\"><input type=\"text\"  index=\""+indexq+"\" name=\"title\" class=\"form-control\"  placeholder=\"我需要更多的支持\"><br><textarea class=\"form-control\" index=\""+indexq+"\" name=\"body\"  rows=\"3\"  placeholder=\"告诉支持者，你美妙的梦想或残酷的现实，为什么需要大家的支持\"></textarea> </div></div>";
		$("#Relevantdata").append(addtext);
		alert("7487");
		initphoto();
		
	}) 
	$("#addpicture").click(function(){
		alert("initialindex:"+initialindex);
		alert("indexq:"+indexq);
		alert("7ere");
		indexq=indexq+1;
		alert(indexq);
		var addphoto="<div class=\"form-group\"><label for=\"\" class=\"col-sm-2 control-label\">添加图片：</label><div class=\"col-sm-3\"> <div id=\"Cover"+indexq+"\"></div><input type=\"file\" class=\"myFile\" index=\""+indexq+"\"  style=\"position:absolute;left:0;bottom:0;font-size:34px; opacity:0;width:92;height:34\"></div> </div>";
		$("#Relevantdata").append(addphoto);
		initphoto();
	})
	//图片上传
	
	function initphoto(){
		var photoindex=0;
		$(".myFile").bind("click",function(){
			//alert("ssd");
			photoindex=parseInt($(this).attr("index"));
			//alert(photoindex);
			//$(this).unbind('click');
		});
		$(".myFile").fileinput({
	    language : 'zh',
	    uploadUrl : "http://localhost:9088/P2P/IndetailContrller/SvaePhoto.do",//上传地址
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
	    	var projectsid=parseInt($.cookie('projectsid'));
	    	return {"projectsid":projectsid,"places":photoindex,"initialindex":initialindex}
	    } ,
	    browseClass : "btn btn-primary", //按钮样式 
	    previewFileIcon : ""
	}).on("filebatchselected", function(event, files) {
			
			$(this).fileinput("upload");
			
    	}).on("fileuploaded", function (event, data) { 
        	var photourl=data.response.url;
        	if(data.response.flag==0){
        		alert(data.extra.places);
        		$("#Cover"+data.extra.places+"").html("");
        		alert("上传成功");
        		url="<img src=\"http://localhost:9088/P2P/images/"+photourl+"\" style=\"width:350px;height:250px\">";
        		$("#Cover"+data.extra.places+"").append(url);
        	}
     });}
</script>