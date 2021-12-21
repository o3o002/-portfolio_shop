<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
	
	.chk_box a {
		border: 1px solid gray;
		background-color: #f5edd7;
		padding: 2px 3px;
		font-size: 10px;
	}
	
	.baskettotalprice tr td {
		font-weight: bolder;
		font-size: 20px;
	}

</style>

<body>
<h4>BASKET</h4>
<div class="chk_box">
	<input type="checkbox" name="all_chk"/> 전체선택
	<a onclick="check_delete()">삭제</a>
</div>

<div class="block"></div>
<div class='boder1'></div>
<div class='basketlist'>
<form method="post" action="basketdelet.buy">
	<table >
		<tr style="background-color: #f5edd7;'"><th style="width: 65px;">선택</th>
				<th>이미지</th>
				<th style="width: 700px;">상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>적립금</th>
		</tr>
		<c:if test="${empty basketlist }">
		<tr>
			<td colspan="7"> 장바구니 상품이 없습니다. </td>
		</tr>
		</c:if>
		<c:if test="${!empty basketlist }">
			<c:set var="sum" value="0"/>
			<c:set var="count" value="0"/>
			<c:set var="num" value="0"/>
			<c:forEach items="${basketlist }" var="basket">
				<tr><td><input type="checkbox" name="basketcheck" />
								<input type="hidden" name="list[${num }].p_num" value="${basket.p_num }"/>
								<input type="hidden" name="list[${num }].color" value="${basket.color }"/>
								<input type="hidden" name="list[${num }].p_size" value="${basket.p_size }"/>
								<input type="hidden" name="list[${num }].p_info_no" value="${basket.p_info_no }"/>
								<input type="hidden" name="list[${num }].p_name" value="${basket.p_name }"/>
								<input type="hidden" name="list[${num }].price" value="${basket.price }"/>
								<input type="hidden" name="list[${num }].product_count" value="${basket.product_count }"/>
								
						</td>
					<td>이미지</td>
					<td class="left" ><a href="go_detail?id=${basket.p_num }"><p style="font-weight: bold;">${basket.p_name }</p></a>
							<p>[옵션 : ${basket.color }/${basket.p_size }]</p></td>
					<td><fmt:formatNumber value="${basket.price }" pattern="#,###"/>원</td>
					<td>${basket.product_count }</td>
					<td><fmt:formatNumber value="${basket.price / 10 }" pattern="#"/></td>
					<c:set var="sum" value="${sum + (basket.price * basket.product_count) }"/>
					<c:set var="count" value="${count + basket.product_count }" />
					<c:set var="num" value="${num + 1 }"/>
				</tr>
			</c:forEach>
		</c:if>
		
		<tfoot>
		<tr>
			<td colspan="7" style="text-align:right; font-size: 14px;" >
					총 <c:out value="${count }"/>개 상품 <fmt:formatNumber value="${sum }" pattern="#,###"/>원
			</td>
		</tr>
		 </tfoot>
	</table>
	</form>
	
	<table class="baskettotalprice" style="border-top: 1px solid gray; margin-top: 50px; ">
		<tr>
			<th>총 상품금액</th>
			<th>총 배송비 </th>
			<th width="500px;">결제예정금액</th>
		</tr>
		<tr height="80px;" style="font-size: 20px;">
			<td><fmt:formatNumber value="${sum }" pattern="#,###"/>원</td>
			<td>
				<c:if test="${sum >= 50000 }">
					+0원
				</c:if>
				<c:if test="${sum < 50000 }">
					+2,500원
				<c:set var="sum" value="${sum + 2500 }"/>
				</c:if>
			</td>
			<td>
				=<fmt:formatNumber value="${sum }" pattern="#,###"/>원
			</td>
			
		</tr>
	</table>
	
	<div >
		<a class="button_a" onclick="productAll_order()">전체주문</a>
		<a class="button_a" onclick="prdocut_order()" >선택주문</a>
	</div>
</div>
</body>
<script type="text/javascript">

$('input[name=all_chk]').on('click', function(){
	
	if($(this).is(':checked') ) {
		$('input[name=basketcheck]').prop('checked', true)
	} else {
		$('input[name=basketcheck]').prop('checked', false) 
	}
	
});

function checkindex(){
	var idx = [];
	
	$('input:checkbox[name=basketcheck]').each(function() {
		  if(this.checked){//checked 처리된 항목의 값
				inputchecked = $('input:checkbox[name=basketcheck]').index(this); 
				idx.push(inputchecked);
		  }
		 });
	return idx;
	
}

function check_delete(){
	var deletechoose = confirm('정말로 삭제하시겠습니까? ');
	//var checked = checkindex();
	
	
	if( deletechoose ){
		
		$('input:checkbox[name=basketcheck]').each(function() {
			  if(!this.checked){//checked 처리된 항목의 값
				 $(this).closest('tr').remove();
			  }
		 });
		
		$('form').submit();
	}
};

function prdocut_order() {
	var check = confirm('선택하신 상품만 주문하시겠습니까?');
	
	var idx = checkindex();
	if( idx == null || idx == ''){
		alert('선택하신 상품이 없습니다!');
		return;
	} else {
		if( check ){
			
			$('input:checkbox[name=basketcheck]').each(function() {
				  if(!this.checked){//checked 처리된 항목의 값
					 $(this).closest('tr').remove();
				  }
			 });
			
			$('form').attr('action', 'check_order').submit();
		}
	}
};

function productAll_order() {
	if( ${empty loginInfo}) 
		{ $('form').attr('action', 'check_order').submit(); }
	else
		{$('form').attr('action', 'all_order_member').submit();}
}

</script>
</html>