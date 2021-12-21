<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .page_on {
 	font-weight: bolder;
 	color: black;
 	font-size: 12px;
 }
  
 .page_off {
 	color: #cccccc;
 	font-size: 12px;
 }
</style>
</head>
<body>
<div id='page_list'>
	<c:if test="${page.curBlock gt 1}">
		<a class="page_first" onclick="go_page(1)">처음</a>
		<a class="page_prev" onclick="go_page(${page.beginPage - page.blockPage })">이전</a>
	</c:if>
	
	<c:forEach var="no" begin="${page.beginPage }" end="${page.endPage }" step="1">
		<c:if test="${no eq page.curPage }">
			<span class="page_on">${no }</span>
		</c:if>
		
		<c:if test="${no ne page.curPage }">
			<a class="page_off" onclick="go_page(${no})">${no }</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${page.curBlock lt page.totalBlock }">
		<a class="page_next" onclick="go_page(${page.endPage + 1})">다음</a>
		<a class="page_last" onclick="go_page(${page.totalPage })">마지막</a>
	</c:if>
</div>
</body>
<script type="text/javascript">
	function go_page(no) {
		$('[name=curPage]').val(no);
		$('#list').submit();
	}
</script>
</html>