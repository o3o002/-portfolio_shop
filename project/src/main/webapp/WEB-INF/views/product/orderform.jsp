<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order form</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">

	
	.buylist {
		margin-top: 10px;
	}
	
	.buylist table {
		width: 90%;
		margin: 0 auto;
		
	}
	
	.buylist table th {
		text-align: center;
		padding: 5px 10px; dddddd
		font-size: 14px;
		opacity: 70%;
	}
	
	.buylist table td{
		font-size: 12px;
			
	}
	

	
	#totalPrice_form table {
		font-size: 14px;
		text-align: center;
	}
	
	#orderarea table th {
		width: 120px;
 		border-bottom: 1px solid #d6d6d6;
    padding: 10px;
	}
 	
 	#orderarea table td{
 		border-bottom: 1px solid #d6d6d6;
    border-left: 1px solid #d6d6d6;
    padding: 10px;

	}
	
	
	#orderarea table input[type=number] {
		width: 100px;
    height: 30px;
    padding-left: 10px;
    
	}
	
	#orderarea table input, textarea {
		border-radius: 5px 5px 5px 5px;
		border: 1px solid #cccccc;
	}
	
	.addr input {
		margin-top: 5px;
	}
	
	.addr input:first-child {
		margin-top: 0px;
	}
	
	textarea {
		padding: 8px;
	}
	
	#totalPrice_form table td, #totalPrice_form table th, #pay_form table td, #pay_form table th, #pay_form tfoot {
		border-bottom: 1px solid #d6d6d6;
    border-top: 1px solid #d6d6d6;
    padding: 10px;
	} 
	
	#totalPrice_form table td {
		font-size: 20px;
		font-weight: bolder;
		padding: 40px 10px; 
	}
	
	#totalPrice_form table span {
		font-size: 14px;
		color: gray;
	}
	
	.invisible {
		padding: 20px 20px;
		display: none;
	}
	
	.visible {
		display: block;
	}
	
	.cash_blank{
		width: 300px;
		height: 30px;
	}
	
	.pay_button {
		display: inline-block;
		width: 200px;
		height: 50px;
		line-height: 50px;
		color: white;
		background-color: black;
		
		text-align: center;
		font-size: 18px;
	}

	
	
	
	
</style>
</head>
<body>
<h4>ORDER FORM</h4>
<div class="buylist">
<form method="post" action="productorder.buy">
<div class="title" style="margin-left: 70px;">
	<h5>?????? ??????</h5>
</div>
	<table >
		<tr style="background-color: #f5edd7;'">
				<th>?????????</th>
				<th style="width: 700px;">????????????</th>
				<th>?????????</th>
				<th>??????</th>
				<th>?????????</th>
		</tr>
		
			<c:set var="sum" value="0"/>
			<c:set var="count" value="0"/>
			<c:forEach items="${basketlist }" var="basket">
				<tr>
					<td>?????????</td>
					<td class="left"><a href="go_detail?id=${basket.p_num }"><p style="font-weight: bold;">${basket.p_name }</p></a>
							<p>[?????? : ${basket.color }/${basket.p_size }]</p></td>
					<td><fmt:formatNumber value="${basket.price }" pattern="#,###"/></td>
					<td>${basket.product_count }</td>
					<td><fmt:formatNumber value="${basket.price }" pattern="#,###"/></td>
					<c:set var="sum" value="${sum + ( basket.price * basket.product_count) }"/>
					<c:set var="count" value="${count + basket.product_count }"/>
				</tr>
			</c:forEach>

		
		<tfoot>
		<tr>
			<td colspan="7" style="text-align:right; font-size: 14px;" >
					???<c:out value="${count }"/>??? ?????? <fmt:formatNumber value="${sum }" pattern="#,###"/>???
			</td>
		</tr>
		 </tfoot>
	</table>
	</form>
	</div>

	<div id="orderarea" class="form_area">
		<form method="post" action="orderinfo.buy">
			<div class="title">
			<h5>?????? ??????</h5>
			<p class="require"><i class="require_sing">* </i>??????????????????</p>
			</div>
			<table >
				<tr><th>??????????????? ???<i class="require_sing">* </i></th>
						<td><input type="text" name="sender" class="chk"/></td></tr>
				<tr class="addr"><th >??????<i class="require_sing">* </i></th>
						<td><input type=text  class="chk" name="s_post" class='wpx70' readonly="readonly"/><a class='btn-fill-s senderpost' >????????????</a><br/>
								<input type="text"  class="chk" name="s_addr" readonly="readonly"/><br/>
								<input type="text" class="chk" name="s_addr2"> ???????????????
						</td>
				</tr>
				<tr><th>???????????????<i class="require_sing">* </i></th>
						<td><input type="number" name="s_phone" class="chk" value="010"/>-
								<input type="number" name="s_phone" class="chk" maxlength="4"/>-
								<input type="number" name="s_phone" class="chk" maxlength="4"/>
						</td>
				</tr>
				<tr><th>????????????</th>
						<td><input type="number" name="s_phone2"/>-
								<input type="number" name="s_phone2"/>-
								<input type="number" name="s_phone2"/>
						</td>
				</tr>
				<tr class="fornombmer"><th>????????????<br/> ????????????<i class="require_sing">* </i></th>
					<td><input type="password" class="chk" name="s_order_pw"/> <span class="pw_reg" style="font-weight: bolder;"></span><span> (?????? ???/?????????, ????????? ?????? ?????? 4-12?????? )</span></td>
				</tr>
				<tr class="fornombmer"><th>????????????<br/> ???????????? ??????<i class="require_sing">* </i></th>
					<td><input type="password" class="pw_chk" name="order_pw_check" class="check"/><span id="order_pwchk"></span></td>
				</tr>
			</table>
			
			<div class="title">
			<h5>?????? ??????</h5>
			<p class="require"><i class="require_sing">* </i>??????????????????</p>
			</div>
			<table>
				<tr><th>???????????????</th>
						<td><label><input type="radio" name="paper" value="same"/> ???????????? ?????? </label>
								<label><input type="radio" name="paper" value="deiffer" checked/> ????????? ?????????</label>
						</td>
				</tr>
				<tr><th>???????????? ???<i class="require_sing">* </i></th>
						<td><input type="text" class="chk" name="recipient"/></td></tr>
			
			<tr class="addr"><th >??????<i class="require_sing">* </i></th>
						<td><input type=text  name="r_post" class='wpx70 chk' readonly="readonly"/><a class='btn-fill-s senderpost'>????????????</a><br/>
								<input type="text" name="r_addr" readonly="readonly" class="chk"/><br/>
								<input type="text" name="r_addr2" class="chk" > ???????????????
						</td>
				</tr>
				<tr><th>???????????????<i class="require_sing">* </i></th>
						<td><input type="number" class="chk" name="r_phone" value="010"/>-
								<input type="number" class="chk" name="r_phone" maxlength="4"/>-
								<input type="number" class="chk" name="r_phone" maxlength="4"/>
						</td>
				</tr>
				<tr><th>????????????</th>
						<td><input type="number" name="r_phone2"/>-
								<input type="number" name="r_phone2"/>-
								<input type="number" name="r_phone2"/>
						</td>
				</tr>
				<tr><th>???????????????</th>
						<td>
							<textarea rows="5" cols="50"></textarea>
						</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="totalPrice_form" class="form_area">
		<div class="title">
		<h5>?????? ??????</h5>
		</div>
		<table>
			<tr><th>??? ?????? ??????</th>
					<th>??????/?????? ??????</th>
					<th>??? ?????? ??????</th>
			</tr>
			<tr>
				<td><fmt:formatNumber value="${sum }" pattern="#,###"/><span>???</span></td>
				<td><c:if test="${sum >= 50000}">
					+ 0<span>???</span>
				</c:if>
				<c:if test="${sum < 50000 }">
				 + 2,500<span>???</span>
				<c:set var="sum" value="${sum + 2500 }"/>
				</c:if>
				</td>
				<td>
				= <fmt:formatNumber value="${sum }" pattern="#,###"/><span>???</span>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="pay_form" class="form_area">
		<div class="title">
			<h5>????????????</h5>
		</div>
			<table>
					<tr>
						<th>????????????</th>
						<td><input type="radio" name="paymethod" value="???????????????" checked="checked"/>???????????????
								<input type="radio" name="paymethod" value="???????????????"/>??????????????? 
								<input type="radio" name="paymethod" value="???????????????">??????????????? 
								<input type="radio" name="paymethod" value="???????????????"/>??????????????? 
								<input type="radio" name="paymethod" value="????????????"/>???????????? 
						</td>
					</tr>
				
				
					<tr>
						<td id="paymethod_area" colspan="3">
							<!-- ??????????????? -->
							<div id="cash">
								<table>
								<tr><th><i class="require_sing">* </i>????????????</th>
										<td><input type="text" name="cash_name" class="cash_blank"/>
								</tr>
								<tr><th><i class="require_sing">* </i>????????????</th>
										<td><select name="cash_bank" class="cash_blank" >
												<option value="no" selected="selected">::???????????????::</option>
												<option value="NH">??????:1234-56789</option>
												<option value="KB">??????:1234-56789</option>
										</select></td>
								</tr>
							</table>		
						</div>
						
						<!-- ????????? ????????? ???????????? -->
						<div id="naver_pay" class="invisible">
								<table>
									<tr><th></th>
									<th>????????? ????????? ???????????? </th></tr>
								</table>
						</div>
						
						<!-- ????????? ????????? ???????????? -->
						<div id="kakao_pay" class="invisible">
								<table>
									<tr><th></th>
										<td>????????? ????????? ???????????? </td>
									</tr>
								</table>
						</div>			
						
						<!-- ??????????????????. -->
						<div id="phone_pay" class="invisible">
							<table>
								<tr><th></th>
										<td>??????????????????. </td>
								</tr>
							</table>
						</div>
						
						<div id="card_pay" class="invisible">
							<table>
								<tr><th></th>
										<td>??????????????????. </td>
								</tr>
							</table>
						</div>
						
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td>
						<a class="pay_button" onclick="go_pay()">
						<span><fmt:formatNumber value="${sum }" pattern="#,###"/>???</span>
						???????????? </a>
						</td>
					</tr>
				
			</table>
	</div>
	
</body>
<script type="text/javascript" src="js/ordercheck.js"></script>
<script type="text/javascript">

$('input[name=paper]').on('click',function(){
	
	if($(this).val() == 'same'){
		
		$('input[name=recipient]').val( $('input[name=sender]').val() );
		$('input[name=r_post]').val( $('input[name=s_post]').val() );
		$('input[name=r_addr]').val( $('input[name=s_addr]').val() );
		$('input[name=r_addr2').val( $('input[name=s_addr2]').val() );
		
		$('input[name=r_phone]').eq(0).val( $('input[name=s_phone]').eq(0).val() );
		$('input[name=r_phone]').eq(1).val( $('input[name=s_phone]').eq(1).val() );
		$('input[name=r_phone]').eq(2).val( $('input[name=s_phone]').eq(2).val() );
		
		$('input[name=r_phone2]').eq(0).val( $('input[name=s_phone2]').eq(0).val() );
		$('input[name=r_phone2]').eq(1).val( $('input[name=s_phone2]').eq(1).val() );
		$('input[name=r_phone2]').eq(2).val( $('input[name=s_phone2]').eq(2).val() );
		
		$('input[name=recipient]').prop('readonly', 'readonly');
		$('input[name=r_post]').prop('readonly', 'readonly');
		$('input[name=r_addr]').prop('readonly', 'readonly');
		$('input[name=r_addr2]').prop('readonly', 'readonly');
		$('input[name=r_phone]').prop('readonly', 'readonly');

	} else {
		
		$('input[name=recipient]').prop('readonly', false);
		$('input[name=r_post]').prop('readonly', false);
		$('input[name=r_addr]').prop('readonly', false);
		$('input[name=r_addr2]').prop('readonly', false);
		$('input[name=r_phone]').prop('readonly', false);
		
	}
	

});


$('.senderpost').on('click', function(){
	
	daum_post($(this));
	
});

function daum_post(post){
	
	
	new daum.Postcode({
	    oncomplete: function(data) {
				post.prev().val( data.zonecode );			
				var addr = data.userSelectedType == 'R' ? data.roadAddress : data.jibunAddress
				post.next().next().val( addr );
	    }
	}).open();
	
};

$('input[name=s_order_pw]').on('change', function(){
	
	var reg = /^[A-za-z0-9]{4,12}$/;
	var pw = $(this).val();
	
	$('#order_pwchk').text(' ??????????????? ???????????? ????????????. ');
	if( !reg.test(pw) ){ 
		$(this).next().text('?????? ??? ??? ?????? ???????????? ?????????.').css('color', 'red'); 
 } else { $(this).next().text('?????? ????????? ???????????? ?????????.').css('color', 'black');
	}
});

$('input[name=order_pw_check]').on('change',function(){
	if( $(this).val() == $('input[name=s_order_pw]').val() ) {
		$('#order_pwchk').text(''); 
		$(this).addClass('checked');
		$(this).removeClass('check');
	} else{
		$('#order_pwchk').text(' ??????????????? ???????????? ????????????.');
		$(this).addClass('check');
		$(this).removeClass('checked');
	}
});

$('input[name=paymethod]').on('click',function(){

	var indx = $(this).index();
	var paymethod_area = $('#paymethod_area div').eq(indx);
	
	paymethod_area.removeClass('invisible');
	$('#paymethod_area div').not(paymethod_area).addClass('invisible');
	
	
	
});

</script>

</html>