<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.thumb.model.vo.*" %>
<%
	ArrayList<Thumbnail> mplist = (ArrayList<Thumbnail>)request.getAttribute("mpZipList");
	Iterator iter = mplist.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		/*background: yellow;*/	
		position: relative;
		left: 0%;
		border: 1px solid red;
	}
	
	#userCommentArea {
		height:100%;
		width:60%;
		/*background: blue;*/
		position: relative;
		left: 40%;
		top:-100%;
		border: 1px solid green;
	}
	
	#profileImg {
		width : 120px;
		height: 140px;
		position: relative;
		left: 15%;
		top: 10%;
	}
	
	#profileArea > div {
		width : 180px;
		height: 180px;
		border: 3px solid black;
		border-radius: 50%;
		position: relative;
		left: 30%;
		top: 25%;
	}
	
	#userCommentArea > div > p {
		height: 160px;
		margin-left:18%;
		margin-right:18%;
		margin-top: 30px;
		border: 1px solid blue;
		font-size: 20px;
	}
	
	#userCommentArea > div > p > table > tr {
		height: 40px;
		border: 1px solid pink;
	}
	
	#myZippopCount {
		position: relative;
		width: 150px;
		height: 50px;
		left: 200px;
	}
	
	#myZippopScrap {
		position: relative;
		width: 150px;
		height: 50px;
		top: -50px;
		left: 350px;
	}
	
	/* 하단부 이미지 출력 CSS */
	.thumbnailArea {
		width:95%;
		height:auto;
		margin-left:auto;
		margin-right:auto;
	}
	.thumb-list {
		width:220px;
		border:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}
	.thumb-list:hover {
		opacity:0.8;
		cursor:pointer;
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
					<img id="profileImg" src="../../resources/images/common/profile.png" alt="프로필 사진없음" />
				</div>
			</div>
			<!-- 내 소개  들어오는 자리  -->
			<div id="userCommentArea">
				<!-- 내가 작성한글 들어오는 자리  -->
				<div>
					<p>
						<%-- <% if (m.getIntro().equals("")) { --%>
							<!-- 
							 <p>아직 내 한줄 소개가 없습니다..</p>
							 -->
						<%--<% } else { --%>
							<%= m.getIntro() %>
						<%--<% } --%>
					
						
						
					</p>
				</div>
				<!-- 갯수 카운트 자리 -->
				<div>
					<!-- 작성글 갯수 부분 들어오는 자리 -->
					<div id="myZippopCount" style="border:1px solid black">
						<img src="" alt="이미지" />
						<b>갯수</b> <!-- 갯수는 count 해서 숫자 반영 -->
					</div>		
					<!-- 스크랩 갯수 부분 들어오는 자리 -->
					<div id="myZippopScrap" style="border:1px solid black">
						<img src="" alt="이미지" />
						<b>갯수</b> <!-- 갯수는 count 해서 숫자 반영 -->
					</div>		
				</div>
			</div>
		</div>
		
		<br /><hr style="border: 1px solid black;">
		
		<!-- 하단 게시글 부분 출력  -->
		<div class="thumbnailArea"> 
		
		<!--  내가 작성한 게시글 조회하기  (조건 :  ) -->
		<% if (iter.hasNext()) { %>
			<% for (Thumbnail t : mplist) { %>
			
				<div class="thumb-list" align="center">
					<div>
						<input type="hidden" name="bno" value="<%= t.getBno() %>"/>
						<img src="<%= request.getContextPath() %>/resources/images/zippopUploadFiles/<%= t.getBoardfile() %>" 
							width="200px" height="150px"/>
					</div>
					
					<p>
						<!-- NO. --> 
						<%--= t.getBno() --%>
						<br />
						<%= t.getBcontent() %>
						<br />
						조회수 : <%= t.getBview() %>
					</p>
				</div>
			<% } %>
			<br /><br />
			
		<% } else { %>
		
			<div id="emptyZippop">
				<p>아직 내가쓴 zippop이 없어요...</p>
				<button onclick="zipWriter();">글쓰기</button>
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