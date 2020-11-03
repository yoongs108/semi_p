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
	<style>
		/* 헤더  */
        header {
            text-align: center;
            height : 100px;
        }
		
		/* 헤더 이미지들 */
        header #hamburger, #logo, #write {
            position: absolute;
            top : 10px;
            width: 25px;
            height: 25px;
            z-index: 5000;
        }

        header img:hover {
            cursor: pointer;
        }

		/* 햄버거 위치 */
        #hamburger {
            left: 10px;
        }

        #logo {
            right: 15px;
        }

        #write{
            right: 40px;
        }

        /* nav */
        header nav {
            position : absolute;
            top : 0;
            left: 0;
            height : 100%;
            width : 0;
            background : white;
            overflow: hidden;
            transition : width 0.65s;
        }
        
		header p {
			position : absolute;
            top : 50px;
            right: 10px;
		}

        header ul {
            list-style: none;
        }

        nav div.right {
            position: absolute;
            top: 30%;
            left : 50%;
            display: inline-block;
            width : 50%;
            height : 50%;
            border-left : 1px solid black;
        }

        nav div.left {
            position: absolute;
            top: 30%;
            left : 0;
            display: inline-block;
            width : 50%;
            height : 50%;
            border-right : 1px solid black;
        }
        nav img {
            width: 25px;
            height: 25px;
        }

        nav hr {
            border : none;
        }

        .nav_hide {
            width : 100%;
        }
	</style>
</head>
<body>

	<header>

		<img src="../resources/hamburger.png" id="hamburger" onclick="navToggle()"/>
		
        <img src="../resources/aaaa.png" alt="ZIPPER" id="logo" onclick="goHome()"/>
        
        <img src="../resources/pen.png" id="write" />
        
		<% if(m != null) { %>
		<p id="admin">
			'<%= m.getUserName() %>' 님 환영합니다!
		</p>
		<% } %>
		
		<!-- nav 메뉴 시작 -->
		<nav>
            <div class="left">
                <ul>
                    <li>
                        <a href="<%= request.getContextPath() %>/views/community/zip.jsp">COMMUNITY</a>
                        <ul>
                            <li>
                                <a href="<%= request.getContextPath() %>/views/community/zip.jsp">ZIP POP</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath() %>/views/community/guide.jsp">GUIDE</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath() %>/views/community/board.jsp">NOTICE</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/views/class/class.jsp">CLASS</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/views/help/helpFAQ.jsp">SERVICE</a>
                        <ul>
                            <li>
                                <a href="<%= request.getContextPath() %>/views/help/helpFAQ.jsp">FAQ</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <% if(m == null) { %>
            <!-- 비회원 -->
            <div class="right">
                <form action="<%= request.getContextPath() %>/login.me" method="post">
                    <table align="center">
                        <tr>
                            <td colspan="2">
                                <div class="input-group">
                                    <span class="input-group-addon" style="width : 50px;">Id</span>
                                    <input type="text" size="20" name="userId" id="userId" class="form-control" placeholder="UserId" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="input-group">
                                    <span class="input-group-addon" style="width : 50px;">Pw</span>
                                    <input type="password" size="20" name="userPwd" id="userPwd" class="form-control" placeholder="UserPassword">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <hr>
                    <button type="submit" class="btn btn-default" onclick="login()" style="width : 100px;">로그인</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-default" onclick="" style="width : 100px;">회원가입</button>
                </form>
                <hr>
                <button type="button" class="btn btn-default" onclick="">아이디 / 비밀번호 찾기</button>
                <hr>
                <div>
                    <img src="../resources/pen.png" /> &nbsp; <img src="../resources/pen.png" /> &nbsp; <img src="../resources/pen.png" />
                </div>
            </div>
            
            <% } else { %>
            
            <div class="right">
                <img src="resources/images/profile.png" alt="프로필" onclick="goMyPage()"/>
                <br>
                <button type="button" onclick="logout()">로그아웃</button>
            </div>
            
            <% } %>
        </nav>
    
    </header>
    <script>
    
	    /* 햄버거 토글 */
	    function navToggle(){
	        $('nav').toggleClass('nav_hide');
	    }
        function login(){
			$('#loginForm').submit();
		}
        function logout(){
			location.href="<%= request.getContextPath() %>/logout.me";
		}
		function goHome() {
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
		function goMyPage(){
			location.href="<%= request.getContextPath() %>/views/myPage/myPage.jsp";
		}
		
		/* 페이지 로드시 실행 */
		$(function(){
			/* 관리자일 경우 p 클릭 시 관리자 페이지로 이동 */
			<% if(m != null && m.getUserId().equals("admin")) {%>
				$('p#admin').click(function(){
					location.href="<%= request.getContextPath() %>/views/admin/admin.jsp";
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