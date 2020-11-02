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
        
        /* 헤더  */
        .loginArea {
            background : orange;
            text-align: center;
            height : 60px;
        }
		
		/* 헤더 이미지들 */
        header img {
            border : 1px solid black;
            height : 40px;
            width : 40px;
        }

        header img:hover {
            cursor: pointer;
        }

		/* 햄버거 위치 */
        .hamburger_menu {
            position : absolute;
            top : 10px;
            left: 10px;

        }

        header nav {
            position : absolute;
            top : 0;
            left: 0;
            height : 100%;
            width : 0;
            background : lightgrey;
            overflow: hidden;
            transition : width 0.5s;
        }
        
		header p {
			position : absolute;
            top : 50px;
            right: 10px;
		}
	</style>
</head>
<body>

	<header class="loginArea" style="clear : both;">
        
		<img src="resources/images/logo.png" alt="햄버거" class="hamburger_menu" id="hamburger" onclick="menu()"/>
		
		<img src="resources/images/logo.png" alt="로고" onclick="goHome()"/>
        
		<% if(m != null) { %>
		<p id="admin">
			'<%= m.getUserName() %>' 님 환영합니다!
		</p>
		<% } %>
		<button type="button" id="write">글쓰기</button>
		
		<!-- nav 메뉴 시작 -->
		<nav id="nav">
            <img src="resources/images/logo.png" alt="햄버거" class="hamburger_menu" id="hamburger2" onclick="menu2()"/>
            
            <% if(m == null) { %>
            <!-- 비회원 -->
            <form action="/SemiProject/login.me" method="post" style="margin-top : auto; margin-bottom : auto;">
            
                <table align="right">
                    <tr>
                        <td colspan="2">
                            <input type="text" size="20" name="userId" id="userId">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" size="20" name="userPwd">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" onclick="login()">로그인</button>
                        </td>
                        <td>
                            <button type="button" onclick="">회원가입</button>
                        </td>
                    </tr>
                </table>
            </form>
            
            <% } else { %>
            
            <div style="float : right;">
                <img src="resources/images/profile.png" alt="프로필" onclick="goMyPage()"/>
                <br>
                <button type="button" onclick="logout()">로그아웃</button>
            </div>
            
            <% } %>
            <br />
            <br />
            <br />
			<div align="left">
				<ul>
					<li>
						<a href="/SemiProject/index.jsp">홈</a>
					</li>
					<li>
						<a href="/SemiProject/views/community/zip.jsp">커뮤니티</a>
						<ul>
							<li>
								<a href="/SemiProject/views/community/zip.jsp">노하우</a>
							</li>
							<li>
								<a href="/SemiProject/views/community/guide.jsp">Zipper 가이드</a>
							</li>
							<li>
								<a href="/SemiProject/views/community/board.jsp">공지사항</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="/SemiProject/views/class/class.jsp">클래스</a>
						<ul>
							<li>
								<a href="/SemiProject/views/class/class.jsp">클래스</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="/SemiProject/views/help/helpFAQ.jsp">고객센터</a>
						<ul>
							<li>
								<a href="/SemiProject/views/help/helpFAQ.jsp">FAQ</a>
							</li>
							<li>
								<a href="/SemiProject/views/help/helpPTP.jsp">1:1 문의</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
        </nav>
    
    </header>
    <script>
    
        function menu(){
            $('nav').css('width', '100%');
        }
        function menu2(){
            $('nav').css('width', '0');
        }
        function login(){
			$('#loginForm').submit();
		}
        function logout(){
			location.href="/SemiProject/logout.me";
		}
		function goHome() {
			location.href="/SemiProject/index.jsp";
		}
		function goMyPage(){
			location.href="/SemiProject/views/myPage/myPage.jsp";
		}
		
		/* 페이지 로드시 실행 */
		$(function(){
			/* 관리자일 경우 p 클릭 시 관리자 페이지로 이동 */
			<% if(m != null && m.getUserId().equals("admin")) {%>
				$('p#admin').click(function(){
					location.href="/SemiProject/views/admin/admin.jsp";
				});				
			<% } %>
			<% if(m == null) {%>
				$('#write').click(function(){
					alert("로그인 후 이용해 주세요!");
					$('#hamburger').click();
					$('#userId').focus();
				});
			<% } %>
			
		})
    </script>
</body>
</html>