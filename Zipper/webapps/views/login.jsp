<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>

 <h1 align="center">로그인 페이지</h1>
	<table align="center" style="background : lightgreen; height : 200px; width : 200px;">
		<tr>
			<td>
				<input type="text" placeholder="아이디"/>			
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="비번"/>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button">로그인</button>
				<button type="button" onclick="goJoin()">회원가입</button>
			</td>
		</tr>
	</table>
	<table align="center">
		<tr>
			<td>
				<button>네이버</button> <br />
			</td>
		</tr>
		<tr>
			<td>
				<button>구글</button> <br />
			</td>
		</tr>
		<tr>
			<td>
				<button>카카오</button> <br />
			</td>
		</tr>
	</table>
	<script>
		function goJoin() {
			location.href = "/SemiProject/views/join.jsp";
		}
	</script>
</body>
</html>