<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel='stylesheet' type='text/css' 
	href='css/common.css?v=<%=new java.util.Date().getTime()%>'>
</head>
<script type="text/javascript" 
src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" 
src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>


<body>

<tiles:insertAttribute name="header"/>
<div id='content' style="margin-top: 50px;">
<tiles:insertAttribute name='content'/>
</div>

<tiles:insertAttribute name="footer"/>
</body>
</html>

