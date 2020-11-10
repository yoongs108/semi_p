<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.member.model.vo.*"%>  
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		body {
            margin : 0;
            padding : 0;
        }
        
        header {
	        height : 40px;
            background : grey;
            clear : both;
        }
        /* 가로 공통 */
        .templateWidth {
            width : 1280px;
            margin-left : auto;
            margin-right : auto;
        }
        /* 세로 공통 */
       	.templateHeight {
			height : 600px;
		}

        header img {
            height : 40px;
            width : 40px;
            margin : 0 10px 0 10px;
        }

        header img:hover {
            cursor: pointer;
        }
        
        nav {
         background : lightgrey;
         width : 80px;
         height : 600px;
         position : absolute;
         top : 40px;
        }
        
        nav ul>li:hover {
        	background : grey;
        }
        
        nav ul>li:hover ul {
        	list-style : none;
        	display : inline-block;
        	position : absolute;
        	background : grey;
        	padding : 0;
        	width : 100px;
        	margin-left : 10px; 
        	
        	
        }
        
        li {
        	padding-left : 10px;
        	margin-bottom : 10px;
        	list-style : none;
        	display : inline-block;
        }
        
        nav>ul>li>ul {
        	display : none;
        }
        
        li a {
        	background : lightgrey;
        	/* text-decoration: none; */
        }

	</style>
</head>
<body>

	<header class="templateWidth">
        
		<img src="<%= request.getContextPath() %>/resources/images/common/logo1.png" alt="로고" onclick="goHome()" style="float : left;"/>
		
		<img src="<%= request.getContextPath() %>/resources/images/profile/<%= m.getProfile() %>" alt="프로필" onclick="goMyPage()" style="float : right; border : 2px solid black; border-radius: 50%; width : 35px; height : 35px;"/>
		
		<p id="admin" style="float : right; display : inline-block;">
			'<%= m.getMnick() %>' 관리자님 환영합니다!
		</p>
		
		<nav>
			<ul class="nav nav-pills nav-stacked">
				<li><img src="<%= request.getContextPath() %>/resources/images/common/home.png" onclick="goMain()"/></li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/warning2.png" onclick="goReport()"/></li>
				<li>
					<img src="<%= request.getContextPath() %>/resources/images/common/qna.png" onclick="goBoard()"/>
					<ul>
						<li><a href="#">1대1문의 리스트</a></li>
						<li><a href="#">FAQ 관리</a></li>
						<li><a href="#">공지사항 관리</a></li>
					</ul>
				</li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/userInfo.png" onclick="goUserInfo()"/>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/payment.png" onclick="goPayment()"/></li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/menu.png" onclick="goHome()"/></li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/menu.png" onclick="goHome()"/></li>
			</ul>
		</nav>
    
    </header>
    <script>

		function goHome() {
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
		
		function goMyPage() {
			location.href="<%= request.getContextPath() %>/views/myPage/myPageMain.jsp";
		}
		
		function goMain() {
			location.href="<%= request.getContextPath() %>/views/admin/admin.jsp";
		}
		
		function goReport() {
			location.href="<%= request.getContextPath() %>/views/admin/report.jsp";
		}
		
		function goUserInfo() {
			location.href="<%= request.getContextPath() %>/uSelectList.ad";
		}
		
		function goPayment() {
			location.href="<%= request.getContextPath() %>/views/admin/payment.jsp";
		}
		
		/* 페이지 로드시 실행 */
		$(function(){
			
		})
    </script>
</body>
</html>