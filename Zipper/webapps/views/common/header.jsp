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
            height : 100px;
            text-align: center;
        }
		
		/* 헤더 이미지 버튼들 절대 위치 */
        header #hamburger, #logo, #write, #profile {
            position: absolute;
            top : 10px;
            width: 25px;
            height: 25px;
            z-index: 5001;
        }

        header img:hover {
            cursor: pointer;
        }

		/* 각 이미지 버튼 위치 */
        #hamburger {
            left: 10px;
        }

        #logo {
            right: 15px;
        }
        
        #write{
            right: 40px;
        }

        #profile{
            right: 70px;
        }

        /* nav */
        header nav {
            position : absolute;
            top : 0;
            left: 0;
            height : 100%;
            width : 0;
            background : lightgreen;/*  */
            overflow: hidden;
            transition : width 0.65s;
            z-index: 5000;
        }
        
		header p {
			position : absolute;
            top : 50px;
            right: 10px;
		}

        header ul {
            list-style: none;
            display : inline-block;
            margin-bottom: 30px; /*  */
        }

        nav div.right {
        	text-align: center;
            position: absolute;
            top: 20%;
            left : 50%;
            display: inline-block;
            width : 50%;
            height : 70%;
            border-left : 1px solid grey;
        }

        nav div.left {
            position: absolute;
            top: 20%;
            left : 0;
            display: inline-block;
            width : 50%;
            height : 70%;
            border-right : 1px solid grey;
            text-align: left;
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
        
        nav a {
        	color : black;
        }
        
        nav h3, h4 {
        	display : inline-block;
        }
        
        .height50 {
        	height : 50px;
        }
	</style>
</head>
<body>

	<header>

		<img src="<%= request.getContextPath() %>/resources/images/hamburger.png" id="hamburger" onclick="navToggle()"/>
		
        <img src="<%= request.getContextPath() %>/resources/images/aaaa.png" alt="ZIPPER" id="logo" onclick="goHome()"/>
        
        <img src="<%= request.getContextPath() %>/resources/images/pen.png" id="write" />
        
        <img src="<%= request.getContextPath() %>/resources/images/profile.png" alt="profile" id="profile" onclick="goMyPage()"/>
        
		<% if(m != null) { %>
		<p id="admin">
			'<%= m.getUserName() %>' 님 환영합니다!
		</p>
		<% } %>
		
		<!-- nav 메뉴 시작 -->
		<nav>
            <div class="left">
	            <br />
	            <table align="center">
	            	<tr>
	            		<td colspan="3">
	            			<a href="<%= request.getContextPath() %>/views/community/zippop.jsp"><h3>COMMUNITY</h3></a>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</td>
	            		<td colspan="2">
			                <a href="<%= request.getContextPath() %>/views/community/zippop.jsp"><h4>ZIP POP</h4></a> <br />
			                <a href="<%= request.getContextPath() %>/views/community/guide.jsp"><h4>GUIDE</h4></a> <br />
			                <a href="<%= request.getContextPath() %>/views/community/board.jsp"><h4>NOTICE</h4></a>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td colspan="3">
                			<a href="<%= request.getContextPath() %>/views/class/class.jsp"><h3>CLASS</h3></a><br /><br />
	            		</td>
	            	</tr>
	            	<tr>
	            		<td colspan="3">
                			<a href="<%= request.getContextPath() %>/views/help/helpFAQ.jsp"><h3>SERVICE</h3></a>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</td>
	            		<td colspan="2">
		                    <a href="<%= request.getContextPath() %>/views/help/helpFAQ.jsp"><h4>FAQ</h5></a> <br />
		                 <% if(m != null) { %>
		                    <a href="<%= request.getContextPath() %>/views/help/helpFAQ.jsp"><h4>1:1문의</h5></a>
		                 <% } %>
	            		</td>
	            	</tr>
	            </table>
            </div>
            
            <% if(m == null) { %>
            <!-- 비회원 -->
            <div class="right">
                <form action="<%= request.getContextPath() %>/login.me" method="post">
                <br /> <br />
                    <table align="center">
                        <tr>
                            <td colspan="2">
                                <div class="input-group">
                                    <span class="input-group-addon" style="width : 50px;">Id</span>
                                    <input type="text" size="20" name="userId" id="userId" class="form-control" placeholder="UserId" style="height : 50px;">
                                </div>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="input-group">
                                    <span class="input-group-addon" style="width : 50px;">Pw</span>
                                    <input type="password" size="20" name="userPwd" id="userPwd" class="form-control height50" placeholder="UserPassword">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <button type="submit" class="btn btn-default height50" onclick="login()" style="width : 100px;">로그인</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-default height50" onclick="join()" style="width : 100px;">회원가입</button>
                </form>
                <br />
                <button type="button" class="btn btn-default height50" onclick="">아이디 / 비밀번호 찾기</button>
                <br />
                <br />
                <div>
                    <img src="<%= request.getContextPath() %>/resources/images/pen.png" /> &nbsp; <img src="<%= request.getContextPath() %>/resources/images/pen.png" /> &nbsp; <img src="<%= request.getContextPath() %>/resources/images/pen.png" />
                </div>
            </div>
            
            <% } else { %>
            
            <div class="right">
	            <br /><br />
	            <br /><br />
	            <br /><br />
                <img src="resources/images/profile.png" alt="logo" onclick="goMyPage()"/>
                <br><br>
                <br><br>
                <button type="button" class="btn btn-default" onclick="logout()">로그아웃</button>
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
        function join(){
        	location.href="<%= request.getContextPath() %>/views/join.jsp";
		}
        function logout(){
			location.href="<%= request.getContextPath() %>/logout.me";
		}
		function goHome() {
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
		function goMyPage(){
			location.href="<%= request.getContextPath() %>/views/myPage/myPageMain.jsp";
		}
		
		/* 페이지 로드시 실행 */
		$(function(){
			/* 관리자일 경우 p 클릭 시 관리자 페이지로 이동 */
			<% if(m != null && m.getUserId().equals("admin")) { %>
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
		});
    </script>
</body>
</html>