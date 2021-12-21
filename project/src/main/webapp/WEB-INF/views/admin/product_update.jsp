<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
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
<h4>상품 업데이트</h4>
<div class='write_form'>
<form method="post" action="product_update.ad" enctype="multipart/form-data">
<input type="hidden" name="p_num" value="${product.p_num }"/>
	<table >
		<tr>
			<th>이미지</th>
			<td><span id="preview" class="img_view chk"><img id="preview-img" src="<spring:url value='${product.filepath }'/>" width="200px" height="200px" ></span>
			<br/>
			<input type="file" name="file"/></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input name="p_name" class="border_none chk" type= "text" readonly="readonly" value="${product.p_name }"/></td>
			<th>가격</th>
			<td><input type="number" name="price" class="chk" value="${product.price }" placeholder="가격을 입력해주세요"/></td>
		</tr>
		<tr>
			<th>상품상세</th>
			<td colspan="3">
				<select name="itemType1" class="chk">
					<option>:::: 선택하세요 ::::</option>
					<option value="outer" ${product.itemType1 eq 'outer' ? 'selected' : '' }>OUTER</option>
					<option value="top" ${product.itemType1 eq 'top' ? 'selected' : '' }>TOP</option>
					<option value="blouse/shirts" ${product.itemType1 eq 'blouse/shirts' ? 'selected' : '' }>BLOUSE/SHIRTS</option>
					<option value="bottom" ${product.itemType1 eq 'bottom' ? 'selected' : '' }>BOTTOM</option>
					<option value="dress" ${product.itemType1 eq 'dress' ? 'selected' : '' }>DRESS</option>
					<option value="knit/cardigan" ${product.itemType1 eq 'kint/cardigan' ? 'selected' : '' }>KNIT/CARDIGAN</option>
				</select>
				<select name="itemType2" class="chk">
					<option>:::: 선택하세요 ::::</option>
					<option value="${product.itemType2 }" selected="selected">${product.itemType2 }</option>
				</select>
			</td>
		</tr>
	
		<tr>
			<th>상품요약</th>
			<td class="textleft" colspan="3">
				<textarea name="summary" class="chk" rows="30" cols="50" style="height: 200px;">${product.summary }</textarea>
			</td>
		</tr>
		
		<tr>
			<th colspan="4">상품상세내용</th>
		</tr>
	
	</table>
	
	<div class="product_detail_writer_area">
	<textarea id="product_writer" class="chk" name="content" class="product_writer">${product.content }</textarea>
	<script>
 var ckeditor_config = {

	
   filebrowserUploadUrl : "product_write_img_upload.ad"
 };
 
 CKEDITOR.replace("product_writer", ckeditor_config);
 
 
</script>
	
	</div>
	</form>

	<div class="button_form">
			<a onclick="update_product()">수정</a>
			<a href="list.no">취소</a>
	</div>	

</div>
</body>
<script type="text/javascript">
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
		

			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		} else {
			alert('사진파일만 가능합니다!!! \n.jpg, .png, .jpeg, .gif, .bmp만 가능합니다.');
			$('input[type=file]').val('');
		
		}
	}
	
});
	
	function update_product() {
	
		
		$('form').submit();
	}

</script>
</html>