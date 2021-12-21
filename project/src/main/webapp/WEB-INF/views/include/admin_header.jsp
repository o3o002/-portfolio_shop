<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

* {
	box-sizing: border-box;
}
a{
	cursor: pointer;
}
ul {
	list-style: none;
}

.menu {
	width: 80%;
	margin: 0 auto;
	padding-top: 15px;
	padding-left:5%;
	padding-bottom: 15px;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
}

#login {
	width: 80%;
	margin:0 auto;
	margin-bottom: 10px;
	padding-left: 55%;
}

#login ul, .menu ul {
	margin: 0;
	overflow: hidden;
	padding: 0;
	
	
}

#login ul li, .menu ul li {
	float: left;
	padding-left: 15px;
	font-size: 14px;
}

.menu ul li {
	padding-left: 170px;
}


.logo {
	padding-top:50px;
	margin-bottom: 40px;
}

.scroll_fixed{
	background-color: #f5edd7;
	width: 100% !important;
	position: fixed;
	top: 0px;
}

.fa-shopping-cart {
	font-size: 18px;
}

.active {
	font-weight: bolder;
	color: blue;
}
</style>
</head>
<body>
	
	<div class='logo'>
	<h2><a href="/pp">SHOPP LOGO</a></h2>
	</div>
	<!-- 	<a class="menu_icon"><i class="fas fa-bars"></i></a>  -->
	<div id="login" class='loginInfo'>
		<ul>
		<li><strong>${loginInfo.m_name }님</strong></li>
		<li><a class='btn-fill-s' href='logout'>로그아웃</a></li>
		<li><a onclick="order()">홈페이지</a></li>
		<li><a href="admin.ad">관리자페이지</a></li>
		</ul>
	</div>
	
	<div class='category menu' >
		<ul>	
		
			<li><a href='member.ad' class="${category eq 'member' ? 'active' : '' }">회원관리</a></li>
			<li><a href='product.ad'class="${category eq 'product' ? 'active' : '' }">상품관리</a></li>
			<li><a href='order_status.ad'class="${category eq 'money' ? 'active' : '' }">입금관리</a></li>
			<li><a href='deliverlist.ad' class="${category eq 'deliver' ? 'acitve' : '' }">주문/배송관리</a></li>
		</ul>
	</div>
	
</body>
</html>