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
	
	#selectDiv button:focus {
		outline: none;
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

	.active, .accordion:hover {
  		background-color: #ccc;
	}

	.panel {
  		padding: 0 18px;
  		background-color: white;
  		max-height: 0;
  		overflow: hidden;
  		transition: max-height 0.2s ease-out;
	}
	
	.accordion:after {
  		content: '\02795'; /* Unicode character for "plus" sign (+) */
  		font-size: 13px;
  		color: #777;
  		float: right;
  		margin-left: 5px;
	}
	
	#selectDetail>div{
		align: center;
		margin-left: 60px;
		margin-right: 60px;
	}
	
	#selectDetail>div>div{
		align: center;
		background: rgb(245,245,245);
	}
	
	#btnImg {
		width: 25px;
		height: 25px;
		background: white;
	}
	
	.accordion_hide {
		height : 0;
		overflow : hidden;
	}
	
</style>
<script>
	function fnMove(seq) {
    	var offset = $(".tabcontent" + (seq + 1)).offset();
    	var winH = $(".tabcontent" + (seq+1)).height();
    	$('html, body').animate({scrollTop : (offset.top - winH*1.8)}, 400);
	};
	
	function accordion_hide(obj) {
		console.log(obj);
		$(obj).parent().find('p').toggleClass('accordion_hide');
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
 		<button onclick="fnMove(1)">클래스</button>
 		<button onclick="fnMove(2)">결제</button>
 		<button onclick="fnMove(3)">test3</button>
 		<button onclick="fnMove(4)">test4</button>
 		<button onclick="fnMove(5)">test5</button>
 	</div>
 	<hr />

 	<!-- 하단 내용영역 (아코디언방식 사용)  / (CSS 작업 필요)-->
 	<div id="selectDetail">
 		<div class='tabcontent1'>
 			<h3>클래스</h3>
			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Section 1</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 2</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 3</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 4</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div> 
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 5</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent2'>
 			<h3>결제</h3>
 			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Section 1</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 2</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 3</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 4</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div> 
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 5</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent3'>
 			<h3>test3</h3>
 			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Section 1</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 2</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 3</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 4</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div> 
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 5</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent4'>
 			<h3>test4</h3>
 			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Section 1</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 2</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 3</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 4</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div> 
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 5</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent5'>
 			<h3>test5</h3>
 			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Section 1</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 2</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 3</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 4</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div> 
			<div>
				<button class="accordion" onclick="accordion_hide(this)">Section 5</button>
				<p class="accordion_hide">국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다. 국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.</p>
			</div>
			<br /><br /><br />
 		</div>
 		<div class="tabcontent6"></div>
 	</div>
 	
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>