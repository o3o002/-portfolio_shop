<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mypage_area {
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
	
	.mypage_area table {
		width: 100%;
		margin: 0 auto;
		margin-top: 20px;
		font-size: 12px;
		color: gray;
		border-top: 3px solid black;
		border-bottom: 1px solid #CCCCCC;
		 
	}
	
	.mypage_area table tr th {
		width: 150px;
		border-left: 1px solid #CCCCCC;
		border-right: 1px solid #CCCCCC;
		height: 100px;
		text-align: center;
		margin-left: 0px;
		margin-right: 0px;
		
	}
	
	.mypage_area table tr th:first-child {
	border-right: none;
	}

	.mypage_area table tr th:last-child {
	border-left: none;
	}
	
	.mypage_area table tr th a p:first-child {
	font-size: 16px;
	font-weight: bolder;
	color: black;
	
	}
	
	.mypage_area table tr th a:hover {
	opacity: 70%;
	}
	
	.order tr th{
		font-size: 16px;
		font-weight: bold;
		color: black;
		
	}
	
	.order tr th:nth-child(2) {
	border-right: none;
}

	
</style>
</head>
<body>
<h4>MY PAGE</h4>
<div class="mypage_area">
	<table>
			<tr>
				<th><a href="orderlist.od"><p>O R D E R</p>
							<p>주문내역조회</p></a></th>
				<th><a href="modify.me"><p>P R O F I L E</p>
							<p>회원정보수정</p></a></th>
				<th><a href="qalist.me"><p>B O A R D</p>
							<p>내게시물</p></a></th>
			
			</tr>
	</table>
	
	<div class="title">
		<h5>나의 주문처리 현황</h5>
	</div>
	
	<table class="order">
		<tr>
			<th>입금전
					<p>${ordercount }</p>
			</th>
			<th>배송준비중
					<p>0</p></th>
			<th>배송완료
			<p>0</p></th>
			<th>
				<p>취소 : ${cancelcount }</p>
				<p>교환 : 0</p>
				<p>환불 : 0</p>
			</th>
		</tr>
		
	
	</table>
</div>
</body>
</html>