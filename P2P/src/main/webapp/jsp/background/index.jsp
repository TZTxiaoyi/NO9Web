<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页-P2P</title>
</head>
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0"	frameborder="no" border="0">
 <frame src="inc/head.jsp"	name="headmenu" id="mainFrame" title="mainFrame"><!-- 引用头部 -->
<!-- 引用左边和主体部分 --> 
<frameset rows="100*" cols="220,*" scrolling="No"framespacing="0" frameborder="no" border="0"> 
<frame	src="inc/left.jsp" name="leftmenu" id="mainFrame" title="mainFrame">
<frame src="main.jsp" name="main" scrolling="yes" noresize="noresize"
	id="rightFrame" title="rightFrame"></frameset></frameset>
</html>