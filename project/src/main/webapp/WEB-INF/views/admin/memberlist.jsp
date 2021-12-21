<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form_area table tr {
	border: 1px solid  #d6d6d6;
	text-align:  center;
	height: 30px;
}

.from_area a {
	display: inline-block;
	color:black;
}

.form_area {
	margin-top: 10px;
}

.search_box {
	width: 90%;
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
}
</style>
</head>
<body>
<div class='search_box'>
	<form method="post" action="member.ad">
		<table>
			<tr>
			<th width="100ox;"></th>
			<td><select name=search>
				<option value="all" ${search eq 'all' ? 'selected' : '' }>전체</option>
				<option value="m_name"  ${search eq 'm_name' ? 'selected' : '' }>이름</option>
				<option value="m_id" ${search eq 'm_id' ? 'selected' : '' }>아이디</option>
				<option value="m_email"  ${search eq 'm_email' ? 'selected' : '' }>이메일</option>
				<option value="m_addr"  ${search eq 'm_addr' ? 'selected' : '' }>주소</option>
				<option value="m_tel"  ${search eq 'm_tel' ? 'selected' : '' }>연락처</option>
			</select></td>
			<td><input type="text" name="keyword" value="${keyword }"/></td>
			<td><a onclick="$('form').submit();">검색</a></td>
		</table>
	</form>
</div>
<div class='form_area'>
	<table>
		<tr style="background-color: #f5edd7;">
			<th>회원이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>연락처</th>
			<th width="20%;">이메일</th>
			<th>주소</th>
		</tr>
		<c:forEach items="${member }" var="member">
		<tr>
			<td><a href="member_detail.ad?m_email=${member.m_email }">${member.m_name }</a></td>					
			<td><a href="member_detail.ad?m_email=${member.m_email }">${member.m_id }</a></td>					
			<c:set var="pw" value="${member.m_pw }"/>
			<c:set var="first" value="${fn:substring(pw, 0, 1) }"/>
			<td><c:out value="${first }*****"/></td>					
			<td>${member.m_tel }</td>					
			<td >${member.m_email}</td>					
			<td >${member.post}${member.m_addr}</td>	
		</tr>
		</c:forEach>
	</table>
</div>
</body>
<script type="text/javascript">

</script>
</html>