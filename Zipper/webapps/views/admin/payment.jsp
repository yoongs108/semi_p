<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.payment.model.vo.*, com.zipper.board.model.vo.*" %>
<%
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>
<style>
	section>div {
		margin-left : 80px;
		height : 100%;
	}
</style>
</head>
<body>
	<%@ include file="../common/header_admin.jsp" %>
	
	<% if( m != null && m.getMgrd().equals("A")) { %>
	
	<section class="templateWidth templateHeight">
		<div>
			<h1>매출</h1>
			<table align="center" border="1px" width="1200px" style="text-align: center;">
				<tr>
					<th>결제번호</th>
					<th>회원번호</th>
					<th>회원아이디</th>
					<th>클래스번호</th>
					<th>클래스명</th>
					<th>결제정보</th>
					<th>결제날짜</th>
					<th>결제상태</th>
					<th>총금액</th>
				</tr>
				<% for(Payment pay : list) { %>
				<tr>
					<td><%= pay.getPno() %></td>
					<td><%= pay.getMno() %></td>
					<td><%= pay.getMno() %></td>
					<td><%= pay.getCno() %></td>
					<td><%= pay.getCno() %></td>
					<td><%= pay.getPayinfo() %></td>
					<td><%= pay.getPdate() %></td>
					<td><%= pay.getPstatus().equals("Y") ? "정상" : "환불" %></td>
					<td style="text-align: right; padding-right : 10px;"><%= pay.getTotal() %></td>
				</tr>
				<% } %>
				<% if(list.size() == 0) { %>
				<tr>
					<td colspan="9"> 조회된 정보가 없습니다.</td>
				</tr>
				<% } %>
			</table>
			<div style="text-align : center;">
				<button class="w3-bar-item w3-button w3-hover-black"
		       			onclick="location.href='<%= request.getContextPath() %>/pSelectList.ad?currentPage=1'"><<</button>
				<% if(currentPage <= 1){ %>
					<button class="w3-bar-item w3-button" disabled><</button>
				<% } else { %>
				<button class="w3-bar-item w3-button w3-hover-black"
						onclick="location.href='<%= request.getContextPath() %>/pSelectList.ad?currentPage=<%=currentPage - 1 %>'"><</button>
				<% } %>
				<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){	
				%>
					<button class="w3-bar-item w3-button" disabled><%= p %></button>
				<%      }else{ %>
					<button class="w3-bar-item w3-button w3-hover-black"
							onclick="location.href='<%= request.getContextPath() %>/pSelectList.ad?currentPage=<%= p %>'"><%= p %></button>
				<%      } %>
				<% } %>
		         
		        <%  if(currentPage >= maxPage){  %>
				<button class="w3-bar-item w3-button" disabled>></button>
				<%  }else{ %>
				<button class="w3-bar-item w3-button w3-hover-black" 
						onclick="location.href='<%= request.getContextPath() %>/pSelectList.ad?currentPage=<%=currentPage + 1 %>'">></button>
				<%  } %>
				<button class="w3-bar-item w3-button w3-hover-black"
						onclick="location.href='<%= request.getContextPath() %>/pSelectList.ad?currentPage=<%= maxPage %>'">>></button>
			</div>
		</div>
	</section>
	
	<% } else { // 관리자 외 접근 차단 
		request.setAttribute("exception", new Exception("잘못된 접근"));
		request.setAttribute("error-msg", "정상 접근 후 진행하세요!");
		
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	} %>
</body>
</html>