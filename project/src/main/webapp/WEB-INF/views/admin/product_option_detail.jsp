<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>produt_option</title>
<style type="text/css">
	.form_area table tr {
		text-align: center;
		height: 50px;
		padding-top: 15px;
		padding-bottom: 15px;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
	}
	
	.form_area {
	margin-top: 10px;
}

	.form_area input[type=text], .form_area input[type=number]{
	padding: 0px;
	width: 70px;
	text-align: center;
	height: 30px;
}

.form_area input[type=number] {
	border: 1px solid #d6d6d6;
	padding-left: 2px;
}
</style>
</head>
<body>
	<div class="form_area"><table>
		<tr style="background-color: #f5edd7;">
		<th>색상</th>
		<th>사이즈</th>
		<th>전체수량</th>
		<th>판매수량</th>
		<th>남은수량</th>
		<th>오늘주문한 수량</th>
		<th>추가로 넣을 수량 </th>
		<th>수정</th>
		</tr>

		
		<tr style="border-bottom: 2px solid black;" >
		<td><input type="text" name="color" placeholder="color"/></td>
		<td><input type="text" name="p_size" placeholder="size"/></td>
		<td></td>
		<td></td>
		<td><input type="hidden" name="p_info_no"/></td>
		<td><input type="hidden" name="add_count"/></td>
		<td><input type="number" name="quota" placeholder="수량"/></td>
		<td><a class='btn-fill-s' id="option_add">추가</a></td>
		</tr>
	
	<c:forEach items="${list }" var="list">
		<tr>
		<td><input type="text" name="color"  value="${list.color }"/></td>
		<td><input type="text" name="p_size" value="${list.p_size }"/></td>
		<td>${list.quota }</td>
		<td>${list.sold }</td>
		<td>${list.quota - sold }</td>
		<td>0<input type="hidden" name="p_info_no" value="${list.p_info_no }"/></td>
		<td><input type="number" name="add_count"/></td>
		<td><a class="btn-fill-s option_update" >수정</a></td>
		</tr>
	</c:forEach>
	</table></div>
</body>
<script type="text/javascript">
	$('#option_add').on('click', function(){
	
		var idx = $(this).index();
		var p_num = ${p_num};
		var color = $('input[name=color]').eq(idx).val();
		var size = $('input[name=p_size]').eq(idx).val();
		var quota = $('input[name=quota]').eq(idx).val();
		
		if(color == '' || size == '' || quota == ''){
			alert('빈칸없이 입력하세요!!!!');
			return;
		}
		
		location.href="option_insert.ad?p_num=" + p_num + "&color=" + color + "&p_size=" + size + "&quota=" + quota;
		
	});
	
	var $item = $('.option_update').on('click', function(){
	var idx = $item.index(this) + 1;
	
	var p_info_no = $('input[name=p_info_no]').eq(idx).val();
	var color = $('input[name=color]').eq(idx).val();
	var size = $('input[name=p_size]').eq(idx).val();
	var add_count = $('input[name=add_count]').eq(idx).val();
	
	

	location.href="option_update.ad?p_info_no=" + p_info_no + "&color=" + color + "&p_size=" + size + "&add_count=" + add_count + "&p_num=" + ${p_num};
	

	});
	
	
</script>
</html>