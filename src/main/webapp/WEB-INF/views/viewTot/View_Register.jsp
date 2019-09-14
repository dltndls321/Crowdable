<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/NeviCss.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/Login_Register_ItemsCss.css">
<link rel="stylesheet" href="/resources/css/All_FooterCss.css">

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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>



</head>

<body>

<jsp:include page="/WEB-INF/views/login_registerContents/Login_Register_Nevi.jsp" flush="false"></jsp:include>

<div style="margin-top:2%">
<jsp:include page="/WEB-INF/views/login_registerContents/Register_Items.jsp" flush="false"></jsp:include>
</div>
<div class="w3-bottom">
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>

</body>
</html>