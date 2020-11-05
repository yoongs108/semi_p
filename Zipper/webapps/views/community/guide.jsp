<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
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

<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}  <!--폰트 수정해야함 -->
.w3-bar-block .w3-bar-item {padding:20px}


</style>

</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
 	<h1 id="title">ZIPPER GUIDE</h1>
 	<br />
		
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
	
	<hr>
	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-content w3-padding" style="max-width:1800px;margin-top:50px">
	
    
 	<!-- First Photo Grid--> 	
    <div class="w3-row-padding w3-padding-16 w3-center" id="guide">
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="../../resources/guide/main/interior1.jpg" style="width:258px;height:388px;">
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
      <img src="../../resources/guide/main/interior2.jpg" style="width:258px;height:388px;">
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
      <img src="../../resources/guide/main/interior3.jpg" style="width:258px;height:388px;">
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
      <img src="../../resources/guide/main/interior4.jpg" style="width:258px;height:388px;">
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
      <img src="../../resources/guide/main/interior5.jpg" style="width:258px;height:388px;">
      </a>
      <div class="bookmark">     
      </div>
      <h3>인테리어 가이드 5</h3>
      <span>[가이드]</span>
      
      <p>인테리어</p>
    </div>  
    
    
    <div class="w3-quarter">
      <a href="#">  <!-- 수정 -->
      <img src="../../resources/guide/main/interior6.jpg" style="width:258px;height:388px;">
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
      <img src="../../resources/guide/main/interior7.jpg" style="width:258px;height:388px;">
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
      <img src="../../resources/guide/main/interior8.jpg" style="width:258px;height:388px;">
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
  </div>
    
    
    	
		
	
 	
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>