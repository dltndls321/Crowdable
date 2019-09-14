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
<script type="text/javascript">
function doChange(){
	$("#filtering").submit();
}
</script>
</head>
<body>
<div>
 <jsp:include page="/WEB-INF/views/allContents/All_Nevi.jsp" flush="false"></jsp:include>
</div>
<form id="filtering" action="/board/projectlistFilter.do">
	<div class="w3-card" id="categorydiv1" style="margin-left:300px; margin-top: 50px; margin-right: 50%; ">
		<select name="category" id="category" onchange="doChange()">
			<option value="default">--장르를 선택해주세요--</option>
			<option value="default">전체</option>
			<option value="MULTIPLAYER">멀티플레이어</option>
			<option value="RACING">레이싱</option>
			<option value="RPG">RPG</option>
			<option value="SPORTS">스포츠</option>
			<option value="SIMULATION">시뮬레이션</option>
			<option value="ACTION">액션</option>
			<option value="ADVENTURE">어드벤쳐</option>
			<option value="INDIE">인디</option>
			<option value="STRATEGY">전략</option>
			<option value="CASUAL">캐쥬얼</option>
			<option value="OTHERGAME">기타</option>
		</select>
	</div>
</form>
<div style="padding-left:255px; margin-top: 50px; padding-bottom: 150px;">
	
	<c:choose>
	<c:when test="${fn:length(projectList) > 0 }">
	
		<c:forEach items="${projectList}" var="list">
		<c:if test="${list.activestatus eq '2' }">
		<table class="w3-table w3-center w3-col m3 w3-card" style="margin-left: 30px; margin-top: 10px; height: 350px;">
			<tr>
			<td><c:out value="${list.filename}" escapeXml="false"></c:out> </td>
			</tr>
			<tr>
				<td colspan="1" style="color: #888888">제목</td><td colspan="3" style="cursor: pointer; color: #000000" onclick="location.href='/board/viewoneproject/${list.num}.do'">${list.subject}</td>
				
			</tr>
			<tr>
				<td colspan="1" style="color: #888888">카테고리</td>
				<td colspan="3">
				<c:if test="${list.category1 ne ''}">
					<c:if test="${not empty list.category1 }">
					<a style="cursor: pointer;" onclick="location.href='/board/projectlistFilter.do?category=${list.category1}'"><c:out value="${list.category1}"/></a>
						<c:if test="${list.category2 ne 'default2'}">
							<c:if test="${not empty list.category2 }">
								/<a style="cursor: pointer;" onclick="location.href='/board/projectlistFilter.do?category=${list.category2}'"><c:out value="${list.category2}"/></a>
								<c:if test="${list.category3 ne 'default3'}">
									<c:if test="${not empty list.category3 }">
										/<a style="cursor: pointer;" onclick="location.href='/board/projectlistFilter.do?category=${list.category3}'"><c:out value="${list.category3}"/></a>
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						
					</c:if>
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="1" style="color: #888888">게시날짜</td><td colspan="3" style="float: right;"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
		</c:if>
	     </c:forEach>
	     
     </c:when>
     <c:otherwise>
     <table class="w3-table w3-center">
     	<tr>
			<td colspan="5">조회된 결과가 없습니다.</td>
		</tr>
	</table>
	</c:otherwise>
	</c:choose>
</div>

<div class="w3-bottom" style="margin-left: 280px;z-index: 1;padding-bottom: 20px;">
<ul class="btn-group pagination">
<c:if test="${pageMaker.prev }">
    <li class = "pagination2">
        <a href='<c:url value="/board/projectlist.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left fafa"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class = "pagination2">
        <a href='<c:url value="/board/projectlist.do?page=${idx }"/>'><i class="fa fafa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li class = "pagination2">
        <a href='<c:url value="/board/projectlist.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right fafa"></i></a>
    </li>
    </c:if>
</ul>
</div>
</body>
</html>