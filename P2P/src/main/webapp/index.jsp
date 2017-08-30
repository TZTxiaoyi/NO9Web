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

  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  </head>
  
  <body>
  		<form action="EvaScoWeb/qwer" method="post">
  			<input type="text" name="stuno">
  			<input type="text" name="stuname">
  			<input type="submit" value="登录">
  		</form>

  </body>
</html>

