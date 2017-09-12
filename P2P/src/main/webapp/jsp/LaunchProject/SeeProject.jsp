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
  	margin:0 auto;
  	padding:100px 100px 0 100px;
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
 .abtn{
 	height:50px;
 	width:120px;
 }
 .pdiv{
 	margin:50px 400px ;
 }
 #topdiv{
 	padding-left:250px;
 	width:100%;
 	height:50px;
 	background-color:#FFFFFF;
 }
 a{
 	margin-left:50px;
 }
  </style>
  </head>
  <body>
  		<div id="topdiv"><img src="../../images/logo.png" alt="" width="100" height="50" /><a href="../../proscenium.jsp">首页</a></div>
  	 	<div class="btn-group pdiv col-md-offset-3" role="group" aria-label="...">
  			<button type="button" id="basic" class=" abtn btn btn-default"><b>基本信息</b></button>
  			<button type="button" id="Project" class=" abtn btn btn-default"><b>项目信息</b></button>
  			<button type="button" id="detailed" class=" abtn btn btn-default"><b>详细描述</b></button>
  			<button type="button" id="sreturn" class=" abtn btn btn-default"><b>回报设置</b></button>
		</div>
  			<div  id="colpadding">
  				<!-- <iframe id = "MyIframe" src = "" width=100% height=100% ></iframe> -->
  				
			

			<iframe id="mainFrame" name="mainFrame" scrolling="no" src="ProjectsLaunch.jsp"
            frameborder="0" style="padding: 0px; width: 100%; height: 1000px;"></iframe>

			

  				
			</div> 
			
	</body>
</html>
<script>


/* var ifm= document.getElementById("MyIframe");

ifm.height=document.documentElement.clientHeight; */

	$("#basic").click(function(){
		$("iframe").show();
		$("#mainFrame").attr("src","ProjectsLaunch.jsp");
	})
	$("#Project").click(function(){
		$("iframe").show();
		$("#mainFrame").attr("src","ProjectsDescribe.jsp");
		
	})
	$("#detailed").click(function(){
		$("iframe").show();
		$("#mainFrame").attr("src","ProjectsIndetail.jsp");
		
	})
	$("#sreturn").click(function(){
		$("iframe").show();
		$("#mainFrame").attr("src","ProjectsReturn.jsp");
		
	})
        startInit('mainFrame', 560);

	var browserVersion = window.navigator.userAgent.toUpperCase();
var isOpera = browserVersion.indexOf("OPERA") > -1 ? true : false;
var isFireFox = browserVersion.indexOf("FIREFOX") > -1 ? true : false;
var isChrome = browserVersion.indexOf("CHROME") > -1 ? true : false;
var isSafari = browserVersion.indexOf("SAFARI") > -1 ? true : false;
var isIE = (!!window.ActiveXObject || "ActiveXObject" in window);
var isIE9More = (! -[1, ] == false);
function reinitIframe(iframeId, minHeight) {
    try {
        var iframe = document.getElementById(iframeId);
        var bHeight = 0;
        if (isChrome == false && isSafari == false)
            bHeight = iframe.contentWindow.document.body.scrollHeight;

        var dHeight = 0;
        if (isFireFox == true)
            dHeight = iframe.contentWindow.document.documentElement.offsetHeight + 2;
        else if (isIE == false && isOpera == false)
            dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
        else if (isIE == true && isIE9More) {//ie9+
            var heightDeviation = bHeight - eval("window.IE9MoreRealHeight" + iframeId);
            if (heightDeviation == 0) {
                bHeight += 3;
            } else if (heightDeviation != 3) {
                eval("window.IE9MoreRealHeight" + iframeId + "=" + bHeight);
                bHeight += 3;
            }
        }
        else//ie[6-8]、OPERA
            bHeight += 3;

        var height = Math.max(bHeight, dHeight);
        if (height < minHeight) height = minHeight;
        iframe.style.height = height + "px";
    } catch (ex) { }
}
function startInit(iframeId, minHeight) {
    eval("window.IE9MoreRealHeight" + iframeId + "=0");
    window.setInterval("reinitIframe('" + iframeId + "'," + minHeight + ")", 100);
} 
</script>