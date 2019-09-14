<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
function isNumber(){
    if(event.keyCode<48 || event.keyCode>57){
        event.returnValue=false;
     }
 }

function  doChange1(target1,target2,target3,target4,target5,target6){
	var1 = document.getElementById(target1);
	var2 = document.getElementById(target2);
	var3 = document.getElementById(target3);
	var4 = document.getElementById(target4);
	var5 = document.getElementById(target5);
	var6 = document.getElementById(target6);
	if(var1.value==""||var2.value==""){
		var3.value=null;
		var4.value=null;
		var5.style.visibility='collapse';
		var6.style.visibility='collapse';
		}
	if(var1.value!="" && var2.value!=""){
		var5.style.visibility='visible';
		var6.style.visibility='visible';
		}
}
</script>

<script type="text/javascript">
$(document).on('click','#Admin_memberupdate_submit',function(e){
	e.preventDefault();
	if($("#giftmoneyone").val()==null||$("#giftmoneyone").val()==""){
		$("#giftmoneyone").val(0);
		}
	if($("#giftmoneytwo").val()==null||$("#giftmoneytwo").val()==""){
		$("#giftmoneytwo").val(0);
		}
	if($("#giftmoneythree").val()==null||$("#giftmoneythree").val()==""){
		$("#giftmoneythree").val(0);
		}
	var giftmoneyone =$("#giftmoneyone").val();
	var giftmoneytwo =$("#giftmoneytwo").val();
	var giftmoneythree =$("#giftmoneythree").val();
	var wantmoney = $("#wantmoney").val();
	if(parseInt($("#wantmoney").val())<parseInt(giftmoneyone)||parseInt($("#wantmoney").val())< parseInt(giftmoneytwo)||parseInt( $("#wantmoney").val())<parseInt(giftmoneythree)){
		alert("선물 금액보다 목표 금액이 커야 됩니다.");
		return false;
		}
	if(parseInt(giftmoneyone)>=parseInt(giftmoneytwo) &&parseInt(giftmoneytwo)!=0 ){
		alert("두번째 금액은 첫번째 금액보다 크게 설정해야 됩니다.");
		return false;
		}
	if(parseInt(giftmoneytwo)>=parseInt(giftmoneythree) &&parseInt(giftmoneythree!=0) ){
		alert("세번째 금액은 두번쨰 금액보다 크게 설정해야 됩니다.");
		return false;
		}
	$("#insertaddionalinfo").submit();
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
 <jsp:include page="/WEB-INF/views/login_registerContents/Identity_Nevi.jsp" flush="false"></jsp:include>
</div>
<div class="w3-card login_regist_table w3-center" style="margin-top: 2%">
	<form  method="post" action="/board/additionalupdate.do" id="insertaddionalinfo">
		<table class="w3-table w3-center">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #000000"><div style="color: blue;">프로젝트가 승인 됬습니다. 추가 정보를 입력해 주세요.</div></td>
				<td style="visibility: collapse;"><input type="hidden" name="boardnum" value="${boardinfo.num }"> </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">프로젝트 제목</td><td colspan="3" class="w3-left" style="color: #000000" ><input type="text" id="Admin_m_email" value="${boardinfo.subject}" disabled="disabled"><input type="hidden" id="membernum" name="membernum" value="${memberinfo.num}"> </td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">설정 계좌</td><td colspan="3" class="w3-left" style="color: #000000" >
					<c:if test="${empty boardinfo.account}"><input type="text" name = "account" id="account" ></c:if>
					<c:if test="${!empty boardinfo.account}"><input type="text" name = "account" id="account" value="${boardinfo.account}"></c:if>
				</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">희망 프로젝트 종료일</td><td colspan="3" class="w3-left" style="color: #888888">
				<c:if test="${empty boardinfo.enddate }"><input id="enddate" name = "enddate" type="date" ></c:if> 
				<c:if test="${!empty boardinfo.enddate }"><input id="enddate" name = "enddate" type="date" value="${boardinfo.enddate}"></c:if> 
				</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">목표 금액</td><td colspan="3" class="w3-left" style="color: #888888">
				<c:if test="${empty boardinfo.wantmoney }"><input id="wantmoney" type="number" name = "wantmoney" onkeypress="isNumber()"></c:if>
				<c:if test="${!empty boardinfo.wantmoney }"><input id="wantmoney" type="number" name = "wantmoney" onkeypress="isNumber()" value="${boardinfo.wantmoney }"></c:if>
				</td>
			</tr>
			<tr  style="border-top: 1px;border-bottom: 1px; border-color: #888888; ">
				<td colspan="1" style="color: #888888">첫번째 후원자 선물</td><td colspan="3" class="w3-left" style="color: #888888">
				<c:if test="${empty giftinfo.num }"><input type="hidden" name="giftnum" value="0"></c:if>
				<c:if test="${!empty giftinfo.num }"><input type="hidden" name="giftnum" value="${giftinfo.num }"></c:if>
				<c:if test="${empty giftinfo.giftcontentone }">
				<input id="giftcontentone" type="text" name = "giftcontentone" onblur="doChange1('giftcontentone','giftmoneyone','giftcontenttwo','giftmoneytwo','checkone','checktwo')">
				</c:if>
				<c:if test="${!empty giftinfo.giftcontentone }">
				<input id="giftcontentone" type="text" name = "giftcontentone" onblur="doChange1('giftcontentone','giftmoneyone','giftcontenttwo','giftmoneytwo','checkone','checktwo')" value="${giftinfo.giftcontentone}">
				</c:if>
				</td>
			</tr>
			<tr  style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">첫번째 희망 금액</td><td colspan="3" class="w3-left" style="color: #888888">
				<c:if test="${empty giftinfo.giftmoneyone }">
				<input id="giftmoneyone" type="number" name = "giftmoneyone"  onkeypress="isNumber()" onblur="doChange1('giftcontentone','giftmoneyone','giftcontenttwo','giftmoneytwo','checkone','checktwo')">
				</c:if>
				<c:if test="${!empty giftinfo.giftmoneyone }">
				<input id="giftmoneyone" type="number" name = "giftmoneyone"  onkeypress="isNumber()" onblur="doChange1('giftcontentone','giftmoneyone','giftcontenttwo','giftmoneytwo','checkone','checktwo')" value="${giftinfo.giftmoneyone}">
				</c:if>
				</td>
			</tr>
			<c:if test="${empty giftinfo.giftcontenttwo }">
			<tr id="checkone"  style="border-top: 1px;border-bottom: 1px; border-color: #888888;  visibility: collapse;">
				<td colspan="1" style="color: #888888">두번쨰 후원자 선물</td><td colspan="3" class="w3-left" style="color: #888888"><input id="giftcontenttwo" type="text" name = "giftcontenttwo" onblur="doChange1('giftcontenttwo','giftmoneytwo','giftcontentthree','giftmoneythree','checkthree','checkfour')"></td>
			</tr>
			</c:if>
			<c:if test="${!empty giftinfo.giftcontenttwo }">
			<tr id="checkone"  style="border-top: 1px;border-bottom: 1px; border-color: #888888;  ">
				<td colspan="1" style="color: #888888">두번쨰 후원자 선물</td><td colspan="3" class="w3-left" style="color: #888888"><input id="giftcontenttwo" type="text" name = "giftcontenttwo" onblur="doChange1('giftcontenttwo','giftmoneytwo','giftcontentthree','giftmoneythree','checkthree','checkfour')" value="${giftinfo.giftcontenttwo }"></td>
			</tr>
			</c:if>
			<c:if test="${empty giftinfo.giftmoneytwo }">
			
			<tr id="checktwo" style="border-top: 1px;border-bottom: 1px; border-color: #888888; visibility: collapse;">
				<td colspan="1" style="color: #888888">두번쨰 희망 금액</td><td colspan="3" class="w3-left" style="color: #888888"><input id="giftmoneytwo" type="number" name = "giftmoneytwo"  onkeypress="isNumber()" onblur="doChange1('giftcontenttwo','giftmoneytwo','giftcontentthree','giftmoneythree','checkthree','checkfour')"></td>
			</tr>
			
			</c:if>
			<c:if test="${!empty giftinfo.giftmoneytwo }">
			<tr id="checktwo" style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">두번쨰 희망 금액</td><td colspan="3" class="w3-left" style="color: #888888"><input value="${giftinfo.giftmoneytwo}" id="giftmoneytwo" type="number" name = "giftmoneytwo"  onkeypress="isNumber()" onblur="doChange1('giftcontenttwo','giftmoneytwo','giftcontentthree','giftmoneythree','checkthree','checkfour')"></td>
			</tr>
			</c:if>
			<c:if test="${empty giftinfo.giftcontentthree }">
			<tr id="checkthree" style="border-top: 1px;border-bottom: 1px; border-color: #888888; visibility: collapse;">
				<td colspan="1" style="color: #888888">세번째 후원자 선물</td><td colspan="3" class="w3-left" style="color: #888888"><input id="giftcontentthree" name = "giftcontentthree"  type="text" ></td>
			</tr>
			</c:if>
			<c:if test="${!empty giftinfo.giftcontentthree }">
			<tr id="checkthree" style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">세번째 후원자 선물</td><td colspan="3" class="w3-left" style="color: #888888"><input value="${giftinfo.giftcontentthree }" id="giftcontentthree" name = "giftcontentthree"  type="text" ></td>
			</tr>
			</c:if>
			<c:if test="${empty giftinfo.giftmoneythree }">
			
			<tr id="checkfour" style="border-top: 1px;border-bottom: 1px; border-color: #888888; visibility: collapse;">
				<td colspan="1" style="color: #888888">세번째 희망 금액</td><td colspan="3" class="w3-left" style="color: #888888"><input id="giftmoneythree" name = "giftmoneythree" type="number" onkeypress="isNumber()" ></td>
			</tr>
			
			</c:if>
			<c:if test="${!empty giftinfo.giftmoneythree }">
			<tr id="checkfour" style="border-top: 1px;border-bottom: 1px; border-color: #888888; ">
				<td colspan="1" style="color: #888888">세번째 희망 금액</td><td colspan="3" class="w3-left" style="color: #888888"><input value="${giftinfo.giftmoneythree}" id="giftmoneythree" name = "giftmoneythree" type="number" onkeypress="isNumber()" ></td>
			</tr>
			</c:if>
			<tr>
				<td colspan="2" ><button id="Admin_memberupdate_submit" type="button">프로젝트 제출</button></td>
			</tr>
			<tr>
				<td colspan="2" id = "adminmemberupdateok"></td><td colspan="1"></td>
			</tr>
		</table>
	</form>
</div>
<div class="w3-bottom" >
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>