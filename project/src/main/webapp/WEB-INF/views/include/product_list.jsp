<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<style type="text/css">
	.form_area table tr {
		text-align: center;
		height: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
	}
	
	.form_area {
	margin-top: 10px;
}

.search_box {
	width: 90%;
	margin:0 auto;
	margin-top: 40px;
	text-align: left;
}

.search_box select {
	height: 30px;
	width: 80px;
	border: 1px solid #d6d6d6;
}

.search_box input {
		border: 1px solid #d6d6d6;
}

.search_box a {
		display:inline-block;
		width:70px;
		height:30px;
		background-color: #f5edd7;
		font-size: 14px;
		text-align:center;
		line-height: 30px;
		border-radius: 3px 3px 3px 3px;
	}
	
	.product_img {
		padding: 2px 3px;
	}

</style>
</head>
<body>
<div class="search_box">
	<form id="list" method="post" action="product.ad">
	<input type="hidden" value="1" name="curPage"/>
	<table>
		<tr>
		<th><select name="search">
		<option value="p_name" selected>상품이름</option>
		</select></th>
		<td><input type="text" name="keyword" value="${keyword }"/></td>
		<td><a onclick="$('form').submit();">검색</a></td>
		</tr>	
	
	</table>
	</form>
</div>
<div class="form_area">
	<table>
		<tr style="background-color: #f5edd7;"><th>상품이름</th>
		<th>카테고리</th>
		<th>카테고리2</th>
		<th>옵션</th>
		<th>전체수량</th>
		<th>판매량</th>
		<th>남은수량</th>
		<th>상품보기</th>
		<th colspan="2">수정</th>
		<th>삭제</th>
		</tr>
		
		<c:forEach items="${page.list }" var="list">
			<tr>
			<td><div class="product_img"><img src="<spring:url value='${list.filepath }'/>" width="80" height="100" onerror="this.style.display='none'"/></div><p>${list.p_name }</p></td>
			<td>${list.itemType1 }</td>
			<td>${list.itemType2 }</td>
			<td>option</td>
			<td>${list.quota }</td>
			<td>${list.quota - list.remaining }</td>
			<td>${list.remaining }</td>
			<td><a class='btn-fill-s' href="product_detail.ad?p_num=${list.p_num }">상품보기</a></td>
			<td><a class='btn-fill-s' href="product_update_form.ad?p_num=${list.p_num }">내용수정</a></td>
			<td><a class='btn-fill-s' href="product_option_update_form.ad?p_num=${list.p_num }">옵션수정</a></td>
			<td><a class='btn-fill-s' onclick="if( confirm('정말 삭제하시겠습니까?') ){location.href='porudct_delete.ad?p_num=${list.p_num }'}">삭제</a></td>
			</tr>
		</c:forEach>
		
	
	</table>
</div>
<div >
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>

</body>
</html>