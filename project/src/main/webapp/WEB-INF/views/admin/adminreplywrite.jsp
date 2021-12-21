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


.detail_form a {
	display: inline-block;
	padding: 10px 30px;
	background-color: black;
	color: white;
}

.detail_form a:last-child {
	background-color: white;
	border: 1px solid black;
	color: black;
	
}

.fa-download {
	cursor: pointer;
}

textarea {
	width: 100%;
	height: 300px;
	padding: 5px 10px;
	border: 1px solid #d6d6d6;
}

#replywriteform{
	margin-top: 50px;
}
</style>

<body>
<h4>고객님 질문 </h4>

<div class='detail_form'>

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
	
	
	<div id="replywriteform">
	
	<h4>답변작성</h4>
	<form method="post" action="replyinsert.bo">
	<input type="hidden" name="board_pw" value="${board.board_pw }"/>
	<input type="hidden" name="title" value="답변드려요^_^"/>	
	<input type="hidden" name="root" value="${board.root }"/>
	<input type="hidden" name="step" value="${board.step }"/>
	<input type="hidden" name="indent" value="${board.indent }"/>
	<input type="hidden" name="category" value=" "/>
			<table>
				<tr>
					<th>제목</th>
					<td>답변드려요^_^</td></tr>
				<tr><th>작성자</th>
						<td>${loginInfo.m_name }</td></tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" class="need">${board.m_name }님의 질문에 대한 답변입니다.</textarea></td>
				</tr>
			</table>
		</form>
	
	</div>

	<div class="button_form">
			<a onclick="check()">댓글쓰기</a>			
			<a href="list.bo">취소</a>
	</div>	

</div>
</body>
<script type="text/javascript">
$('.fa-download').on('click',function(){
	location.href='download.bo?b_id=${board.b_id}';
});



function check() {
	if( $('textarea').val() == '' || $('textarea').val() == null  ) {
		alert ('내용을 입력해주세요');
		return false;
	} else {
		$('form').submit();
		return true;
	}
}

</script>
</html>