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
 /*  	body
  {
  background-color:#F0F0F0;
  
  } */
  /* #colpadding{
  	margin:100px auto;
  	padding:100px;
  	background-color:#FFFFFF;
  	width:900px;
  } */
  #inputpadding{
  	margin:0 auto;
  	width:80%;
  	
  }
  #filediv{
  	width:300px;
  }
 #Relevantdata{
 	width:150px;
 }
 .A1{
 	height:30px;
 	color:red;
 }
  </style>
  </head>
  <body>
  	 
  			<div  id="colpadding">
  				<form class="form-horizontal" >
				<div>
					
					<h3>个人众筹资料</h3><br>
					<div id="inputpadding">
						<input type="text" id="originatorname" name="originatorname" class="form-control" placeholder="输入中文姓名">
						<div id="s1" class="A1"></div><br>
	
						<input type="text" id="idcard" name="idcard" class="form-control" placeholder="二代身份证，输入数字或字母">
						<div id="s2" class="A1"></div><br>
						
						<input type="text" id="telephone" name="telephone" class="form-control" placeholder="手机号，输入纯数字">
						<div id="s3" class="A1"></div><br>
					</div>
					<h3>你要创建的项目类型</h3><br>
					<div id="projecttype">
						
					</div>
					<h3>上传相关资料</h3><br>
					<div id="Relevantdata">
						
						<div class="form-group">
							
						   <label for="" class="col-sm-2 control-label">身份证正面</label>
						   <div class="col-sm-3">
						    <div id="cardimage1"></div>
        					<input type="file" cardimage="cardimage1" class="myFile"  style="position:absolute;left:0;bottom:0;font-size:34px; opacity:0;width:92;height:34">
						   </div>
  						</div>
  						
  						<div  class="form-group">
						   <label for="" class="col-sm-2 control-label">身份证反面</label>
						   <div class="col-sm-3">
						   	<div id="cardimage2"></div>
        					<input type="file" cardimage="cardimage2" class="myFile"  style="position:absolute;left:0;bottom:0;font-size:34px; opacity:0;width:92;height:34">
						   </div>
  						</div>
  					</div>
					
					<h3>选择平台渠道费</h3><br>
					<div id="Relevantdata1">
						<input type="radio" name="Cost" value="1.5" checked>渠道费 1.5% (用于支付给第三方支付机构，如众筹项目不成功，则不收取该笔费用。)
					</div>
				</div>
				<input id="wewr"  class="btn btn-info"  value="保存" style="position:relative;top:20;width:100px">
			</form>
			</div>
			
	</body>
</html>
<script>
//表单验证
	$("#originatorname").blur(function(){
		if(!/^[\u4e00-\u9fa5]+$/gi.test($("#originatorname").val())){
			$("#s1").html("只能输中文");
			
		}else{
			$("#s1").html("");
			
		}
    	
  	});
  	$("#idcard").blur(function(){
  		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
  		if(!reg.test($("#idcard").val())){ 
  			$("#s2").html("身份证输入不合法");
  			
  		}else{
  			$("#s2").html("");
  			
  		}
  	})
  	$("#telephone").blur(function(){
  		var phone=$("#telephone").val();
  		if(!(/^1[34578]\d{9}$/.test(phone))){ 
  			$("#s3").html("手机号码有误，请重填");
  	       
  	    } else{
  	    	$("#s3").html("");
  	    }
  		
  	})
	$("#wewr").click(function(){
		//alert("555");
			var projectsid=$.cookie('projectsid');
			var originatorname=$("#originatorname").val();
			var idcard=$("#idcard").val();
			var telephone=$("#telephone").val();
			var protypeid=$("input[type='radio']:checked").val();
			var data ={};
			data["projectsid"]=parseInt(projectsid);
			data["originatorname"]=originatorname;
			data["idcard"]=parseInt(idcard);
			data["telephone"]=parseInt(telephone);
			data["protypeid"]=parseInt(protypeid);
			//alert("456");
			$.ajax({
				type:"post",
				url:"http://localhost:9088/P2P/PerProController/UpataPerPro.do",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				success:function(data){
					if(data="success"){
						window.location.href = 'http://localhost:9088/P2P/jsp/LaunchProject/ProjectsDescribe.jsp';
					}
					
				}
			})
	})
	
	$(function(){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"http://localhost:9088/P2P/ProjectsController/AllProjectsType.do",
			success:function(data){
				$.each(data,function(index,value){
					var ddd="<input type=\"radio\" name=\"protypeid\" value=\""+value.PROTYPEID+"\">"+value.PROTYPENAME;
					$("#projecttype").append(ddd);
				})
				
			}
		})
		
	})
	$(function(){
		var projectsid=$.cookie('projectsid');
		var input="<input type=\"hidden\" name=\"projectsid\" value=\""+projectsid+"\"/>"; 
		$("#Relevantdata").append(input);
		//alert(projectsid);
		var data={};
		data["projectsid"]=projectsid;
		
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/PerProController/AllPerPro.do",
			data:data,
			success:function(data){
				//var json=JSON.parse(data);
				var cardimage1="<img src=\"http://localhost:9088/P2P/images/"+data[0].CARDIMAGE1+"\" style=\"width:150px;height:150px\" class=\"img-responsive\">";
				var cardimage2="<img src=\"http://localhost:9088/P2P/images/"+data[0].CARDIMAGE2+"\" style=\"width:150px;height:150px\" class=\"img-responsive\">";
				$("#originatorname").val(data[0].ORIGINATORNAME);
				$("#idcard").val(data[0].IDCARD);
				$("#telephone").val(data[0].TELEPHONE);
				$("#cardimage1").append(cardimage1);
				$("#cardimage2").append(cardimage2);
				$("input:radio[value='"+data[0].PROTYPEID+"']").attr('checked','true');
				
			}
		})
		
	})
	var cardimage="";
	$(".myFile").click(function(){
		cardimage=$(this).attr("cardimage");
	})
	//图片上传
	$(".myFile").fileinput({
	    language : 'zh',
	    uploadUrl : "http://localhost:9088/P2P/PerProController/SaveFile.do",//上传地址
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
	    	if(cardimage=="cardimage1"){
	    		
	    		return { "cardimage1":cardimage,"projectsid":projectsid};
	    	} else if(cardimage=="cardimage2"){
	    		
	    		return { "cardimage2":cardimage,"projectsid":projectsid};
	    	}
	    	
	    } ,
	    browseClass : "btn btn-primary", //按钮样式 
	    previewFileIcon : ""
	}).on("filebatchselected", function(event, files) {
			
			$(this).fileinput("upload");
			
    	}).on("fileuploaded", function (event, data) {  
    		var url="";
        	var cardimage="";
        	$.each(data,function(index,value){
        		
        		if(value.flag==0){
        			alert("上传成功");
        			url="<img src=\"http://localhost:9088/P2P/images/"+value.url+"\" style=\"width:150px;height:150px\" class=\"img-responsive\">";
        		}
        		if(value.cardimage1=="cardimage1"){
        			$("#cardimage1").html("");
        			cardimage="#cardimage1";	
        		}else if(value.cardimage2=="cardimage2"){
        			$("#cardimage2").html("");
        			cardimage="#cardimage2";			
        		}
        	})
        	$(cardimage).append(url);
     });
</script>