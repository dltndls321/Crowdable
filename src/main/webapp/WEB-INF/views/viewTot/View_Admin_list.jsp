<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$('#Admin_update_submit').click(function(e){
		 e.preventDefault();
		 var email = $("#Admin_a_email").val();
		 var name = $("#Admin_a_name").val();
		 var address = $("#Admin_a_address").val();
		 var content = $("#Admin_a_content").val();
		 var phone = $("#Admin_a_phone").val();
		 var passwd = $("#Admin_a_passwd").val();
		 $.ajax({
				url : 'updateAdmin.do',
				type : 'post',
				data: {'email' : email,'name' : name,'passwd' : passwd,'name' : name,'address' : address,'content' : content,'phone': phone },
				success:function(data){	
					$('#adminupdateok').css("color", "blue" );
					$('#adminupdateok').html("관리자 정보가 수정되었습니다.");	
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
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
<div class="w3-card login_regist_table w3-center" style="margin-top: 5%;">
	<form  method="post">
		<table class="w3-table w3-center">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">이름</td><td colspan="3" class="w3-left" style="color: #888888">${onclickList.name}</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">지역</td><td colspan="3" class="w3-left" style="color: #888888">${onclickList.address}</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">소개</td><td colspan="3" class="w3-left" style="color: #888888"><textarea id="Admin_a_content" disabled="disabled">${onclickList.content}</textarea ></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">전화번호</td><td colspan="3" class="w3-left" style="color: #888888">${onclickList.phone}</td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">비밀번호</td><td colspan="3" class="w3-left" style="color: #888888">${onclickList.passwd}</td>
			</tr>
			
			<tr >
				<td colspan="2" ><button id="Admin_update_submit" type="button">관리자 정보 수정</button></td>
			</tr>
			<tr>
				<td colspan="2" id = "adminupdateok"></td><td colspan="1"></td>
			</tr>
			
		</table>
	</form>
</div>
<div class="w3-bottom"style="z-index: -1;">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>