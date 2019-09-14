<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/NeviCss.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/Main_ItemsCss.css">
<link rel="stylesheet" href="/resources/css/All_FooterCss.css">
<link rel="stylesheet" href="/resources/css/BoardCss.css">

<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
.grid-container{font-family: "Roboto", sans-serif}
.all-footer{font-family: "Roboto", sans-serif}
</style>

<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.0.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/TotJs.js"></script>
</head>
<body>
<div>
 <jsp:include page="/WEB-INF/views/allContents/All_Nevi.jsp" flush="false"></jsp:include>
</div>
<div style="padding-left:255px;">
	<table class="w3-table w3-center">
	<c:choose>
	<c:when test="${fn:length(noticeList) > 0 }">
		<c:forEach items="${noticeList}" var="list">
			<tr>
				<td style="cursor: pointer;" onclick="location.href='/board/viewoneboard/${list.num}.do'">${list.subject}</td>
				<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
			</tr>
	     </c:forEach>
     </c:when>
     <c:otherwise>
     	<tr>
			<td colspan="5">조회된 결과가 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>
	<%
		if(session.getAttribute("sessionNum")!=null&&session.getAttribute("sessionNum").equals(2)){%>
			<tr>
				<td ><button id="create_notice"
						type="button" onclick="location.href='/movecreatenotice.do'">공지사항 작성</button></td>
			</tr>
		<%}
	%>
</table>
</div>
<div style="margin-left: 280px;">
<ul class="btn-group pagination">
<c:if test="${pageMaker.prev }">
    <li class = "pagination2">
        <a href='<c:url value="/board/noticelist.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left fafa"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class = "pagination2">
        <a href='<c:url value="/board/noticelist.do?page=${idx }"/>'><i class="fa fafa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li class = "pagination2">
        <a href='<c:url value="/board/noticelist.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right fafa"></i></a>
    </li>
    </c:if>
</ul>
</div>
<div class="w3-bottom">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>