<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	section {
		
	}
</style>
</head>
<body>

<%@ include file="common/header.jsp" %>

<section>
	<h1 align="center">회원가입</h1>
	<hr />
	<br /><br />
	<form action="">
		<table align="center" style=" height : 200px;">
			<tr>
				<td style="width : 150px;">
					<h4>아이디</h4>
				</td>
				<td style="width : 150px;">
					<input type="text" size="20" name="userId_join" id="userId_join" class="form-control" placeholder="아이디" required="required">
				</td>
				<td style="width : 100px;">
					&nbsp;<button type="button" class="btn btn-default" id="idCheck">중복확인</button>
				</td>
			</tr>
			<tr>
				<td>
					<h4>비밀번호</h4>
				</td>
				<td>
					<input type="password" size="20" name="userPwd_join" id="userPwd_join" class="form-control" placeholder="비밀번호" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<h4>비밀번호 확인</h4>
				</td>
				<td>
					<input type="password" size="20" name="userPwd2" id="userPwd2" class="form-control" placeholder="비밀번호 확인" onchange="chkPwd()" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<h4>닉네임</h4>
				</td>
				<td>
					<input type="text" size="20" name="userName" id="userName" class="form-control" placeholder="닉네임" required="required">
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<h4>연락처</h4>
				</td>
				<td>
					<input type="text" name="tel" id="tel" class="form-control" placeholder="010-0000-0000">
				</td>
			</tr>
			<tr>
				<td>
					<h4>주소</h4>
				</td>
				<td>
					<input type="text" size="20" name="address" id="address1" class="form-control" placeholder="주소">
				</td>
				<td>
					&nbsp;<button type="button" class="btn btn-default">주소검색</button>
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">
					<input type="text" size="20" name="address" id="address2" class="form-control" placeholder="주소">
				</td>
			</tr>
			<tr>
				<td>
					<h4>이메일</h4>
				</td>
				<td>
					<input type="text" size="20" name="email" id="email" class="form-control" placeholder="이메일" required="required">
				</td>
				<td>
					&nbsp;
					<select name="" id="" class="btn btn-default form-control" style="width : 130px; background : none;">
						<option value="@naver.com" >@naver.com</option>
						<option value="@daum.net" >@daum.net</option>
						<option value="@gmail.com" >@gmail.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				</td>
			</tr>
		</table>
		<br />
		<div style="text-align: center;">
		<button type="submit" class="btn btn-default" onclick="">가입완료</button>
		<button type="reset" class="btn btn-default" onclick="">취소</button>
		</div>
	</form>
		<br />
		<br />
		<br />
</section>
<script>
	
	/* 아이디 중복 체크 */
	$('#idCheck').on('click',function(){		
		$.ajax({
			url : '/Zipper/idDup.me',
			type : 'post',
			data : { userId : $('#userId_join').val() },
			success : function(data){
				// console.log(data);
				
				// 전달된 결과가 0이면 사용자 없음 : 가입 가능!
				//    ' '   1   ' ' 있음 : 가입 불가!
				if( data == 0 ) {
					alert("사용 가능한 아이디입니다.");
				} else {
					alert("이미 사용 중인 아이디입니다.");
				}
			}, error : function(){
				console.log("에러 발생~!");
			}
		});
	});
	
	/* 비밀번호 확인 */
	function chkPwd() {
		var pwd1 = $('#userPwd_join').val();
		var pwd2 = $('#userPwd2').val();
		
		if(!(pwd1 == pwd2)) {
			alert("비번이 다릅니다");
		}
	}
</script>
</body>
</html>