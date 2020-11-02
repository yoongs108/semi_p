<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<%@ include file="/views/common/header_admin.jsp" %>
	
	<% if( m != null && m.getUserId().equals("admin")) { %>
	
	<section>
		<h1>관리자 페이지</h1>
	</section>
	
	<% } else { // 관리자 외 접근 차단 
		request.setAttribute("exception", new Exception("잘못된 접근"));
		request.setAttribute("error-msg", "정상 접근 후 진행하세요!");
		
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	} %>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>