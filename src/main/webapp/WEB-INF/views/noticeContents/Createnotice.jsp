<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 
<form action="/board/createnotice.do" method="post" id="frm" style="margin-left: 255px;">
<input type="hidden" name="boardid" value="1">
<input type="hidden" name="category1" value="">
<input type="hidden" name="category2" value="">
<input type="hidden" name="category3" value="">
<input type="hidden" name="writer" value="ADMIN">
<input type="hidden" name="filename" value="">
<input type="hidden" name="filesize" value="0">
<input type="hidden" name="ip" value="<%= request.getRemoteAddr()%>">
<input type="hidden" name="activestatus" value="2">
<input type="hidden" name="wantmoney" value="0">
	<div>공지사항 제목</div>
	<div><input type="text" name="subject" id="noticeSubject"></div>
	<hr>
    <textarea name="content" id="noticeContent" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
    <input type="button" id="createNoticebutton_Submit" value="프로젝트만들기"/>
</form>
<script type="text/javascript"> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "noticeContent",  //textarea ID
    sSkinURI: "/resources/editor/SmartEditor2Skin.html",  //skin경로
    fCreator: "createSEditor2",
});
$("#createNoticebutton_Submit").click(function(){
    //id가 smarteditor인 textarea에 에디터에서 대입
    oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
    //폼 submit
	$("#frm").submit();
})

</script>
    