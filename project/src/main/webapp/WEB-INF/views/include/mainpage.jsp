<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
	<title>Home</title>
<style type="text/css">

 * {
  box-sizing: border-box;
  margin: 0 auto;
 }
 
 ul{ margin: 0; overflow: hidden;}
 li{float: left;}

 #body_content{
 	width: 100%;
 	margin: 0 auto;
 	margin-top: 50px;
 } 
 
 #main_top_content {
 
 	height: 500px;
 	width: 1200px;
 	margin: 0 auto;
 }
 
 
 #new_products, #top_products{
		text-align: left;
		margin-top: 30px;
		display: table;
		padding-left: 30px;
	}
	
	#new_products ul li, #top_products ul li {
		margin-left: 20px;
		margin-bottom: 20px;
	}
	.product_img {
		width: 250px;
		height: 300px;
	}
	
	h4 {
		margin-top: 20px;
		color: gray;
	}
	
	.main_img {
		width: 1200px;
		height: 500px;
	}
	
	.product_img img {
		width: 250px;
		height: 300px;
		object-fit: cover;
	}

	.summary {
		width: 200px;
		height: 80px;
		word-break:break-all;
		font-size: 9px;
		color: gray;
		padding: 0;
		margin: 0;
	}
</style>
</head>

<body>
<div id='body_content'>
<div id='main_top_content'>
<img class="main_img" src="img/main.png"/>
</div>
<h4>TOP PRODUCT</h4>
<div id="top_products">
	<ul class='product_detail'>
		  <!-- c:foreach  --> 
		 <c:forEach items="${popular_products }" var="vo">
			<li><div><a href="go_detail?id=${vo.p_num }">
				<div class='product_img'><img src="<spring:url value='${vo.filepath }'/>" width="250" height="300" onerror="this.style.display='none'"/></div>
				<div>${vo.p_name}</div>
				<hr/>
				<div><fmt:formatNumber value="${vo.price}" pattern="#,###"/>원</div>
				<div class="summary">${vo.summary }</div>
		</a></div>		
		</li>
		 </c:forEach>
	</ul>
</div>
<h4>NEW PRODUCT</h4>
<div id="new_products">
	<ul class='product_detail'>
		  <!-- c:foreach  --> 
		 <c:forEach items="${new_products }" var="vo">
		<li><div><a href="go_detail?id=${vo.p_num }">
				<div class='product_img'><img src="<spring:url value='${vo.filepath }'/>" width="250" height="300" onerror="this.style.display='none'"/></div>
				<div>${vo.p_name}</div>
				<hr/>
				<div><fmt:formatNumber value="${vo.price}" pattern="#,###"/>원</div>
				<div class="summary">${vo.summary }</div>
		</a></div>		
		</li>
		 </c:forEach>
	</ul>
</div>

</div>
</body>
</html>
