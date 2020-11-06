<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>Zipper Guide</title>

<style>

#navi { 
    list-style-type: none; 
    height: 50px; 
    padding: 0; 
    margin: 0;
}

#navi li { 
    float: left; 
    position: relative; 
    padding: 0; 
    line-height: 40px; 
    
}

#navi li a { 
    display: block; 
    
    font-weight:600; 
    font-size:20px;
    padding: 10px 30px; 
    color:black;
    text-decoration: none; 
}

#navi li a:hover {
    color: lightskyblue; 
}

#navi li:hover ul {
    opacity: 1;
}

#navi li ul li {
    float: none;
    height: 0;
    line-height: 0;
    background: none;
}

#navi li:hover ul li {
    height: 30px; 
    line-height: 30px;
    padding:5px 0;
}

#navi li ul li a {
    background: #211b74;
    font-family:"굴림"; 
    font-weight:600; 
    font-size:14px;
    color:rgb(16, 240, 240); 
}


#navi li {
    transition : all 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#navi li a {
    transition: all 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#navi li ul {
    transition: all 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#navi li ul li {
    transition : height 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#guide1  {
    padding : 0px 35px 0px 0px;
}

#guide2  {
    padding : 0px 35px 0px 0px;
}

#guide3  {
    padding : 0px 35px 0px 0px;
}

#guide4  {
    padding : 0px 50px 0px 0px;
}

#guide5  {
    padding : 0px 35px 0px 0px;
}

#guide6  {
    padding : 0px 35px 0px 0px;
}

#guide7  {
    padding : 0px 35px 0px 0px;
}

#guide8  {
    padding : 0px 50px 0px 0px;
}

section {
    
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
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
  	
</style>
<script>
	function moveMain() {
		$(this).on('click', function() {
			location.href = "myPageMain.jsp";
		});
	}
	
</script>
</head>
<body>
<section>
	<%@ include file="/views/common/header.jsp" %>
		
	<div style="border-bottom: 1px solid black;">
	
		<div class="title">
		<h2 id="title">ZIPPER GUIDE</h2>
		
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="goGuideMain()"> 

		</div>
		

	</div>
	
	
	<!-- !PAGE CONTENT! -->
	
	
    
 	<!-- First Photo Grid--> 	
    	<div id="navi-top">
	
	<ul id="navi">

        <li>
            <a href="#"> 전체 </a>
        </li>

        <li>
            <a href="#"> 셀프 인테리어 </a>            
        </li>

        <li>
            <a href="#">리모델링</a>
        </li>
        
		<li>
            <a href="#">가구 쇼핑 가이드</a>
			
		</li>
	</ul>
	</div>
    <div class="w3-row-padding w3-padding-16 w3-center">
    
    <div class="w3-quarter" >
      <a href="#">  <!-- 수정 -->   
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior1.jpg" style="width:258px;height:388px;" id="guide1" >
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 1</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 1</span>
      <p>인테리어</p>
    </div>
    
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior2.jpg" style="width:258px;height:388px;" id="guide2">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 2</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 2</span>
      <p>인테리어</p>
    </div>
    
    
      <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior3.jpg" style="width:258px;height:388px;" id="guide3">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 3</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 3</span>
      <p>인테리어</p>
    </div>
    
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior4.jpg" style="width:258px;height:388px;" id="guide4">
      </a>
      <div class="bookmark">
      </div>
      <h3>인테리어 가이드 4</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 4</span>
      <p>인테리어</p>
    </div>  
  </div>
  
  <!-- 아래 문단-->
  
   <div class="w3-row-padding w3-padding-16 w3-center" id="guide">
   <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior5.jpg" style="width:258px;height:388px;" id="guide5">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 5</h3>
      <span>[가이드]</span>
      
      <p>인테리어</p>
    </div>  
    
    
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior6.jpg" style="width:258px;height:388px;" id="guide6">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 6</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 6</span>
      <p>인테리어</p>
    </div>
    
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior7.jpg" style="width:258px;height:388px;" id="guide7">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 7</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 7</span>
      <p>인테리어</p>
    </div>
    
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="<%= request.getContextPath() %>/resources/images/guide/main/interior8.jpg" style="width:258px;height:388px;" id="guide8">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 8</h3>
      <span>[가이드]</span>
      <span>인테리어 가이드 8</span>
      <p>인테리어</p>
    </div>	
    </div>
      <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  
 	<%@ include file="/views/common/footer.jsp" %>
 </div>	
 	</section>
</body>
</html>