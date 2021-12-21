<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.order_area {
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
	}
	
	.order_area table {
		width: 100%;
		margin: 0 auto;
		font-size:12px;
		color: gray;
		border-top: 3px solid black;
		text-align: left;
	
		
	}
	
	.order_area table tr td{
		width: 30%;
	}
	.order_area table tr th {
		width:20%;
		height: 50px;
		text-align: left;
		margin-left: 0px;
		margin-right: 0px;
		font-weight: bolder;
		padding-left: 10px;
		color: black;
		
	}
	

	.order_area table:last-child {
		text-align: center;
}

.order_area table:last-child tr:last-child {
	text-align: center;
}

	
</style>
</head>
<body>
<h4>주문내역 정보</h4>
<div class='order_area'>
	<table>
		<tr><th colspan="4" style="background-color: #f5edd7; text-align: center">${deliver.m_id } 님의 주문 내역서</th></tr>
		<tr>
			<th>주문번호</th>
			<td>${order.order_num }</td>
			<th>총 구매 가격</th>
			<td><fm:formatNumber value="${order.totalprice }" pattern="#,###"/>원 </td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${deliver.s_phone}</td>
			<th>입금방법</th>
			<td>${order.paymethod }(<span style="color:red;">${order.order_status }</span>)</td>
		</tr>
		<tr>
			<th>수령자</th>
			<td>${deliver.recipient }</td>
			<th>배송지</th>
			<td>${deliver.r_post } ${deliver. r_addr} ${deliver. r_addr2 }</td>
		</tr>
	</table>
</div>
<div class='order_area'>	
	<table>
		<tr style="background-color: #f5edd7">
				<th>상품명</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>금액</th>
				</tr>
			<c:forEach items="${product }" var="product">
				<tr>
				<td>${product.p_name }</td>
				<td>${product.p_size }/${product.color }</td>
				<td>${product.product_count }개</td>
				<td><fm:formatNumber value="${product.product_count * product.price }" pattern="#,###"/>원</td>
				</tr>			
			</c:forEach>
		<tfoot>
			<tr>
				<th>지불상태</th>
				<th>${order.order_status }</th>
				<th>배송상태</th>
				<th>
				<c:if test="${empty deliver.tracking_num }">
					배송전
				</c:if>
				</th>
			</tr>
		</tfoot>
	</table>
</div>	

<div class="btn-box">
	<a class="button_a" href="/pp">홈</a>
	<c:if test="${order.order_status ne '입금취소' }">
	<a class="button_a" onclick="order_cancel()" >주문취소</a>
	</c:if>
</div>
</body>
<script type="text/javascript">
	function order_cancel() {
		if ( confirm('정말로 주문을 취소 하시겠습니까? ') ) {
			console.log( ${order.order_num } );
			location.href="cancle.od?order_num=" + ${order.order_num};
		} else {
			return;
		}
		
	}
</script>
</html>