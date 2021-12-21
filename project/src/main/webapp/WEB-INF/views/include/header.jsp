<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/f350b699f8.js" crossorigin="anonymous"></script>
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
	padding-bottom: 15px;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
}

#login {
	width: 80%;
	margin:0 auto;
	padding-left: 48%;	
	margin-bottom: 10px;
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
	padding-left: 70px;
}

.menu ul li:nth-child(2){
	padding-left: 30px;
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

.menu ul li:first-child, .menu ul li:last-child {
	display: none;
}

.fa-shopping-cart {
	font-size: 18px;
}
</style>
</head>
<body>
<header style="text-align:center; font-family: 'Do Hyeon', sans-serif;">
	
	<div class='logo'>
	<h2><a href="/pp">SHOPP LOGO</a></h2>
	</div>
<!-- 	<a class="menu_icon"><i class="fas fa-bars"></i></a>  -->
<div id="login" class='loginInfo'>
		<ul>
		<c:if test="${empty loginInfo }">			
			<li><a href="login">로그인</a></li>
			<li><a href="member">회원가입 </a></li>
		</c:if>
		<c:if test="${!empty loginInfo }">
			<li><strong>${loginInfo.m_name }님</strong></li>
			<li><a class='btn-fill-s' href='logout'>로그아웃</a></li>
		</c:if>
		<li><a onclick="myfage()">마이페이지</a></li>
		<li><a href="basketlist.buy">장바구니</a></li>
		<li><a onclick="order()">주문배송</a></li>
		<c:if test="${loginInfo.admin eq 'Y' }">
		<li><a href="admin.ad">관리자페이지</a></li>
		</c:if>
		</ul>
	</div>
	
	<div class='category menu ' >
		<ul>	
			<li><strong><a href="/pp">SHOPP LOGO</a></strong></li>
			<li><a href='list.pd?itemType1=outer'>OUTER</a></li>
			<li><a href='list.pd?itemType1=top'>TOP</a></li>
			<li><a href='list.pd?itemType1=shirts'>BLOUSE/SHIRTS</a></li>
			<li><a href='list.pd?itemType1=knit'>KNIT/CARDIGAN</a></li>
			<li><a href='list.pd?itemType1=dress'>DRESS</a></li>
			<li><a href='list.pd?itemType1=bottom'>BOTTOM</a></li>
			<li><a href='list.pd?itemType1=accessory'>ACCESSORY</a></li>
			<li><a href='list.pd?itemType1=sale'>SALE</a></li>
			<li><a href='list.bo' class='${category eq "bo" ? "active" : " " }'>게시판 </a></li>		
			<li><a><i class="fas fa-shopping-cart"></i></a></li>
		</ul>
	</div>


</header>
</body>
<script type="text/javascript">
	function order() {
		if( ${empty loginInfo} ) {
			location.href = "orderlogin.od";
		} else {
			location.href = "orderlist.od";
		}
		
	}

	function myfage() {
		
		if ( ${empty loginInfo} ) {
			alert('로그인을 먼저 해주세요!');
			location.href = "login";
		}else {
			location.href = "mypage";
		}
	}
	
	var didScroll;
	var lastScrollTop = 0;
	var delta = 5; //동작이 구현이 시작되는 위치? 
	var naverbarHeight = $('.category').outerHeight();
	
	$(window).scroll(function(event){
		didScroll = true;
	});
	
	setInterval(function(){
		if (didScroll) {
			hasScrolled();
			didScroll =false;
		}
	}, 250);
	
	function hasScrolled(){
		var st = $(this).scrollTop();
		console.log(st);
		
		if( Math.abs(lastScrollTop -st) <= delta)
			return;
		
		if(st > lastScrollTop && st > naverbarHeight){
			$('.category').addClass('scroll_fixed');
			$('.menu ul li:first-child').css('display', 'block');
			$('.menu ul li:last-child').css('display', 'block');
		} else {
			if(st + $(window).height() < $(document).height()) {
				$('.category').removeClass('scroll_fixed')
			$('.menu ul li:first-child').css('display', 'none');
			$('.menu ul li:last-child').css('display', 'none');
			}
		}
		
		lastScrollTop = st;
	};
</script>
</html>