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

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<style>
		body {
            margin : 0;
            padding : 0;
        }
        
        header {
	        height : 60px;
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
            height : 38px;
            width : 38px;
            margin : 10px 0 10px 20px;
        }
        .logo {    
        	margin: 5px 10px 5px 20px;
        	float : left;
        }

        header img:hover {
            cursor: pointer;
        }
        
        nav {
         background : lightgrey;
         width : 80px;
         height : 600px;
         position : absolute;
         top : 60px;
        }
        li {
        	list-style : none;
        	display : inline-block;
        }
        nav>ul>li>ul {
        	display : none;
        }
        .sub>a {
        	margin-top : 15px;
        	text-decoration: none;
        	color : black;
        	margin-top: 20px;	
        }
        .sub>a:hover {
        	cursor: pointer;
        	font-weight :bold;
        	font-size : 16px;
        }
        nav ul>li:hover {
        	background : grey;
        }
        
        nav ul>li:hover ul {
        	list-style : none;
        	display : inline-block;
        	position : absolute;
        	background : grey;
        	padding : 10px;
        	width : 130px;
        	height : 200px;
        	margin-left : 22px; 
        }
        
	</style>
</head>
<body>

	<header class="templateWidth">
        
		<img src="<%= request.getContextPath() %>/resources/images/common/logo1.png" alt="로고" class="logo" 
			style=" margin-top : 10px;" onclick="goHome()"/>
		
		<img src="<%= request.getContextPath() %>/resources/images/profile/setting.png<%-- <%= m.getProfile() %> --%>" onclick="goMyPage()" 
			style="float : right; width : 40px; height : 40px; margin-right: 20px; margin-bottom:5px;"/>
		
		<p id="admin" style="float : right; display : inline-block; margin-top: 25px; font-size : 15px;">
			'<%= m.getMnick() %>' 관리자님 환영합니다!
		</p>
		
		<nav>
			<ul class="nav nav-pills nav-stacked">
				<li><img src="<%= request.getContextPath() %>/resources/images/common/homeBnt.png" onclick="goMain()"/></li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/attention.png" onclick="goReport()"/></li>
				<li>
					<img src="<%= request.getContextPath() %>/resources/images/common/qna.png" onclick="goBoard()"/>
					<ul>
						<li class="sub">
							<br /><a href="#">1대1문의 리스트</a><br />
						</li>
						<li class="sub">
							<br /><a href="#">FAQ 관리</a><br />
						</li>
						<li class="sub">
							<br /><a href="#">공지사항 관리</a><br />
						</li>
					</ul>
				</li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/userInfo.png" onclick="goUserInfo()"/>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/bill.png" onclick="goPayment()"/></li>
				<li><img src="<%= request.getContextPath() %>/resources/images/common/menu.png" onclick="goVideoInfo()"/></li>
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
			location.href="<%= request.getContextPath() %>/pSelectList.ad";
		}
		
		function goVideoInfo() {
			location.href="<%= request.getContextPath() %>/views/admin/classStatus.jsp";
		}
		
		/* 페이지 로드시 실행 */
		$(function(){
			
		})
    </script>
</body>
</html>