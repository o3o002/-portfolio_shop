<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">

#loginarea {
	display: table;
	margin: 0 auto;
	border: 1px solid #d6d6d6;
	padding: 30px 20px;
}
#logintable {
	margin-top: 20px;
}

#logintable tr {
	height:60px;
	width: 300px;
}

#logintable tr:first-child, #logintable tr:nth-child(2) {
	height: 50px;
}

#logintable input {
	height: 40px;
	width: 300px;
}

#logintable a {
	display: block;
	width: 300px;
	height: 50px;
	line-height:50px;
}

#logintable tr:last-child a {
	display: inline-block;
	width: 100px;
	height: 30px;
	line-height: 30px;
	font-size: 12px;	
}

#logintable tr:last-child a:hover {
	color: #CCCCCC;
}
</style>
</head>
<body>
		<div id="loginarea">
		<h4>LOGIN</h4>
		<table id="logintable" >
			<tr>
			<td><input type="text" id="m_id" value="admin" placeholder="아이디를 입력하세요 "/>	</td></tr>
			<tr><td><input type="password" value="admin" id="m_pw" placeholder="비밀번호를 입력하세요. "/></td></tr>
			<tr><td><a onclick="go_login()" style="background-color: black; color: white;">로그인</a></td></tr>
			<tr><td><a href="member" style="border: 1px solid gray;">회원가입</a></td></tr>
			<!-- <tr><td><a style="background-color: #2d8400; color: white;" href="navercallback">네이버로그인</a></td></tr>
			<tr><td><a href="kakaocallback" style="background-color: #f9e000;">카카오로그인</a></td></tr>  -->
			<tr>
				<td><a href="find_id_form">아이디 찾기</a>
				<a href="find_pw_form">비밀번호 찾기</a></td>
			</tr>
		</table>
		
		</div>

</body>
<script type="text/javascript">
	function go_login() {
		if( $("#m_id").val() == "" ){
			alert('아이디를 입력하세요');
			$("#m_id").focus();
			return;
		}
		
		if( $("#m_pw").val() == "" ){
			alert ('비밀번호를 입력하세요');
			$("#m_pw").focus();
		 	return;
		}
		
		$.ajax({
			type: 'post',
			url: 'smartLogin',
			data: { id:$('#m_id').val(), pw: $("#m_pw").val() },
			success: function(response ){
				if( response ){
					location.href = document.referrer.match(/list/g) ? document.referrer : '<c:url value="/"/>';
				} else {
					alert('아이디나 비밀번호가 일치하지 않습니다!!');
				}
			},
			error(req, text){
				alert( text + ":" + req.status); 
			}
		});
	}
</script>
</html>