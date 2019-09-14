<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>admin</title>
<link rel="stylesheet" href="/resources/css/NeviCss.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/Main_ItemsCss.css">
<link rel="stylesheet" href="/resources/css/All_FooterCss.css">
<link rel="stylesheet" href="/resources/css/AdminCss.css">


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
 <jsp:include page="/WEB-INF/views/adminContents/Admin_Nevi.jsp" flush="false"></jsp:include>
</div>
<div style="margin-left: 280px;">
<table class="w3-table w3-center">
	<tr>
		<th>EMAIL</th><th>이름</th><th>PHONE</th><th>ADDRESS</th>
	</tr>
	<c:forEach items="${userList}" var="list">
		<tr>
		<%-- onclicklist(${list.num})    --%>
			<td class="onclicklist" style="cursor: pointer;"  onclick="location.href='/admin/viewonemember/${list.num}.do'" >${list.email}</td>
			<td>${list.name}</td>
			<td>${list.phone}</td>
			<td>${list.address}</td>
		</tr>
     </c:forEach>
</table>
</div>
<div style="margin-left: 280px;">
<ul class="btn-group pagination">
<c:if test="${pageMaker.prev }">
    <li class = "pagination2">
        <a href='<c:url value="/admin/adminmember.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left fafa"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class = "pagination2">
        <a href='<c:url value="/admin/adminmember.do?page=${idx }"/>'><i class="fa fafa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li class = "pagination2">
        <a href='<c:url value="/admin/adminmember.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right fafa"></i></a>
    </li>
    </c:if>
</ul>
</div>
<div class="w3-bottom"style="z-index: -1;">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>