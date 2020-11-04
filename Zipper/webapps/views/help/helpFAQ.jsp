<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
	#searchDiv {
		width: 40%;
		border: 1px solid black;
		height: 30px;
		position: relative;
		left: 30%;		
		margin-top: 100px;
	}
	
	#searchTool, #searchBtn {
		border: 0px;
	}
	
	#searchTool:focus, #searchBtn:focus {
		outline: none;
	}
	
	#searchBtn {
		margin-right: 50px;
	}
	
	#selectDiv button:hover {
		background-color: #ccc;
	}
	
	#selectDiv button {
		border:0px;
		width: 90px;
		height: 90px;
		margin-left: 30px;
		margin-right: 30px;
		margin-top: 140px;
		margin-bottom: 100px;
	}
	
	.accordion {
  		background-color: #eee;
  		color: #444;
  		cursor: pointer;
  		padding: 18px;
  		width: 100%;
  		text-align: left;
  		border: none;
  		outline: none;
  		transition: 0.4s;
	}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
	.active, .accordion:hover {
  		background-color: #ccc;
	}

/* Style the accordion panel. Note: hidden by default */
	.panel {
  		padding: 0 18px;
  		background-color: white;
  		display: none;
  		overflow: hidden;
	}
	
	#selectDetail {
		
		
	}
	
	#btnImg {
		width: 25px;
		height: 25px;
		background: white;
	}

</style>
<script>
	function fnMove(seq) {
    	var offset = $(".tabcontent" + seq).offset();
    	var winH = $(".tabcontent" + seq).height();
    	$('html, body').animate({scrollTop : (offset.top - winH*1.8)}, 400);
	};

	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    /* Toggle between adding and removing the "active" class,
	    to highlight the button that controls the panel */
	    this.classList.toggle("active");

	    /* Toggle between hiding and showing the active panel */
	    var panel = this.nextElementSibling;
	    if (panel.style.display === "block") {
	      panel.style.display = "none";
	    } else {
	      panel.style.display = "block";
	    }
	  });
	}
</script>
</head>
<body>
 	<%@ include file="/views/common/header.jsp" %>
 	
 	<h1 align="center">FAQ page</h1>
 	
 	<!-- 검색 영역  / (CSS 작업 필요, 링크 연결용 코드 필요) -->
 	<div align="center" id="searchDiv">
 		<button id="searchBtn"><img src="../../resources/images/magnifier_icon.png" alt="검색" id="btnImg" /></button>
 		<input type="text" name="" id="searchTool" placeholder="무엇을 검색하시겠습니까?"/>
 	</div>
 	
 	<!-- 버튼 5개 영역  / (CSS 작업 필요)-->
 	<div class="selectDiv" id="selectDiv" align="center">
 		<button>클래스</button>
 		<button>결제</button>
 		<button>test3</button>
 		<button>test4</button>
 		<button>test5</button>
 	</div>
 	<hr />

 	<!-- 하단 내용영역 (아코디언방식 사용)  / (CSS 작업 필요)-->
 	<div class="selectDiv detail" id="selectDetail">
 		<div onclick="fnMove('1')">
 			<button class="accordion">Section 1</button>
			<div class="panel">
 				<p>Lorem ipsum...</p>
			</div>
			
			<button class="accordion">Section 2</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>

			<button class="accordion">Section 3</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>
 		</div> <hr />
 		<div onclick="fnMove('2')">
 			<button class="accordion">Section 1</button>
			<div class="panel">
 				<p>Lorem ipsum...</p>
			</div>
			
			<button class="accordion">Section 2</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>

			<button class="accordion">Section 3</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>
 		</div> <hr />
 		<div onclick="fnMove('3')">
 			<button class="accordion">Section 1</button>
			<div class="panel">
 				<p>Lorem ipsum...</p>
			</div>
			
			<button class="accordion">Section 2</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>

			<button class="accordion">Section 3</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>
 		</div> <hr />
 		<div onclick="fnMove('4')">
 			<button class="accordion">Section 1</button>
			<div class="panel">
 				<p>Lorem ipsum...</p>
			</div>
			
			<button class="accordion">Section 2</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>

			<button class="accordion">Section 3</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>
 		</div> <hr />
 		<div onclick="fnMove('5')">
 			<button class="accordion">Section 1</button>
			<div class="panel">
 				<p>Lorem ipsum...</p>
			</div>
			
			<button class="accordion">Section 2</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>

			<button class="accordion">Section 3</button>
			<div class="panel">
				<p>Lorem ipsum...</p>
			</div>
 		</div>
 	</div>
 	
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>