<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://webfontworld.github.io/TheJamsil/TheJamsil.css" rel="stylesheet">
<link href="../../css/dudu/appdetail.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" onclick="backToCalendar()" class="back">
	<span class="material-symbols-outlined">arrow_back</span>
</button>
	<div class="main_div">
	<div style="display:flex; padding:10px 0;; border-bottom:1px solid #d3d3d3;">
	<div style="display:flex; width:50%; align-items:center;"><img style="width:100%;" src="<c:url value='/images/dudu/dudulogo.png' />"></div>
	<div style="display:flex; width:49%; justify-content: flex-end;">
	<table class="apptable" border=1>
		<tr class="apptr">
			<td class="apptd">담당</td>
			<td class="apptd">부서장</td>
			<td class="apptd">대표이사</td>
		</tr>
		<tr class="apptr">
			<td style="width:70px; height:70px;" id="first">&nbsp</td>
			<td style="width:70px; height:70px;" id="middle">&nbsp</td>
			<td style="width:70px; height:70px;" id="final">&nbsp</td>
		</tr>
	</table>
</div>
</div>
<div style="display:flex; justify-content:center; width:100%; height:100%; font-size:15pt;">
		<form class="pjfrom" id="approval" name="approval">
		<div class="content" style="align-items:center;">
			<div class="approval_topcolor">신청자</div>
			<div class="approval_topcolor">소속</div>
			<div>팀이름</div>
			<div class="approval_topcolor">이름</div>
			<div>이름</div>
		</div>
		<div class="content" >
		<div class="approval_topcolor">제목</div>
			<div style="width:80%;"><c:out value="${applist.apptitle}"/></div>
		</div>
		<div class="content" style="width:100%;">
		<div class="approval_topcolor">첨부파일</div>
		<div style="width:80%;">
			<c:set var="name" value="${fn:split(applist.appfilename,',')}"/>
			<c:set var="realfile" value="${fn:split(applist.appfile,',')}"/>
			<c:forEach var="i" begin="0" end="${fn:length(name)-1}">
					<div style="width:100%;"><a style="width:100%;" href="download?filename=${realfile[i]}" download><c:out value="${name[i]}"/>
				</a></div>
				</c:forEach>
				</div>
		</div>
		<div class="content" style="width:100%; height:80%; border:none;">
			<div style="width:100%; margin:10px; align-items:flex-start; justify-content:flex-start;"><c:out value="${applist.appcnt}"/></div>
		</div>
		<c:set var="auth" value="${sessionScope.loginMember.auth}"/>
		<c:set var="appstatus" value="${applist.appstatus}"/>
		<c:choose>
			<c:when test="${appstatus ne '완료' && appstatus ne '반려' && (auth eq applist.appfirst || auth eq applist.appmiddle || auth eq applist.appfinal || auth eq '5')}">
			<div class="content" style="border:none; border-top:1px solid #d3d3d3; width:100%; height:10%; display:flex; justify-content:center;">
				<input onclick="approve()" class="btn" type="button" value="승인">
				<input onclick="back()" class="btn" type="button" value="반려">
			</div>
			</c:when>
		</c:choose>
		<input type="hidden" name="appauto" value="${applist.appauto}">
		<input type="hidden" name="useremail" value="${sessionScope.loginMember.name}">
		<input type="hidden" name="userrole" value="${sessionScope.loginMember.auth}">
		<input type="hidden" name="appstatus" value="${applist.appstatus }">
		<input type="hidden" name="appfirst" value="${applist.appfirst}">
		<input type="hidden" name="appmiddle" value="${applist.appmiddle}">
		<input type="hidden" name="appfinal" value="${applist.appfinal}">
		
		</form>
		</div>
	</div>

	<div id="modal2" class="modal">		
		<div class="modal_body" style="text-align:center;">
		<form class="pjfrom"  action="appback.do" name="sub3" method="POST">
		    <div class="backtitle">
		        반려 사유
		    </div>
		    <div style="width:100%">
			<textarea id="dacnt" name="appreason" class="backcnt" type="text" maxlength="1500" placeholder="반려사유" ></textarea>
		    </div>
		    <div class="backfoot">
		        <input class="backbtn" type="submit" value="반려">
		        <input class="backbtn" type="button" value="닫기" onclick="appclose()">
		    </div>
		</div>
		<input type="hidden" name="appauto" value="${applist.appauto}">
		</form>
	</div>
	
	
</body>
</html>

<script>
	
	if("${applist.appfirst}" == "완료"){
		document.getElementById("first").classList.add("backslash");
	}
	if("${applist.appmiddle}" == "완료"){
		document.getElementById("middle").classList.add("backslash");
	}
	
	
	if("${applist.appfirst}".length >=2 && "${applist.appfirst}" != '완료'){
		$('#first').text('${applist.appfirst}');
	}
	if("${applist.appmiddle}".length >=2 && "${applist.appfirst}" != '완료'){
		$('#middle').text('${applist.appmiddle}');
	}
	if("${applist.appfinal}".length >=2){
		$('#final').text('${applist.appfinal}');
	}

	function approve(){
		var approval = document.getElementById("approval");
		approval.setAttribute("action","approve.do");
		console.log(approval);
		document.approval.submit();
		
	}
	
	function back(){
		var back = document.getElementById("modal2");
		back.style.display = "inline-block";
	}
	
	function appclose(){
		var back = document.getElementById("modal2");
		back.style.display = "none";
	}
	 function backToCalendar() {
	      window.parent.frames['_calendar'].location.replace("approval.do");
	   }
	
</script>