<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.find_form{
		display: table;
		margin: 0 auto;
		border: 1px solid #d6d6d6;
		padding: 30px 20px;
	}
	
	.find_form table {
		margin-top: 20px;
	}
	
	.find_form table tr {
		height: 100px;
		width: 400px;
	}
	
	.find_form table tr th {
		width: 100px;
		height: 50px;
		color: #ccccc;
		text-align: left;
	}
	
	.find_form table input {
		width: 300px;
		height: 50px;
		border: 1px solid #d6d6d6;
	}
	
	.find_form a {
		display: block;
		widows: 400px;
		height: 50px;
		background-color: black;
		color: white;
		line-height: 50px;
		
	}
	

</style>
</head>
<body>
<div class="find_form">
	<h4>비밀번호 찾기</h4>
	<form method="post" action="find_pw">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="m_id"/></td>
			</tr>
			<tr>
			<th>이메일</th>
			<td><input type="text" name="email"/></td>
			</tr>
			<tr>
				<td colspan="2"><a onclick="find_form()">확인</a></td>
			</tr>		
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
	function find_form(){
		var id = $('[name=m_id]').val();
		var email = $('[name=email]').val();
		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if( id == "" || id == null ){
			alert('아이디를 입력해주세요!');
			return;
		}
		
		if( email == "" || email == null ){ 
			alert('이메일을 입력해주세요!');
			return; 
		}	else if ( !reg.test(email) ){
			alert('이메일 형식이 아닙니다. 다시 입력해주세요!');
			return; 
			
		}
		
		$('form').submit();
		
	};
</script>
</html>