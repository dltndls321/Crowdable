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
function myfuncblur(){
	var donate = $("#donate").val();
	var donatetot = ${totProjectDonation} + parseInt(donate);
	var fir = ${giftinfo.giftmoneyone};
	var sec = ${giftinfo.giftmoneytwo};
	var thir = ${giftinfo.giftmoneythree};
	if(parseInt(donatetot)<parseInt(fir)){
		$("#fircol").css("color", "red");
		$("#seccol").css("color", "red");
		$("#thircol").css("color", "red");
	}else if(parseInt(donatetot)>= parseInt(fir) && parseInt(donatetot)<parseInt(sec) && parseInt(sec)!=0){
		$("#fircol").css("color", "blue");
		$("#seccol").css("color", "red");
		$("#thircol").css("color", "red");
	}
	else if(parseInt(donatetot)>= parseInt(sec) && parseInt(donatetot)<parseInt(thir) && parseInt(thir)!=0){
		$("#fircol").css("color", "blue");
		$("#seccol").css("color", "blue");
		$("#thircol").css("color", "red");
	}
	else{
		$("#fircol").css("color", "blue");
		$("#seccol").css("color", "blue");
		$("#thircol").css("color", "blue");
	}
}
</script>
<script type="text/javascript">
$(document).on('click','#Admin_memberupdate_submit',function(e){
	e.preventDefault();
	
	$("#donateform").submit();
});
</script>
</head>
<body>
 <div>
 <jsp:include page="/WEB-INF/views/allContents/All_Nevi.jsp" flush="false"></jsp:include>
</div>
<div class="w3-card login_regist_table w3-center" style="margin-top: 2%; padding-bottom: 150px;">
	<form  method="post">
		<table class="w3-table w3-center">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">대표 이미지</td><td colspan="3" class="w3-left" style="color: #000000" ><c:out value="${boardinfo.filename}" escapeXml="false"></c:out><input type="hidden" id="boardnumherehere" value="${boardinfo.num}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">작성자 아이디/이메일</td><td colspan="3" class="w3-left" style="color: #000000" ><c:out value="${memberinfo.email}"></c:out><input type="hidden" id="boardnumherehere" value="${boardoneview.num}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">작성자 이름</td><td colspan="3" class="w3-left" style="color: #000000" ><c:out value="${memberinfo.name}"></c:out></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">등록일</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<fmt:formatDate value="${boardinfo.regdate}" pattern="yyyy-MM-dd"/>
				 </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">제목</td>
				<td colspan="3" class="w3-left" style="color: #000000" >
					<c:out value="${boardinfo.subject}"></c:out>
				 </td>
			</tr>
			<c:if test="${boardinfo.category1 ne ''}">
				<c:if test="${not empty boardinfo.category1 }">
					<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
						<td colspan="1" style="color: #888888">선호 카테고리</td>
						<td colspan="3" class="w3-left" style="color: #000000" >
							<c:out value="${boardinfo.category1}"/>
							<c:if test="${boardinfo.category2 ne 'default2'}">
								<c:if test="${not empty boardinfo.category2 }">
									/<c:out value="${boardinfo.category2}"/>
									<c:if test="${boardinfo.category3 ne 'default3'}">
										<c:if test="${not empty boardinfo.category3 }">
											/<c:out value="${boardinfo.category3}"/>
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
					<c:out value="${boardinfo.content}" escapeXml="false"/>
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
<div class="w3-card login_regist_table w3-center" style="margin-top: 2%; margin-bottom: 150px;">
	<form action="/board/donateinsert/${boardinfo.num}.do" id="donateform" method="post">
		<table class="w3-table w3-center">
		<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">목표 금액</td><td colspan="3" class="w3-left" >
				<c:out value="${boardinfo.wantmoney}"></c:out>원 
				</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">후원 진행정도</td><td colspan="3" class="w3-left" >
				<c:out value="${oneBoardDonation*100/boardinfo.wantmoney}"></c:out>% 
				</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">프로젝트 지분</td><td colspan="3" class="w3-left" >
				<c:if test="${oneBoardDonation ne 0 }">
				<c:out value="${totProjectDonation*100/oneBoardDonation}"></c:out>% 
				</c:if>
				<c:if test="${oneBoardDonation eq 0 }">
					0%
				</c:if>
				</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">금액 후원하기</td><td colspan="3" class="w3-left" ><input onblur="myfuncblur()" type="number" name="donate" id="donate" value="0"><input name="boardnum" type="hidden" id="boardnumherehere" value="${boardinfo.num}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">첫번째 후원상품</td><td colspan="3" class="w3-left"><c:out value="${giftinfo.giftcontentone}"></c:out></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">첫번째 금액</td><td id="fircol" colspan="3" class="w3-left"><c:out value="${giftinfo.giftmoneyone}"></c:out>원<input type="hidden" id="firstvalue" value="${giftinfo.giftmoneyone}"><input name="membernum" type="hidden" id="membernumherehere" value="${memberinfo.num}"></td>
			</tr>
			<c:if test="${giftinfo.giftmoneytwo>0 }">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;" id = "gifttwo">
				<td colspan="1" style="color: #888888">두번째 후원상품</td><td colspan="3" class="w3-left" ><c:out value="${giftinfo.giftcontenttwo}"></c:out></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;" id="gifttwomoney">
				<td colspan="1" style="color: #888888">두번째 금액</td><td id="seccol" colspan="3" class="w3-left" ><c:out value="${giftinfo.giftmoneytwo}">원<input type="hidden" id="secvalue" value="${giftinfo.giftmoneytwo}"></c:out>원</td>
			</tr>
			</c:if>
			<c:if test="${giftinfo.giftmoneythree>0 }">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;" id = "giftthree">
				<td colspan="1" style="color: #888888">세번째 후원상품</td><td colspan="3" class="w3-left"><c:out value="${giftinfo.giftcontentthree}"></c:out></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;" id="giftthreemoney">
				<td colspan="1" style="color: #888888">세번째 금액</td><td id="thircol" colspan="3" class="w3-left"><c:out value="${giftinfo.giftmoneythree}">원<input type="hidden" id="thirvalue" value="${giftinfo.giftmoneythree}"></c:out></td>
			</tr>
			</c:if>
			<c:if test="${!empty oneBoardDonation }">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;" >
				<td colspan="1" style="color: #888888">프로젝트 총 후원금액</td><td id="oneBoardDonation" colspan="3" class="w3-left"><c:out value="${oneBoardDonation}"></c:out>원</td>
			</tr>
			</c:if>
			<c:if test="${!empty totProjectDonation}">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;" >
				<td colspan="1" style="color: #888888">내 후원금액</td><td id="totProjectDonation" colspan="3" class="w3-left"><c:out value="${totProjectDonation}"></c:out>원</td>
			</tr>
			</c:if>
		</table>
		<div>
			<button id="donateSubmit">후원하기</button>
		</div>
	</form>
</div>
<div class="w3-bottom">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>