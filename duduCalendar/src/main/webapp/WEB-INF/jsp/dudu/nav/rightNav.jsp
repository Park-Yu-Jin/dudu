<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://webfontworld.github.io/TheJamsil/TheJamsil.css"
	rel="stylesheet">
<link href="../../css/dudu/rightNav.css" rel="stylesheet">
<script type="text/javascript">
var err_msg = "<%= session.getAttribute("err_msg") %>";
if (err_msg !== "null") {
    alert(err_msg);
    <% session.removeAttribute("err_msg"); %>
}
</script>
</head>
<%
	Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("M월 d일 EEEE");
String formattedDate = dateFormat.format(today);
%>
<body>
	<nav class="rightNav">
		<div class="today"><%=formattedDate%></div>
		<div class="dailyList">
			<c:forEach items="${dailyList }" var="daily">
				<c:set var="formattedDailyDate">
					<fmt:parseDate var="parsedDate" value="${daily.dadate}"
						pattern="yyyy-MM-dd HH:mm:ss.S" />
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
				</c:set>
				<c:if test="${formattedDailyDate eq todayDate}">
					<div class="daily"
						style="box-shadow: inset 0.5em 0em 0 0px ${daily.dacolor};">
						<div style="display: flex; align-items: center;">
							<c:if test="${daily.daimp==1 }">
								<div
									style="background-color: #47c347; width: 8px; height: 8px; border-radius: 100%; margin-right: 3px; border: 1px solid #37ab37; box-sizing: border-box;"></div>
							</c:if>
							<c:if test="${daily.daimp==2 }">
								<div
									style="background-color: #cff112; width: 8px; height: 8px; border-radius: 100%; margin-right: 3px; border: 1px solid #a8bf28; box-sizing: border-box;"></div>
							</c:if>
							<c:if test="${daily.daimp==3 }">
								<div
									style="background-color: yellow; width: 8px; height: 8px; border-radius: 100%; margin-right: 3px; border: 1px solid #ddc057; box-sizing: border-box;"></div>
							</c:if>
							<c:if test="${daily.daimp==4 }">
								<div
									style="background-color: #fba200; width: 8px; height: 8px; border-radius: 100%; margin-right: 3px; border: 1px solid #d59f06; box-sizing: border-box;"></div>
							</c:if>
							<c:if test="${daily.daimp==5 }">
								<div
									style="background-color: #fb0000; width: 8px; height: 8px; border-radius: 100%; margin-right: 3px; border: 1px solid #a30d0d; box-sizing: border-box;"></div>
							</c:if>
							${daily.datitle }
						</div>
						<div class="dailyContent">${daily.dacnt }</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</nav>
</body>
</html>