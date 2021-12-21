<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="reviewlist">
	<c:forEach items="${review.list }" var="review">
	<c:if test="${review.grade ne 0 }">
		<tr><td><div class='blank'></div></td></tr>
		<tr>
			<td><c:forEach begin="1" end="${review.grade }">
			<c:set var="gradesum" value="${gradesum + review.grade }"/>
			<i class="fas fa-star"></i>
			</c:forEach>&nbsp;&nbsp;${review.grade }점
			
			<c:set var="name" value="${review.m_name}" />
			<c:set var="totalLength" value="${fn:length(name) }" />
			<c:set var="first" value="${fn:substring(name, 0, 1) }" />
			<c:set var="last" value="${fn:substring(name, 2, totalLength) }" />
			<p>작성자 : <span><c:out value="${first}*${last}"/></span></p>
			
			</td></tr>
    <tr class="${review_num }">
    <td><span class="content collspan">${fn:replace(review.content, crlf, '<br>' )}</span><a class="review_view">더보기</a></td></tr>
		<tr><td><img src="<spring:url value='${review.filepath }'/>" width="200" height="200" onerror="this.style.display='none'"/></td>
    </tr>
				<tr><td>
					<form class="review" method="post" action="reply_insert.rv">
   				<input type="hidden" name="p_num" value="${review.p_num }">
   				<input type="hidden" name="root" value="${review.root }">
   				<input type="hidden" name="m_id" value="${loginInfo.m_id }"/>
   				<input type="hidden" name="step" value="${review.step }"/>
					<input type="text" placeholder="댓글을 남겨주세요 :)"/><a class='btn'>등록</a></form>
   				</td></tr>
				</c:if>
   				<tr><td class="review_reply_area">
						<c:if test="${review.grade eq 0}">
   						ㄴ <strong>작성자</strong> : ${review.m_name }<br/>
   						${review.content }</c:if>
   						</td></tr>
	
		
	</c:forEach>
	
</table>
</body>
</html>