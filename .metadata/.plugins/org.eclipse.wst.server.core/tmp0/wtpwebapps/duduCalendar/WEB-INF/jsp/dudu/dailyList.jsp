<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<link type="text/css" rel="stylesheet"
   href="<c:url value='/css/egovframework/com/cop/smt/sdm/dept_schdule_manage.css'/>">
<link href="https://webfontworld.github.io/TheJamsil/TheJamsil.css"
   rel="stylesheet">
<link type="text/css" rel="stylesheet"
   href="<c:url value='../../css/dudu/nav.css'/>">
<link type="text/css" rel="stylesheet"
   href="<c:url value='../../css/dudu/pjlist.css'/>">
<link type="text/css" rel="stylesheet"
   href="<c:url value='../../css/dudu/dailyList.css'/>">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <button type="button" onclick="backToCalendar()" class="back">
      <span class="material-symbols-outlined">arrow_back</span>
   </button>
   <div class="maindiv">
      <form>
         <div class="listtable">
            <div class="ptitle"
               style="width: 20%;margin-bottom: 30px;color: #092873;margin-left: 20px;font-size: 25px;">일일업무
               목록</div>
               
            <c:if test="${fn:length(result) ne 0}">
            <div class="row blueborder">
               <div class="thead">
                  <div class="pno header">번호</div>
                  <div class="ptitle header">프로젝트 제목</div>
                  <div class="ptitle header">일일업무 제목</div>
                  <div class="pmem header" style="justify-content: center;">작성자</div>
                  <div class="pdate header">날짜</div>
               </div>
            </div>
               </c:if>
            <div class="tbody">
               <c:forEach items="${result}" var="dailyList">
                  <div class="row" onclick="openDaily('${dailyList.dailyno}')">
                     <div>
                        <div class="pno"><c:out value='${dailyList.dailyno}'/></div>
                        <input type="button" value="<c:out value='${dailyList.pjtitle}'/>" class="ptitle">
                        <input type="button" value="<c:out value='${dailyList.datitle}'/>" class="ptitle">
                         <div class="pmem">
                           <c:out value="${dailyList.username }"></c:out>
                        </div> 
                        <div class="pdate">
                           <div class="pstart">
                           		<c:set var="splitDate" value="${fn:split(dailyList.dadate, ' ')}"/>
                              <c:out value='${splitDate[0]}' />
                           </div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
					<c:if test="${fn:length(result) eq 0}">
						<div class="nodaily">일일업무가 존재하지 않습니다.</div>
					</c:if>
				</div>
         </div>
      </form>
   </div>
   
   <!-- 일일업무 상세보기 -->
	<c:forEach items="${result}" var="daily">
		<div id="da_${daily.dailyno}" class="modal">		
		<div class="modal_body" style="text-align:center;">
		<form class="pjfrom" id="${daily.dailyno}" method="POST">
			<div style="width:100%; margin:20px;">
				<div class="modaltitle">
					<div style="font-size:large; color:#2556a3;">일일 업무 정보</div>
				</div>
				<div class="pjinfo">* 일일 업무 정보입니다</div>
				<table>
					<tr>
						<td>일일 업무 명</td>
						<td class="tableborder" style="text-align:center;"><input style="margin=0;" type="color" name="dacolor" value="${daily.dacolor}"  id="deco"></td>
						<td class="tableborder"><input id="datitle_${daily.dailyno}" class="pjtitle" type="text" maxlength="50" name="datitle" placeholder="일일 업무 명" value="${daily.datitle}"></td>
					</tr>
					<tr>
						<td>일일업무 내용</td>
						<td class="tableborder" colspan="2"><textarea id="dacnt_${daily.dailyno}" class="pjcnt" name="dacnt" maxlength="1000" placeholder="일일 업무 내용">${daily.dacnt}</textarea></td>
					</tr>
					<tr>
						<td>프로젝트 선택</td>
						<td class="tableborder" colspan="2">
						<div>
							<div style="display:flex; justify-content:center;">
								<select style="width: 200px;height: 40px;font-size: 12pt;margin: 5px;" name="daproject" id="daproject_${daily.dailyno}">
								<c:forEach items="${project}" var="project">
									<option value="${project.pjno}" ${title == project.pjtitle ? 'selected':''}>${project.pjtitle}</option>
								</c:forEach>
							</select>
							</div>
						</div>
						</td>
					</tr>
					<tr>
						<td>작업 상태</td>
						<td class="tableborder" colspan="2">
							<div>
								<div style="display:flex; justify-content:center;">
									<select style="width: 200px;height: 40px;font-size: 12pt;margin: 5px;" name="dafinish" id="dafinish_${daily.dailyno}">
										<option value="0">작업중</option>
										<option value="1">작업 완료</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #d3d3d3;">
						<td>작업 중요도</td>
						<td class="tableborder" colspan="2">
							<div>
								<div style="display:flex; justify-content:center;">
								<c:set var="imp" value="${daily.daimp}"/>
									<select style="width: 200px;height: 40px;font-size: 12pt;margin: 5px;" name="daimp" id="daimp_${daily.dailyno}">
			    						<option value=1 ${imp == '1'?'selected':''}>1</option>
							    		<option value=2 ${imp == '2'?'selected':''}>2</option>
							    		<option value=3 ${imp == '3'?'selected':''}>3</option>
							    		<option value=4 ${imp == '4'?'selected':''}>4</option>
							    		<option value=5 ${imp == '5'?'selected':''}>5</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr style="height:150px; border:none">
						<td colspan="3">
							<div class="pjfoot">
								<div>
									<input type="button" value="수정" onclick="dailyupdate('${daily.dailyno}')">
								</div>
								<div>
									<input type="button" onclick="dailydelete('${daily.dailyno}')" value="삭제">
								</div>
								<div>
									<input type="button" value="닫기" onclick="dailyclose('${daily.dailyno}')">
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		
		<input type="hidden" name="useremail" value="${sessionScope.loginMember.email}">
		<input type="hidden" name="username" value="${sessionScope.loginMember.name }">
		<input type="hidden" name="dailyno" value="${daily.dailyno}">
		<input type="hidden" name="pjno" id="pjno_${daily.dailyno}">
		
		</form>
		</div>
	</div>
	</c:forEach>
   <c:if test="${fn:length(result) ne 0}">
   <div
      style="font-size: 20px; font-family: 'TheJamsil'; color: #313131; align-items: center; position: absolute; left: 50%; bottom: 15%; translate: -50%;">
      <c:choose>
         <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
         <c:when test="${paging.page<=1}">
            <span><span class="material-symbols-outlined"
               style="font-size: 15px; margin: 0;"> arrow_back_ios_new </span></span>
         </c:when>
         <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
         <c:otherwise>
            <a href="/dailyList.do?page=${paging.page-1}"><span
               class="material-symbols-outlined"
               style="font-size: 15px; margin: 0;"> arrow_back_ios_new </span></a>
         </c:otherwise>
      </c:choose>

      <%--  for(int i=startPage; i<=endPage; i++)      --%>
      <c:forEach begin="${paging.startPage}" end="${paging.endpage}" var="i"
         step="1">
         <c:choose>
            <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
            <c:when test="${i eq paging.page}">
               <span style="color: #2277d7;">${i}</span>
            </c:when>

            <c:otherwise>
               <a href="/dailyList.do?page=${i}">${i}</a>
            </c:otherwise>
         </c:choose>
      </c:forEach>

      <c:choose>
         <c:when test="${paging.page>=paging.maxPage}">
            <span><span style="font-size: 15px; margin: 0;"
               class="material-symbols-outlined"> arrow_forward_ios </span></span>
         </c:when>
         <c:otherwise>
            <a href="/dailyList.do?page=${paging.page+1}"><span
               style="font-size: 15px; margin: 0;"
               class="material-symbols-outlined"> arrow_forward_ios </span></a>
         </c:otherwise>
      </c:choose>
   </div>
   </c:if>
</body>
<script>
   <c:forEach items="${result}" var="btn">
   if ("${sessionScope.loginMember.position}" != "연구원") {
      $('#up_${btn.pjno}').show();
      $('#de_${btn.pjno}').show();
      $('#ad_${btn.pjno}').show();
      $('#rm_${btn.pjno}').show();
      $('#seldiv_${btn.pjno}').show();
   } else {
      $('#up_${btn.pjno}').hide();
      $('#de_${btn.pjno}').hide();
      $('#ad_${btn.pjno}').hide();
      $('#rm_${btn.pjno}').hide();
      $('#seldiv_${btn.pjno}').hide();
   }
   </c:forEach>
   
   function dailyupdate(title){
		if($('#datitle_'+title).val() == ""){
			alert("제목을 입력해주세요");
		}
		else if($('#dacnt_'+title).val() == ""){
			alert("내용을 입력해주세요");
		}
		else{
			const dailyform = document.getElementById(title);
			dailyform.setAttribute("action","dailyupdate.do");
			var pjtitle = document.createElement('input');
			pjtitle.type="hidden";
			pjtitle.name="pjtitle";
			pjtitle.value= $('#daproject_'+title+' option:selected').text();
			$('#pjno_'+title).val($('#daproject_'+title+' option:selected').val());
			dailyform.appendChild(pjtitle);
			dailyform.submit();
		}
	}
	function dailydelete(title){
		const dailyform = document.getElementById(title);
		$('#pjno_'+title).val($('#daproject_'+title+' option:selected').val());
		dailyform.setAttribute("action","dailydelete.do");
		dailyform.submit();
	}

	function dailyclose(no){
		var daily = document.getElementById("da_"+no);
		daily.style.display = "none";
	}
	
	function openDaily(no){
		var daily = document.getElementById("da_"+no);
		daily.style.display = "inline-block";
	}
	
	function dailyclose(no){
		
		var daily = document.getElementById("da_"+no);
		daily.style.display = "none";
	}
   
   function updatedd(title) {
      var start = new Date($('#pjstart_' + title).val());
      var end = new Date($("#pjend_" + title).val());

      var sub = Math.ceil(Math.abs(end - start) / (1000 * 60 * 60 * 24));

      if ($('#pjtitle_' + title).val() == "") {
         alert("제목을 입력해주세요");
         return false;
      } else if ($('#pjcnt_' + title).val() == "") {
         alert("내용을 입력해주세요");
         return false;
      } else if ($('#pjstart_' + title).val() == ""
            || $('#pjend_' + title).val() == "") {
         alert("날짜를 입력해주세요");
         return false;

      } else if (sub < 0) {
         alert("날짜를 정확하게 입력해주세요");
         return false;
      } else if ($('#pjmember_' + title).length == 0) {
         alert("팀원을 등록해주세요");
         return false;
      } else {
         $('input:checkbox[id="pjmember_' + title + '"]').prop("checked",
               true);
         const dd = document.getElementById(title);
         dd.setAttribute("action", "pjupdate.do");
         dd.submit();
         console.log(dd);
      }

   }

   function opendd(no) {
      const nn = document.getElementById("pj_" + no);
      nn.style.display = "inline-block";
   }

   function closedd(no) {
      const cc = document.getElementById("pj_" + no);
      cc.style.display = "none";
   }

   function logdd(no) {
      const dd = document.getElementById(no);
      dd.setAttribute("action", "pllist.do");
      dd.submit();
      console.log(dd);
   }

   function memberadd(no) {
      var add = $("#username_" + no + " option:selected").text();
      console.log("이름 추가 = " + add);
      $('#member_' + no)
            .append(
                  "<label style='font-size:9pt;'><input id='pjmember_"+no+"'name='pjmember' type='checkbox' value="+add+">"
                        + add + "</label>");
   }

   function memberrm(no) {
	   var result ="";
      $("input:checkbox[id='pjmember_" + no + "']").each(function() {
         if ($(this).is(":checked") == true) {
        	 result += $(this).val();
            $(this).parent().remove();
         }
 		if(result == ""){
				alert("삭제할 참가자를 선택하세요");
				return false;
		}
      })
   }

   function backToCalendar() {
      window.parent.frames['_calendar'].location.replace("duducalendar.do");
   }
</script>
</html>


