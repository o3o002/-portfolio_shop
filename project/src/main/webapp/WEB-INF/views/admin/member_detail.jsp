<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.valid { color: green; }
.invalid { color: red; }

.form_area table th {
	width: 120px;
	border-bottom: 1px solid #d6d6d6;
  padding: 10px;
 }
 	
 .form_area table td{
 	 border-bottom: 1px solid #d6d6d6;
   border-left: 1px solid #d6d6d6;
   padding: 10px;
}
	
	
.form_area table input[type=number] {
	width: 100px;
  height: 30px;
  padding-left: 10px;
}
	
.form_area table input, .form_area table select {
	border-radius: 5px 5px 5px 5px;
	border: 1px solid #cccccc;
	}
	
	.addr{
		margin-top: 5px;
	}
	
	.email{
		background-color: #cccccc;
	}
	
	.addr:first-child {
		margin-top: 0px;
	}
	
	.emailchodearea {
		display: none;
	}
	
</style>
<script type="text/javascript" 
src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<h4>REGISTER</h4>
<div class="form_area">
<div class="title">
<h5>기본정보</h5>
<p class="require"><i class="require_sing">* </i>는 필수입력 항목입니다 </p>
</div>
<form method="post" action="member_update.ad">
	<table>
		<tr><th>아이디<i class="require_sing">* </i></th>
			<td><input id="m_id" class="m_id" type="text" name="m_id" value="${member.m_id }" />
			</td>
		</tr>
		<tr><th>닉네임<i class="require_sing">* </i></th>
			<td><input type="text" name="m_name" class='chk' value="${member.m_name }"/></td>
		</tr>
		<tr><th>비밀번호<i class="require_sing">* </i></th>
			<td><input type="text" name="m_pw" class='chk' value="${member.m_pw }"/></td>
		</tr>
		
		<tr>
			<th>이메일<i class="require_sing">* </i> </th>
			<td><input type="text" style="width: 200px;" class="email" name="m_email" value="${member.m_email}" readonly="readonly"/>
		</tr>

		<tr>
			<th>전화번호 </th>
			<td>
				<input type="text" style="width: 200px;" name="m_tel" value="${member.m_tel }"/>
		
			</td>
		</tr>
		<tr>
			<th>주소 </th>
			<td>
			<input type="text" style="width: 100px;" name="post" class="addr" readonly="readonly" value="${member.post }"/>
			<a class=btn-fill-s onclick="daum_post()">우편번호 찾기 </a><br/>
			<input type="text" name="m_addr" readonly="readonly" class="addr" value="${member.m_addr }"/>
			</td>
		</tr>
	</table>
</form>
</div>
<div class="btn-box">
	<a class='button_a' onclick="go_update()">수정하기</a>
	<a class='button_a' onclick="if( confirm('회원을 삭제하시겠습니까?') ) {location.href='member_delet.ad?m_email=${member.m_email}'}">삭제하기</a>
	<a class='button_a' onclick="history.go(-1)">취소</a>
</div>
</body>
<script type="text/javascript" src="js/join.js"></script>
<script type="text/javascript" src="js/doublecheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


function go_update() {
	if( confirm('회원정보를 수정하시겠습니까? ') ){
		$('form').submit();
	}
}





function daum_post() {
	 new daum.Postcode({
	        oncomplete: function(data) {
	           $('[name=post]').val( data.zonecode );
	          var address = data.userSelectedType == 'R' ? data.roadAddress : data.jibunAddress;
	          if(data.buildingName != '') address += '(' + data.buildingName + ')';
	          $('[name=m_addr]').val(address);
	        }
	    }).open();
}


</script>
</html>