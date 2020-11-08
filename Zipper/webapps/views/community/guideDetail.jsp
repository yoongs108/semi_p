<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>

<title>Guide 상세페이지</title>
<style>
* {
  box-sizing: border-box;
}



/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media screen and (max-width: 900px) {
  .column {
    width: 50%;
  }
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}


.title{
		height : 30px;
	}

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
</style>

<script>
	function moveGuideMain() {
		$(this).on('click', function() {
			location.href = "guide.jsp";
		});
	}	
</script>


</head>
<body>
<section>
<%@ include file="/views/common/header.jsp" %>

<div style="border-bottom: 1px solid black;">
	
		<div class="title">
		<h2 id="title">GUIDE 상세페이지</h2>
		
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="goMyPageMain()"> 

		</div>
		</div>
		
		
		<div class="content">
  <img src="<%= request.getContextPath() %>/resources/images/guide/detail/detail1.jpg" alt="detail1" style="width:100%;height:50%">
  <h3>Some Other Work</h3>
  <p>
  이 밤 그날의 반딧불을 
당신의 창 가까이 보낼게요
음 사랑한다는 말이에요

나 우리의 첫 입맞춤을 떠올려
그럼 언제든 눈을 감고 
음 가장 먼 곳으로 가요

난 파도가 머물던 
모래 위에 적힌 글씨처럼
그대가 멀리 
사라져 버릴 것 같아 
늘 그리워 그리워

여기 내 마음속에 
모든 말을 
다 꺼내어 줄 순 없지만
사랑한다는 말이에요 </p>
<p>
어떻게 나에게 
그대란 행운이 온 걸까
지금 우리 함께 있다면 
아 얼마나 좋을까요

난 파도가 머물던 
모래 위에 적힌 글씨처럼
그대가 멀리 
사라져 버릴 것 같아
또 그리워 더 그리워

나의 일기장 안에
모든 말을 
다 꺼내어 줄 순 없지만
사랑한다는 말

이 밤 그날의 반딧불을 
당신의
창 가까이 띄울게요
음 좋은 꿈 이길 바라요
  </p>
  
  
</div>
		




<%@ include file="/views/common/footer.jsp" %>



</section>
</body>
</html>