
function email_code_check(){
	var code = $('input[name=email_code]').val()
	var email = $('input[name=m_email_id]').val() + $('input[name=m_email_domain]').val()
	
	var emailchk = $('input[name=m_email]')
	
	if( code == "" || code == null || code.length > 4 || code.length < 1){
		alert('인증번호를 확인하세요!');
		return false;
	}

	$.ajax({
		type:'post',
		url: 'emailCodeChk',
		data : {code:code, email:email},
		success : function( response ){
			if(response > 0) {
				alert('인증되었습니다!');
				$('input[name=m_email_id]').attr('readonly', true);
				$('input[name=m_email_domain]').attr('readonly', true);
				emailchk.removeClass('chk');
				emailchk.addClass('chked');
				
			}else {
				alert('인증번호와 이메일을 확인해주세요');
				}
		
		},
		error: function(req, text){
			alert(text + ":" + req.status + "\n" + req.respnseText);
		} 
		
	});

};

 function email_check() {
	
	var email =  $('input[name=m_email_id]').val() + $('input[name=m_email_domain]').val() 
	
	$('.email_chk').text('이메일 인증중입니다. 잠시만 기다려주세요 ');

	
	$.ajax({
		type:'post',
		url: 'email_Authentication',
		data: { chk_email:email },
		success: function(response) {
			if(response) {
				alert('인증번호가 메일로 전송되었습니다. 아래칸에 입력해주세요');
				$('.emailchodearea').css('display', 'block');
				
				
			} else {
				if ( confirm('이미 가입된 메일입니다! 로그인 페이지로 이동할까요?') ) {
					location = "login";
				}
			}
		},
		error:function(req, text){
			alert(text + ":" + req.status + "\n" + req.responseText );
		}		
		
	});
}
 
 function id_check() {
	var id = $('[name=m_id]');
	if( id.hasClass('chked')) return;
	
	var data = join.tag_status(id);
	if( data.code == 'invalid') {
		alert( data.desc + "\n 확인해주세요");
		id.focus();
		return;
	}
	

	$.ajax({
		type:'post',
		url: 'id_check',
		data : { chk_id:id.val() },
		success: function( response ) {
			if( response ) {
				response = join.id.usable;
			} else {
				response = join.id.unUsable;
			}
			
			display_status(response, id.siblings('div'));
			id.addClass('chked');
		},
		error: function(req, text){
			alert(text + ":" + req.status + "\n" + req.responseText );
		}
		
	});
}