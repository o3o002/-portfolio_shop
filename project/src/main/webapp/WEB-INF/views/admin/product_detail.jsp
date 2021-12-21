<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

	.tumb, .item_info {
		float: left;
	}
	
	.tumb a {
		display: inline-block;
		width: 600px;
		height: 700px;
		border: 1px solid red;
		
		margin-left: 20px;
	}
	
	.item_info table{
		width: 400px;
		text-align: left;
		
		font-size: 12px;
		margin-left: 50px;
		font-size: 14px;
	
	}
	
	.item_info table tr td {
		padding: 5px 10px;
	}
	
	.item_info table select {
		width: 200px;
		height: 25px;
		padding-left: 5px;
	}
	
	.totalProducts {
		margin-top: 20px;
		
	}
	.buy_btn {
		text-align: left;
		margin-left: 50px;
		margin-top: 20px;
	}
	
	.buy_btn a {
		display: inline-block;
		width: 200px;
		height: 50px;
		margin-left: 8px;
		margin-top: 10px;
		text-align: center;
		line-height: 50px;
		
		font-size: 14px;
		border: 1px solid gray;
	}
	
	.buy_btn a:first-child {
		display: block;
		width: 410px;
		height: 50px;
		background-color: black;
		color: white;
		text-align: center;
		
		font-size: 14px;
		font-weight: bolder;
		line-height: 50px;
	}
	
	.totalProducts table a {
		font-size: 15px;
		text-align: center;
	}
	
	.totalProducts table input[type=number] {
			width: 35px;
			height: 25px;
			text-align: center;
			border: none;
			padding-left: 10px;
			
	}
	
	.pd_c a {
		display: inline-block;
		width: 35px;
		height: 25px;
		background-color: black;
		color: white;
		font-size: 15px;
	
		
	}
	
	.totalProducts tfoot {
		text-align: right;
	}
	
	#review_summary_form {
		width: 100%;
		margin-top: 50px;
	}
	
	#review_summary_form table {
		width: 70%;
		margin: 0 auto;
		font-size: 50px;
		border: 1px solid #d6d6d6;	
		padding: 20px 30px;
		margin-top: 20px;
		margin-bottom: 30px;
	}
	
	.box {
		width: 200px;
		height: 75px;
		background-color: black;
		color: white;
	}
	
	.totalstar{
		font-size: 60px;
	}
	
	.reviewlist {
		width: 70%;
		margin: 0 auto;
		text-align: left;
		color: gray;
	}
	
	.reviewlist p {
		text-align: right;
		color:#CCCCCC;
		margin-top: -20px;
	}
	
	.reviewlist p span {
		color: black;
		font-weight: bolder;
	}
	
	.blank {
		height: 20px;
	}
	
	.collspan {
	display: inline-block;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	width: 250px;
	}
	
	.review_reply_area {
		padding: 5px 10px;
		font-size: 12px;
	
	}
	
	.review input {
		border: 1px solid #d6d6d6;
		width: 90%;
	}
	
	.review {
		display: none;
	}
	
	.btn {
		display: inline-block;
		width: 10%;
		height: 30px;
		padding-left: 5px;
		line-height: 30px;
	}
	
	.content {
		width: 80%;
		margin: 0 auto;
		margin-top: 30px;
	}
	

</style>
<body>
	<div style="display:table; margin: 0 auto; margin-top: 40px;" class='detail_top'>
			<div class='tumb'>
				<a>사진</a>
			</div>
			
			<div class='item_info'>
					<table>
						<tr><th style="font-size: 20px; font-weight: bolder;">${pd.p_name }</th></tr>
						<tr><td colspan="2">${pd.summary }</td></tr>
						<tr><th>가격</th>
								<td><fmt:formatNumber value="${pd.price }"/>원</td></tr>
						<tr><th>적립금</th>
								<td><fmt:formatNumber value="${pd.price / 100 }" pattern="#"/>point</td></tr>
						<tr><th>색</th>
								<td><select name="color" >
											<option value="none">선택</option>
											 
											<c:forEach items="${colorlist }" var="color">
												<option value="${color}">${color }</option>
											</c:forEach>
											
										</select></td></tr>
						<tr><th>사이즈</th>
								<td><select name="p_size">
												<option value="none" class="no added">선택</option>
										</select></td></tr>
					
					</table>
					<div class='buy_btn'>
							<a href="#">BUY NOW</a>
							<a href="#">ADD TO CART</a>
							<a>WISHLIST</a>
					</div>
			</div>
	
	</div>
	<div class="block" style="clear: both;"></div>
	<div style="margin-top: 50px;"><h4>DETAIL</h4></div>
	<div class="content">
		${pd.content }
	</div>
	
	<a href="">상품리스트 보기</a>
	<a href="">내용 수정하기</a>
</body>
<script type="text/javascript">
$('#product_option').on('DOMSubtreeModified', function() {
    
	var c_total = $('#product_option tr').length;
	var sum = 0;
	
	for(var i = 0; i < c_total - 1; i++){
		sum += parseInt( $('.c_total').eq(i).text() );
	}
	
	$('#product_option tfoot tr td p ').text("총 합계 : " + sum + "원");
	
	//$('.입력하려는 클래스 또는 ID').text( $('.입력 값이 있는 클래스 또는 ID').text() );
  });


$(document).on("click", ".x", function(){
	var idx = $('.x').index(this);
	
	$('.totalProducts > form > table > tr').eq(idx).remove();
	
});

$('.c_pd').on('change', function(){
	if( $('.c_pd').val() < 0){
		alert('해당 상품은 최소 1개 이상 주문하셔야 합니다.');
		return false;
	};
});


$(document).on("click", ".minus_c", function(){
	
	var count =	$('.plus_c').index(this);
	var totalc = $('.c_total').eq(count);
	var price = String( ${pd.price} );
	
	if( $(this).siblings('input').val() == 1 ) {
		alert('상품을 최소 1개 이상 선택하셔야 합니다.');
		return false;
	}
	var c = parseInt ( $(this).siblings('input').val() ) - 1;
	
	var price = String ( ${pd.price });
	var cvalue = $('.plus_c').eq(count).siblings('input');

	
	
	cvalue.val( c );
	totalc.text ( c * parseInt(price) );
	
});



$(document).on("click", ".plus_c", function(){
	
	var count =	$('.plus_c').index(this);
	var totalc = $('.c_total').eq(count);
	var price = String( ${pd.price} );
	var c = parseInt ( $(this).siblings('input').val() ) + 1;
	
	var price = String ( ${pd.price });
	var idx = $('.plus_c').eq(count).siblings('input');

	
	
	idx.val( c );
	totalc.text ( c * parseInt(price) );
	
});


function tocart(){
	
	//var id =  $('input[name=m_id]').val();
	if( $('.pd_c').hasClass('valid') ) {
		$('#basket').submit();	
	} else {
		
		alert('옵션을 선택하세요!');
	}
		
//		if( $('#product_option tr').length < 1 ){
//		}
		//	basketInsert.buy
};

function buynow(){
	
	
	if( $('.pd_c').hasClass('valid') ) {
		$('#basket').attr('action', 'ordernow.buy');
		$('#basket').submit();
	} else {
		alert('옵션을 선택하세요!');
	}

}



$('select[name=p_size]').on('click', function(){
	if( $('select[name=color]').val() == 'none' ){
		alert('상품 색상을 먼저 선택하세요');
	}
});

$('select[name=p_size]').on('change', function(){
	
	var tag = '';
	
	if( $(this).val().search("품절") > 0){
		alert('선택하신 상품은 재고가 없습니다');
		$('select[name=p_size]').val('none').prop('selected', true);
		
		return false;
	};
	
	
	

	$('select[name=color]').on('change', function(){
		
		$('select[name=p_size]').children('option:not(:first)').remove();

		if( $(this).val() == 'none' ) {
			alert("상품 색상을 선택하세요 ")
			return false;
		}
		
		
//		var alldata = {"color" : $(this).val(), "p_num" : ${pd.p_num} }
//		console.log(alldata);
		
		$.ajax({
			url: 'productSize',
			data: { color : $(this).val(), id : ${pd.p_num} },
			success: function( response ){
				 sizelist(response);
			},
			error(req, text) {
				alert(text + ":" + req.status);
			}
			
		});
		
	});
	
function sizelist( list ){
  
  var text
	var selectsize = $('select[name=p_size]');
	

	for(var i = 0; i < list.length; i++){
		
		text += "<option value='" + list[i] + "'>" + list[i] + "</option>";
	}
	
	selectsize.append( text );
	
};	

</script>
</html>