<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 및 결제</title>
<style type="text/css">

	button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
	}
	
	.boxLine {
		width : 700px;
        border-bottom: 2px solid black;
		margin: 20px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div align="center">
		<div>
			<div class="boxLine">
				<h2>신청 내역</h2>
			</div>
			
			<div style=" text-align:left; width : 700px; height : 170px;">
				<div style="display: inline-block;">
					<img src="../../resources/images/class/carouselImg/h.jpg" alt="" width="150px" height="150px"/>
				</div>
				
				<div style="display: inline-block; width: 150px; height: 150px; border-left: 1px solid black;">
					분위기 끝판왕 행거 만들기
				</div>	
			</div>
			
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div>
			<div class="boxLine">
				<h2>회원 정보</h2>
			</div>
			
			<table style=" width : 700px; height : 170px;">
				<tr>
					<td>
						<h4>이름</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input type="text" size="20" name="userName" id="userName" class="form-control" placeholder="">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<h4>연락처</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input type="text" name="tel" id="tel" class="form-control" placeholder="010-0000-0000">
					</td>
				</tr>
			
				<tr>
					<td>
						<h4>이메일</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input type="text" size="20" name="email" id="email" class="form-control" placeholder="이메일">
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
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div>
			<div class="boxLine">
				<h2>배송지</h2>
			</div>
			
			<table style=" width : 700px; height : 300px;">
				
				<tr>
					<td>
						<h4>받는분 </h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input type="text" size="20" name="userName" id="userName" class="form-control">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<h4>연락처 </h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input type="text" name="tel" id="tel" class="form-control" placeholder="010-0000-0000">
					</td>
				</tr>
				<tr>
					<td>
						<h4>주소 </h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<input type="text" size="20" name="address" id="address1" class="form-control" placeholder="주소">
					</td>
					<td>
						&nbsp;&nbsp;<button type="button" class="btn btn-default">주소검색</button>
					</td>
				</tr>
		
				<tr>
					<td></td>
					<td colspan="2">
						<input type="text" size="20" name="address" id="address2" class="form-control" placeholder="주소">
					</td>
				</tr>
				
				<tr>
					<td>
						<h4>배송 메모 </h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<input type="text" size="20" name="address" id="address2" class="form-control" placeholder="배송 전 연락 바랍니다.">
					</td>
				</tr>
				
				
			</table>
			
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div>
			<div class="boxLine">
				<h2>총 결제 금액</h2>
			</div>
			<table style=" width : 700px; height : 150px;">
				<tr>
					<td>총 상품 금액</td>
					<td align="right">원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td align="right">원</td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><h2>원</h2></td>
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
			
			<button style=" width : 700px;" onclick="">결제</button>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>
	
	
	
	
	
	
	<%@ include file="/views/common/footer.jsp"%>
	
</body>
</html>