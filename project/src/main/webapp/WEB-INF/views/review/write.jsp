<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review_Write</title>
</head>
<style>
	#r_write_form {
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
	
	#r_write_form table {
		width: 60%;
		margin: 0 auto;
		margin-top: 30px;
	}
	
	#r_write_form table th {
		height: 60px;
	}
	
	.fa-star {
		font-size: 60px;
		color: #cccccc;
	}
	
	textarea {
		width: 40%;
		height: 200px;
		padding: 5px 10px;
		border: 1px solid #d6d6d6;
	}
	
	input[type=file] {
		width: 40%;
		text-align: left;
		height: 40px;

	}
	
	.btn_box {
		margin-top: 40px;
	}
	
	.button_a {
		font-size: 18px;
	}
	
	.chk {
		color :#ff904f
	}
	
	.unchk {
		color: #ccccc;
	}
	
	
</style>
<body>
<h4>리뷰쓰기</h4>
<div id="r_write_form">
	<table>
	<tr>
		<td><div id="img">이미지</div></td>
		<td class='textleft'><p>${product.p_name }</p>
				<p>${product.color }/${product.p_size }</p>
		</td>
	</tr>
	</table>
	<br/>
	<form method="post" action="insert.rv" enctype="multipart/form-data">
	<input type="hidden" name="grade"/>
	<input type="hidden" name="p_num" value="${product.p_num }" />
		<table>
			<tr><th><h4>상품은 어땠나요?</h4></th></tr>
			<tr><td><i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i></td></tr>
			<tr><th><h4>어떤점이 좋았나요?</h4></th></tr>
			<tr>
				<td><textarea name="content" cols="30" rows="5" placeholder="10자이상 작성해주세요."></textarea></td>
			</tr>
			<tr><td><input type="file" name="file"/></td></tr>
		</table>
	</form>
</div>

<div class='btn_box'>
	<a class='button_a' onclick="reviewsumbit()">작성</a>
	<a class='button_a'>취소</a>

</div>
</body>
<script type="text/javascript">
	$('input[type=file]').on('change',function(){
	//	console.log($(this).val() );
	
		var file = $(this).val().split(".");
		var f_extension = file[ file.length - 1 ].toLowerCase();
		
	//	console.log( f_extension );

		if( f_extension == 'png' || f_extension == 'jpg' || f_extension == 'jpeg' || f_extension == 'bmp' || f_extension == 'hdr' || f_extension == 'jpeg2000' ){
			return true;
		} else {
			alert (' 이미지 파일이 아닙니다!\n png,jpg,jpeg,bmp,hdr,jepg2000만 사용 가능합니다');
			$('input[type=file]').val('');
			
		}

	});
 
	$('.fa-star').on('mouseover',function(){
		var idx = $(this).index() + 1;
	
	colorchange(idx);
	});
	
	function colorchange(idx){
		
		$('.fa-star').each(function(){
			if( $(this).index() < idx) {
				$(this).addClass('chk');
			} else {
				$(this).removeClass('chk');
				$(this).addClass('unchk');
			}
		});
		
	};
	
	function reviewsumbit() {
		$()
		if($('textarea').val() == '' || $('textarea').val() == null ) {
			alert('리뷰 내용을 작성해주세요!');
		} else if( $('textarea').val().length < 11 ) {
		 	alert('최소 10자 이상은 입력해주세요!');
		} else {

		$('input[name=grade]').val( $('.chk').length );
		$('form').submit();
		}
		
	}
</script>
</html>