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
 <jsp:include page="/WEB-INF/views/login_registerContents/Identity_Nevi.jsp" flush="false"></jsp:include>
</div>
<div style="padding-left: 255px; margin-bottom: 1%;" class="w3-card">
	<table class="w3-table w3-center" >
	<c:choose>
	<c:when test="${fn:length(donationList) > 0 }">
			<tr>
				<th>프로젝트제목</th><th>후원금액</th>
			</tr>
		<c:forEach  var="donationList" items="${donationList}"  varStatus="status">
			<tr>
				<td> ${boardList[status.index].subject } </td> 
				<td> ${donationList.donate }원 </td>
			</tr>
	     </c:forEach>
     </c:when>
     <c:otherwise>
     	<tr>
			<td colspan="5">조회된 결과가 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>
</table>
</div>
<c:choose>
<c:when test="${fn:length(donationList) > 0 }">
<div style="padding-left: 255px; margin-bottom: 20%;" class="w3-card">
	<table class="w3-table w3-center" >
	<tr>
	<th> 총 후원금액</th>
	</tr>
	<tr>
	<td>${oneMemberDonation }원</td>
	</tr>
	</table>
	
	<table class="w3-table w3-center">
	<tr>
	<th>프로젝트명</th><th>프로젝트별 후원 금액</th>
	</tr>
		<c:forEach  var="donationList" items="${projectDo}"  varStatus="status">
			<tr>
				<td> ${boardListtwo[status.index].subject } </td> 
				<td> ${donationList.donate}원 </td>
			</tr>
		</c:forEach>
	</table>
</div>	
</c:when>
</c:choose>	
<div class="w3-bottom" >
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>