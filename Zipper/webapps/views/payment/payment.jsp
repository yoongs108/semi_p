<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.classMain.model.vo.*, java.util.*"%>
    
    <% 	ClassList classList = (ClassList)request.getAttribute("clist");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 및 결제</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 다음주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
	<div align="center">
		<div>
			<div class="boxLine">
				<h2>신청 내역</h2>
			</div>
			
			<div class="class">
				<div>
					<img class="classImg" src="<%= request.getContextPath() %>/resources/images/fileUpload/<%= classList.getFileNewName()%>" alt=""/>
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
							<td><%= classList.getTname() %></td> 
							<td></td>
							
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
						<input type="text" size="20" name="userNick" id="userNick" class="form-control" value="<%= m.getMnick() %>" disabled>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<h4>연락처</h4>
					</td>
					<td>
						<input type="text" name="tel" id="tel" class="form-control" value="<%= m.getMcontact() %>" disabled>
					</td>
				</tr>
			
				<tr>
					<td>
						<h4>이메일</h4>
					</td>
					<td>
						<input type="text" size="20" name="userEmail" id="userEmail" class="form-control" value="<%= m.getMemail() %>" disabled>
					</td>
					<td>
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
						<input type="text" name="tel" id="tel2" class="form-control" placeholder="010-0000-0000" value="<%= m.getMcontact() %>">
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
						&nbsp;<button type="button" class="btn btn-default" onclick="addrSearch()">주소검색</button>
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
					<td align="right"><h2><%= classList.getPrice() %>원</h2></td>
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
			<input type="checkbox" id="checkbox">&nbsp;&nbsp;<label for="checkbox">결제 진행 필수사항 동의 </label><br />
			
			<!-- 아코디언 -->
			<p>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</p> <%--<img src="<%= request.getContextPath() %>/resources/images/common/downArrow.png" width="15px" height="7.5px" class="accordion" onclick="accordion_hide(this)"/> --%>				
			 <br />
			<div class="ac">
				개인정보 제 3자 제공
				<%--<img src="<%= request.getContextPath() %>/resources/images/common/downArrow.png" width="15px" height="7.5px" class="accordion" onclick="accordion_hide(this)"/> --%>				
	        	<p class="accordion_hide"> 개인정보 제 3자 제공 내역</p>
			
				개인정보 수집 및 이용
				<%--<img src="<%= request.getContextPath() %>/resources/images/common/downArrow.png" width="15px" height="7.5px" class="accordion" onclick="accordion_hide(this)"/> --%>				
	        	<p class="accordion_hide"> 개인정보 수집 및 이용 내역</p>
				
	        	결제대행 서비스 이용약관
				<%--<img src="<%= request.getContextPath() %>/resources/images/common/downArrow.png" width="15px" height="7.5px" class="accordion" onclick="accordion_hide(this)"/> --%>				
	        	<p class="accordion_hide"> 결제대행 서비스 이용약관 내역</p>
	        	
	    	</div>
			
			
			
			<button style=" width : 700px; color : white;" id="payBtn">결제</button>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>

	</section>
	
	<script>
		function goClassDetail() {
			location.href = "<%= request.getContextPath() %>/views/class/classDetail.jsp";
		};

		/* 주소 넣기 */
		$(function(){
			var addressArr = '<%= m.getAddress() %>'.split(', ');
			
			<% if(m.getAddress() != null) { %>
			$('#zipCode').val(addressArr[0]);
			$('#address1').val(addressArr[1]+addressArr[2]);
			<% } %>
			
		});
		
		
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp62319910');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			if(!$('#checkbox').prop('checked')){
				alert('약관 동의 후 이용해 주세요');
				return false;
			}
				IMP.request_pay({
					pg : 'kakaopay', // 결제정보 추가(임시)
					pay_methide : 'card', // 임시 추가
				    merchant_uid : new Date().getTime() + '.zip',
					name : $('#cName').text(), // 클래스 이름
					amount : parseInt($('#totalPrice').text()), // 결제 금액
					buyer_email : $('#userEmail').val(),
					buyer_name : $('#name').val(), // 회원 닉네임
					buyer_tel : $('#tel2').val(),  // 주문자 연락처, 회원 연락처랑 별개
					buyer_addr : $('#address1').val(),
					buyer_postcode : $('#zipCode').val(),
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "<%= request.getContextPath() %>/insertPayment.pm", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								pno : rsp.merchant_uid,
								mno : <%= m.getMno() %>,
								cno : <%= classList.getCno() %>,
								payinfo : rsp.buyer_name + ', ' + rsp.buyer_tel + ', ' +  $('#messege').val(),
								price : rsp.paid_amount
								
							//기타 필요한 데이터가 있으면 추가 전달
							}, success : function(data) {
								if(data == 1){
									// 추가 성공
								location.href="<%= request.getContextPath() %>/views/payment/paymentConfirm.jsp?cname="
									+$('#cName').text()
									+"&pay_method="+rsp.pay_method
									+"&name="+rsp.buyer_name 
									+"&date="+rsp.paid_at
									+"&price="+rsp.paid_amount;
								} else {
									// 추가 실패
									alert("결제정보 저장 실패");
								}
							
								
							}, error : function() {
								alert("결제정보 저장 실패");
							}
						
						});
						
						
						
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
		
		// 참조 API : http://postcode.map.daum.net/guide
		function addrSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
	                
	                $('#address1').val(fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $('#address2').focus();
	            }
	        }).open();
	    };
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	
</body>
</html>