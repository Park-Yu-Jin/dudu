<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link href="https://webfontworld.github.io/TheJamsil/TheJamsil.css"
	rel="stylesheet">
<link href="../../css/dudu/approval.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
window.onload=function(){
	if('${status}' == '대기'){
		$('#wait').closest('.menuli').css({"color":"#2556a3","border-bottom":"1px solid #2556a3"});
		$('#wait').css({"color":"#092873"});
		$('#finish').css("color","#bda6a6");
		$('#back').css("color","#bda6a6");
		$('#me').css("color","#bda6a6");
	}
	if('${status}' == "완료"){
		$('#wait').css("color","#bda6a6");
		$('#finish').closest('.menuli').css({"color":"#2556a3","border-bottom":"1px solid #2556a3"});
		$('#finish').css({"color":"#092873"});
		$('#back').css("color","#bda6a6");
		$('#me').css("color","#bda6a6");
	}
	if('${status}' == '반려'){
		$('#wait').css("color","#bda6a6");
		$('#finish').css("color","#bda6a6");
		$('#back').closest('.menuli').css({"color":"#2556a3","border-bottom":"1px solid #2556a3"});
		$('#back').css({"color":"#092873"});
		$('#me').css("color","#bda6a6");
	}
	if('${status}' == '내꺼'){
		$('#wait').css("color","#bda6a6");
		$('#finish').css("color","#bda6a6");
		$('#back').css("color","#bda6a6");
		$('#me').closest('.menuli').css({"color":"#2556a3","border-bottom":"1px solid #2556a3"});
		$('#me').css({"color":"#092873"});
	}
}


</script>
<body>
<button type="button" onclick="backToCalendar()" class="back">
	<span class="material-symbols-outlined">arrow_back</span>
</button>
<div class="title">
	<div style="color:#092873; font-size:25px;">결재 목록</div>
	<div style="display:flex; width:80%; justify-content:flex-end"><button class="menubtn" type="button" onclick="openmodal()">결재 등록</button></div>
</div>
<div class="menudiv">

	<ul class="topnav">
		<li class="menuli" ><a id="wait" href="approval.do?appstatus=대기">대기중 항목</a></li>
		<li class="menuli" ><a id="finish" href="approval.do?appstatus=완료">완료된 항목</a></li>
		<li class="menuli" ><a id="back" href="approval.do?appstatus=반려">반려된 항목</a></li>
		<li class="menuli" ><a id="me" href="approval.do?appstatus=내꺼">내가 올린 항목</a></li>
	</ul>
	
</div>

	<%-- 대기중 항목 페이지 --%>
	<c:choose>
		<c:when test="${status eq '대기' }">
		<c:choose>
				<c:when test="${fn:length(applist) ne 0}">
			<table class="apptable">
				<tr class="header">
					<td>제목</td>
					<td>등록 날짜</td>
					<td>결재 날짜</td>
					<td>승인 상태</td>
					<td>작성자</td>
				</tr>
				<c:forEach items="${applist}" var="applist">
					<tr class="rowheader">
						<td><a href="detailapp.do?appauto=${applist.appauto}"><c:out value="${applist.apptitle}"/></a></td>
						<td><c:out value="${applist.appdate}"/></td>
						<td><c:out value="${applist.appenddate}"/></td>
						<td>결재 대기 중</td>
						<c:set var="name" value="${fn:split(applist.useremail,',')}"/>
						<td><c:out value="${name[0]}"/></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
				<div class="divtext">대기 중 결재항목이 없습니다.</div>
			</c:otherwise>
		</c:choose>
		</c:when>

		
		<%-- 완료된 항목 페이지 --%>
		<c:when test="${status eq '완료'}">
			<c:choose>
				<c:when test="${fn:length(applist) ne 0}">
			<table class="apptable">
				<tr class="header">
					<td>제목</td>
					<td>등록 날짜</td>
					<td>결재 날짜</td>
					<td>승인 상태</td>
					<td>작성자</td>
				</tr>
				<c:forEach items="${applist}" var="applist">
					<tr class="rowheader">
						<td><a href="detailapp.do?appauto=${applist.appauto}"><c:out value="${applist.apptitle}"/></a></td>
						<td><c:out value="${applist.appdate}"/></td>
						<td><c:out value="${applist.appenddate}"/></td>
						<td>결재 완료</td>
						<c:set var="name" value="${fn:split(applist.useremail,',')}"/>
						<td><c:out value="${name[0]}"/></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
				<div class="divtext">완료된 결재항목이 없습니다.</div>
			</c:otherwise>
		</c:choose>
		</c:when>
		
		<%-- 반려된 항목 페이지 --%>
		<c:when test="${status eq '반려'}">
			<c:choose>
			<c:when test="${fn:length(applist) ne 0}">
			<table class="apptable">
				<tr class="header">
					<td>제목</td>
					<td>등록 날짜</td>
					<td>결재 날짜</td>
					<td>승인 상태</td>
					<td>작성자</td>
				</tr>
				<c:forEach items="${applist}" var="applist">
					<tr class="rowheader">
						<td><a href="detailapp.do?appauto=${applist.appauto}"><c:out value="${applist.apptitle}"/></a></td>
						<td><c:out value="${applist.appdate}"/></td>
						<td><c:out value="${applist.appenddate}"/></td>
						<td><a href="#this" onclick="backcheck('${ applist.appauto}')">반려</a></td>
						<c:set var="name" value="${fn:split(applist.useremail,',')}"/>
						<td><c:out value="${name[0]}"/></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
			<c:otherwise>
				<div class="divtext">반려된 결재항목이 없습니다.</div>
			</c:otherwise>
		</c:choose>
		</c:when>
		</c:choose>
		
		<%-- 내가 올린 항목 페이지 --%>
	<c:choose>
		<c:when test="${status eq '내꺼' }">
		<c:choose>
				<c:when test="${fn:length(applist) ne 0}">
			<table class="apptable">
				<tr class="header">
					<td>제목</td>
					<td>등록 날짜</td>
					<td>결재 날짜</td>
					<td>승인 상태</td>
					<td>작성자</td>
				</tr>
				<c:forEach items="${applist}" var="applist">
					<tr class="rowheader">
						<td><a href="detailapp.do?appauto=${applist.appauto}"><c:out value="${applist.apptitle}"/></a></td>
						<td><c:out value="${applist.appdate}"/></td>
						<td><c:out value="${applist.appenddate}"/></td>
						<c:choose>
							<c:when test="${applist.appstatus eq '완료' }">
								<td>결재 완료</td>
							</c:when>
							<c:when test="${applist.appstatus eq '반려' }">
								<td><a href="#this" onclick="backcheck('${ applist.appauto}')">반려</a></td>
							</c:when>
							<c:otherwise>
								<td>결재 대기 중</td>
							</c:otherwise>
						</c:choose>
						<c:set var="name" value="${fn:split(applist.useremail,',')}"/>
						<td><c:out value="${name[0]}"/></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
				<div class="divtext">내가 올린 항목이 없습니다.</div>
			</c:otherwise>
		</c:choose>
		</c:when>
		</c:choose>
		
			<c:if test="${fn:length(applist) ne 0}">
			<div
		style="font-size: 20px; font-family: 'TheJamsil'; color: #313131; align-items: center; position: absolute; left: 50%; bottom: 15%; translate: -50%;" class="paging">
		<c:choose>
			<%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
			<c:when test="${paging.page<=1}">
				<span><span class="material-symbols-outlined"
					style="font-size: 15px; margin: 0;"> arrow_back_ios_new </span></span>
			</c:when>
			<%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
			<c:otherwise>
				<a href="/pjlist.do?page=${paging.page-1}"><span
					class="material-symbols-outlined"
					style="font-size: 15px; margin: 0;"> arrow_back_ios_new </span></a>
			</c:otherwise>
		</c:choose>

			<%--  for(int i=startPage; i<=endPage; i++)      --%>
			<c:forEach begin="${paging.startPage}" end="${paging.endpage}"
				var="i" step="1">
				<c:choose>
					<%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
					<c:when test="${i eq paging.page}">
						<span style="color: #2277d7;">${i}</span>
					</c:when>

					<c:otherwise>
						<a href="/approval.do?page=${i}&appstatus=${status}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				<span><span style="font-size: 15px; margin: 0;"
					class="material-symbols-outlined"> arrow_forward_ios </span></span>
			</c:when>
			<c:otherwise>
				<a href="/approval.do?page=${paging.page+1}&appstatus=${status}"><span
					style="font-size: 15px; margin: 0;"
					class="material-symbols-outlined"> arrow_forward_ios </span></a>
			</c:otherwise>
		</c:choose>
		</div>
		</c:if>
<div id="modal1" class="modal">
	<div class="modal_body">
	<form class="pjfrom" id="appform" name="appform" action="appinsert.do" method="post" enctype="multipart/form-data" >
		<div style="width: 100%; margin: 20px;">
			<div>
				<div class="approval_body">
				<div style="font-size:20pt;">결재 신청서</div>
				<div class="apptitle">
					<div class="approval">
						<div class="approval_1">
							<div>담당</div>
							<div class="aprroval_2">&nbsp</div>
						</div>
						<div class="approval_1">
							<div>부서장</div>
							<div class="aprroval_2">&nbsp</div>
						</div>
						<div style="width:33%;">
							<div>대표이사</div>
							<div class="aprroval_2">&nbsp</div>
						</div>
					</div>
				</div>
				<div class="approval_top">
					<div class="approval_topcolor">신청자</div>
					<div class="approval_topcolor">소속</div>
					<div>${sessionScope.loginMember.orgnztNm}</div>
					<div class="approval_topcolor">이름</div>
					<div style="border:none;">${sessionScope.loginMember.name}</div>
				</div>
				<div>
					<div class="approval_title">
						<div class="approval_title_1">제목</div>
						<div style="width:80%;"><input style="width:400px;" type="text" maxlength="50" name="apptitle" placeholder="공문 제목"></div>
					</div>
				</div>
				<div>
					<div class="approval_cnt">
						<div class="approval_cnt_1">내용</div>
						<div style="width:80%;"><textarea maxlength="1000" id="appcnt" name="appcnt" placeholder="공문 내용" type="text"></textarea></div>
					</div>
				</div>
				<div>
					<div class="approval_member">
						<div class="approval_member_1">결재자</div>
						<div class="approval_member_2">
							<div style="height:30px;">팀 선택</div>
							<select id="team" onchange="change(this)">
								<option value="기획">기획</option>
								<option value="사업관리">사업관리</option>
								<option value="영업">영업</option>
								<option value="컨텐츠">컨텐츠</option>
								<option value="LMS">LMS</option>
							</select>
						</div>
						<div style="border:none; margin-left:5px;">							
							<select id="appname" name="appname">
								<c:forEach items="${userList}" var = "user">
									<c:if test="${user.userdepartment eq '기획' and sessionScope.loginMember.auth < user.userrole}">
										<script>console.log("auth = ${session.Scope.loginMember.auth}");</script>
										<option value="${user.useremail},${user.userrole}">${user.username} ${user.userrank }</option>
									</c:if>
								</c:forEach>
							</select>
							<div class="cnt_btn">
								<input style="margin:5px;" type="button" id="appadd" value="추가">
								<input type="button" id="appremove" value="삭제">
							</div>
							<div style="height:50px;" class="member" id="app">
							</div>
						</div>
					</div>
					<div>
						<div class="approval_file">
							<div class="approval_file_1">첨부파일</div>
							<div style="margin: 20px;"><a href="#this" onclick="addfile()">파일 추가</a></div>
							<div class="insert">
							<div><input type="file" name="filename" accept=".pdf,.img,.hwp,.png"><a href="#this" name="file-delete">삭제</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			</div>
					<div class="approval_btn">
						<input class="appbtn" type="button" value="등록" onclick="appsubmit()">
						<input class="appbtn" type="button" value="닫기" onclick="closemodal()">
					</div>
		</div>
		<input type="hidden" name="useremail" value="${sessionScope.loginMember.email}">
		<input type="hidden" name="username" value="${sessionScope.loginMember.name}">
		<input type="hidden" name="appstatus" value="${sessionScope.loginMember.auth}">
		</form>
		
	</div>
</div>
<c:forEach items="${applist}" var="app">
	<div id="app_${app.appauto}" class="modal">		
		<div class="backmodal">
		    <div class="backtitle">
		        반려 사유
		    </div>
		    <div style="width:100%; height:50%; display:flex; justify-content:center; margin-top:10px;">
			<div class="backcnt">${app.appreason}</div>
		    </div>
		    <div class="backbtn">
		        <input type="button" value="확인" onclick="appclose(${app.appauto})">
		    </div>
		</div>
	</div>
</c:forEach>
</body>
</html>
<script>
console.log("auth = ${sessionScope.loginMember.auth}");
	function change(e){
		var item = document.getElementById("appname");
		console.log(item);
		item.innerHTML = "";
		<c:forEach items="${userList}" var = "user">
		if(e.value == '${user.userdepartment}' && "${sessionScope.loginMember.auth}" < "${user.userrole}"){
			var option = document.createElement("option");
			option.text = "${user.username}\n${user.userrank}";
			option.value = "${user.useremail},${user.userrole}";
			item.add(option);
		}
		</c:forEach>
	}
	$(document).ready(function(){
	    $("a[name='file-delete']").on("click", function(e){
	        e.preventDefault();
	        deleteFile($(this));
	    });

	    $(".insert").on("click", "a[name='file-delete']", function(e){
	        e.preventDefault();
	        deleteFile($(this));
	    });
	});

	var count = 1;

	function addfile(){
	    var str = "<div><input type='file' name='filename'><a href='#this' name='file-delete'>삭제</a></div>";
	    if (count > 2){
	        alert("파일은 최대 3개까지 등록할 수 있습니다");
	        return false;
	    } else {
	        $(".insert").append(str);
	        count++;
	    }
	}

	function deleteFile(obj){
	    obj.parent().remove();
	    count--; // 파일 삭제 시 count 감소
	    if (count < 0) {
	        count = 0; // 음수가 되지 않도록 보정
	    }
	}

	
	
	/*모달 열고 닫기*/
	function openmodal(){
		$('#modal1').css("display","inline-block");
	}
	function closemodal(){
		$('#modal1').css("display","none");
	}
	
	/*결재자 등록, 삭제*/
	document.getElementById("appadd").onclick = function(){
	var add = $("#appname option:selected").val();
	var ad = $("#appname option:selected").text();
	if(ad == ""){
		alert("결재자를 선택해 주세요");
		return false;
	}
	$('#app').append("<p><input id='appmember' name='appmember' type='checkbox' value="+add+">"+ad+"</p>");
	$('#appname option:selected').remove();
	}
	
	document.getElementById("appremove").onclick = function(){
		var result ="";
		var reuslt2 ="";
		console.log("result = "+result);
		$("input:checkbox[name='appmember']").each(function(){
			if($(this).is(":checked")==true){
				result = $(this).val();
				result2 = $(this).closest('p').text().trim();
				console.log("result = "+result);
				console.log("result2 = "+result2);
				$(this).parent().remove();
				$('#appname').prepend("<option value='"+result+"'>"+result2+"</option>");
			}

		})
		if(result == ""){
			alert("삭제할 결재자를 선택해 주세요");
			return false;
		}
	}
	
	/*수신자 참조 등록, 삭제
		document.getElementById("refadd").onclick = function(){
	var add = $("#refname option:selected").text();
	$('#ref').append("<label style='float:right'><input id='refmember' name='appref' type='checkbox' value="+add+">"+add+"</label>");
	}
	
	document.getElementById("refremove").onclick = function(){
		$("input:checkbox[name='refmember']").each(function(){
			if($(this).is(":checked")==true){
				$(this).parent().remove();
			}	
		})
	}*/
	/*등록하기*/
	function appsubmit(){

		if($('#apptitle').val()==""){
			alert("제목을 입력해주세요");
			return false;
		}
		else if($('#appcnt').val()==""){
			alert("내용을 입력해주세요");
			return false;
		}
		else{
			$('input:checkbox[name="appmember"]').prop("checked",true);
			$('input:checkbox[name="refmember"]').prop("checked",true);
		document.appform.submit();
		}
	}
	
	function backcheck(appauto){
		var backcheck = document.getElementById("app_"+appauto);
		backcheck.style.display = "inline-block";
	}
	
	function appclose(appauto){
		var backcheck = document.getElementById("app_"+appauto);
		backcheck.style.display = "none";
	}
	
	   function backToCalendar() {
		      window.parent.frames['_calendar'].location.replace("duducalendar.do");
		   }
</script>