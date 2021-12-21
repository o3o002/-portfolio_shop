<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	series.data.setAll( ${grapJSON} );

	series.appear(1000, 100);

	}); // end am5.ready()
	
	
	</script>
</head>
<body>
<div id='chartdiv'></div>
<div class="search_box">
	<form id="list" method="post" action="deliverlist.ad">
	<input type="hidden" name="curPage" value="1"/>
	<table>
		<tr>
		<th><select name="search">
		<option value="all" ${search eq 'all' ? 'selected' : '' }>전체</option>
		<option value="order_num" ${search eq 'order_num' ? 'selected' : '' }>주문번호</option>
		<option value="m_id" ${search eq 'm_id' ? 'selected' : '' }>회원아이디</option>
		<option value="deliver_content" ${search eq 'deliver_content' ? 'selected' : '' }>배송현황</option>
		<option value="tracking_num" ${search eq 'tracking_num' ? 'selected' : '' }>송장번호</option>
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
		<th>배송현황</th>
		<th>송장번호</th>
		<th>주문날짜</th>
		</tr>
		
		<c:forEach items="${page.deliver_list }" var="list">
			<tr>
				<td><a title="배송지보기" href="deliver_modify.ad?order_num=${list.order_num }">${list.order_num }</a></td>
				<td>${list.m_id }</td>
				<td>${list.deliver_content }</td>
				<td>
				<c:if test="${empty list.tracking_num }">
				X
				</c:if>
				${list.tracking_num }</td>
				<td>${list.order_sysdate }</td>
			</tr>
		</c:forEach>	
	</table>
</div>
<div>
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
</body>

</html>