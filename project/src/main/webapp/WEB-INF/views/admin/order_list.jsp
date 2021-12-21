<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.form_area table tr {
		text-align: center;
		height: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
	}
	
	.form_area {
	margin-top: 10px;
}

.search_box {
	width: 90%;
	margin:0 auto;
	margin-top: 40px;
	text-align: left;
}

.search_box select {
	height: 30px;
	width: 80px;
	border: 1px solid #d6d6d6;
}

.search_box input {
		border: 1px solid #d6d6d6;
}

.search_box a {
		display:inline-block;
		width:70px;
		height:30px;
		background-color: #f5edd7;
		font-size: 14px;
		text-align:center;
		line-height: 30px;
		border-radius: 3px 3px 3px 3px;
	}
	
#chartdiv {
  width: 90%;
  height: 500px;
  margin: 0 auto;
}

</style>
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Chart code -->
<script type="text/javascript">
am5.ready(function() {

	// Create root element
	// https://www.amcharts.com/docs/v5/getting-started/#Root_element
	var root = am5.Root.new("chartdiv");

	// Set themes
	// https://www.amcharts.com/docs/v5/concepts/themes/
	root.setThemes([
	  am5themes_Animated.new(root)
	]);

	// Create chart
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
	// start and end angle must be set both for chart and series
	var chart = root.container.children.push(am5percent.PieChart.new(root, {
	  startAngle: 180,
	  endAngle: 360,
	  layout: root.verticalLayout,
	  innerRadius: am5.percent(50)
	}));

	// Create series
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
	// start and end angle must be set both for chart and series
	var series = chart.series.push(am5percent.PieSeries.new(root, {
	  startAngle: 180,
	  endAngle: 360,
	  valueField: "value",
	  categoryField: "category",
	  alignLabels: false
	}));

	series.states.create("hidden", {
	  startAngle: 180,
	  endAngle: 180
	});

	series.slices.template.setAll({
	  cornerRadius: 5
	});

	series.ticks.template.setAll({
	  forceHidden: true
	});

	// Set data
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
	series.data.setAll( ${chartJSON} );

	series.appear(1000, 100);

	}); // end am5.ready()
	
	
	</script>
</head>
<body>
<p>오늘 주문 내역 <span id="totalcount"></span>개</p>
<div id='chartdiv'></div>
<div class="search_box">
	<form method="post" action="order_status.ad">
	<table>
		<tr>
		<th><select name="search">
		<option value="all" ${search eq 'all' ? 'selected' : '' }>전체</option>
		<option value="order_num" ${search eq 'order_num' ? 'selected' : '' }>주문번호</option>
		<option value="m_id" ${search eq 'm_id' ? 'selected' : '' }>아이디</option>
		<option value="paymethod" ${search eq 'paymethod' ? 'selected' : '' }>지불방법</option>
		<option value="order_status" ${search eq 'order_status' ? 'selected' : '' }>입금상태</option>
		</select></th>
		<td><input type="text" name="keyword" value="${keyword }"/></td>
		<td><a onclick="$('form').submit();">검색</a></td>
		</tr>	
	
	</table>
	</form>
</div>
<div class="form_area">
	<table>
		<tr style="background-color: #f5edd7;"><th>주문번호</th>
		<th>회원아이디</th>
		<th>총가격</th>
		<th>지불금액</th>
		<th>지불방법</th>
		<th>확인</th>
		</tr>
		
		<c:forEach items="${order }" var="order">
			<tr>
				<td><a>${order.order_num }</a></td>	
				<td><a>${order.m_id }</a></td>
				<td><fm:formatNumber value="${order.totalprice }" pattern="#,###"/>원</td>		
				<td><fm:formatNumber value="${order.deposit }" pattern="#,###"/>원</td>
				<td>${order.paymethod }(
					<c:choose>
						<c:when test="${order.order_status eq '주문취소' }">
						<span style="color:red">${order.order_status }</span>
						</c:when>

						<c:when test="${order.order_status eq '입금완료' }">
						<span style="color:blue">${order.order_status }</span>
						</c:when>
						
						<c:otherwise>
						<span> ${order.order_status }</span>
						</c:otherwise>
					</c:choose>
				)</td>
				<td><a onclick="if(confirm('입금된 금액이 ${order.deposit} 입니다. 입금확인 하시겠습니까?') ) {location.href='orderstatus_update.ad?order_num=${order.order_num }&order_status=입금완료'}" class='btn-fill-s'>입금완료</a>
				<a class='btn-fill-s' onclick="if(confirm('입금된 금액이 ${order.deposit} 입니다. 입금확인 하시겠습니까?') ) {location.href='orderstatus_update.ad?order_num=${order.order_num }&order_status=주문취소'}">주문취소</a></td>
			</tr>
		</c:forEach>
	
	</table>
</div>
</body>
<script type="text/javascript">
var jsonarray = ${chartJSON};
var totalcount = 0;
for(var i = 0; i < jsonarray.length; i++ ){
	var current = jsonarray[i];
	totalcount += Number(current.value);	
}

$('#totalcount').html(totalcount);
</script>
</html>