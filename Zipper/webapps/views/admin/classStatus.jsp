<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.zipper.video.model.vo.*, java.util.*, com.zipper.board.model.vo.*" %>
<%
	ArrayList<Video> vlist = (ArrayList<Video>)request.getAttribute("video");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 관리</title>
<style>
	section>div {
		margin-left : 80px;
		height : 100%
	}
	section table {
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="../common/header_admin.jsp" %>
	
	<% if( m != null && m.getMgrd().equals("A")) { %>
	
	<section class="templateWidth templateHeight">
		<div>
			<h2>CLASS 관리</h2>
			<table align="center" border="1px" width="1200px">
				<tr>
					<th>클래스 번호</th>
					<th>비디오 번호</th>
					<th>강의명</th>
					<th>첨부 파일명</th>
					<th>상태</th>
				</tr>
				<%--  <% for(Video v : vlist) { %>  --%>
				<%-- <tr>
					<td><%= v.getCno() %></td>
					<td><%= v.getVno() %></td>
					<td><%= v.getCname() %></td>
					<td><%= v.getVideo() %></td>
					<td>
					<input type="radio" name="mgrd<%= v.getVno() %>" value="A" <%= user.getMgrd().equals("A") ? "checked='checked'" : "" %>/>A
					<input type="radio" name="mgrd<%= v.getVno() %>" value="M" <%= user.getMgrd().equals("M") ? "checked='checked'" : "" %>/>M
					</td>
					
				</tr> --%>
				 <%-- <% } %> --%>
			</table>
		</div>
	</section>
	
	<% } else { // 관리자 외 접근 차단 
		request.setAttribute("exception", new Exception("잘못된 접근"));
		request.setAttribute("error-msg", "정상 접근 후 진행하세요!");
		
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	} %>
</body>
</html>