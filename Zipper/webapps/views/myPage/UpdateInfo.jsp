<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<h1>회원정보 수정</h1>
<table align="center" style="background : lightgreen; height : 200px; width : 200px;">
		<tr>
			<td>
				<input type="text" placeholder="아이디"/>	*		
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="비번"/> *
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="비번2"/> *
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="닉네임"/> *
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="email"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="phone"/> *
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="">수정완료</button>
				<button type="button" onclick="goMyPage()">취소</button>
			</td>
		</tr>
	</table>
	<script>
		function goMyPage() {
			location.href = "/SemiProject/views/myPage.jsp"
		}
	</script>
</body>
</html>