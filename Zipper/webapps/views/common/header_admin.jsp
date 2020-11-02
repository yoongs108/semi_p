<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.member.model.vo.*"%>  
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/SemiProject/resources/js/jquery-3.5.1.min.js"></script>
	<style>
		body {
            margin : 0;
            padding : 0;
        }
        .loginArea {
            background : grey;
            text-align: center;
            height : 100px;
        }

        header img {
            border : 1px solid black;
            height : 40px;
            width : 40px;
        }

        header img:hover {
            cursor: pointer;
        }

	</style>
</head>
<body>

	<header class="loginArea" style="clear : both;">
        
		<img src="resources/images/logo.png" alt="로고" onclick="goHome()"/>
        
        <h1>Zipper</h1>
		<% if(m != null) { %>
		<p id="admin">
			'<%= m.getUserName() %>' 관리자님 환영합니다!
		</p>
		<% } %>

    
    </header>
    <script>

        function logout(){
			location.href="/SemiProject/logout.me";
		}
		function goHome() {
			location.href="/SemiProject/index.jsp";
		}
		/* 페이지 로드시 실행 */
		$(function(){
			
		})
    </script>
</body>
</html>