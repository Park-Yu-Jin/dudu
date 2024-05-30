<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle">회원가입</c:set>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="/css/dudu/join.css">
<script type="text/javascript" src="js/egovframework/com/jQuery.js"></script>
<script type="text/javascript" src="js/egovframework/com/validChecker.js"></script>
<script type="text/javascript" src="js/egovframework/com/duduCheck.js"></script>
<script type="text/javascript" src="/validator.do"></script>
<validator:javascript formName="JoinVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
function regSubmit() {
	alert("가입 신청이 완료되었습니다.");
	var form = document.getElementsByName('JoinVO')[0];
	form.action = '/uss/umt/join.do';
	form.submit();
}

$(document).ready(function() {
    $('.email-content').on("property change keyup paste input", function(){
        var memberId = $('.email-content').val();
        var data = {userEmail : memberId}
        
        $.ajax({
        	type: "post",
        	url: "join.idchk.do",
        	data: data,
        	success: function(result) {
        		if(result != 'fail') {
        			$('.idCheck1').css("display", "inline-block");
        			$('.idCheck2').css("display", "none");
        		} else {
        			$('.idCheck2').css("display", "inline-block");
        			$('.idCheck1').css("display", "none");
        		}
        	}
        });
    });
    
    $('#position').change(function() {
        var position = $(this).val();
        var authValue = ""; // auth 값을 설정할 변수
        switch(position) {
            case "연구원":
                authValue = "0";
                break;
            case "선임연구원":
                authValue = "1";
                break;
            case "책임연구원":
                authValue = "2";
                break;
            case "팀장":
                authValue = "3";
                break;
            default:
                break;
        }
        $('#auth').val(authValue); // auth hidden input의 값을 설정
    });
});
</script>
</head>
<body>

<!-- content start -->
<form action="/join.done.do" name="JoinVO" method="post" onsubmit="return memberJoinCheck(this);">

<div class="wTableFrm">
	<!-- 타이틀 -->
	<div class="logo-div">
		<a href="/">
			<img alt="로고" src="/images/dudu/sky_duduCalendar_logo.svg">
		</a>
	</div>
	<div class="wTableHead">회원가입</div>

	<!-- 등록폼 -->
	<table class="wTable" >
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 이메일 -->
		<tr>
			<td class="left">
				<div class="left-title">이메일</div>
				<div class="email-input-container">
					<input name="applcntEmailAdres" id="applcntEmailAdres" title="이메일" class="email-content" maxlength="20" />
			 		<span class="email-domain">@duduit.co.kr</span>
				</div>
				​​​​​​​​​​​​​​​​​​​​​​​​<span class="idCheck1">사용 가능한 이메일입니다.</span>
				​​​​​​​​​​​​​​​​​​​​​​​​<span class="idCheck2">이미 사용중인 이메일입니다.</span>
			</td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
			<td class="left">
				<div class="left-title">비밀번호</div>
				<input type="password" name="entrprsMberPassword" title="비밀번호" class="pw-content" size="50" maxlength="20" placeholder="문자, 숫자, 특수문자 최소 1개씩 포함" />
			</td>
		</tr>
		<!-- 비밀번호확인 -->
		<tr>
			<td class="left">
				<div class="left-title">비밀번호 확인</div>
				<input name="entrprsMberPassword2" id="entrprsMberPassword2" title="비밀번호 확인" class="pw1-content" type="password" size="50" maxlength="20" placeholder="비밀번호를 다시 입력하세요" />
			</td>
		</tr>
		<!-- 연구원 이름 -->
		<tr>
			<td class="left">
				<div class="left-title">성명</div>
				<input name="cmpnyNm" title="성명" class="name-content" size="20" maxlength="20" placeholder="본명을 입력해주세요" />
			</td>
		</tr>
		<!-- 부서 -->
		<tr>
		    <td>
		    	<div class="left-title">소속 부서</div>
		    	<select class="position-select" name="orgnztNm">
    				<option>소속 부서를 선택하세요</option>
    				<option>기획</option>
    				<option>사업관리</option>
    				<option>영업</option>
    				<option>컨텐츠</option>
    				<option>LMS</option>
	    		</select>
		    </td>
		</tr>
		<!-- 직급 -->
		<tr>
			<td class="left">
				<div class="left-title">직급</div>
				<select name="position" id="position" class="name-content">
					<option>직급을 선택해주세요</option>
					<option >연구원</option>
					<option >선임연구원</option>
					<option >책임연구원</option>
					<option >팀장</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="left">
				<input type="hidden" id="auth" name="auth" value="">
			</td>
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 --> 
	<div class="btn regBtn">
		<button class="s_submit" value="가입 신청" title="가입 버튼">가입 신청</button>
		<div class="bottom-text">사원 정보와 다를 경우 가입 승인이 거부될 수 있습니다</div>
	</div><div style="clear:both;"></div>

</div>
</form>

</body>
</html>
