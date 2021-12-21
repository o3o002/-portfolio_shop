<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.list_area {
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
	}
	
	.list_area table {
		width: 100%;
		margin: 0 auto;
	}
	
	.list_area table th {
		text-align: center;
		padding: 5px; 10px;
		font-size: 14px;
		opacity: 70%;
	}
	
	.list_area table td {
		font-size: 12px;
		border-bottom: 1px solid #d6d6d6;	
	}
	
	.list_area table tr {
		height: 40px;
	}
</style>
</head>
<body>
<h4>주문목록</h4>
<div class="list_area">
	<table>
		<tr style="background-color:#f5edd7; ">
			<th>주문번호</th>
			<th>총 가격</th>
			<th>지불상태</th>
			<th>배송상태</th>
		</tr>
		<c:forEach items="${list }" var="order">
			<tr>
				<td><a href="detail.od?order_num=${order.order_num }">${order.order_num }</a></td>
				<td><fmt:formatNumber value="${order.totalprice }" pattern="#,###"/>원 </td>
				<td>${order.paymethod }( <c:if test="${order.order_status eq '입금취소' }"><span style="color: red;">${order.order_status}</span></c:if>
				<c:if test="${order.order_status ne '입금취소'}">${order.order_status }</c:if> )</td>
				<td>
				<c:if test="${order.order_status eq '입금취소' }">
				 
				</c:if>
				<c:if test="${order.order_status eq '입금대기' }">
				배송전</c:if>
				<c:if test="${order.order_status eq '결제완료' }">
				<a href="ready()">배송현황</a>
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="btn-box">
	<a class="button_a" href="/pp">홈</a>
</div>
</body>
<script type="text/javascript">
	function ready() {
		alert('아직 준비중입니다!');
	}
</script>
</html>