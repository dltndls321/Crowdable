<%@page import="com.sooin.crowdable.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="w3-card login_regist_table w3-center">
	<form  method="post">
		<table class="w3-table w3-center">
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">이름</td><td colspan="3" class="w3-left" style="color: #888888"><input type="text"  value="${Identity_Items.name}"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">지역</td><td colspan="3" class="w3-left" style="color: #888888"><input type="text"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">소개</td><td colspan="3" class="w3-left" style="color: #888888"><textarea></textarea></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">전화번호</td><td colspan="3" class="w3-left" style="color: #888888"><input type="text"></td>
			</tr>
			<tr style="border-top: 1px;border-bottom: 1px; border-color: #888888;">
				<td colspan="1" style="color: #888888">비밀번호</td><td colspan="3" class="w3-left" style="color: #888888"><input type="text" value="${Identity_Items.passwd}"></td>
			</tr>
			
			<tr>
				<td colspan="4" class="w3-center"><button id="login_submit"
						type="button">로그인</button></td>
			</tr>
			
		</table>
	</form>
</div>