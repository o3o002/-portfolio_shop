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
	
	.email, .m_id {
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
<form method="post" action="update.me">
<input type="hidden" name="m_email" class="chk"/>
	<table>
		<tr><th>아이디<i class="require_sing">* </i></th>
			<td><input id="m_id" class="m_id" type="text" name="m_id" value="${loginInfo.m_id }" readonly="readonly"/>
				<div class='valid'>아이디를 입력하세요(영문소문자, 숫자만 입력가능 )</div>
			</td>
		</tr>
		<tr><th>닉네임<i class="require_sing">* </i></th>
			<td><input type="text" name="m_name" class='chk' value="${loginInfo.m_name }"/></td>
		</tr>
		<tr><th>비밀번호<i class="require_sing">* </i></th>
			<td><input type="password" name="m_pw" class='chk'/>
				<div class='valid'>비밀번호를 입력하세요(영문 대/소문자, 숫자를 모두 포함 )</div>
			</td>
		</tr>
		<tr><th>비밀번호 확인<i class="require_sing">* </i></th>
			<td><input class='chk' type="password" name='pw_chk'/>
				<div class='valid'>비밀번호를 다시 입력하세요 </div>
			</td>
		</tr>
	
		<tr>
			<th>이메일<i class="require_sing">* </i> </th>
			<td><input type="text" style="width: 100px;" class="email" name="m_email" value="${email_id }" readonly="readonly"/>
					<input type="text" style='width: 110px;' class="email" name="m_email" value="@${email_domain }" readonly="readonly"/>
		</tr>

		<tr>
			<th>전화번호 </th>
			<td>
				<input type="text" style="width: 80px;" name="m_tel" maxlength="3" value="${tel0 }"/> -
				<input type="text" style="width: 95px;" name='m_tel' maxlength="4" value="${tel1 }"> -
				<input type="text" style="width: 95px;" name='m_tel' maxlength="4" value="${tel2 }"> 
			</td>
		</tr>
		<tr>
			<th>주소 </th>
			<td>
			<input type="text" style="width: 100px;" name="post" class="addr" readonly="readonly" value="${loginInfo.post }"/>
			<a class=btn-fill-s onclick="daum_post()">우편번호 찾기 </a><br/>
			<input type="text" name="m_addr" readonly="readonly" class="addr" value="${loginInfo.m_addr }"/>
			</td>
		</tr>
	</table>
</form>
</div>
<div class="btn-box">
	<a class='button_a' onclick="go_update()">수정하기</a>
	<a class='button_a' onclick="history.go(-1)">취소</a>
</div>
</body>
<script type="text/javascript" src="js/join.js"></script>
<script type="text/javascript" src="js/doublecheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


function go_update() {
	
	if( $('[name=m_name]').val() == ''){
		alert('성명을 입력하세요!');
		$('[name=m_name]').focus();
		
		return;
	}
	
		

	
	if( !item_check( $('[name=m_pw]') ) ) return;
	if( !item_check( $('[name=pw_chk]') ) ) return;
	
	
	$('form').submit();
}

function item_check( tag ){
	var data = join.tag_status( tag );
	
	if( data.code == 'valid'){ 
		return true;
		
	} else {
		alert( '회원가입불가!\n' + data.desc );
		tag.focus();
		return false;
	};
}




$('.chk').on('change',function(){
	validate( $(this) );
});

function validate(t){
	var data = join.tag_status(t);
	
	display_status(data, t.siblings('div'));
};

function display_status( data, div){
	div.text( data.desc);
	div.removeClass();
	div.addClass( data.code);
};

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