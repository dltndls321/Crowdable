<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <script>
   
   $(document).on('click','#register_submit',function(e){
	   
		e.preventDefault();
		var name = $("#register_Name").val();
		var email= $("#register_Email").val();
		var email2= $("#register_Email2").val();
		var passwd= $("#register_Passwd").val();
		var passwd2=$("#register_Passwd2").val();
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var passRule = /^[A-Za-z0-9]{6,12}$/;
		
		
		if(name==""||name == null){
			$('#nameok').css("color", "red" );
			$('#nameok').html("이름을 입력해 주세요.");
			return false;
		}
		else if( email==null || email ==""){
			$('#nameok').css("color", "blue" );
			$('#nameok').html("확인.");
			$('#emailok').css("color", "red" );
			$('#emailok').html("이메일을 입력해주세요.");
		
			return false;
		}else if(!emailRule.test(email)){
			$('#emailok').css("color", "red" );
			$('#emailok').html("이메일 양식에 맞게 다시 입력해 주세요.");
			
			return false;
		}else if($('#checkemail').val() != email){
			$('#emailok').css("color", "red" );
			$('#emailok').html("이메일 중복체크를 하십시오.");
			
			return false;
		}else if (passwd==null || passwd ==""){
			$('#emailok').css("color", "blue" );
			$('#emailok').html("확인");
			$('#passwdok').css("color", "red" );
			$('#passwdok').html("패스워드를 입력해 주세요.");
			return false;
		}else if(!passRule.test(passwd)){
			$('#passwdok').css("color", "red" );
			$('#passwdok').html("패스워드를 6~12자리 글자로 입력해 주세요");
			return false;
		}else if(passwd != passwd2){
			$('#passwdok').css("color", "blue" );
			$('#passwdok').html("확인");
			$('#passwd2ok').css("color", "red" );
			$('#passwd2ok').html("패스워드 확인이 틀렸습니다.");
			return false;
		}else{
			$('#passwdok').css("color", "blue" );
			$('#passwdok').html("확인");
			$.ajax({
				url : 'member/insertmember.do',
				type : 'post',
				data: {'email' : email,'passwd' : passwd,'name' : name},
				success:function(data){
					if(data == '1'){
						location.href="/main.do"
					}					
				},
				error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
		        }
			
		});
		}
		
	});
   </script>
   <script>
	$(document).on('click','#emailcheck',function(){
		var email= $("#register_Email").val();
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if( email==null || email ==""){
			$('#emailok').css("color", "red" );
			$('#emailok').html("이메일을 입력해주세요");
			
			return false;
		}if(!emailRule.test(email)){
			$('#emailok').css("color", "red" );
			$('#emailok').html("이메일 양식에 맞게 다시 입력해 주세요");
			
			return false;
		}
	    $.ajax({
	        url:'member/checkemail.do',
	        type:'POST',
	        data: {'email' : email},
	        success:function(data){
				if(data == "ok"){
					$('#checkemail').val(email);
					$('#emailok').css("color", "blue" );
					$('#emailok').html("사용가능한 이메일입니다.");
					
				}else{
					$('#emailok').css("color", "red" );
					$('#emailok').html("이미 사용중인 이메일입니다.");
					$('#checkemail').val(email);
					
				}
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
	        }
	    });
	});
	</script>
   
	
<div class="w3-card login_regist_table">
<input type="hidden" id="checkemail">
	<form method="post"  action="${pageContext.request.contextPath}/member/insertmember.do" id= "registerForm" modelAttribute="memberVO" >
		<table class="w3-table w3-center">
			<tr>
				<td colspan="5" class="w3-center" style="color: #888888"><a id="kakao-login-btn2"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d73e37fa9e92d50069218deaa7c4f1f3');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn2',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script></td>
			<tr>
				<td colspan="5" class="w3-center" style="color: #888888">또는</td>
			</tr>
		
			<tr>
				<td colspan="4"><hr style="border: 1px solid color: #888888;"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>		
				<td colspan="5" class="w3-center" style="font-weight:bolder">회원가입</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-right" style="font-weight:bolder">이름</td>
				<td colspan="2" class="w3-center" ><input type="text" name="name" id="register_Name"> </td>
			</tr>
			<tr>
				<td colspan="2" ></td><td colspan="2" id = "nameok"></td><td colspan="1"></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-right" style="font-weight:bolder">이메일주소</td>
				
				<td colspan="2" class="w3-center" ><input type="text" name="email" id="register_Email" ></td><td colspan="1" class="w3-center" ><input type="button" id="emailcheck" value="중복 확인"> </td>
			</tr>
			<tr>
				<td colspan="2" ></td><td colspan="2" id = "emailok"></td><td colspan="1"></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-right" style="font-weight:bolder">비밀번호</td>
				<td colspan="2" class="w3-center" ><input  type="password" name="passwd" id="register_Passwd"> </td>
			</tr>
			<tr>
				<td colspan="2" ></td><td colspan="2" id = "passwdok"></td><td colspan="1"></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-right" style="font-weight:bolder">비밀번호 확인</td>
				<td colspan="2" class="w3-center" ><input  type="password" name="passwd2" id="register_Passwd2"> </td>
			</tr>
			<tr>
				<td colspan="2" ></td><td colspan="2" id = "passwd2ok"></td><td colspan="1"></td>
			</tr>
			<tr>
				<td colspan="4" class="w3-center"><button id="register_submit" type="button">회원가입</button></td>
			</tr>
			<tr>
				<td colspan="4" class="w3-center"><p onclick="location.href='/login.do'" style="cursor: pointer;">이미계정이 있으신가요? 기존계정으로 로그인하기</p></td>	
		</table>
	</form>
</div>
