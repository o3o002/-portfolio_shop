<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문배송조회</title>
<style type="text/css">
	.login_area {
		display: table;
		margin: 0 auto;
		border: 1px solid #d6d6d6;
		padding: 30px 20px;
		margin-top: 20px;
	}
	
	.login_area table {
		font-size: 12px;
		color: gray;
	}
	
	.login_area table tr {
		height: 60px;
		width: 300px;
	}
	
	.login_area table input {
		height: 40px;
		width: 300px;
		border: 1px solid #d6d6d6;
		margin-left: 10px;
	}
</style>
</head>
<body>
<h4>주문배송 조회</h4>
<div class="login_area">
	<form method="post" action="detail.od">
	<table >
		<tr>
			<th>주문번호</th>
			<td><input type="text" name="order_num" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw"/></td>
		</tr>
	</table>
	</form>
	<div class="btn-box">
		<a class="button_a" onclick = "order()">주문배송 조회</a>
		<a class="button_a" href="/pp">취소</a>
	</div>	
</div>
</body>
<script type="text/javascript">
	function order() {
	var order_num = $('input[name=order_num]').val();
	var pw = $('input[name=pw]').val();
	
	
	if( order_num == '' || pw == '') {
		alert('주문번호와 비밀번호를 입력하세요!!!');
	} else {
		
		$.ajax({
			
			type: 'post',
			url : 'nomember_detail.od',
			data : {order_num, pw},
			success : function(response){
				if( response > 0) {
					$('form').submit();
				} else {
					alert('입력하신 정보가 틀립니다! \n다시 입력해주세요!');
				}
			},
			
			error(req, text) {
			alert(text + ": " + req.status);
			}
		}); //ajax
	}
		
	
	}

</script>
</html>