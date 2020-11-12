<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.member.model.vo.*" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style>
	section>div {
		margin-left : 80px;
		height : 100%;
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
			<h1>회원정보</h1>
			
			<table align="center" border="1px" width="1200px">
				<tr>
					<th>회원번호</th>
					<th>회원등급</th>
					<th>아이디</th>
					<th>별명</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>탈퇴일</th>
					<th>상태</th>
				</tr>
				<% for(Member user : list) { %>
				<tr>
					<td><%= user.getMno() %></td>
					<td>
					<input type="radio" name="<%= user.getMno() %>" value="A" <%= user.getMgrd().equals("A") ? "checked='checked'" : "" %> onclick="updateGrd(this)"/>A
					<input type="radio" name="<%= user.getMno() %>" value="M" <%= user.getMgrd().equals("M") ? "checked='checked'" : "" %> onclick="updateGrd(this)"/>M
					</td>
					<td><%= user.getMid() %></td>
					<td><%= user.getMnick() %></td>
					<td><%= user.getMcontact() %></td>
					<td><%= user.getMemail() %></td>
					<td><%= user.getMendate() %></td>
					<td><%= user.getMexdate() %></td>
					<td><%= user.getMstatus() %></td>
				</tr>
				<% } %>
			</table>
		</div>
	</section>
	
	<% } else { // 관리자 외 접근 차단 
		request.setAttribute("exception", new Exception("잘못된 접근"));
		request.setAttribute("error-msg", "정상 접근 후 진행하세요!");
		
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	} %>
	
	<script>
		// 회원 등급 변경
		function updateGrd(obj) {
			$.ajax({
				url : '<%= request.getContextPath() %>/updateGrd.ad',
				type : 'post',
				data : { 
						 mno : $(obj).prop('name'),
					     mgrd : $(obj).val()
						},
				success : function(data){
					// console.log(data);

					alert("수정되었습니다.");
					location.href = "<%= request.getContextPath() %>/uSelectList.ad";

				}, error : function(){
					alert("수정 실패!");
					location.href = "<%= request.getContextPath() %>/uSelectList.ad";
				}
			});
		}
	</script>
</body>
</html>