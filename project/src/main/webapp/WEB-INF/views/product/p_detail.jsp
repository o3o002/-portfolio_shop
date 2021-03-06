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
</style>
<body>
	<div style="display:table; margin: 0 auto;" class='detail_top'>
			<div class='tumb'>
				<a><img src="<spring:url value='${pd.filepath }'/>" width="600" height="700" onerror="this.style.display='none'"/></a>
			</div>
			
			<div class='item_info'>
					<table>
						<tr><th style="font-size: 20px; font-weight: bolder;">${pd.p_name }</th></tr>
						<tr><td colspan="2">${pd.summary }</td></tr>
						<tr><th>??????</th>
								<td><fmt:formatNumber value="${pd.price }"/>???</td></tr>
						<tr><th>?????????</th>
								<td>${pd.price / 100 }</td></tr>
						<tr><th>???</th>
								<td><select name="color" >
											<option value="none">??????</option>
											 
											<c:forEach items="${colorlist }" var="color">
												<option value="${color}">${color }</option>
											</c:forEach>
											
										</select></td></tr>
						<tr><th>?????????</th>
								<td><select name="p_size">
												<option value="none" class="no added">??????</option>
										</select></td></tr>
					
					</table>
					<div class='totalProducts' style="display: none">
						<form id="basket" method="post" action="basketInsert.buy" >
							<input type="hidden" name="p_name" value="${pd.p_name }"/>
							<input type="hidden" name="p_num" value="${pd.p_num}"/> 
							<input type="hidden" name="m_id" value="${loginInfo.m_id }"/>
							<input type="hidden" name="clientip" value="${clientip }"/>
							<input type="hidden" name="price" value="${pd.price }"/>
			
							<table id='product_option' style="font-size: 14px;">	
									<tfoot>				
									<tr><td colspan="4"><p>??? ?????? : 00???</p></td></tr></tfoot>
							</table>							
						</form>
						
					</div>
					<div class='buy_btn'>
							<a onclick='buynow()'>BUY NOW</a>
							<a onclick='tocart()'>ADD TO CART</a>
							<a>WISHLIST</a>
					</div>
					<a href="write.rv?p_num=${pd.p_num }">review??????</a>
			</div>
			
			<div>
				${pd.content }
			</div>
	
	</div>
	<div class="block" style="clear: both;"></div>

<div id="review_summary_form">
<hr/>
<h4>REVIEW</h4>
	<table>
		<tr>
			<th class="textcenter"><div class="box">
				${totalgrade }???
			</div></th>
			<td class="totalstar ">
			<fmt:formatNumber type="number" maxFractionDigits="0"  value="${totalgrade}" var="total"/>
				<c:forEach step="1" begin="1" end="${total}">
				<i class="fas fa-star"></i>
				</c:forEach>
			</td>
		</tr>
	</table>
</div>

</body>
<script type="text/javascript">
$('#product_option').on('DOMSubtreeModified', function() {
    
	var c_total = $('#product_option tr').length;
	var sum = 0;
	
	for(var i = 0; i < c_total - 1; i++){
		sum += parseInt( $('.c_total').eq(i).text() );
	}
	
	$('#product_option tfoot tr td p ').text("??? ?????? : " + sum + "???");
	
	//$('.??????????????? ????????? ?????? ID').text( $('.?????? ?????? ?????? ????????? ?????? ID').text() );
  });


$(document).on("click", ".x", function(){
	var idx = $('.x').index(this);
	
	$('.totalProducts > form > table > tr').eq(idx).remove();
	
});

$('.c_pd').on('change', function(){
	if( $('.c_pd').val() < 0){
		alert('?????? ????????? ?????? 1??? ?????? ??????????????? ?????????.');
		return false;
	};
});


$(document).on("click", ".minus_c", function(){
	
	var count =	$('.plus_c').index(this);
	var totalc = $('.c_total').eq(count);
	var price = String( ${pd.price} );
	
	if( $(this).siblings('input').val() == 1 ) {
		alert('????????? ?????? 1??? ?????? ??????????????? ?????????.');
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
		
		alert('????????? ???????????????!');
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
		alert('????????? ???????????????!');
	}

}



$('select[name=p_size]').on('click', function(){
	if( $('select[name=color]').val() == 'none' ){
		alert('?????? ????????? ?????? ???????????????');
	}
});

$('select[name=p_size]').on('change', function(){
	
	var tag = '';
	
	if( $(this).val().search("??????") > 0){
		alert('???????????? ????????? ????????? ????????????');
		$('select[name=p_size]').val('none').prop('selected', true);
		
		return false;
	};
	
	
	
	$('.product_option>p:last').text( $('select[name=color]').val() + "/" + $('select[name=p_size]').val() );
	
	tag += '<tr><td><p style="font-weight: bolder;">' + $('select[name=color]').val() + '/' + $('select[name=p_size]').val() + '</p></td>';
	tag += '<td class="pd_c valid"><a class="plus_c">+</a><input class="c_pd" name="product_count" type="number"  value="1"/><a class="minus_c">-</a></td> ';
	tag += '<td class="textright"><p class="c_total" name="pd_price">${pd.price}</p></td><td class="textright"><p><a class="x">X</a></p></td></tr>';
	
	tag +='<input type="hidden" name="p_size" value="' + $('select[name=p_size]').val() + '"/>';
	tag +='<input type="hidden" name="color" value="' + $('select[name=color]').val() + '">';
	
	$(".totalProducts>form>table").append( tag );
	
	
	$('.totalProducts').css('display', 'block');
	
	
	
	
	
	
});

	$('select[name=color]').on('change', function(){
		
		$('select[name=p_size]').children('option:not(:first)').remove();

		if( $(this).val() == 'none' ) {
			alert("?????? ????????? ??????????????? ")
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

$('.review_reply_area').on('click', function(){
	console.log($(this).index() )	
});

$('.review_view').on('click', function(){
	var idx = $('.review_view').index(this);
	
	if( !$(this).hasClass('view') ){
	
	$(this).prev().removeClass('collspan');
	$(this).text('?????????');
	$(this).addClass('view');
	
//	$('.review_reply_area').eq(idx).css('display', 'block');
	$('.review').eq(idx).css('display', 'block');

//	str = review_reply_area()
//	str +="<li><input type='text' name='content' placeholder='????????? ??????????????? :)'/><a class='btn' onclick='repley_insert()'>??????</a></li>"
//	
	
//	$('.review_reply_area').eq(idx).css('border', '1px solid #d6d6d6');
	
	} else {
		$(this).text('?????????');
		$(this).removeClass('view');
		$(this).prev().addClass('collspan');
//		$('.review_reply_area').eq(idx).css('display', 'none');
		$('.review').eq(idx).css('display', 'none');
//		$('.review_reply_area').eq(idx).text('');
//	$('.review_reply_area').eq(idx).css('border', 'none');
		
	}
	
});


function repley_insert() {
	
	if( ${empty loginInfo} ) {
		alert('???????????? ????????? ????????? ???????????? ??? ????????????.');
		location.href="login";
	} else {
		if ( $('input[name=content]').val().length < 5 ) {
			alert('?????? 5?????? ????????? ??????????????????!');
		} else {
		$('.review').submit();
			
		}
	}
	
}

</script>
</html>