<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
$(document).ready(function(){
	$('#Admin_memberupdate_submit').click(function(e){
		 e.preventDefault();
		 var num = $("#Admin_m_num").val();
		 var email = $("#Admin_m_email").val();
		 var name = $("#Admin_m_name").val();
		 var address = $("#Admin_m_address").val();
		 var content = $("#Admin_m_content").val();
		 var phone = $("#Admin_m_phone").val();
		 var passwd = $("#Admin_m_passwd").val();
		 $.ajax({
				url : '/admin/updateAdminmember.do',
				type : 'post',
				data: {'num' : num, 'email' : email,'name' : name,'passwd' : passwd,'name' : name,'address' : address,'content' : content,'phone': phone },
				success:function(data){	
					$('#adminmemberupdateok').css("color", "blue" );
					$('#adminmemberupdateok').html("회원 정보가 수정되었습니다.");	
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
		        }
			
		});
	 });
	 $('#Admin_deletemember_submit').click(function(e){
		 e.preventDefault();
		 var email = $("#Admin_m_email").val();
		 $.ajax({
			 	url : '/admin/deleteAdminmember.do',
				type : 'post',
				data: {'email' : email},
				success:function(data){	
					location.href="/admin/adminmember.do"
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
		        }
		 })
	})
	});
</script>
</head>
<body>
<div>
 <jsp:include page="/WEB-INF/views/adminContents/Admin_Nevi.jsp" flush="false"></jsp:include>
</div>
<div class="w3-card login_regist_table w3-center" style="margin-top: 2%">
	<form  method="post">
		<table class="w3-table w3-center">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #000000">회원정보</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">아이디/이메일</td><td colspan="3" class="w3-left" style="color: #000000" ><input type="text" id="Admin_m_email" value="${memberinfo.email}" disabled="disabled"><input type="hidden" id="Admin_m_num" value="${memberinfo.num}"> </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">이름</td><td colspan="3" class="w3-left" style="color: #000000" ><input type="text" id="Admin_m_name" value=" ${memberinfo.name}" disabled="disabled"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">지역</td><td colspan="3" class="w3-left" style="color: #888888"><input id="Admin_m_address" type="text" value="${memberinfo.address}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">소개</td><td colspan="3" class="w3-left" style="color: #888888"><textarea id="Admin_m_content">${memberinfo.content}</textarea ></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">전화번호</td><td colspan="3" class="w3-left" style="color: #888888"><input id="Admin_m_phone" type="text" value="${memberinfo.phone}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">비밀번호</td><td colspan="3" class="w3-left" style="color: #888888"><input id="Admin_m_passwd" type="text" value="${memberinfo.passwd}"></td>
			</tr>
			
			<tr >
				<td colspan="2" ><button id="Admin_memberupdate_submit" type="button">회원 정보 수정</button></td>
				<td colspan="2" ><button id="Admin_deletemember_submit" type="button">회원탈퇴</button></td>
			</tr>
			<tr>
				<td colspan="2" id = "adminmemberupdateok"></td><td colspan="1"></td>
			</tr>
			
		</table>
	</form>
</div>
<div class="w3-card login_regist_table w3-center" style="margin-top: 2%;margin-bottom: 10%;">

	<div>
		<table class="w3-table w3-center" >
		<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #000000">작성 게시물</td>
			</tr>
		<c:choose>
		<c:when test="${fn:length(boardinfo) > 0 }">
				<tr>
					<th>게시글종류</th><th>제목</th><th>날짜</th><th>활성화</th>
				</tr>
			<c:forEach items="${boardinfo}" var="list">
				<tr>
					<c:if test="${list.boardid eq 1}"><td>공지사항</td></c:if>
					<c:if test="${list.boardid eq 2}"><td>프로젝트</td></c:if>
					<td  onclick="location.href='/admin/viewoneboard/${list.num}.do'" style="cursor: pointer;" >${list.subject}</td>
					<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
					<c:if test="${list.activestatus eq '1'}"><td>비활성화</td></c:if>
					<c:if test="${list.activestatus eq '2'}"><td>활성화</td></c:if>
					<c:if test="${list.activestatus eq '3'}"><td>작성자수정대기중</td></c:if>
					<c:if test="${list.activestatus eq '4'}"><td>작성자수정확인</td></c:if>
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
</div>
</body>
</html>