<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


	.write_form table {
		width: 60%;
		margin: 0 auto;
		text-align: left;
	}
	
	
	
	.write_form table th {
		padding: 5px 10px;
		font-size: 14px;
		opacity: 70%;
		background-color: #f5edd7;
	}
	
	.write_form table td{
		font-size: 12px;
		text-align: left;
		padding: 2px 2px;
			
	}
	
	.write_form table input[type=text], .write_form table textarea  {
		border: 1px solid #d6d6d6;
		width: 100%;
		
	}
	
	.write_form table textarea {
		resize: none;
		padding: 5px 10px;
	}
	
	.write_form table input[type=password] {
		border: 1px solid #d6d6d6;
	
	}
	
	.write_form table select { 
			border: 1px solid #d6d6d6;
			width: 30%;
			height: 30px;
	}
	
	.write_form table select:last-child {
		width: 69.6%;
		
`}

	.border_none {
	color: #d6d6d6;
	font-weight: bolder;
}

.button_form {
	margin-top: 20px;
}


.write_form a {
	display: inline-block;
	padding: 10px 30px;
	background-color: black;
	color: white;
}

.write_form a:last-child {
	background-color: white;
	border: 1px solid black;
	color: black;
	
}
</style>

<body>
<h4>WRITE</h4>
<div class='write_form'>
<form method="post" action="board_insert.bo" enctype="multipart/form-data">
	<table >
		<tr>
			<th>제목</th>
			<td>
				<select name="category">
					<option value="상품문의">상품문의</option>
					<option value="배송문의">배송문의</option>
					<option value="입금문의">입금문의</option>
					<option value="기타문의">기타문의</option>
				</select>
				<select name="title">
					<option value="기타문의합니다">기타문의합니다</option>
					<option value="배송전 변경해주세요">배송전 변경해주세요</option>
					<option value="반품/교환 문의합니다">반품/교환 문의합니다</option>
					<option value="입고/요청 문의합니다">입고/요청 문의합니다</option>
					<option value="입금/결제 문의합니다">입금/결제 문의합니다</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input name="wirte" class="border_none" type="text" value="${loginInfo.m_name }" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="30" cols="100" name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td class="textleft">
				<label>
				<input type="file" name="file" id="attach-file"/>
				</label>
				
			</td>
		</tr>
		<tr>
			<th>비밀글설정</th>
			<td><input type="password" name="board_pw" class="need chk" placeholder="비밀번호를 입력해주세요 "/>
			<p class="pw_chk"></p>
			</td>
		  </tr>
	</table>
	</form>

	<div class="button_form">
			<a onclick="insert_board()">등록</a>
			<a href="list.no">취소</a>
	</div>	

</div>
</body>
<script type="text/javascript">
	$('[name=board_pw]').on('change', function(){
		
		console.log( $(this).val().length );
		
		if ( $(this).val().length < 4 ) {
			$('.pw_chk').text('최소 4글자 이상은 입력해주세요').css('color', 'red');
			$(this).addClass('chk');
		}else {
			$('.pw_chk').text('사용가능한 비밀번호 입니다').css('color', 'green');
			$(this).removeClass('chk');
		}
	});
	
	function insert_board(){
	if(	$('[name=content]').val() == '' ) {alert('글 내용을 작성해주세요! '); return;}
	if( $('[name=board_pw]').val() == '' ) { alert('비밀번호를 입력해주세요 '); return; }
	if( $('[name=board_pw]').hasClass('chk') ) { alert('비밀번호를 최소4글자 이상 설정해주세요' ); return; }
	
	
	$('form').submit();	
	};

</script>
</html>