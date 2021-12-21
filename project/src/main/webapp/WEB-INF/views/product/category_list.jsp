<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	ul { margin:0; overflow: hidden; }
	li { float: left;}
	
	#outer_category ul li a, #view_type ul li a {
		margin-left: 20px;
	}
	
	#outer_category ul li a:hover, #view_type ul li a:hover {
		font-weight: bold;
	}
	
	#outer_category ul {
		display: table;
		margin: 0 auto;
		margin-top: 10px;
	}
	
	#view_type {
		width:90%;
		font-size: 10px;
		color: gray;
		padding-right: 23px;
	}
	
	#view_type ul li {
		float: right;
	}
	
	#product_detail_list{
		text-align: left;
		padding-left: 20px;
		margin-top: 30px;
	}
	
	#product_detail_list ul li {
		margin-left: 20px;
		margin-bottom: 20px;
	}
	

	
	
	.product_img {
	
		width: 250px;
		height: 300px;
	}
	
	a {
	text-decoration: none;
	color: black;
	
	}
	
	#outer_category ul li a.active {
		font-weight: bold;
		border-bottom: 1px solid black;
		padding-bottom: 1px;
	}
	
	item_choose:hover{
		font-weight: bold;
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
<h4 ><a href="list.pd?itemType1=${page.itemType1 }">${fn:toUpperCase(page.itemType1) }</a></h4>
<form method="post" action="sublist.pd" id="list">
	<input type="hidden" name="curPage" value="1"/>
	<input type="hidden" name="itemType1" value="${page.itemType1 }" />
	<input type="hidden" name="itemType2" value="${page.itemType2 }" />
	<input type="hidden" name="sort" value="${page.sort }"/>
</form>
<!-- 옷 상품분류 -->
<div id='outer_category'>
	<ul>
		<c:forEach items="${itemCategory }" var="ca">
			<li><a href="sublist.pd?itemType1=${ca.itemType1 }&itemType2=${ca.itemType2}">${ca.itemType2 }</a></li>
		</c:forEach>
	</ul>
</div>

<!-- 조건별 순서로 보기-->
<div id='view_type'>
	<ul>
		<li><a>리뷰순</a></li>	
		<li><a href='sublist.pd?itemType1=${page.itemType1 }&itemType2=${page.itemType2}&sort=hightprice'>높은가격</a></li>	
		<li><a href='sublist.pd?itemType1=${page.itemType1 }&itemType2=${page.itemType2}&sort=lowprice'>낮은가격</a></li>	
		<li><a href='sublist.pd?itemType1=${page.itemType1 }&itemType2=${page.itemType2}&sort=update'>신상품순</a></li>
	</ul>
</div>

<div id="product_detail_list">
	<ul class='product_detail'>
		  <!-- c:foreach  --> 
		 <c:forEach items="${page.list }" var="vo">
		<li><div><a href="go_detail?id=${vo.p_name }">
			<div class='product_img'><img src="<spring:url value='${vo.filepath }'/>" width="250" height="300" onerror="this.style.display='none'"/></div>
			<div>${vo.p_num}</div>
			<hr/>
			<div>${vo.price}</div>
			<div class="summary">${vo.summary }</div>
		</a></div>		
		</li>
		 </c:forEach>
	</ul>
</div>
<div >
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>


</body>
</html>