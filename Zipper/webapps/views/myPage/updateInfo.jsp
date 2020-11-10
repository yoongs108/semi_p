<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

<!-- 다음주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	tr>td>h5 {
		color : red;
	}
</style>

</head>
<body>

<%@ include file="../common/header.jsp" %>

<section>
	<h1 align="center">회원 정보 수정</h1>
	<hr />
	<br /><br />
	<form action="<%= request.getContextPath() %>/mUpdate.me" id="updateForm"
		  method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td colspan="4" align="center">
					<img id="profileImgPre" width="200" height="200" src="<%= request.getContextPath() %>/resources/images/profile/<%= m.getProfile() %>"/>
				</td>
			</tr>
			<tr>
				<td style="width : 150px;">
					<h4>아이디</h4>
				</td>
				<td style="width : 150px;">
					&nbsp;<h4><%= m.getMid() %></h4>
				</td>
				<td style="width : 90px;">
				</td>
				<td style="width : 110px;">
				</td>
			</tr>
			<tr>
				<td>
					<h4>비밀번호</h4>
				</td>
				<td>
					<input type="password" size="20" name="userPwd_join" id="userPwd_join" class="form-control" placeholder="비밀번호" required="required" onkeyup="validate(this)">
				</td>
				<td colspan="2">
					<h5></h5>
				</td>
			</tr>
			<tr>
				<td>
					<h4>비밀번호 확인</h4>
				</td>
				<td>
					<input type="password" size="20" name="userPwd2" id="userPwd2" class="form-control" placeholder="비밀번호 확인" onkeyup="chkPwd()" required="required">
				</td>
				<td colspan="2">
					<h5></h5>
				</td>
			</tr>
			<tr>
				<td>
					<h4>닉네임</h4>
				</td>
				<td>
					&nbsp;<h4><%= m.getMnick() %></h4>
				</td>
			</tr>
			<tr>
				<td >
					<h4>연락처</h4>
				</td>
				<td>
					<input type="text" name="tel" id="tel" class="form-control" placeholder="010-0000-0000" onkeyup="validate(this)" value="<%= m.getMcontact() %>">
				</td>
				<td colspan="2">
					<h5></h5>
				</td>
			</tr>
			<tr>
				<td rowspan="3">
					<h4>주소</h4>
				</td>
				<td>
					<input type="text" size="20" name="zipCode" id="zipCode" class="form-control" placeholder="우편번호">
				</td>
				<td>
					&nbsp;<button type="button" class="btn btn-default" onclick="addrSearch();">주소검색</button>
				</td>
			</tr>
			<tr>
				
				<td colspan="2">
					<input type="text" size="20" name="address1" id="address1" class="form-control" placeholder="주소">
				</td>
			</tr>
			<tr>
				
				<td colspan="2">
					<input type="text" size="20" name="address2" id="address2" class="form-control" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td>
					<h4>이메일</h4>
				</td>
				<td>
					&nbsp;<h4><%= m.getMemail() %></h4>					
				</td>
			</tr>
			<tr>
				<td>
					<h4>한줄 소개</h4>
				</td>
				<td colspan="2">
					<textarea class="form-control" name="intro" id="" cols="30" rows="10" style="resize: none;"><%= m.getIntro() %></textarea>
				</td>
			</tr>
		</table>
		<br />
		<div style="text-align: center;">
		<button type="button" class="btn btn-default" onclick="updateMember()">정보수정</button> &nbsp;&nbsp;
		<button type="button" class="btn btn-default" onclick="cancelUpdate()">수정취소</button> &nbsp;&nbsp;
		<button type="button" class="btn btn-default" onclick="deleteMember()">회원탈퇴</button>
		</div>
		<div class="fileArea" id="fileArea">
      		<input type="file" id="profileImg"
      				name="profileImg1" onchange="loadImg(this);" />
      				
      	</div>
	</form>
		<br />
		<br />
		<br />
</section>
<script>
	$(function(){
		/* 주소 넣기 */
		var addressArr = '<%= m.getAddress() %>'.split(', ');
		
		$('#zipCode').val(addressArr[0]);
		$('#address1').val(addressArr[1]);
		$('#address2').val(addressArr[2]);
		
		// 프로필 영역 클릭 시 파일 등록 실행
		$('#profileImgPre').click(function(){
			$('#profileImg').click();
		});
		
		$('#profileImg').hide(); // 파일 등록 태그 숨김
	});
	
	/* 사진 파일 등록 시 이미지 로드 */
	function loadImg(img){
		if(img.files && img.files[0]) {
			
			var reader = new FileReader();
			
			reader.onload = function(e){
				
				$('#profileImgPre').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(img.files[0]);
		}
	}
	
	/* 수정취소 */
	function cancelUpdate() {
		if(confirm("마이페이지로 돌아가시겠습니까?")){
			location.href='<%= request.getContextPath() %>/views/myPage/myPageMain.jsp';			
		}
	}
	
	/* 회원탈퇴 */
	function deleteMember() {
		if(confirm("회원탈퇴 하시겠습니까?")){
			location.href = "<%= request.getContextPath() %>/mDelete.me?mid=<%=m.getMid()%>";
		}
	}
	
	/* 정보수정 */
	function updateMember() {
		validate('#userPwd_join');
		validate('#tel');
		chkPwd();
		
		if($('td>h5').text() != ''){
			return false;
		}
		if(confirm("수정하시겠습니까?")){
			$("#updateForm").submit();
		}
	}
	
	$("#updateForm").submit(function(event){
		if($("#userPwd_join").val() == "" ) alert("비밀번호는 필수 값입니다.");
		else if($('#userPwd_join').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
		else return;
		event.preventDefault();
	});

	/* 유효성체크 */
	function validate(obj){
	
		var validate = ''; // 정규식
		var valiMessage = ''; // 유효성 체크 메새지
		
		var inputValue = $(obj).val(); // 입력 값
		var valiText = $(obj).parent().parent().find('h5'); // 유효성 메세지 보여줄 태그
		
		switch($(obj).attr('id')) {
		case 'userPwd_join':
			validate = /^[A-Za-z0-9_-]{4,18}$/;
			valiMessage = '영문대소문자+숫자 4~18자리';
			break;
		case 'tel':
			validate = /^\d{2,3}-\d{3,4}-\d{4}$/;
			valiMessage = '전화번호 양식을 확인해주세요';
			break;	
		}
		
		// 유효성 체크
		if(validate.test(inputValue)){
			valiText.text('');
		} else {
			valiText.text(valiMessage);
		}
	}
	
	/* 비밀번호 확인 */
	function chkPwd() {
		var pwd1 = $('#userPwd_join').val();
		var pwd2 = $('#userPwd2').val();
		var pwd2Message = $('#userPwd2').parent().parent().find('h5');
		
		if(!(pwd1 == pwd2)) {
			pwd2Message.text('비밀번호가 다릅니다.');
		} else {
			pwd2Message.text('');
		}
	}
	
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
</body>
</html>