<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
$(document).ready(function(){
	$('#Admin_boardupdate_submit1').click(function(e){
		 e.preventDefault();
		 var num = $("#boardnumherehere").val();
		 $.ajax({
			 	url : '/admin/boardupdateAdminone.do',
				type : 'post',
				data: {'num' : num},
				success:function(data){	
					alert("되냥");
					location.href="/admin/projectlist.do";
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
					location.href="/admin/projectlist.do";
		        }
		 })
	})
	$('#Admin_boardupdate_submit2').click(function(e){
		 e.preventDefault();
		 var num = $("#boardnumherehere").val();
		 $.ajax({
			 	url : '/admin/boardupdateAdmintwo.do',
				type : 'post',
				data: {'num' : num},
				success:function(data){	
					location.href="/admin/projectlist.do";
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
					location.href="/admin/projectlist.do";
		        }
		 })
	})
	$('#Admin_deleteboard_submit').click(function(e){
		 e.preventDefault();
		 var num = $("#boardnumherehere").val();
		 $.ajax({
			 	url : '/admin/deleteAdminboard.do',
				type : 'post',
				data: {'num' : num},
				success:function(data){	
					location.href="/admin/projectlist.do";
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
					location.href="/admin/projectlist.do";
		        }
		 })
	})
});
</script>
</head>
<body>
 <div>
 <jsp:include page="/WEB-INF/views/allContents/All_Nevi.jsp" flush="false"></jsp:include>
</div>
<div class="w3-card login_regist_table w3-center" style="margin-top: 2%;">
	<form  method="post">
		<table class="w3-table w3-center">
			
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">작성자 아이디/이메일</td><td colspan="3" class="w3-left" style="color: #000000" ><c:out value="${memberinfo.email}"></c:out><input type="hidden" id="boardnumherehere" value="${boardoneview.num}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">작성자 이름</td><td colspan="3" class="w3-left" style="color: #000000" ><c:out value="${memberinfo.name}"></c:out></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">게시글 종류</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<c:if test="${boardoneview.boardid eq 1}">공지사항</c:if>
					<c:if test="${boardoneview.boardid eq 2}">프로젝트</c:if>
				 </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">활성화도</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<c:if test="${boardoneview.activestatus eq '1'}">비활성화</c:if>
					<c:if test="${boardoneview.activestatus eq '2'}">활성화</c:if>
					<c:if test="${boardoneview.activestatus eq '3'}">작성자 수정대기</c:if>
					<c:if test="${boardoneview.activestatus eq '4'}">작성자 수정확인</c:if>
				 </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">등록일</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<fmt:formatDate value="${boardoneview.regdate}" pattern="yyyy-MM-dd"/>
				 </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">IP</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<c:out value="${boardoneview.ip}"></c:out>
				 </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">제목</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<c:out value="${boardoneview.subject}"></c:out>
				 </td>
			</tr>
			<c:if test="${boardoneview.category1 ne ''}">
				<c:if test="${not empty boardoneview.category1 }">
					<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
						<td colspan="1" style="color: #888888">선호 카테고리</td>
						<td colspan="3" class="w3-left" style="color: #000000" >
							<c:out value="${boardoneview.category1}"/>
							<c:if test="${boardoneview.category2 ne 'default2'}">
								<c:if test="${not empty boardoneview.category2 }">
									/<c:out value="${boardoneview.category2}"/>
									<c:if test="${boardoneview.category3 ne 'default3'}">
										<c:if test="${not empty boardoneview.category3 }">
											/<c:out value="${boardoneview.category3}"/>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
						 </td>
					</tr>
				</c:if>
			</c:if>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">내용</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<c:out value="${boardoneview.content}" escapeXml="false"/>
				 </td>
			</tr>
			<tr >
				<c:if test="${sessionNum eq '2'}">
					<td colspan="2" ><button id="Admin_deleteboard_submit" type="button">게시글 삭제</button></td>
				</c:if>
			</tr>
		</table>
	</form>
</div>

<div class="w3-bottom">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>