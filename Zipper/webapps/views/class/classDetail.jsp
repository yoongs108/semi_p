<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.classMain.model.vo.*, java.util.*" %>
    
<% 	ArrayList<ClassList> cList = (ArrayList<ClassList>)request.getAttribute("cList");
	ArrayList<VIDEO> vList = (ArrayList<VIDEO>)request.getAttribute("kList");
	ArrayList<Kit> kList = (ArrayList<Kit>)request.getAttribute("kList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세보기</title>

<style type="text/css">

	section {
		width: 1024px;
      	margin-left: auto;
      	margin-right: auto;
      	position: relative;
      	top: 30px;
   }
   
   
	#back {
		position : absolute;
		left : 950px;
		height : 80px;
		width: 80px;
		position:relative;
		top: -70px;		
	}
	
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
	#title {
		margin-top: 100px;
		text-align: center;
	}
	.top {
		height :170px;
		position: fixed; 
		width: 1024px;
		top: 30px;
	}
  
	.left_page {
		display: inline-block;
		margin-top: 100px;
	
	}
	.right_page {
		position: fixed;
		display: inline-block;
		rigth: 30%;
		margin-left: 20px; 
		margin-top: 100px;
		 
	}
 	.ac a {
        display: block;
        color : black;
        text-decoration: none;
        margin: 0;
		padding: 10px;
		border-radius: 5px;
	}
        
	
    .accordion {
    	cursor: pointer;
    }
    
    .accordion_hide {
		height : 0;
		overflow : hidden;
	}
        
	.pay { /* 왜안먹히고 난리야 */
		 height: 75px;
		 position: fixed;
		
	}
	
	button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
		cursor: pointer;
	}
	
	.tabcontent_wrap {
		border: 2px solid black;
		width: 650px;
	}
	
	.tabcontent_wrap p {
		margin-bottom : 30px;
	}
	.page_wrap {
		paddig-top: 100px;
	}


</style>

</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<section>
		<div class="top" style=" top: 100; background-color: white; border-bottom: 1px solid black;">
			<h2 id="title">CLASS</h2>
			<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
				alt="class1" id="back" onclick="goClass()"> 
		</div>
		<% for(ClassList classList : cList) { %>
		<div class="page_wrap">
			<div class="left_page">
			
				<div><img src="../../resources/images/class/carouselImg/h.jpg" alt="" width="650px" height="500px"/></div>
				
				<h3><%= classList.getCname() %></h3>
				<div>
			 		<button style="color : white;" onclick="fnMove(1)">클래스 소개</button>
			 		<button style="color : white;" onclick="fnMove(2)">커리큘럼</button>
			 		<button style="color : white;" onclick="fnMove(3)">키트 소개</button>
			 		<button style="color : white;" onclick="fnMove(4)">환불 정책</button>
		 		</div>
		 		
		 		
		 	 	<div class="tabcontent_wrap">
			 		<div class='tabcontent1'>
			 			<h3>클래스 소개</h3>
						<p><%= classList.getCintro() %></p>
			 		</div>
			 		<div class='tabcontent2'>
						<h3>커리큘럼</h3>
						<p><%= classList.getCourse() %></p>
			 		</div>
			 		
			 		<% for(Kit kit : kList) { %>
			 		<div class='tabcontent3'>
			 			<h3>키트 소개</h3>
						<p><%= kit.getKdetail() %></p>
			 		</div> 
			 		<% } %>
			 		
			 		<div class='tabcontent4'>
			 			<h3>환불 정책</h3>
			 			<p>청춘의 싸인 돋고, 맺어, 이상의 할지니, 때까지 끓는 피가 약동하다. 아름답고 천지는 온갖 품으며, 꽃이 오직 그들은 사막이다. 있음으로써 튼튼하며, 이상이 인생에 사람은 그들의 구할 같으며, 것이다. 그들에게 청춘에서만 있는 반짝이는 사막이다. 고동을 이상이 없으면 관현악이며, 있는가? 그림자는 열락의 같이 우리의 작고 인생의 바로 가지에 아니다. 바이며, 보내는 눈에 피고, 품고 눈이 우리는 있으랴?</p>
						
						<div class='tabcontent5'></div>
		 			</div>
		 			
	 			</div>
	 			
			</div>
		
		
			<div class="right_page">
		
				<h3><%= classList.getCname() %></h3> <br /><br />
				<table>
					<tr>
						<% for(VIDEO video : vList) { %>
						<td width="200px">클래스 </td>
						<td><%= video.getVprice() %> 원</td>
						<% } %>
					</tr>
					
					<tr>
						<td width="300px">
							<div class="ac">
					        	키트
					        	<img src="../../resources/images/common/downArrow.png" width="15px" height="7.5px" class="accordion" onclick="accordion_hide(this)"/>
					        	<p class="accordion_hide"></p>
					    	</div>
						</td>
						<% for(Kit kit : kList) { %>
						<td style="vertical-align:top"><%= kit.getKprice() %> 원</td>
						<% } %>
					</tr>
				</table>
				
				<div class="pay">
					<table>
					<tr>
						<td width="200px" height="400px">결제금액 </br> <h1><%= classList.getPrice() %>원</h1> </td>
						<td><br />
							<button style="color : white;" onclick="goPayment();">결제</button>
							<img src="../../resources/images/common/bookmark.png" width="50px" height="50px" onclick="" alt="" />
						</td>
					</tr>
					</table>
				</div>
				
			</div>
		</div>
		<% } %>
		
	</section>
	<br />
	<br />
	<br />
	<%@ include file="/views/common/footer.jsp"%>



	<script>
		function goPayment() {
			location.href = "<%= request.getContextPath() %>/payment.pm";
		};
		
		function goClass() {
			location.href = "<%= request.getContextPath() %>/views/class/class.jsp";
		};
		
		function fnMove(seq) {
	    	var offset = $(".tabcontent" + (seq + 1)).offset();
	    	var winH = $(".tabcontent" + (seq+1)).height();
	    	$('html, body').animate({scrollTop : (offset.top - winH*1.5)}, 400);
		};
		
		document.getElementsByClassName('accordian');

		function accordion_hide(obj) {
			$(obj).parent().find('p').toggleClass('accordion_hide');
		};
		
	</script>
	
</body>
</html>