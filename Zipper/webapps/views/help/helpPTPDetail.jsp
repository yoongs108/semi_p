<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 1:1 문의 상세 페이지 </title>
<style>
#back{
      position : absolute;
      top : 100px;
      left : 950px;
      height : 80px;
      width: 80px;
      position:relative;
      top:-210%;
   }
   
   #back:hover{
      cursor: pointer;
      transform: scale(1.2);
   }
   
   section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
   }
   
   div .content{
      width : 80%;
 	  height : 300px;
	  margin-left : 60px;
   }
   
   #date{
   	  float : right;
   	  margin-right : 60px;
   }
   
   h3{
   	  margin-left : 60px;
   }
   
</style>
</head>
<body id="body">
<section> 
 	<%@ include file="/views/common/header.jsp" %>
 	<h1> 1:1 문의내역 </h1>
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="goMyPageMain()"> 
		&nbsp;&nbsp;&nbsp;
		
	<hr style="width: 100%; border: solid 0.3px black;">
 	
 	<div>
	<div id="date"> 
		<h4> 2020-11-05 </h4>
	</div>
	<br>
	<br>
	<div> 
		<h3 id="title" > <b>문의 제목 </b> </h3>
		<br>
	</div>
 	<div class="content">
		가슴이 설레는 말이다 청춘! 
		너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 
		끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 
		이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 
		얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 
		풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 
		이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 
		인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 
		청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 
		열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 
		오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지
 		</div>
 	 </div>
 	
 	<!-- DB구축 시 가지고 와야할 구문  -->
 	<%-- <div><%=q.getQcontent()</div>--%>
 	<div>
 	<div id="date"> 
		<h4> 2020-11-05 </h4>
	</div>
	<br>
	<div> 
 		<h3 id="commenttitle" > <b>문의 답변 </b> </h3>
		<br>
 	</div>
 	<div class="content">
 		가슴이 설레는 말이다 청춘! 
		너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 
		끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 
		이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 
		얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 
		풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 
		이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 
		인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 
		청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 
		열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 
		오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지
 	</div>
 	</div>
 	</section>
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>