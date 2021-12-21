<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.mycategory {
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
	}
	.mycategory ul {
		overflow: hidden;
		padding-left:0px;
		display: table;
		margin: 0 auto;
	}
	
	.mycategory ul li {
		float: left;
		font-size: 14px;
		color: gray;
		
	}
	
	.mycategory ul li a {
		display: inline-block;
		opacity: 50%;
	}
	
	.mycategory ul li:last-child a{
		padding-left: 20px;
	opacity: 100%;
	font-weight: bolder;
}

	.listform {
	margin-bottom: 20px;
	margin-top: 20px;
	}
	.listform table {
		width: 90%;
		margin: 0 auto;
		
	}
	
	.listform table th {
		text-align: center;
		padding: 5px 10px;
		font-size: 14px;
		opacity: 70%;
	}
	
	.listform table td{
		font-size: 12px;
		border-bottom: 1px solid #d6d6d6;	
	}
	
	.listform table tr {
		height: 70px;
	}
	
	.active {
		opacity: 100%;
	}
	
	.fa-star {
	
	}
</style>
<body>
<h4>MY REVIEW LIST</h4>
<div class='mycategory'>
	<ul>
		<li><a href="qalist.me">Q&A</a></li>
		<li><a href="reviewlist.me">REVIEW</a></li>
	</ul>
</div>

<div class="listform">
	<table >
	<tr style="background-color: #f5edd7;">
				<th style="width: 150px;">PRODUCT</th>
				<th style="width: 100px;">GRADE</th>
				<th style="width: 500px;" >CONTENT</th>
				<th style="width: 70px;">NAME</th>
				<th style="width: 100px;">DATE</th>
		</tr>
		<c:forEach items="${review }" var="review">
			<tr>
				<td><a href="go_detail?id=${review.p_num }">${review.p_name }</a></td>
				<td><c:forEach begin="1" end="${review.grade }">
				<i class="fas fa-star"></i>
				</c:forEach> ${review.grade }점</td>
				<td class='textleft' style="padding-left: 5px;">${review.content }</td>
				<td>${review.m_name }</td>
				<td>${review.writedate }</td>
			</tr>
		</c:forEach>
		
		
		</table>
		
		
		
</div>
</body>
</html>