<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트생성</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/NeviCss.css">
<link rel="stylesheet" href="/resources/css/Main_ItemsCss.css">
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
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js"></script>



</head>
<body>
<div>
 <jsp:include page="/WEB-INF/views/allContents/All_Nevi.jsp" flush="false"></jsp:include>
</div>
<div style="color: red;padding-left: 255px;">프로젝트가 승인되기 전까지 수정이 가능합니다.</div>
<div>
	<jsp:include page="/WEB-INF/views/boardContents/Board_Create_Member.jsp" flush="false"></jsp:include>
</div>
<div >
	<jsp:include page="/WEB-INF/views/allContents/All_Footer.jsp" flush="false"></jsp:include>
</div>

</body>
</html>