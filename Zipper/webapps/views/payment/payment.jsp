<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.classMain.model.vo.*, java.util.*"%>
    
    <% 	ArrayList<ClassList> cList = (ArrayList<ClassList>)request.getAttribute("cList");
		ArrayList<Teacher> tList = (ArrayList<Teacher>)request.getAttribute("tList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 및 결제</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">

	section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;      
   }
   
   #back{
		position : absolute;
		left : 950px;
		height : 80px;
		width: 80px;
		position:relative;
		top:-30px;
	}
	
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
	.top {
		position : absolute;

		height :170px; 
		width: 1024px;
		top: 40px;
	}
   	#title {
		text-align: center;
   		
   	}
	table {
		width : 700px; 
   }
   
   
	button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
	}
	
	.boxLine {
		width : 700px;
        border-bottom: 1px solid black;
		margin-top: 150px;
	}
	
	.class {
		text-align:left; 
		width : 700px; 
		height : 170px;
		clear :both;
	}
	
	.class>div {
		display: inline-block;
		float :left;
		margin-top: 20px;
	}
	
	.classImg {
		width : 150px; 
		height : 150px;
	}
	
	.classDescription {
		display: inline-block; 
		height: 150px; 
		border-left: 2px solid black;
		margin-left: 20px;
	}
	
	.classDescription>table {
		width : 500px;
		margin-left: 20px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section>
		<div class="top" style="border-bottom: 1px solid black;">
			<h2 id="title">수강신청 및 결제</h2>
			<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
				alt="class1" id="back" onclick="goClassDetail()"> 
		</div>
	<% for(ClassList classList : cList) { %>
	<div align="center">
		<div>
			<div class="boxLine">
				<h2>신청 내역</h2>
			</div>
			
			<div class="class">
				<div>
					<img class="classImg" src="../../resources/images/class/carouselImg/h.jpg" alt=""/>
				</div>
				
				<div class="classDescription">
					<table>
						<tr>
							<td><br />클래스 명</td>
							<td rowspan="2" style="vertical-align:bottom; text-align:right;"><h4>금액</h4></td>
						</tr>
						<tr>
							<td><span id="cName"><%= classList.getCname() %> </span>
							<br />
							<br /></td>
							
							<td></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td></td>
						</tr>
						<tr>
							<td>강사 명</td>
							<td style="vertical-align:top; text-align:right;"> <h4> <%= classList.getPrice() %>원</h4></td>
						</tr>
						<tr>
							<% for(Teacher teacher : tList) { %>
							<td><%= teacher.getTname() %></td>
							<td></td>
							<% } %>
						</tr>
					</table>
					
				</div>	
				
			</div>
			
		</div>
		
		<div>
			<div class="boxLine">
				<h2>회원 정보</h2>
			</div>
			
			<table style="height : 170px;">
				<tr>
					<td  width="200px;">
						<h4>닉네임</h4>
					</td>
					<td>
						<input type="text" size="20" name="userNick" id="userNick" class="form-control" value="<%= m.getMnick() %>">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<h4>연락처</h4>
					</td>
					<td>
						<input type="text" name="tel" id="tel" class="form-control" value="<%= m.getMcontact() %>">
					</td>
				</tr>
			
				<tr>
					<td>
						<h4>이메일</h4>
					</td>
					<td>
						<input type="text" size="20" name="userEmail" id="userEmail" class="form-control" value="<%= m.getMemail() %>">
					</td>
					<td>
						&nbsp;
						<select name="" id="" class="btn btn-default form-control" style="width : 130px; background : none;">
							<option value="@naver.com" >@naver.com</option>
							<option value="@daum.net" >@daum.net</option>
							<option value="@gmail.com" >@gmail.com</option>
						</select>
					</td>
				</tr>
			</table>
			
		</div>
	
		<div>
			<div class="boxLine">
				<h2>배송지</h2>
			</div>
			
			<table style="height : 300px;">
				
				<tr>
					<td width="200px;">
						<h4>받는분 </h4>
					</td>
					<td>
						<input type="text" size="20" name="name" id="name" class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<h4>연락처 </h4>
					</td>
					<td>
						<input type="text" name="tel" id="tel2" class="form-control" placeholder="010-0000-0000">
					</td>
				</tr>
				<tr>
					<td>
						<h4>주소 </h4>
					</td>
					<td>
						<input type="text" size="20" name="zipCode" id="zipCode" class="form-control" placeholder="우편번호">
					</td>
					<td>
						&nbsp;<button type="button" class="btn btn-default">주소검색</button>
					</td>
				</tr>
		
				<tr>
					<td></td>
					<td colspan="2">
						<input type="text" size="20" name="address" id="address1" class="form-control" placeholder="상세 주소">
					</td>
				</tr>
				
				<tr>
					<td>
						<h4>배송 메모 </h4>
					</td>
					<td colspan="2">
						<input type="text" size="20" name="messege" id="messege" class="form-control" placeholder="배송 전 연락 바랍니다.">
					</td>
				</tr>
				
				
			</table>
			
		</div>
		
		<div>
			<div class="boxLine">
				<h2>총 결제 금액</h2>
			</div>
			<table style="height : 150px;">
				<tr>
					<td>총 상품 금액</td>
					<td align="right" id="totalPrice"><%= classList.getPrice() %>원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td align="right">3000 원</td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><h2><%= classList.getPrice() + 3000 %>원</h2></td>
				</tr>
			</table>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<div>
			<hr />
			<input type="checkbox">&nbsp;&nbsp;결제 진행 필수사항 동의 <br />
			
			<!-- 아코디언 -->
			<p>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</p> <br /><br />
			
			<button style=" width : 700px; color : white;" id="payBtn">결제</button>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>
	<% } %>
	</section>
	
	<script>
		function goClassDetail() {
			location.href = "<%= request.getContextPath() %>/views/class/classDetail.jsp";
		};

		
		
		
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp62319910');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : $('#cName').text(), // 클래스 이름
					amount : parseInt($('#totalPrice').text()), // 결제 금액
					buyer_email : $('#userEmail').text(),
					buyer_name : $('#nick').text(), // 회원 닉네임
					buyer_tel : $('#tel2').text(),  // 주문자 연락처, 회원 연락처랑 별개
					buyer_addr : $('#address1').text(),
					buyer_postcode : $('#zipCode').text(),
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "/Zipper/insertPayment.pm", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								merchant_uid : rsp.merchant_uid,
								cName : rsp.name,
								price : rsp.paid_amount,
								name : rsp.buyer_name
							//기타 필요한 데이터가 있으면 추가 전달
							}
						});
						location.href="/Zipper/views/payment/paymentConfirm.jsp?cname="
								+$('#cName').text()
								+"&pay_method="+rsp.pay_method
								+"&name="+rsp.buyer_name 
								+"&date="+rsp.paid_at
								+"&price="+rsp.paid_amount;
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	
</body>
</html>