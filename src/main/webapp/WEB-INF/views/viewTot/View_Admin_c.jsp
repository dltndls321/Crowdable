<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
<script type="text/javascript">
var onclickEmail = $(document).ready(function(a){
	 $(".onclicklist").click(function(e){
		 e.preventDefault();
		 var email = a;
		 alert(email);
		 $.ajax({
				url : 'onclicklist.do',
				type : 'post',
				data: {'email' : email},
				success:function(data){	
					/* $('#adminupdateok').css("color", "blue" );
					$('#adminupdateok').html("관리자 정보가 수정되었습니다.");	 */
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.'	 );
		        }
			
		});
	});
});


</script>
</head>
<body>

<div>
 <jsp:include page="/WEB-INF/views/adminContents/Admin_Nevi.jsp" flush="false"></jsp:include>
</div>
<div style="padding-left:255px; ">
	<table class="w3-table w3-center"  >
	
	<c:choose>
	<c:when test="${fn:length(noticeList) > 0 }">
			<tr>
				<th>제목</th><th>게시판 종류</th><th>작성자</th> <th>날짜</th><th>활성화</th>
			</tr>
		<c:forEach items="${noticeList}" var="list">
			<tr>
				<td onclick="location.href='/admin/viewoneboard/${list.num}.do'" style="cursor: pointer;">${list.subject}</td>
				<c:if test="${list.boardid eq '1'}"><td>공지사항 </td></c:if>
				<c:if test="${list.boardid eq '2'}"><td>프로젝트 </td></c:if>
				<td>${list.writer}</td>
				<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
				<c:if test="${list.activestatus eq '1'}"><td>비활성화</td></c:if>
				<c:if test="${list.activestatus eq '2'}"><td>활성화</td></c:if>
				<c:if test="${list.activestatus eq '3'}"><td>작성자 수정 대기</td></c:if>
				<c:if test="${list.activestatus eq '4'}"><td>작성자 수정 확인</td></c:if>
			</tr>
	     </c:forEach>
	     <tr>
          </tr>
     </c:when>
     <c:otherwise>
     	<tr>
			<td colspan="5">조회된 결과가 없습니다.</td>
		</tr>
	</c:otherwise>
	</c:choose>
</table>
</div>
<div style="margin-left: 280px;">
<ul class="btn-group pagination">
<c:if test="${pageMaker.prev }">
    <li class = "pagination2">
        <a href='<c:url value="/admin/projectlist.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left fafa"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class = "pagination2">
        <a href='<c:url value="/admin/projectlist.do?page=${idx }"/>'><i class="fa fafa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li class = "pagination2">
        <a href='<c:url value="/admin/projectlist.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right fafa"></i></a>
    </li>
    </c:if>
</ul>
</div>
<div class="w3-bottom"style="z-index: -1;">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>