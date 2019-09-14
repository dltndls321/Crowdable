<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <script type="text/javascript">
function  doChange1(srcE,targetId1,targetId2,targetId3,targetId4){
	var val = srcE.options[srcE.selectedIndex].value;
	var targetE = document.getElementById(targetId1);
	var targetE2 = document.getElementById(targetId2);
	var targetE3 = document.getElementById(targetId3);
	var targetE4 = document.getElementById(targetId4);
	if(val!="default1"){
		targetE.style.display='block';
	}
	if(val=='default1'){
		 targetE.style.display='none';
		 targetE2.style.display='none';
		 targetE3.options[0].selected = true ;
		 targetE4.options[0].selected = true ;
	}
}
function  doChange2(srcE, targetId1,targetId2){
	var val = srcE.options[srcE.selectedIndex].value;
	var targetE = document.getElementById(targetId1);
	var targetE2 = document.getElementById(targetId2);
	if(val!="default2"){
		targetE.style.display='block';
	}
	
	if(val=='default2'){
		 targetE.style.display='none';
		 targetE2.options[0].selected = true ;
	}
}
</script>

 
<form action="/board/createcontent.do" method="post" id="frm" style="margin-left: 255px;" enctype="multipart/form-data">
<input type="hidden" name="boardid" value="2">
<input type="hidden" name="filename" value="">
<input type="hidden" name="filesize" value="0">
<input type="hidden" name="ip" value="<%= request.getRemoteAddr()%>">
<input type="hidden" name="activestatus" value="1">
<input type="hidden" name="wantmoney" value="0">
<input type="hidden" name="writer" value="<%=session.getAttribute("sessionName")%>">
	<div>프로젝트 제목</div>
	<div><input name="subject" type="text"></div>
	<hr>
	<div>대표 이미지</div>
	<div>
		<input type="file" name="file">
	</div>
	<hr>
	<div>장르</div>
	<hr>
		<div id="categorydiv1">
			<select name="category1" id="category1" onchange="doChange1(this,'categorydiv2','categorydiv3','category2','category3')">
				<option value="default1">--장르를 선택해주세요--</option>
				<option value="MULTIPLAYER">멀티플레이어</option>
				<option value="RACING">레이싱</option>
				<option value="RPG">RPG</option>
				<option value="SPORTS">스포츠</option>
				<option value="SIMULATION">시뮬레이션</option>
				<option value="ACTION">액션</option>
				<option value="ADVENTURE">어드벤쳐</option>
				<option value="INDIE">인디</option>
				<option value="STRATEGY">전략</option>
				<option value="CASUAL">캐쥬얼</option>
				<option value="OTHERGAME">기타</option>
			</select>
			<div id = "category1ok"></div>
		<hr>
		</div>
		<div id="categorydiv2" style="display: none;">
			<select name="category2" id="category2" onchange="doChange2(this,'categorydiv3','category3')" >
				<option value="default2">--장르를 선택해주세요--</option>
				<option value="MULTIPLAYER">멀티플레이어</option>
				<option value="RACING">레이싱</option>
				<option value="RPG">RPG</option>
				<option value="SPORTS">스포츠</option>
				<option value="SIMULATION">시뮬레이션</option>
				<option value="ACTION">액션</option>
				<option value="ADVENTURE">어드벤쳐</option>
				<option value="INDIE">인디</option>
				<option value="STRATEGY">전략</option>
				<option value="CASUAL">캐쥬얼</option>
				<option value="OTHERGAME">기타</option>
			</select>
			<div id = "category2ok"></div>
		<hr>
		</div>
		<div id="categorydiv3" style="display: none;">
			<select name="category3" id="category3">
				<option value="default3">--장르를 선택해주세요--</option>
				<option value="MULTIPLAYER">멀티플레이어</option>
				<option value="RACING">레이싱</option>
				<option value="RPG">RPG</option>
				<option value="SPORTS">스포츠</option>
				<option value="SIMULATION">시뮬레이션</option>
				<option value="ACTION">액션</option>
				<option value="ADVENTURE">어드벤쳐</option>
				<option value="INDIE">인디</option>
				<option value="STRATEGY">전략</option>
				<option value="CASUAL">캐쥬얼</option>
				<option value="OTHERGAME">기타</option>
			</select>
			<div id = "category3ok"></div>
		<hr>
	</div>
    <textarea name="content" id="content" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
    <input type="button" id="savebutton" value="프로젝트만들기"/>
</form>
<script type="text/javascript"> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",  //textarea ID
    sSkinURI: "/resources/editor/SmartEditor2Skin.html",  //skin경로
    fCreator: "createSEditor2",
});
$("#savebutton").click(function(){
	var category1 = $("#category1").val();
	var category2 = $("#category2").val();
	var category3 = $("#category3").val();
    //id가 smarteditor인 textarea에 에디터에서 대입
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    if(category1=="default1"){
        $('#category1ok').css("color", "red");
        $('#category1ok').html("최소 한개 이상의 카테고리를 선택해 주세요");
        return false;	
        }else if(category1!="default1"){
        	$('#category1ok').html("");
        }if(category1==category2){
        	$('#category2ok').css("color", "red");
            $('#category2ok').html("같은 카테고리는 선택이 불가능 합니다.");
            return false;
        }else if(category1!=category2){
        	$('#category2ok').html("");
        }if(category1==category3){
        	$('#category3ok').css("color", "red");
            $('#category3ok').html("같은 카테고리는 선택이 불가능 합니다.");
            return false;
        }else if(category1!=category3){
        	$('#category3ok').html("");
        }if(category2==category3){
        	$('#category3ok').css("color", "red");
            $('#category3ok').html("같은 카테고리는 선택이 불가능 합니다.");
            return false;
        }else if(category2!=category3){
        	$('#category3ok').html("");
        }
		$("#frm").submit();
		$("#frm2").submit();
    //폼 submit
});
</script>

