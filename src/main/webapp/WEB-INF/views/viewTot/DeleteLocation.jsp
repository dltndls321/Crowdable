<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>개인정보</title>
<link rel="stylesheet" href="/resources/css/NeviCss.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/Main_ItemsCss.css">
<link rel="stylesheet" href="/resources/css/All_FooterCss.css">
<link rel="stylesheet" href="/resources/css/Identity_Items.css">


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
	$('#delete_submit').click(function(e){
		 e.preventDefault();
		 var passwd = $("#delete_passwd").val();
		 var passwd2 = $("#delete_passwd2").val();
		 $.ajax({
				url : 'member/deleteMember.do',
				type : 'post',
				data: {'passwd' : passwd,'passwd2' : passwd2},
				success:function(data){	
					if(data=="a"){
						$('#deletepasswd_ok').css("color", "red" );
						$('#deletepasswd_ok').html("비밀번호가 틀렸습니다.");	
						}
					else if(data=="b"){
						$('#deletepasswd_ok').css("color", "blue" );
						$('#deletepasswd_ok').html("확인");	
						$('#deletepasswd2_ok').css("color", "red" );
						$('#deletepasswd2_ok').html("비밀번호 확인이 틀렸습니다.");	
						}
					else{
						location.href='/member/logout.do';
						}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
		        }
			
		});
	 });
	$('#update_location').click(function(e){
		e.preventDefault();
		location.href="/identity.do";
		
	 });
});
</script>
</head>
<body>
<div>
 <jsp:include page="/WEB-INF/views/login_registerContents/Identity_Nevi.jsp" flush="false"></jsp:include>
</div>
<div class="w3-card login_regist_table w3-center" style="margin-top: 5%;">
	<form  method="post">
		<table class="w3-table w3-center">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">비밀번호</td><td colspan="3" class="w3-left" style="color: #888888"><input id="delete_passwd" type="text"></td>
			</tr>
			<tr>
				<td colspan="2" id = "deletepasswd_ok"></td><td colspan="1"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">비밀번호 확인</td><td colspan="3" class="w3-left" style="color: #888888"><input id="delete_passwd2" type="text"></td>
			</tr>
			<tr>
				<td colspan="2" id = "deletepasswd2_ok"></td><td colspan="1"></td>
			</tr>
			<tr >
				<td colspan="2" ><button id="delete_submit" type="button">회원탈퇴</button></td>
				<td colspan="2" ><button id="update_location" type="button">회원정보수정</button></td>
			</tr>
			
		</table>
	</form>
</div>
<div class="w3-bottom"style="z-index: -1;">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>