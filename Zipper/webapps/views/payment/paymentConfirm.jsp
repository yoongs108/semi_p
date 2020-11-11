<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 및 결제 완료</title>

<style type="text/css">
	section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
   }
   
   table {
		width : 700px; 
   }
   
   
   button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
	}
	
	.boxLine {
		width : 700px;
        border-bottom: 1px solid black;
		margin: 50px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<section>
		<div style="border-bottom: 1px solid black;">
			<h2 id="title">수강신청 및 결제 완료</h2>
		</div>
		<div align="center">
			<div class="boxLine">
				<h2>신청 및 결제 내역</h2>
			</div>
			<table>
				<tr>
					<td>클래스 명</td>
					<td style="text-align:right;"><%= request.getParameter("cname") %></td>
				</tr>
				<tr>
					<td>총 결제 금액</td>
					<td style="text-align:right;"><%= request.getParameter("price") %> 원</td>
				</tr>
			</table>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			
			
			<div>
			<button style=" width : 700px; color : white;" onclick="goClass()">확인</button>
			</div>
		</div>

	</section>
	
	
	<%@ include file="/views/common/footer.jsp"%>
	
	
	<script type="text/javascript">
		function goClass() {
			location.href = "<%= request.getContextPath() %>/classFromMain.cfm";
		};
	</script>
</body>
</html>