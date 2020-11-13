<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.thumb.model.vo.*" %>
<%
	ArrayList<Thumbnail> mplist = (ArrayList<Thumbnail>)request.getAttribute("mpZipList");
	Iterator iter = mplist.iterator();
	int count = mplist.size();
	String profile = mplist.get(0).getProfile();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>My Zippop</title>
<style>

	section {
		width: 1024px;
		margin-left:auto;
		margin-right:auto;
	}

	#reverseBtn {
		background: white;
		width: 50px;
		height: 50px;
		border: 0px;
		left: 90%;
		position:relative;
		top:-210%; 
	}
	
	#reverseBtn:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
	#reverseBtn:focus {
		outline: none;
	}
	
	
	#reverseImg {
		width: 80px;
		height: 80px;
		border: 0px;
	}
	
	#pageTop {
		height:30px;
	}
	
	#basicInfo {
		width: 100%;
		height: 300px;
	}
	
	
	#profileArea {
		height:100%;
		width:40%;
		position: relative;
		left: 0%;
	}
	
	#profileImg {
		right: 120px;
        border : 1px solid black;
        border-radius: 50%;
        margin-right : 10px;
		width : 200px;
		height: 200px;
		position: relative;
		left: 110px;
		top: 70px;
	}
	/*
	#profileArea > div {
		width : 180px;
		height: 180px;
		border: 3px solid black;
		border-radius: 50%;
		position: relative;
		left: 30%;
		top: 25%;
	}
	*/
	#userCommentArea {
		height:100%;
		width:60%;
		/*background: blue;*/
		position: relative;
		left: 40%;
		top:-100%;
		/*border: 1px solid green;*/
	}
	
	#userCommentArea > div{
		position: relative;
		width:60%;
		top: 70px;
	}
	
	#userCommentArea > div > p {
		height: 120px;
		margin-left:auto;
		margin-right:auto;
		margin-top: auto;
		/*border: 1px solid blue;*/
		font-size: 16px;
		width: 300px;
	}

	
	#myZippopCount {
		position: relative;
		width: 240px;
		height: 25px;
		left: 70px;
		font-size: 13px;
		top : 15px;
	}
	
	#myZippopCount>img {
		width:20px;
		height:20px;
	}
	
	
	/* 하단부 이미지 출력 CSS */
   .thumbnailArea {
      width:950px;
      height:auto;
      margin-left:auto;
      margin-right:auto;
   }
   .thumb-list {
      width:300px;
      border:1px solid white;
      display:inline-block;
      margin:5px;
      align:center;
   }
   .thumb-list:hover {
      opacity:0.8;
      cursor:pointer;
   }
	
	
	#zipWriter {
		/*margin-left: 50px;*/
		width: 100px;
		height: 50px;
		background: black;
		color: white;
	}
	
	#zipWriter:hover {
		background: grey;
		cursor: pointer;
	}
	
	#zipWrite {
		position: relative;
		width: 100px;
		height: 50px;
		margin-left:900px;
	}
	
	#qutationLeft, #qutationRight {
		height : 50px;
		height: 50px;
		
	}
	
	#qutationLeft {
		position: relative;
		right:220px;
		top:40px;
	}
	
	#qutationRight {
		position: relative;
		left:220px;
		bottom: 140px;
	}
	
	
</style>
<script>
	function moveMain() {
		$(this).on('click', function() {
			location.href = "<%= request.getContextPath() %>/views/myPage/myPageMain.jsp";
		});
	}
	
	function zipWriter() {
		$(this).on('click', function() {
			location.href = "<%= request.getContextPath() %>/views/writer/zippopWriter.jsp";
		})
	}
	
	$('.thumb-list').click(function () {
		var bno = $(this).find('input').val();
		location.href ='<%= request.getContextPath()%>/zippopSelectOne.zp?bno=' + bno;
	});
</script>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<section>
		<div id="pageTop">
			<h2 align="center"><%= m.getMnick() %>.ZIP</h2>
			<button id="reverseBtn" onclick="moveMain();">
				<img id="reverseImg" src="<%= request.getContextPath() %>/resources/images/common/backButton.png" alt="뒤로가기" />
			</button>
		</div>
		<hr style="border:1px solid black;">
	
		<div id="basicInfo">
			<div id="profileArea">
				<div>
					<img id="profileImg" src="<%= request.getContextPath() %>/resources/images/profile/<%= profile %>" alt="프로필 사진없음" />
				</div>
			</div>
			<!-- 내 소개  들어오는 자리  -->
			<div id="userCommentArea" align="center">
				<!-- 내가 작성한글 들어오는 자리  -->
				<img src="<%= request.getContextPath() %>/resources/images/common/qutation_img.png" alt="쉼표" id="qutationLeft"/>
				<div>
					<p align="center">
						<% if (m.getIntro() == null) { %>
							 아직 내 한줄 소개가 없습니다..
						<% } else { %>
							<%= m.getIntro() %>
						<% } %>
					</p>
				</div>
				<img src="<%= request.getContextPath() %>/resources/images/common/quatation_right_img.png" alt="쉼표" id="qutationRight" />
				<!-- 갯수 카운트 자리 -->
				<div>
					<!-- 작성글 갯수 부분 들어오는 자리 -->
					<div id="myZippopCount" ><!-- style="border:1px solid black"-->
						<img src="<%= request.getContextPath() %>/resources/images/common/logo1.png" alt="이미지" />
						내가 작성한 글 수 : <%= count %>
					</div>		
				</div>
			</div>
		</div>
		<div align="right" id="zipWrite">
			<button type="button" id="zipWriter" onclick="zipWriter();">글쓰기</button>
		</div>
		<br /><hr style="border: 1px solid black;">
		
		<!-- 하단 게시글 부분 출력  -->
		<div class="thumbnailArea"> 
		
		<!--  내가 작성한 게시글 조회하기  (조건 :  ) -->
		<% if (iter.hasNext()) { %>
			<% for (Thumbnail t : mplist) { %>
			
				<div class="thumb-list" align="center" onclick="location.href='<%= request.getContextPath() %>/zippopSelectOne.zp?bno=<%= t.getBno() %>'">
					<div>
						<input type="hidden" name="bno" value="<%= t.getBno() %>"/>
						<img src="<%= request.getContextPath() %>/resources/images/zippopUploadFiles/<%= t.getBoardfile() %>" 
							width="200px" height="150px"/>
					</div>
					
					<p>
						<%= t.getUserId()%>
                 		<div>                  
                  		</div>
                  		<br />
                 		<%= t.getBcontent() %>
					</p>					
				</div>
			<% } %>
			<br /><br />
			
		<% } else { %>
		
			<div id="emptyZippop" align="center" style="margin-top:50px; font-size:20px;">
				<p>아직 내가쓴 zippop이 없어요...</p>
				
			</div>
		 
		<% } %>	
		
		</div>
		
	</section>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>