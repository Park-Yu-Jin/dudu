<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두두캘린더</title>
<link type="text/css" rel="stylesheet" href="/css/dudu/login.css" />
<script type="text/javascript" src="js/egovframework/com/jQuery.js"></script>
<script type="text/javascript" src="js/egovframework/com/validChecker.js"></script>
<script type="text/javascript" src="js/egovframework/com/duduCheck.js"></script>
<script type="text/javascript">
    var err_msg = "<%= session.getAttribute("err_msg") %>";
    if (err_msg !== "null") {
        alert(err_msg);
        <% session.removeAttribute("err_msg"); %>
    }
    
    window.onpageshow = function(event) {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
            // 이벤트 추가하는 곳
            $('#id').val("");
            $('#password').val("");
            console.log("새로고침");
    	}
	}
    
</script>
</head>
<body >
	<div class="login-wrapper">
		<form class="login-form" name="loginForm" id="loginForm" action="/login.do" method="post" onsubmit="return memberLoginCheck(this);">
			<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">

			<fieldset>
				<div class="logo-div">
					<a href="/">
						<img alt="로고" src="/images/dudu/sky_duduCalendar_logo.svg">
					</a>
				</div>
				<br><br><br>
				<div class="login_input">
					<ul style="padding-left: 0px;">
						<c:set var="title">아이디</c:set>
						<li>
							<img alt="사용자 아이디 입력 아이콘 " src="/images/dudu/user_id.svg" id="userIdIcon">
							<input class="user-input" type="text" name="id" id="id" maxlength="30" title="아이디" placeholder="아이디">
						</li>
						<c:set var="title">비밀번호</c:set>
						<li class="user-list-pw">
							<img alt="사용자 비밀번호 입력 아이콘 " src="/images/dudu/user_pw.svg" id="userPwIcon">
							<input class="user-input" type="password" name="password" id="password" maxlength="20" title="비밀번호" placeholder="비밀번호">
						</li>
						<li>
							<button id="userLoginBtn" class="btn_login user-login-btn">로그인</button>
						</li>
					</ul>
				</div>

			</fieldset>
			<div class="chk" style="display: flex; justify-content: center;">
				<a href="/join.do" id="RegiUsr">회원가입 |</a>
				<a href="/dudu.do" id="password" class="password">&nbsp;비밀번호 초기화</a>
			</div>

			<input name="userSe" type="hidden" value="GNR" />
			<input name="j_username" type="hidden" />
		</form>
	</div>
</body>
</html>