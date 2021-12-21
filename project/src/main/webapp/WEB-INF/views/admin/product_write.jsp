<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script src="js/ckeditor/ckeditor.js"></script>

<style>
	h4 {
		margin-top: 30px;
		margin-bottom: 30px;
	}

	.write_form table {
		width: 80%;
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
	
	.write_form table input[type=text], .write_form table textarea, .write_form table input[type=number]  {
		border: 1px solid #d6d6d6;
		width: 100%;
		height: 30px;
		padding: 5px 3px;
		
	}
	
	.write_form table textarea {
		resize: none;
		padding: 5px 10px;
	}
	
	
	.write_form table select { 
			border: 1px solid #d6d6d6;
			width: 30%;
			height: 30px;
			padding-left: 5px;
			color: gray;
	}
	
	.write_form table select:last-child {
		width: 69.6%;
		
`}

	.border_none {
	
	font-weight: bolder;
}

.button_form {
	margin-top: 20px;
}

.img_view {
	display: inline-block;
	width: 200px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	
	border: 1px solid #d6d6d6;
	margin-bottom: 5px;
	cursor: text;
}

.add{
	display: inline-block;
	margin-left: 5px;
	background-color:#f5edd7;
	color: gray;
	padding: 3px 5px 3px 5px;
	border-radius: 3px 3px 3px 3px;
	text-align: center;
	
}

.cancle{
	display: none;
}

.product_detail_writer_area {
	width: 80%;
	margin: 0 auto;
	margin-top: 10px;
}

#product_writer {
	height: 300px;
}

.button_form a {
	display: inline-block;
	padding: 10px 30px;
	background-color: black;
	color: white;
}

.button_form a:last-child {
	background-color: white;
	border: 1px solid black;
	color: black;
}


</style>

<body>
<h4>PRODUCT_WRITE</h4>
<div class='write_form'>
<form method="post" action="product_insert.ad" enctype="multipart/form-data">
<input type="hidden" name="options"/>
	<table >
		<tr>
			<th>이미지</th>
			<td><span id="preview" class="img_view chk">이미지(600*700)</span>
			<br/>
			<input type="file" name="file"/></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input name="p_name" class="border_none chk" type="text" placeholder="상품명을 기입해주세요"/></td>
			<th>가격</th>
			<td><input type="number" name="price" class="chk" placeholder="가격을 입력해주세요"/></td>
		</tr>
		<tr>
			<th>상품상세</th>
			<td colspan="3">
				<select name="itemType1" class="chk">
					<option>:::: 선택하세요 ::::</option>
					<option value="outer">OUTER</option>
					<option value="top">TOP</option>
					<option value="blouse/shirts">BLOUSE/SHIRTS</option>
					<option value="bottom">BOTTOM</option>
					<option value="dress">DRESS</option>
					<option value="knit/cardigan">KNIT/CARDIGAN</option>
				</select>
				<select name="itemType2" class="chk">
					<option>:::: 선택하세요 ::::</option>
				</select>
			</td>
		</tr>
	
		<tr>
			<th>상품옵션</th>
			<td colspan="3"><input type="text" class='wpx250 color' placeholder="색상을 하나씩 기입해주세요 ex)black"/>
			<input type="text" class='wpx250 size' placeholder="사이즈를 하나씩 기입해주세요 ex)S"/>
			<input type="number" class="wpx250 remaining" placeholder="수량을 기입해주세요 ex)100" />
			<a id='option_chk_add' class='add'>추가</a><a class='cancle add'>다시입력하기</a></td>
		</tr>
		<tr>
			<th>옵션</th>
			<td colspan="3"><p class='option_chk one chk'>색과 사이즈를 입력하시면, 이곳에 표시됩니다. 색상과 사이즈가 없다면, FREE로 입력해주세요<br/>Ex) BLACK/S/100개 BLACK/M/100개 BLACK/L/100개</p></td>
		</tr>
		<tr>
			<th>상품요약</th>
			<td class="textleft" colspan="3">
				<textarea name="summary" class="chk" rows="30" cols="50" style="height: 200px;"></textarea>
			</td>
		</tr>
		
		<tr>
			<th colspan="4">상품상세내용</th>
		</tr>
	
	</table>
	
	<div class="product_detail_writer_area">
	<textarea id="product_writer" class="chk" name="content" class="product_writer"></textarea>
	<script>
 var ckeditor_config = {

	
   filebrowserUploadUrl : "product_write_img_upload.ad"
 };
 
 CKEDITOR.replace("product_writer", ckeditor_config);
 
 
</script>
	
	</div>
	</form>

	<div class="button_form">
			<a onclick="insert_product()">등록</a>
			<a href="list.no">취소</a>
	</div>	

</div>
</body>
<script type="text/javascript">
	$('.chk').on('change',function(){
		$(this).removeClass('chk');
		$(this).addClass('chked');
		
	});
	
	$('.chked').on('change', function(){
		if( $(this).val() == '' ) {
			$(this).removeClass('chked');
			$(this).addClass('chk');
		}
	});
	
	function insert_product() {
		var option = $('.option_chk').text().toUpperCase();
		
		$('input[name=options]').val(option);
		
		if ( $('input[name]').hasClass('chk') ) {
			alert('빈칸없이 입력해주세요!');
			return;
		}
		
		$('form').submit();
		
		
	}

	$('.size').on('click', function(){
	var color =	$('.color').val();
	
	if(color == null || color == '') {
		alert('색상을 먼저 입력하세요!!');
		$('.color').val('');
		$('.color').focus();
	}
	
	});
	
	$('#option_chk_add').on('click', function(){
		var size = $('.size').val();
		var option_chk = $('.option_chk');
		var remaing = $('.remaining').val();
		
		
		if( size == null || size == '') {
			alert('사이즈를 입력하세요!!');
			$('.size').val('');
			$('.size').focus();
			return;
		} else {
			
			var color = $('.color').val();
			
			
			if( $('.option_chk').hasClass('one') ) {
				option_chk.html('');
				$('.cancle').css('display', 'inline-block');
				var one = $('.one').removeClass('one');
			}
			
			
			option_chk.append(color + "/" + size + "/" + remaing + " ");
			
			
		}
	});
	
	$('.cancle').on('click', function(){
		$('.option_chk').html('');
	});	

	$('select[name=itemType1]').on('change', function(){
		var item = $(this).val();
		
		$.ajax({
			type:'post',
			url: 'option_category',
			data: {itemType1:item},
			success: function(response){
				item_list(response);
			}, error(req, text){
				alert( text + ":" + req.status);
			}
		});
		
		
	});
	
	function item_list( list ) {
		
		var itemtype2 = $('select[name=itemType2]');
		
		$('select[name=itemType2] option:gt(0)').remove();
		
		var text;
		
		for(var i = 0; i < list.length; i++){
			text += "<option value='" + list[i] + "'>" + list[i] + "</option>";
		}
		
		itemtype2.append(text);
		
		
	};
	
	function isImage(filename){
		var ext = filename.substring(filename.lastIndexOf('.') + 1 ).toLowerCase(); // 마지막 점(.) 다음 위치에서부터 끝까지 뽑고 소문자로 변환
		var imgs = ['png', 'jpg', 'jpeg', 'gif', 'bmp'];
		if ( imgs.indexOf(ext) > -1 ) { return true; }
		else { return false; }
	}
	
	$('input[type=file]').on('change', function(){
		var attach = this.files[0];
		if( attach ) {
			if( isImage(attach.name) ) {
				var img = "<img id='preview-img' class='file-img' width='200px' src=''/>";
				$('#preview').css('border', 'none');
				$('#preview').html(img);
			

				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview-img').attr('src', e.target.result);
				}
				reader.readAsDataURL(attach);
			} else {
				alert('사진파일만 가능합니다!!! \n.jpg, .png, .jpeg, .gif, .bmp만 가능합니다.');
				$('input[type=file]').val('');
				$('#preview').css('border', '1px solid #d6d6d6');
				$('#preview').html('이미지(600*700)');
			}
		}
		
	});

</script>
</html>