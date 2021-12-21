<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.basketlist {
	margin-bottom: 20px;
	}
	.basketlist table {
		width: 90%;
		margin: 0 auto;
		
	}
	
	.basketlist table th {
		text-align: center;
		padding: 5px 10px;
		font-size: 14px;
		opacity: 70%;
	}
	
	.basketlist table td{
		font-size: 12px;
		
			
	}
	
	.chk_box{
		float: right;
		margin-right: 100px;
		
	}
	.chk_box input{
		border: 1px solid #d6d6d6;	
	}
	
	.chk_box select {
		width: 100px;
		height: 30px;
		border: 1px solid #d6d6d6;
	}
	
	.chk_box a {
		display:inline-block;
		width:45px;
		height:30px;
		background-color: #f5edd7;
		padding: 2px 3px;
		font-size: 12px;
		line-height: 30px;
	}
	
	
	.chk_box a:first-child {
		display:inline-block;
		width:80px;
		height:30px;
		background-color: #f5edd7;
		padding: 2px 3px;
		font-size: 14px;
		line-height: 30px;
		float: left;
	}

</style>

<body>
<h4>Q&A</h4>

<div class="chk_box">
<a onclick="board_write()">글쓰기</a>
<jsp:useBean id="now" class="java.util.Date"/>
<fm:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss" var="today"/>
	
	<form method="post" action="list.bo" id="list">
	<input type="hidden" name="curPage" value="1">
	<table>
		<tr>
			<th width="100px;"></th>	
			<td><select name="search">
				<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
				<option value="m_name" ${page.search eq 'm_name' ? 'selected' : '' }>작성자</option>
				<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
				<option value="content"  ${page.search eq 'content' ? 'selected' : '' }>내용</option>
		</select></td>

		<td><input type="text" name="keyword" value="${page.keyword }"/></td>
		<td><a onclick="$('form').submit()">검색</a></td>
			
		
		</tr>
	</table>

	</form>
</div>

<div class="block"></div>
<div class='boder1'></div>
<div class='basketlist'>

	<table >
		<tr style="background-color: #f5edd7;'"><th style="width: 50px;">NO</th>
				<th style="width: 100px;">OPTION</th>
				<th style="width: 500px;" >CONTENT</th>
				<th style="width: 70px;">NAME</th>
				<th style="width: 100px;">DATE</th>
		</tr>

		<c:forEach items="${page.list }" var="list">
				
				<tr>
					<td>${list.no }</td>
					<td>${list.category }</td>
					<td class="textleft" style="padding-left: 5px;">
					<c:forEach var="i" begin="1" end="${list.indent }">
					${i eq list.indent ? "ㄴ>" : "&nbsp;&nbsp;" }
					</c:forEach>
					<a onclick="go_detail('${list.b_id},${list.board_pw },${list.m_id} }')">${list.title }
					<c:if test="${ !empty list.filename }">
					<i class="fas fa-paperclip"></i>
					</c:if>
					
					</a></td>
					<td>${list.m_name }</td>
					<td>${list.writedate }</td>
				</tr>
				
		</c:forEach>
	</table>

</div>
<div >
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>


</body>
<script type="text/javascript">
function go_detail(data) {
		var data = data.split(",");
		var b_id = data[0]
		var pw = data[1]
		var m_id = data[2]
		
		if( ${loginInfo.admin eq 'Y'} ) {
			location.href="adminreplywrite.bo?b_id=" + b_id;
		} else {
		
			var user_pw = prompt('비밀번호를 입력해주세요 ');
	
			if( user_pw == pw ) {
			
				location.href="detail.bo?b_id=" + b_id;
			} else {
				alert('비밀번호가 일치 하지 않습니다.');
			return false
		}
	
		}
		
		
}

	function board_write() {
		if( ${empty loginInfo} ){
			alert('로그인을 하셔야 글을 쓰실 수 있습니다. ');
			location.href="write.bo";
		} else {
			location.href="write.bo";
		}
		
	};

</script>
</html>