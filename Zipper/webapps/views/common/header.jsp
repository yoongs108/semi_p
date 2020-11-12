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

<!-- 부트스트랩 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 구글 로그인 api meta-->
<meta name = "google-signin-client_id"content = "894633026908-nhpt910n7saunji257c36vovru0h3n3t.apps.googleusercontent.com">

<!-- 구글 로그인 api -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

	<style>
		/* 헤더  */
        header {
            height : 100px;
            text-align: center;
        }
		
		/* 헤더 이미지 버튼들 절대 위치 */
        header #hamburger, #profile {
            position: absolute;
            top : 10px;
            width: 25px;
            height: 25px;
            z-index: 5001;
        }

        header img:hover,
        header #logo:hover {
            cursor: pointer;
        }

		/* 각 이미지 버튼 위치 */
        #hamburger {
            left: 10px;
        }

        #logo {
         	position: absolute;
            top : 5px;
            right: 15px;
            z-index: 5001;
            font-size: 25px;
        }
        
        #profile {
            right: 120px;
            border : 1px solid black;
            border-radius: 50%;
        }

        #write {
            width: 25px;
            height: 25px;
            
        }
        
        /* 글쓰기 버튼 박스 */
        #writeBox {
            position: absolute;
            top : 10px;
        	right: 150px;
        	z-index: 5002;
        }

        /* nav */
        header nav {
            position : fixed;
            top : 0;
            left: 0;
            height : 100%;
            width : 0;
            background : white;
            overflow: hidden;
            transition : width 0.65s;
            z-index: 5000;
        }
        
		header p {
			position : absolute;
            top : 40px;
            right: 10px;
            z-index: 5001;
		}

        header ul {
            list-style: none;
            display : inline-block;
            margin-bottom: 30px; /*    */
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

        nav hr {
            border : none;
        }

        .nav_hide {
            width : 100%;
        }
        
        nav a {
        	color : black;
        }
        
        nav a:hover * {
        	font-weight : bold;
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

		<img src="<%= request.getContextPath() %>/resources/images/common/menu.png" id="hamburger" onclick="navToggle()"/>
		
		<span id="logo" onclick="goHome()">ZIPPER</span>
        
		<% if(m != null) { %>
        
        <img src="<%= request.getContextPath() %>/resources/images/profile/<%= m.getProfile() %>" alt="profile" id="profile" onclick="goMyPage()"/>
        <!-- 글쓰기 버튼 영역 -->
        <div id="writeBox">
        	<img src="<%= request.getContextPath() %>/resources/images/common/pen.png" id="write" data-toggle="dropdown"/>
        	<ul class="dropdown-menu" role="menu" style="top : 25x;">
			    <li><a href="<%= request.getContextPath() %>/views/writer/zippopWriter.jsp"">ZIP POP</a></li>
			    <li><a href="<%= request.getContextPath() %>/views/writer/PTPWrite.jsp">1:1 문의</a></li>
			</ul>
		</div>
		
		<p id="admin">
			'<%= m.getMnick() %>' 님 환영합니다!
		</p>
		<% } %>
		
		<!-- nav 메뉴 시작 -->
		<nav>
            <div class="left">
	            <br />
	            <table align="center">
	            	<tr>
	            		<td colspan="3">
	            			<a href="<%= request.getContextPath() %>/zippop.zp"><h3>COMMUNITY</h3></a>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</td>
	            		<td colspan="2">
			                <a href="<%= request.getContextPath() %>/zippop.zp"><h4>ZIP POP</h4></a> <br />
			                <a href="<%= request.getContextPath() %>/selectList.gu"><h4>GUIDE</h4></a> <br />
			                <a href="<%= request.getContextPath() %>/selectList.no"><h4>NOTICE</h4></a>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td colspan="3">
                			<a href="<%= request.getContextPath() %>/classFromMain.cfm"><h3>CLASS</h3></a><br /><br />
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
		                    <a href="<%= request.getContextPath() %>/helpfaq.fq"><h4>FAQ</h5></a> <br />
		                 <% if(m != null) { %>
		                    <a href="<%= request.getContextPath() %>/selectList.qo"><h4>1:1문의</h5></a>
		                 <% } %>
	            		</td>
	            	</tr>
	            </table>
            </div>
            
            <% if(m == null) { %>
            <!-- 비회원 -->
            <div class="right">
                <form action="" method="post">
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
                                    <input type="password" size="20" name="userPwd" id="userPwd" class="form-control height50" placeholder="UserPassword" onKeyDown="enterKey()">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <button type="button" class="btn btn-default height50" onclick="login()" style="width : 100px;">로그인</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-default height50" onclick="join()" style="width : 100px;">회원가입</button>
                </form>
                
                <br />
                <button type="button" class="btn btn-default height50" onclick="">아이디 / 비밀번호 찾기</button>
                <br />
                <br />
                <div>
                <%-- <div class="g-signin2" data-onsuccess="onSignIn"></div> <!-- 구글 로그인 버튼 -->
                    <img src="<%= request.getContextPath() %>/resources/images/pen.png" /> &nbsp; <img src="<%= request.getContextPath() %>/resources/images/pen.png" /> &nbsp; <img src="<%= request.getContextPath() %>/resources/images/pen.png" />
                </div> --%>
            </div>
            
            <% } else { %>
            
            <div class="right">
	            <br /><br />
	            <br /><br />
	            <br /><br />
	            <span onclick="goHome()" style="font-size : 25px;">ZIPPER</span>
                <br><br>
                <br><br>
                <button type="button" class="btn btn-default" onclick="logout()">로그아웃</button>
                
            </div>
            
            <% } %>
           <!--  <a href="#" onclick="signOut();">Sign out</a>
				<script>
				  function signOut() {
				    var auth2 = gapi.auth2.getAuthInstance();
				    auth2.signOut().then(function () {
				      console.log('User signed out.');
				    });
				  }
				</script> -->
        </nav>
    
    </header>
    <script>
    
    	/* 햄버거 토글 */
	    function navToggle(){
	        $('nav').toggleClass('nav_hide');
	    }
	    function enterKey() {
	        if (event.keyCode==13){
	        	login();
	        }
	     }
        function login(){
			//$('#loginForm').submit();
			
			$.ajax({
				url : '<%= request.getContextPath() %>/login.me',
				type : 'post',
				data : { 
						 userId : $('#userId').val(),
					     userPwd : $('#userPwd').val()
						},
				success : function(data){
					// console.log(data);

					if( data == 1 ) {
						alert("로그인 되었습니다.");
						location.href = "<%= request.getContextPath() %>/index.jsp";
					} else {
						alert("아이디 혹은 비밀번호를 확인해주세요");
						location.href = "<%= request.getContextPath() %>/index.jsp";
					}
				}, error : function(){
						alert("아이디 혹은 비밀번호를 확인해주세요");
						location.href = "<%= request.getContextPath() %>/index.jsp";
				}
			});
		}
        function join(){
        	location.href="<%= request.getContextPath() %>/views/join.jsp";
		}
        function logout(){
        	if(!confirm("로그아웃 하시겠습니까?")){
        		return false;
        	}
        	
			location.href="<%= request.getContextPath() %>/logout.me";
		}
		function goHome(){
			location.href="<%= request.getContextPath() %>/index.jsp";
		}
		function goMyPage(){
			location.href="<%= request.getContextPath() %>/views/myPage/myPageMain.jsp";
		}
		
		/* 페이지 로드시 실행 */
		$(function(){
			/* 관리자일 경우 p 클릭 시 관리자 페이지로 이동 */
			<% if(m != null && m.getMid().equals("admin")) { %>
				$('p#admin').click(function(){
					location.href="<%= request.getContextPath() %>/views/admin/admin.jsp";
				});
			<% } %>
		});
		
		/* 구글 로그인 정보 */
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			}
    </script>
</body>
</html>