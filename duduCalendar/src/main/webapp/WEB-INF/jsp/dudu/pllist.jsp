<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 로그</title>
<script type="text/javascript" src="js/egovframework/com/jQuery.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cop/smt/sdm/dept_schdule_manage.css'/>">
<link href="https://webfontworld.github.io/TheJamsil/TheJamsil.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='../../css/dudu/nav.css'/>">
<link type="text/css" rel="stylesheet" href="<c:url value='../../css/dudu/pjlist.css'/>">
<link type="text/css" rel="stylesheet" href="<c:url value='../../css/dudu/pllist.css'/>">
</head>
<body>
	<div class="plogTitle">프로젝트 수정 내역</div>
	<br><br>
    <table>
        <thead>
            <tr>
                <th style="width:7%">로그번호</th>
                <th style="width:15%">사용자 이메일</th>
                <th style="width:30%">기존 내용</th>
                <th style="width:30%">수정 내용</th>
                <th>수정 날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="log" items="${logResult}">
                <c:if test="${not fn:endsWith(log.logNo, '-1')}">
                    <tr>
                        <td>${log.logNo}</td>
                        <td>${log.useremail}</td>
                        <td>
                            <ul>
                                <li class="oldTitle">Title: ${log.logOldtitle}</li>
                                <li class="oldText">Text: ${log.logOldtext}</li>
                                <li class="oldMember">Member: ${log.logOldmember}</li>
                                <li class="oldStart">Start Date: ${log.logOldstart}</li>
                                <li class="oldEnd">End Date: ${log.logOldend}</li>
                                <li class="oldColor">Color: ${log.logOldcolor}</li>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <li class="newTitle">Title: ${log.pjtitle}</li>
                                <li class="newText">Text: ${log.pjcnt}</li>
                                <li class="newMember">Member: ${log.pjmember}</li>
                                <li class="newStart">Start Date: ${log.pjstart}</li>
                                <li class="newEnd">End Date: ${log.pjend}</li>
                                <li class="newColor">Color: ${log.pjcolor}</li>
                            </ul>
                        </td>
                        <td><fmt:formatDate value="${log.logDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var rows = document.querySelectorAll("tbody tr");
        rows.forEach(function(row) {
            var oldElements = row.querySelectorAll(".oldTitle, .oldText, .oldMember, .oldStart, .oldEnd, .oldColor");
            var newElements = row.querySelectorAll(".newTitle, .newText, .newMember, .newStart, .newEnd, .newColor");
            
            oldElements.forEach(function(oldElement, index) {
                var oldText = oldElement.textContent.trim();
                var newText = newElements[index].textContent.trim();
                
                if (oldText !== newText) {
                    oldElement.style.backgroundColor = "#E0EDFB";
                    oldElement.style.color = "#2383E2";
                    newElements[index].style.backgroundColor = "#F1B1B8";
                    newElements[index].style.color = "#DA3243";
                }
            });
        });
    });
</script>
</body>
</html>