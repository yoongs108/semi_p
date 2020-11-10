<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>
<style>
	section>div {
		margin-left : 80px;
		height : 100%
	}
</style>
</head>
<body>
	<%@ include file="../common/header_admin.jsp" %>
	
	<% if( m != null && m.getMgrd().equals("A")) { %>
	
	<section class="templateWidth templateHeight">
		<div>
			<h1>매출</h1>
		</div>
	</section>
	
	<% } else { // 관리자 외 접근 차단 
		request.setAttribute("exception", new Exception("잘못된 접근"));
		request.setAttribute("error-msg", "정상 접근 후 진행하세요!");
		
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	} %>
</body>
</html>