<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


	.detail_form table {
		width: 60%;
		margin: 0 auto;
		text-align: left;
		
	}
	
	
	
	.detail_form table th {
		padding: 5px 10px;
		width: 10%;
		height: 30px;
		font-size: 14px;
		opacity: 70%;
		background-color: #f5edd7;
	}
	
	.detail_form table td{
		font-size: 12px;
		text-align: left;
		padding: 5px 10px;
		width: 70%;
			
	}

	


	.border_none {
	color: #d6d6d6;
	font-weight: bolder;
}

.button_form {
	margin-top: 20px;
}


.button_form  a {
	display: inline-block;
	padding: 10px 30px;
	background-color: black;
	color: white;
}

.button_form  a:last-child {
	background-color: white;
	border: 1px solid black;
	color: black;
	
}

.fa-download {
	cursor: pointer;
}

</style>

<body>
<h4>DETAIL </h4>
<div class='detail_form'>
<form method="post" action="board_modfiy.bo" enctype="multipart/form-data">
	<table >
		<tr>
			<th>제목</th>
			<td>
				<span>${board.category }</span>
				<span>${board.title }</span>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.m_name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${fn:replace(board.content, crlf, '<br>') }</td>
		</tr>
		<tr>
		
			<th>파일</th>
			<td class="textleft">
				<c:if test="${!empty board.filename }">
				<i class="fas fa-download"> ${board.filename }</i>
				
				</c:if>
				
				<c:if test="${empty board.filename }">
					<span>파일이 없습니다.</span>
				</c:if>
				
			</td>
		</tr>
		
		
	</table>
	</form>
	<div class="button_form">
			<c:if test="${board.title eq '답변드려요^_^'}">
				<a href="list.bo">확인</a>
			</c:if>
			<c:if test="${board.title ne '답변드려요^_^'}" >
				<a href="modify.bo?b_id=${board.b_id }">수정</a>
				<a href="list.bo">취소</a>
			</c:if>
	</div>	

</div>
</body>
<script type="text/javascript">
$('.fa-download').on('click',function(){
	location.href='download.bo?b_id=${board.b_id}';
});

</script>
</html>