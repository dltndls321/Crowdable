<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- <link rel="stylesheet" href="/resources/css/w3css.css"> -->
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top w3-card" style="z-index:3;width:250px" id="mySidebar_left">
  <div class="w3-container w3-display-container w3-padding-16 logo" onclick="location.href='/main.do'">
    <i onclick="nevi_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright" ></i>
    <h3 class="w3-wide"></h3>
  </div>
  
  <%if(session.getAttribute("sessionId")==null){%>
  
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="/board/noticelist.do" class="w3-bar-item w3-button">공지사항</a>
    <a href="/whatcrowdable.do" class="w3-bar-item w3-button">CROWDABLE?</a>
     <a href="/login.do" class="w3-bar-item w3-button">게임 둘러보기</a>
   <!--  <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      게임 올리기 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>게임 올리기</a>
      <a href="#" class="w3-bar-item w3-button">내 후원목록</a>
      <a href="#" class="w3-bar-item w3-button">CROWDABLE?</a>
      <a href="#" class="w3-bar-item w3-button">Straight</a>
    </div> -->
    <a href="/login.do" class="w3-bar-item w3-button">게임 올리기</a>
    <a href="/login.do" class="w3-bar-item w3-button">내 후원목록</a>   
  </div>
  
   <%}else if(session.getAttribute("sessionNum").equals(2)){%>
   
   <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="/board/noticelist.do" class="w3-bar-item w3-button">공지사항</a>
    <a href="/whatcrowdable.do" class="w3-bar-item w3-button">CROWDABLE?</a>
     <a href="/board/projectlist.do" class="w3-bar-item w3-button">게임 둘러보기</a>
      <a href="/createboardmember.do" class="w3-bar-item w3-button">게임 올리기</a>
    <a href="/board/donationlist.do" class="w3-bar-item w3-button">내 후원목록</a>
    
    <%}else{ %>
    
    <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="/board/noticelist.do" class="w3-bar-item w3-button">공지사항</a>
    <a href="/whatcrowdable.do" class="w3-bar-item w3-button">CROWDABLE?</a>
     <a href="/board/projectlist.do" class="w3-bar-item w3-button">게임 둘러보기</a>
      <a href="/createboardmember.do" class="w3-bar-item w3-button">게임 올리기</a>
    <a href="/board/donationlist.do" class="w3-bar-item w3-button">내 후원목록</a> 
    
     <%} %>
  
</nav>
<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide"></div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="nevi_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="nevi_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <% int num = 2; %>
  <%if(session.getAttribute("sessionId")==null){%>
  <header class="w3-container w3-xlarge w3-card">
    <p class="w3-left">Main</p>
    <p class="w3-right">
    
      <i class="fa fa-user-circle w3-margin-right">      
      <a class="shadow_animate" style="cursor: pointer;" 
      onclick="location.href='/login.do'">LOGIN</a>
      /
      <a class="shadow_animate" style="cursor: pointer;" 
      onclick="  location.href='/register.do'">REGISTER A NEW ACCOUNT</a>
      </i>
      
      <i class="fa fa-search"></i>
      
    </p>
  </header>
  <%}else if(session.getAttribute("sessionNum").equals(2)){ %>
  <header class="w3-container w3-xlarge w3-card">
    <p class="w3-left">Main</p>
    <p class="w3-right">
    
      <i class="fa fa-user-circle w3-margin-right">      
      <a class="shadow_animate" style="cursor: pointer;" 
      onclick="location.href='/admin/identity.do'">ADMIN</a>
      /
      <a class="shadow_animate" style="cursor: pointer;" 
      onclick="  location.href='/member/logout.do'">LOGOUT</a>
      </i>
      
      <i class="fa fa-search"></i>
      
    </p>
  </header>
  <%}else{%>
  <header class="w3-container w3-xlarge w3-card">
    <p class="w3-left">Main</p>
    <p class="w3-right">
    
      <i class="fa fa-user-circle w3-margin-right">      
      <a class="shadow_animate" style="cursor: pointer;" 
      onclick="location.href='/identity.do'"><%=session.getAttribute("sessionName")%>님 안녕하세요.</a>
      /
      <a class="shadow_animate" style="cursor: pointer;" 
      onclick="location.href='/member/logout.do'">LOGOUT</a>
      </i>
      
      <i class="fa fa-search"></i>
      
    </p>
  </header>
  <%} %>
  
 </div>