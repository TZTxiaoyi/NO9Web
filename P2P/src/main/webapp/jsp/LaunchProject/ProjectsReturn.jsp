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
  #colpadding{
  	
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
  	position:relative;
  	top:-26;
  	left:100%;
  	
  }
  .hdiv{
  	margin-top:10px;
  	margin-bottom:30px;
  	padding:20px 50px;
  	background-color:#F0F0F0;
  	
  }
  .form-group{
  	width:600px;
  }
  textarea{ resize:none;}
  </style>
  </head>
  <body>
  			<div  id="colpadding">
  				<b>设置你的回报信息</b>
  				<hr>
  				
			</div>
			<input id="addhdiv"  class="btn btn-info"  type="button" value="添加回报">
			
			
			<input id="submitpro"  class="btn btn-info" type="button" value="提交审核" ><br>
			<input id="submit"  class="btn btn-info" type="button" value="保存" style="position:relative;top:20;;width:100px">
	</body>
</html>
<script>

	var returnindex=0;
	var indexq=0;
	var initialindex=0;
	var topWindow=window.top;
	$("#submitpro").click(function(){
		//alert("545");
		var projectsid=$.cookie("projectsid");
		var empid=$.cookie("empid");
		var data={};
		data["projectsid"]=projectsid;
		data["empid"]=empid;
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/ReturnContrller/SExamine.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				if(data=="success"){
					alert("提交成功");
					topWindow.location.href = "http://localhost:9088/P2P/newHome.jsp";
					//window.location.href = 'http://localhost:9088/P2P/newHome.jsp';
					
				}
			}
		})
	})
	function delectreturn(btnindex){
		//alert(btnindex);
		var projectsid=parseInt($.cookie('projectsid'));
		//alert(projectsid);
		var data={};
		data["projectsid"]=projectsid;
		data["formindex"]=btnindex;
		$.ajax({
			type:"post",
			url:"http://localhost:9088/P2P/ReturnContrller/DelectReturn.do",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success:function(data){
				//alert(data);
				if(data==1){
					alert("删除成功");
					
				}else{
					
					alert("删除失败");
				}
				
			}
		})
		
	}
	
	
	function SaveReturn(formdatas){
		//alert("4645");
		$.ajax({
			type:"post",
			contentType:"application/json;charset=utf-8",
			url:"http://localhost:9088/P2P/ReturnContrller/SaveReturn.do",
			data:JSON.stringify(formdatas),
			success:function(data){
				if(data=="success"){
					alert("保存成功");
					
				}
			}
			
		})
		
	}
	$("#addhdiv").click(function(){

		
		adddiv();
		
	});
	function adddiv(){
		indexq=indexq+1;
		returnindex=returnindex+1;
		//alert("sda");
		//alert(indexq);
		//alert(returnindex);
		var addreturn="<form class=\"form-horizontal\" formindex=\""+indexq+"\"><b>回报"+returnindex+"</b><input class=\" delectbtn btn btn-info col-sm-offset-10\" formindex=\""+indexq+"\" value=\"删除\" index=\"1\" type=\"button\"><div class=\"hdiv\"><div id=\"Relevantdata\"><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">选择回报类型：</label><div class=\"col-sm-7\"><input type=\"radio\" value=\"38\" name=\"return_type\" >&nbsp实物回报&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=\"radio\" value=\"39\" name=\"return_type\">&nbsp虚拟回报</div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">支持金额：</label><div class=\"col-sm-8\"><input type=\"text\"  name=\"offer_money\" class=\"form-control\" placeholder=\"输入需要用户支持的金额(必填)\"></div><span id=\"formspan\">元</span></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报标题：</label><div class=\"col-sm-8\"><input type=\"text\"  name=\"return_title\" class=\"form-control\" placeholder=\"输入回报标题（必填）\"></div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报内容：</label><div class=\"col-sm-8\"><textarea  rows=\"3\" name=\"return_content\" class=\"form-control\"    placeholder=\"回报内容（必填）\"></textarea> </div></div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报时间：</label><div class=\"col-sm-8 \"><input type=\"text\" id=\"financing_day\" name=\"return_time\" class=\"form-control\" placeholder=\"\"></div><span id=\"formspan\">天</span></div></div></div></form>";
		$("#colpadding").append(addreturn);
		//EventInitialization ();
	} 
	function EventInitialization (){
		//删除回报
		$(".delectbtn").click(function(){
			//alert("dd");
			//alert($(this).attr("formindex"));
			var btnindex=parseInt($(this).attr("formindex"));
			//alert(btnindex);
			$("form[formindex=\""+btnindex+"\"]").remove();
			//alert(index);
			//alert(initialindex);
			if(btnindex<=initialindex){
				//alert("14");
				delectreturn(btnindex);
				
			}
		})
		//保存回报
		$("#submit").click(function(){
			//alert("484");
			var data={};
			var indexarr={};
			var formdata={};
			$("form").each(function(){
				var num="index"+$(this).attr("formindex");
				indexarr[num]=$(this).attr("formindex");
				var o = {};
			    var a = $(this).serializeArray();
			    //alert("88");
			    $.each(a, function() {
			        if (o[this.name] !== undefined) {
			            if (!o[this.name].push) {
			                o[this.name] = [o[this.name]];
			            }
			            o[this.name].push(this.value || '');
			        } else {
			            o[this.name] = this.value || '';
			        }
			    });
				//alert(o.return_content);
				
				formdata[num]=o;
				
			});
			data["indexarr"]=indexarr;
			data["formdata"]=formdata;
			data["projectsid"]=parseInt($.cookie('projectsid'));
			data["initialindex"]=initialindex;
			//alert("er0");
			SaveReturn(data);
			//alert("er1");	
		});
	};
	$(function(){
		var projectsid=$.cookie("projectsid");
		//alert(projectsid);
		var data={};
		data["projectsid"]=projectsid;
		$.ajax({
			type:"post",
			contentType:"application/json;charset=utf-8",
			url:"http://localhost:9088/P2P/ReturnContrller/AllReturn.do",
			data:JSON.stringify(data),
			success:function(data){
				
				if(data.flag==1){
					$.each(data.formdata,function(index,value){
						//alert(value.FORMINDEX);
						returnindex=returnindex+1;
						//alert(returnindex);
						//var addreturn="<form class=\"form-horizontal\" formindex=\"\"><b>回报</b><input class=\" delectbtn btn btn-info col-sm-offset-10\" formindex=\"\" value=\"删除\" index=\"1\" type=\"button\"><div class=\"hdiv\"><div id=\"Relevantdata\"><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">选择回报类型：</label><div class=\"col-sm-7\"><input type=\"radio\" value=\"38\" name=\"return_type\" >&nbsp实物回报&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=\"radio\" value=\"39\" name=\"return_type\">&nbsp虚拟回报</div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">支持金额：</label><div class=\"col-sm-8\"><input type=\"text\"  name=\"offer_money\" class=\"form-control\" placeholder=\"输入需要用户支持的金额(必填)\"><br></div><span id=\"formspan\">元</span></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报标题：</label><div class=\"col-sm-8\"><input type=\"text\"  name=\"return_title\" class=\"form-control\" placeholder=\"输入回报标题（必填）\"></div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报内容：</label><div class=\"col-sm-8\"><textarea  rows=\"3\" name=\"return_content\" class=\"form-control\"    placeholder=\"回报内容（必填）\"></textarea> </div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">人数上限：</label><div class=\"col-sm-8 \"><input type=\"text\" id=\"financing_day\" name=\"limit_people\" class=\"form-control\" placeholder=\"\"></div><span id=\"formspan\">个</span></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报时间：</label><div class=\"col-sm-8 \"><input type=\"text\" id=\"financing_day\" name=\"return_time\" class=\"form-control\" placeholder=\"\"></div><span id=\"formspan\">天</span></div></div></div></form>";
						//alert(addreturn);
						var eform="<form class=\"form-horizontal\" formindex=\""+value.FORMINDEX+"\"><b>回报"+returnindex+"</b><input class=\" delectbtn btn btn-info col-sm-offset-10\" formindex=\""+value.FORMINDEX+"\" value=\"删除\" index=\"1\" type=\"button\"><div class=\"hdiv\"><div id=\"Relevantdata\"><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">选择回报类型：</label><div  class=\" col-sm-7\"><input type=\"radio\" rindex=\"seleradio38"+value.FORMINDEX+"\" value=\"38\" name=\"return_type\" >&nbsp实物回报&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type=\"radio\" value=\"39\" rindex=\"seleradio39"+value.FORMINDEX+"\" name=\"return_type\">&nbsp虚拟回报</div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">支持金额：</label><div class=\"col-sm-8\"><input type=\"text\"  name=\"offer_money\" class=\"form-control\" value=\""+value.OFFER_MONEY+"\" placeholder=\"输入需要用户支持的金额(必填)\"></div><span id=\"formspan\">元</span></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报标题：</label><div class=\"col-sm-8\"><input type=\"text\"  name=\"return_title\" class=\"form-control\" value=\""+value.RETURN_TITLE+"\" placeholder=\"输入回报标题（必填）\"></div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报内容：</label><div class=\"col-sm-8\"><textarea  rows=\"3\" name=\"return_content\" class=\"form-control\" placeholder=\"回报内容（必填）\">"+value.RETURN_CONTENT+"</textarea> </div></div><div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">回报时间：</label><div class=\"col-sm-8 \"><input type=\"text\" id=\"financing_day\" name=\"return_time\" class=\"form-control\" value=\""+value.RETURN_TIME+"\" placeholder=\"\"></div><span id=\"formspan\">天</span></div></div></div></form>";
						
						var ddd="\".seleradio"+value.RETURN_TYPE+""+value.FORMINDEX+"\"";
						//alert(value.RETURN_TYPE);
						//alert(eform);  
						$("#colpadding").append(eform);
						$("input:radio[rindex='seleradio"+value.RETURN_TYPE+""+value.FORMINDEX+"']").attr('checked','true');
						//alert($(ddd).attr("value"));
						//alert(returnindex);
						indexq=value.FORMINDEX;
						initialindex=value.FORMINDEX;
					})
					
				}else if(data.flag==0){
					adddiv();
					
				}
				//alert("q");
				EventInitialization();
				//alert("w");
				
			}
			
		})
		
	})
	/* $("#submitpro").click(function(){
		var projectsid=$.cookie("projectsid");
		var data={};
		data["projectsid"]=projectsid;
		$.ajax({
			type:"post",
			contentType:"application/json;charset=utf-8",
			url:"http://localhost:9088/P2P/ReturnContrller/Return.do",
			data:JSON.stringify(data),
			success:function(data){
				if(data=="success"){
					alert("保存成功");
					
				}
			}
			
		})
	}) */
</script>
