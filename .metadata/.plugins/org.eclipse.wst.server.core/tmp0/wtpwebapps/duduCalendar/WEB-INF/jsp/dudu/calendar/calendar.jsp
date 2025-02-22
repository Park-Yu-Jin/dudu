<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Random"%>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page import='egovframework.com.utl.fcc.service.EgovNumberUtil'%>
<%@ page import='egovframework.com.utl.fcc.service.EgovStringUtil'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
java.util.Calendar cBeginDate = java.util.Calendar.getInstance();
java.util.Calendar cEndDate = java.util.Calendar.getInstance();

String sImgUrl = "/images/egovframework/com/cop/smt/sim/";
String sCssUrl = "/css/egovframework/com/cop/smt/sim/";
//KISA 보안약점 조치 (2018-10-29, 윤창원)
String strYear = EgovStringUtil.removeMinusChar(request.getParameter("year"));
String strMonth = request.getParameter("month");

int year = cal.get(java.util.Calendar.YEAR);
int month = cal.get(java.util.Calendar.MONTH);
int date = cal.get(java.util.Calendar.DATE);

if (strYear != null && EgovNumberUtil.getNumberValidCheck(strYear)) {
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
} else {

}
//년도/월 셋팅
cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;

//현재년월일 셋팅
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String sTodate = formatter.format(new java.util.Date());
%>
<!DOCTYPE html>

<html>
<head>
<TITLE><spring:message code="comCopSmtSim.Gbn.Daily" /> <spring:message
		code="comCopSmtSim.title" /></TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/com.css'/>">
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cop/smt/sdm/dept_schdule_manage.css'/>">
<link href="https://webfontworld.github.io/TheJamsil/TheJamsil.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<c:url value='../../css/dudu/nav.css'/>">
<script type="text/javaScript" language="javascript">

	var gOpener = parent.document.all? parent.document.IndvdlSchdulManageVO : parent.document.getElementById("IndvdlSchdulManageVO") ;
	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_regist_IndvdlSchdulManage(sDate){
		//alert(sDate);

		gOpener.schdulBgnde.value = sDate;
		gOpener.schdulEndde.value = sDate;
		gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do' />";
		gOpener.submit();
	}


	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_detail_IndvdlSchdulManage(schdulId){

		gOpener.schdulId.value = schdulId;
		gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />";
		gOpener.submit();
	}


	var ifr= parent.document.all? parent.document.all.SchdulView : parent.document.getElementById("SchdulView") ;

	function do_resize() {
		resizeFrame(1);
	}

	//가로길이는 유동적인 경우가 드물기 때문에 주석처리!
	function resizeFrame(re) {

		if(ifr){

			var innerHeight = document.body.scrollHeight + (document.body.offsetHeight - document.body.clientHeight);

			if(ifr.style.height != innerHeight) //주석제거시 다음 구문으로 교체 -> if (ifr.style.height != innerHeight || ifr.style.width != innerWidth)
			{ifr.style.height = innerHeight;}

			/*
			if(!re) {
				try{ document.body.attachEvent('onclick',do_resize);
				}catch(e){document.body.addEventListener("click", do_resize, false);}
			}
			*/
		}
	}

	function fnEgovSchdulSe(setValue) {

		location.href="<c:url value='calendar.do' />?year=<%=year%>&month=<%=month%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
	}
	
	function fnEgovSchdulTodate() {

		location.href="<c:url value='calendar.do' />?year=<%=sTodate.substring(0, 4)%>&month=<%=Integer.valueOf(sTodate.substring(4, 6)) - 1%>&searchCondition=SCHDUL_SE&searchKeyword=" + document.IndvdlSchdulManageVO.schdulSe.value;

	}
	
	function fnEgovTodateSelect(){
		
		var obj = document.getElementById("id_<%=sTodate%>");

		if (obj != null && obj != undefined) {
			//console.trace("fnEgovTodateSelect obj>"+obj);
			//obj.querySelector('font').setAttribute("style", "background-color:#87CEFA;"); //opacity:0.5;
			obj
					.querySelector("font")
					.setAttribute(
							"style",
							"color: white; background-color: #ff5252; padding: 5px; border-radius: 50px; display: flex; justify-content: center; width: 14px;"); //opacity:0.5;
			obj.querySelector(".dayDiv").setAttribute("style",
					"margin-left: 5px; margin-top: 5px;");
		}

	}

	window.onload = function() {
		do_resize();
		fnEgovTodateSelect();
	}
</script>
<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
	display: flex;
	justify-content: center;
	height: 100vh;
	align-items: center;
}

td {
	font-family: 'TheJamsil';
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: 'TheJamsil';
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: 'TheJamsil';
	font-size: 12pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

.divWeekBar {
	overflow: hidden;
	text-overflow: ellipsis;
	background-color: #FF69B4;
	/* #8394c 파랑 #8B008B 자주  	#228B22초록	#FF69B4 핫핑크 		#FFD700 골드  	#B22222 나무색 */
	-moz-box-shadow: 2px 3px 2px grey;
	-webkit-box-shadow: 2px 3px 2px grey;
	box-shadow: 2px 3px 2px grey;
}

.linkWeek:link {
	color: #fff;
	font-size: 9pt;
	font-family: "TheJamsil";
	font-weight: normal;
}

.linkWeek:visited {
	color: #fff;
	font-size: 9pt;
	font-family: "TheJamsil";
	font-weight: normal;
}

.linkWeek:active {
	color: #fff;
	font-size: 9pt;
	font-family: "TheJamsil";
	font-weight: normal;
}

.linkWeek:hover {
	color: #fff;
	font-size: 9pt;
	font-family: "TheJamsil";
	font-weight: normal;
}

A:link {
	font-size: 9pt;
	font-family: "TheJamsil";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "TheJamsil";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "TheJamsil";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "TheJamsil";
	color: red;
	text-decoration: none;
}

form {
	display: flex;
	height: 100%;
	align-items: center;
}

	.pjfrom{
		background-color: #FFFFFF;
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 0 50px 50px;
		height: 100%;
		width: 350px;
		flex-direction: column;
	}

	.pjinput{
		width:90%;
		padding: 12px 15px;
		border: none;
		margin: 8px 0;
		background-color: #eee;
		overflow: hidden;
	}
	input[type=text]{
		border:none;
	}
	
	.modal{
		position: absolute;
		display:none;
		justify-content: center;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background-color: rgba(0,0,0,0.4);
	}
	
	.modal_body{
		position:absolute;
		top:50%;
		left: 50%;
		width: 400px;
		height: 600px;
		padding: 40px;
		text-align: center;
		bacground-color: rgb(255,255,255);
		border-radius: 10px;
		box-shadow: 0 2px 3px 0 rgba(34,36,38,0.15);
		transform: translateX(-50%) translateY(-50%);
		
	}
</style>

<script>
	console.log("여기는 캘린더${username}");
	console.log(typeof "${username}");
	var str = "";
	<c:forEach items="${username}" var="userlist">
		str += "${userlist.username},";
	</c:forEach>
	console.log(str);
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<BODY>
	<form name="IndvdlSchdulManageVO" id="IndvdlSchdulManageVO" action=""
		method="post">
		<DIV id="content" style="width: 1420px;">
			<div class="sort_area">
				<div class="select_group">
					<select name="schdulSe" class="select" id="schdulSe"
						onChange="fnEgovSchdulSe(document.forms[0].schdulSe.options[document.forms[0].schdulSe.selectedIndex].value);"
						title="일정구분선택">
						<option selected value=''>--
							<spring:message code="input.cSelect" /> --
						</option>
						<!-- 선택  -->
						<c:forEach var="result" items="${schdulSe}" varStatus="status">
							<option value='${result.code}'
								<c:if test="${searchKeyword == result.code}">selected</c:if>>${result.codeNm}</option>
						</c:forEach>
					</select>
				</div>
				<div class="date_view" style="left: 39%;">
					<ul>
						<li><a href="javascript:fnEgovSchdulTodate();" class="today"><spring:message
									code="comCopSmtSim.Navi.Today" /></a></li>
						<!-- 오늘 -->

						<li><a class="prev"
							href="<c:url value='calendar.do' />?year=<%=year - 1%>&amp;month=<%=month%>">prev</a></li>
						<li class="date"><%=year%> <spring:message
								code="comCopSmtSim.Navi.Year" /></li>
						<!-- 년 -->
						<li><a class="next"
							href="<c:url value='calendar.do' />?year=<%=year + 1%>&amp;month=<%=month%>">next</a></li>
						<li class="date">&nbsp;</li>

						<%
							if (month > 0) {
						%>
						<li><a
							href="<c:url value='calendar.do' />?year=<%=year%>&month=<%=month - 1%>"
							title="<spring:message code="comCopSmtSim.goPrevMonth"/>"
							class="prev">prev</a></li>
						<!-- 이전달로 가기 -->
						<%
							} else if (month == 0) {
						%>
						<li><a
							href="<c:url value='calendar.do' />?year=<%=year - 1%>&month=<%=11%>"
							title="<spring:message code="comCopSmtSim.goPrevMonth"/>"
							class="prev">prev</a></li>
						<%
							}
						%>
						<li class="date"><%=month + 1%> <spring:message
								code="comCopSmtSim.Navi.Month" /></li>
						<!-- 월 -->
						<%
							if (month < 11) {
						%>
						<li><a
							href="<c:url value='calendar.do' />?year=<%=year%>&month=<%=month + 1%>"
							class="next"
							title="<spring:message code="comCopSmtSim.goNextMonth"/>">next</a></li>
						<!-- 다음달로 가기 -->
						<%
							} else if (month == 11) {
						%>
						<li><a
							href="<c:url value='calendar.do' />?year=<%=year + 1%>&month=<%=0%>"
							class="next"
							title="<spring:message code="comCopSmtSim.goNextMonth"/>">next</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>

			<table class="month">
				<caption>
					<spring:message code="comCopSmtSim.Gbn.Daily" />
					<spring:message code="comCopSmtSim.title" />
				</caption>
				<!-- 월간 부서일정관리 -->
				<colgroup>
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
				</colgroup>
				<thead>
					<tr>
						<th><spring:message code="comCopSmtSim.Monthly.sunday" /></th>
						<!-- 일 -->
						<th><spring:message code="comCopSmtSim.Monthly.monday" /></th>
						<!-- 월 -->
						<th><spring:message code="comCopSmtSim.Monthly.tuesday" /></th>
						<!-- 화 -->
						<th><spring:message code="comCopSmtSim.Monthly.wednesday" /></th>
						<!-- 수 -->
						<th><spring:message code="comCopSmtSim.Monthly.thursday" /></th>
						<!-- 목 -->
						<th><spring:message code="comCopSmtSim.Monthly.friday" /></th>
						<!-- 금 -->
						<th><spring:message code="comCopSmtSim.Monthly.saturday" /></th>
						<!-- 토 -->
					</tr>
				</thead>
				<TBODY>
					<TR class='line'>
						<%
							List listResult = (List) request.getAttribute("resultList");
						EgovMap egovMap = new EgovMap();
						Random random = new Random();

						int iBeginDate = 0;
						int iBeginEnd = 0;
						//게시물카운트
						int iDayPreviewCount = 0;
						int iDayCount = 0;
						int iSchdulWeekFirest = 0;

						String[] arrWeekColorList = { "#8394c" //파랑 
								, "#8B008B" // 자주
								, "#228B22" //초록
								, "#FF69B4" //핫핑크
								, "#FFD700" //골드
								, "#B22222" //나무색
								, "#00BFFF" //DeepSkyBlue 
								, "#9400D3" //DarkViolet 
								, "#00CED1" //DarkTurquoise 
								, "#2F4F4F" //DarkSlateGrey 
								, "#FF8C00" //DarkOrange 
								, "#BDB76B" //DarkKhaki 	 
						};

						String[] arrWeekColorList2 = { "Tomato", "Orange", "DodgerBlue", "MediumSeaGreen", "Gray", "SlateBlue", "Violet",
								"LightGray" };

						//저번달 계산
						//년도/월 셋팅

						cal.set(year, month, 1);
						cal.add(cal.MONTH, -1);
						int startDay2 = cal.getMinimum(java.util.Calendar.DATE);
						int endDay2 = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
						int newLine2 = 0;

						for (int index = 1; index < start; index++) {
							newLine2++;
							newLine++;
						}

						if (newLine == 7) {
							newLine = 0;
						}

						//처음 빈공란 표시 + 저번달 날짜 추가
						for (int index = 0; index < newLine2; index++) {
							String idvalue = "";
							if (month == 0) {
								String idyear = Integer.toString(year - 1);
								String idmonth = "12";
								String iddate = Integer.toString(endDay2 - newLine2 + index + 1);
								idvalue = idyear.join("", idyear, idmonth, iddate);
							} else {
								String idyear = Integer.toString(year);
								String idmonth = String.format("%02d", month);
								String iddate = Integer.toString(endDay2 - newLine2 + index + 1);
								idvalue = idyear.join("", idyear, idmonth, iddate);
							}
							out.println("<TD valign='top' id='id_" + idvalue + "' valign='top' align='left' height='118px' nowrap='' >");

							//공휴일
							List holidayResult = (List) request.getAttribute("holidayList");
							String holidayName = "";

							for (Object holiday : holidayResult) {
								dudu.HolidayVO holidayVO = (dudu.HolidayVO) holiday;

								String originalDate = idvalue;
								String formattedDate = originalDate.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3");
								String day = holidayVO.getHolidayDate();

								if (day.equals(formattedDate)) {
							holidayName = holidayVO.getHolidayName();
								}
							}

							if (holidayName != "") {
								out.println("<div class='dayDiv'><font color='#ffc4c4'>" + (endDay2 - newLine2 + index + 1) + "</font></div>");
								out.println("<div class='holiday' style='opacity: 0.5;'>" + holidayName + "</div>");
							} else {
								out.println("<div class='dayDiv'><font color='#dfdfdf'>" + (endDay2 - newLine2 + index + 1) + "</font></div>");
							}

						}

						//처음 빈공란 표시
						/*for (int index = 1; index < start - newLine2; index++) {
							out.println("<TD></TD>");
							newLine++;
						}*/

						for (int index = 1; index <= endDay; index++) {
							String color = "";
							iDayCount = 0;
							iDayPreviewCount = 0;

							if (newLine == 0) {
								color = "RED";
								if (!(start == 1 && index == 1)) {
							out.println("<TR class='line'>");
								}
							} else if (newLine == 6) {
								color = "#529dbc";
							} else {
								color = "BLACK";
							}
							;

							String sUseDate = Integer.toString(year);

							sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
							: Integer.toString(month + 1);
							sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

							int iUseDate = Integer.parseInt(sUseDate);

							//일별게시껀
							if (listResult != null) {
								for (int i = 0; i < listResult.size(); i++) {
							egovMap = (EgovMap) listResult.get(i);
							iBeginDate = Integer.parseInt(((String) egovMap.get("schdulBgnde")).substring(0, 8));
							iBeginEnd = Integer.parseInt(((String) egovMap.get("schdulEndde")).substring(0, 8));
							if (iUseDate >= iBeginDate && iUseDate <= iBeginEnd) {
								iDayPreviewCount++;
							}
								}
							}

							if (iDayPreviewCount > 4) {
								out.println("<TD id='id_" + iUseDate + "' valign='top' align='left' height='"
								+ (92 + ((iDayPreviewCount - 4) * 24)) + "px' nowrap>");
							} else {
								out.println("<TD id='id_" + iUseDate + "' valign='top' align='left' height='118px' nowrap>");
							}

							//공휴일
							List holidayResult = (List) request.getAttribute("holidayList");
							String holidayName = "";
							for (Object holiday : holidayResult) {
								dudu.HolidayVO holidayVO = (dudu.HolidayVO) holiday;

								String originalDate = sUseDate;
								String formattedDate = originalDate.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3");
								String day = holidayVO.getHolidayDate();

								if (day.equals(formattedDate)) {
							holidayName = holidayVO.getHolidayName();
								}
							}

							if (holidayName != "") {
								out.println("<div class='dayDiv'><font color='red'>" + index + "</font></div>");
								out.println("<div class='holiday'>" + holidayName + "</div>");
							} else {
								out.println("<div class='dayDiv'><font color='" + color + "'>" + index + "</font></div>");
							}

							out.println("<BR>");

							if (listResult != null) {

								for (int i = 0; i < listResult.size(); i++) {
							egovMap = (EgovMap) listResult.get(i);

							iBeginDate = Integer.parseInt(((String) egovMap.get("schdulBgnde")).substring(0, 8));
							iBeginEnd = Integer.parseInt(((String) egovMap.get("schdulEndde")).substring(0, 8));

							int iBeginYear = Integer.parseInt(String.valueOf(iBeginDate).substring(0, 4));
							int iBeginMonth = Integer.parseInt(String.valueOf(iBeginDate).substring(4, 6)) - 1;
							int iBeginDay = Integer.parseInt(String.valueOf(iBeginDate).substring(6, 8));

							if (month > iBeginMonth) {
								iBeginMonth = month;
								iBeginDay = 01;
							}

							int iEndYear = Integer.parseInt(String.valueOf(iBeginEnd).substring(0, 4));
							int iEndMonth = Integer.parseInt(String.valueOf(iBeginEnd).substring(4, 6)) - 1;
							int iEndDay = Integer.parseInt(String.valueOf(iBeginEnd).substring(6, 8));

							if (month < iEndMonth) {
								iEndMonth = month;
								iEndDay = endDay; //해당 달의 마지막 날짜 계산
							}

							cBeginDate.set(iBeginYear, iBeginMonth, iBeginDay);
							cEndDate.set(iEndYear, iEndMonth, iEndDay);

							long remainingDays = (long) Math
									.ceil((float) (cEndDate.getTimeInMillis() - cBeginDate.getTimeInMillis()) / (24 * 60 * 60 * 1000));

							//스캐줄연속갯수
							int iSchdulCurrent = 0;
							int iSchdulCurrentTotal = 0;
							if (egovMap.get("schdulCurrent") == null) {
								iSchdulCurrent = Integer.parseInt(String.valueOf(remainingDays)); //iBeginEnd-iBeginDate;
								iSchdulCurrentTotal = Integer.parseInt(String.valueOf(remainingDays)); //iBeginEnd-iBeginDate;
							} else {
								iSchdulCurrent = (Integer) egovMap.get("schdulCurrent");
							}
							//주의첫일정갯수
							if (egovMap.get("schdulWeekFirest") == null) {
								iSchdulWeekFirest = 0;
							} else {
								iSchdulWeekFirest = (Integer) egovMap.get("schdulWeekFirest");
							}

							//if( >= iUseDate && iUseDate <= iBeginEnd){
							if (iUseDate >= iBeginDate && iUseDate <= iBeginEnd) {

								//이전 Dispaly 방식
								//out.print("<table><tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'><a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
								//out.print((String)egovMap.get("schdulNm"));
								//out.println("</a></div></td></tr></table>");

								//표준프레임워크 3.6 Display 방식
								//스케줄연속갯수 감소
								iSchdulCurrent--;
								egovMap.put("schdulCurrent", iSchdulCurrent);

								//주의첫일정갯수 증가
								if (newLine == 6) {
									iSchdulWeekFirest = 0;
								} else if (newLine >= 0) {
									iSchdulWeekFirest++;
								}
								egovMap.put("schdulWeekFirest", iSchdulWeekFirest);

								int iDotTextWidth = 0;
								if (iSchdulWeekFirest == 1 || (iSchdulWeekFirest == 0 && iSchdulCurrent == iSchdulCurrentTotal - 1)) { //첫 토요일 보정 처리

									if ((iSchdulCurrent + 1) < 6) {
										iDotTextWidth = 100 * (iSchdulCurrent + 2);
									} else {
										iDotTextWidth = 100 * (7 - newLine);
									}

									if (egovMap.get("schdulWeekColor") == null) {
										//egovMap.put("schdulWeekColor", arrWeekColorList[random.nextInt(11)]);
										egovMap.put("schdulWeekColor", arrWeekColorList2[iDayCount]);
									}

									out.print("<div class='divWeekBar' style='margin-top:" + (iDayCount * 20)
											+ "px;position:absolute;width:" + iDotTextWidth + "px;border:solid 0px;background-color:"
											+ egovMap.get("schdulWeekColor")
											+ ";'><a href=\"JavaScript:fn_egov_detail_IndvdlSchdulManage('"
											+ (String) egovMap.get("schdulId") + "')\" class='linkWeek'>");
									out.print((String) egovMap.get("schdulNm"));
									out.println("</a></div>");
								}
								//일별스케줄갯수
								iDayCount++;
							}
								}
							}

							out.println("</TD>");
							newLine++;

							if (newLine == 7) {
								out.println("</TR>");
								/*
								out.println("<TR class='line'><td></td><td></td><td></td><td></td><td></td><td></td><td></td></TR>");
								if (index <= endDay) {
							out.println("<TR class='line'>");
								}
								*/
								newLine = 0;
							}
						}

						//마지막 공란 LOOP +  다음달 날짜 추가
						int lastDay = 1;
						while (newLine > 0 && newLine < 7) {
							String idvalue = "";
							if (month == 11) {
								String idyear = Integer.toString(year + 1);
								String idmonth = "01";
								String iddate = String.format("%02d", lastDay);
								idvalue = idyear.join("", idyear, idmonth, iddate);
							} else {
								String idyear = Integer.toString(year);
								String idmonth = String.format("%02d", month + 2);
								String iddate = String.format("%02d", lastDay);
								idvalue = idyear.join("", idyear, idmonth, iddate);
							}
							out.println("<TD valign='top' id='id_" + idvalue + "'>");

							//공휴일
							List holidayResult = (List) request.getAttribute("holidayList");

							String holidayName = "";
							for (Object holiday : holidayResult) {
								dudu.HolidayVO holidayVO = (dudu.HolidayVO) holiday;

								String originalDate = idvalue;
								String formattedDate = originalDate.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3");
								String day = holidayVO.getHolidayDate();

								if (day.equals(formattedDate)) {
							holidayName = holidayVO.getHolidayName();
								}
							}

							if (holidayName != "") {
								out.println("<div class='dayDiv'><font color='#ffc4c4'>" + lastDay + "</font></div>");
								out.println("<div class='holiday' style='opacity: 0.5;'>" + holidayName + "</div>");
							} else {
								out.println("<div class='dayDiv'><font color='#dfdfdf'>" + lastDay + "</font></div>");
							}

							newLine++;
							lastDay++;
						}
						if (newLine != 0) {
							newLine = 0;
						}

						//줄이 5줄일 경우 한 줄 추가
						if ((newLine2 + endDay + lastDay - 1) / 7 < 6) {
							out.println("<TR class='line'>");

							while (newLine < 7) {
								String idvalue = "";
								if (month == 11) {
							String idyear = Integer.toString(year + 1);
							String idmonth = "01";
							String iddate = String.format("%02d", lastDay);
							idvalue = idyear.join("", idyear, idmonth, iddate);
								} else {
							String idyear = Integer.toString(year);
							String idmonth = String.format("%02d", month + 2);
							String iddate = String.format("%02d", lastDay);
							idvalue = idyear.join("", idyear, idmonth, iddate);
								}
								out.println("<TD valign='top' id='id_" + idvalue + "' valign='top' align='left' height='118px' nowrap>");

								//공휴일
								List holidayResult = (List) request.getAttribute("holidayList");

								String holidayName = "";
								for (Object holiday : holidayResult) {
							dudu.HolidayVO holidayVO = (dudu.HolidayVO) holiday;

							String originalDate = idvalue;
							String formattedDate = originalDate.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3");
							String day = holidayVO.getHolidayDate();

							if (day.equals(formattedDate)) {
								holidayName = holidayVO.getHolidayName();
							}
								}

								if (holidayName != "") {
							out.println("<div class='dayDiv'><font color='#ffc4c4'>" + lastDay + "</font></div>");
							out.println("<div class='holiday' style='opacity: 0.5;'>" + holidayName + "</div>");
								} else {
							out.println("<div class='dayDiv'><font color='#dfdfdf'>" + lastDay + "</font></div>");
								}

								newLine++;
								lastDay++;
							}
						}
						%>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</form>
	<!-- 프로젝트 등록 -->
		<div id="modal1" class="modal">		
		<div class="modal_body" style="text-align:center;">
		<form class="pjfrom" action="pjinsert.do" name="sub2" method="POST">
		    <div style="width:100%; display:inline-block;">
		   		<input class="pjinput" style="float:left; width:15%; height:39px; padding:unset;" name="pjcolor" type="color">
		        <input style="width:68%; float:right;" name="pjtitle" class="pjinput" type="text" placeholder="프로젝트 제목">
		    </div>
		    <div style="width:100%">
		        <input style="width:140px" name="pjstart" class="pjinput" type="date" placeholder="시작날짜">
		        <input style="width:140px" name="pjend" class="pjinput" type="date" placeholder="종료날짜">
		    </div>
		    <div style="width:100%">

		    </div>
		    <div style="display:flex; width:100%">
		    <div style="width:50%">
		    <select id="username" style="float:left; height:100%;" name="username">
		    	<c:forEach items="${username}" var="userlist">
		    		<option value="${userlist.username}">${userlist.username}${userlist.userdepartment}</option>
		    	</c:forEach>
		    </select>
				<input id="add" style="margin-bottom:7px; font-size:12pt; display:flex" type="button" value="추가">
		    	<input id="remove" style="font-size:12pt; display:flex" type="button" value="삭제">
		    	   
		    </div>
		    <div id="member" style="width:50%">
		    </div>
		    </div>
		    <div style="width:100%">
<textarea name="pjcnt" class="pjinput" type="text" placeholder="프로젝트 내용" style="height:200px;"></textarea>
		    </div>
		    <div style="width:100%">
		        <input style="width:100%;" class="pjinput" type="button" value="등록하기" id="pjregist">
		        <input style="width:100%;" class="pjinput" type="button" id="close" value="닫기">
		    </div>
		</div>
		<input type="hidden" name="useremail" value="ddd@naver.com">
		<input type="hidden" name="userdm" value="LMS">
		</form>
	</div>
	
	<!-- 일일 업무 등록 -->
	<div id="modal2" class="modal">		
		<div class="modal_body" style="text-align:center;">
		<form class="pjfrom" action="dailyinsert.do" name="sub3" method="POST">
		    <div style="width:100%; display:inline-block;">
		   		<input class="pjinput" style="float:left; width:15%; height:39px; padding:unset;" name="pjcolor" type="color">
		        <input style="width:68%; float:right;" name="pjtitle" class="pjinput" type="text" placeholder="일일업무 제목">
		    </div>

		    <div style="width:100%">
<textarea name="pjcnt" class="pjinput" type="text" placeholder="일일업무 내용" style="height:200px;"></textarea>
		    </div>
		    <div style="width:100%">
		        <input style="width:100%;" class="pjinput" type="button" value="등록하기" id="regist">
		        <input style="width:100%;" class="pjinput" type="button" id="closedaily" value="닫기">
		    </div>
		</div>
		<input type="hidden" name="useremail" value="ddd@naver.com">
					
		</form>
	</div>
</body>
<script type="text/javascript" src="/js/dudu/calendar.js"></script>
<script>
$('#pjregist').click(function(){
	$('input:checkbox[name="pjmember"]').prop("checked",true);
	document.sub2.submit();
})

$('#dailyregist').click(function(){
	document.sub3.submit();
})
	
	function openProject(){
		var project = document.getElementById("modal1");		
		project.style.display = "inline-block";
	}
	
	function openDaily(){
		var daily = document.getElementById("modal2");
		daily.style.display = "inline-block";
	}
	
	var closeproject = document.getElementById("close");
	closeproject.onclick = function (){
		var project = document.getElementById("modal1");
		project.style.display = "none";

	}
	document.getElementById("closedaily").onclick = function(){
		
		var daily = document.getElementById("modal2");
		daily.style.display = "none";
	}
	document.getElementById("add").onclick = function(){
		var add = $("#username option:selected").text();
		$('#member').append("<label style='float:right'><input name='pjmember' type='checkbox' value="+add+">"+add+"</label>");
	
	}
	
	document.getElementById("remove").onclick = function(){
		$("input:checkbox[name='pjmember']").each(function(){
			if($(this).is(":checked")==true){
				$(this).parent().remove();
			}	
		})
	}
</script>
</html>