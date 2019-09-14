<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script>
   $(document).on('click','#login_submit',function(e){
	   
		e.preventDefault();
		var email= $("#login_Email").val();
		var passwd= $("#login_Password").val();
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var passRule = /^[A-Za-z0-9]{6,12}$/;
		
		if( email==null || email ==""){
			$('#login_emailok').css("color", "red");
			$('#login_emailok').html("이메일을 입력해주세요.");
			return false;
		}else if(!emailRule.test(email)){
			$('#login_emailok').css("color", "red");
			$('#login_emailok').html("이메일 양식에 맞게 다시 입력해 주세요.");
			return false;
		}else if (passwd==null || passwd ==""){
			$('#login_emailok').css("color", "blue");
			$('#login_emailok').html("확인");
			$('#login_passwdok').css("color", "red");
			$('#login_passwdok').html("패스워드를 입력해 주세요.");
			return false;
		}else if(!passRule.test(passwd)){
			$('#login_passwdok').css("color", "red");
			$('#login_passwdok').html("패스워드를 6~12자리 글자로 입력해 주세요");
			return false;
		}else{
			$.ajax({
				url : 'member/loginmember.do',
				type : 'post',
				data: {'email' : email,'passwd' : passwd},
				success:function(data){
					if(data == 'emailfail'){
						$('#login_emailok').css("color", "red");
						$('#login_emailok').html("이메일을 확인해 주세요");
					}
					else if(data == 'passwdfail'){
						$('#login_emailok').css("color", "blue");
						$('#login_emailok').html("확인");
						$('#login_passwdok').css("color", "red");
						$('#login_passwdok').html("비밀번호를 확인해 주세요");

					}
					else if(data == 'ok'){
						$('#login_passwdok').css("color", "blue");
						$('#login_passwdok').html("확인");
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
<div class="w3-card login_regist_table">
	<form id="form_loginInfo" method="post"
		action="${pageContext.request.contextPath}/member/loginmember.do">
		<table class="w3-table w3-center">
			<tr>
				<td colspan="4" class="w3-center" style="color: #888888"><a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d73e37fa9e92d50069218deaa7c4f1f3');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(res) {
        var id = res.id;
        var email = res.kaccount_email;
        
        alert(id);
        alert(email);
        
        console.log(userID);
        console.log(userEmail);
        
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>

			<tr>
				<td colspan="4" class="w3-center" style="color: #888888">또는</td>
			</tr>
			<tr>
				<td colspan="4"><hr style="border: 1px solid color: #888888;"></td>
			</tr>
			<tr>
				<td colspan="4" class="w3-center" style="font-weight: bolder">로그인</td>
			</tr>
			<tr>
				<td colspan="2" class="w3-right" style="font-weight: bolder">이메일주소</td>
				<td colspan="2" class="w3-center"><input id="login_Email"
					type="text" name="loginId"></td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="2" id="login_emailok"></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-right" style="font-weight: bolder">비밀번호</td>
				<td colspan="2" class="w3-center"><input id="login_Password"
					type="password" name="loginPw"></td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="2" id="login_passwdok"></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4" class="w3-center"><button id="login_submit"
						type="button">로그인</button></td>
			</tr>
			<tr>
				<td colspan="4" class="w3-center"><p
						onclick="location.href='/register.do'" style="cursor: pointer;">아직
						계정이 없으신가요? CROWDABLE가입하기</p></td>
		</table>
	</form>
</div>