<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY BOARD LIST</title>
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
		padding-left: 20px;
		opacity: 50%;
	}
	
	.mycategory ul li:first-child a{
	padding-left: 0px;
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
	}
	
	.active {
		opacity: 100%;
	}
</style>
<body>
<h4>MY Q&A LIST</h4>
<div class='mycategory'>
	<ul>
		<li><a class="${mycategory eq 'qa' ? 'active' : '' }">Q&A</a></li>
		<li><a href="reviewlist.me" class="${mycategory eq 'review' ? 'active' : '' }">REVIEW</a></li>
	</ul>
</div>

<div class="listform">
	<table >
	<tr style="background-color: #f5edd7;">
				<th style="width: 100px;">OPTION</th>
				<th style="width: 500px;" >CONTENT</th>
				<th style="width: 70px;">NAME</th>
				<th style="width: 100px;">DATE</th>
		</tr>
		
		<c:forEach items="${list }" var="qalist">
				
				<tr>
					<td>${qalist.category }</td>
					<td><a href="detail.bo?b_id=${qalist.b_id }">${qalist.title }</a></td>
					<td>${qalist.m_name }</td>
					<td>${qalist.writedate }</td>
				</tr>
		</c:forEach>
		
		</table>
		
		
		
</div>
</body>
</html>