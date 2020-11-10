<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>CLASS 업로드 글쓰기</title>
<style>
	/* 페이지 공통 스타일*/
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}
	
	#title {
		text-align: center;
	}

	
	/* 사진 올리기 */
	#imgArea {
		padding-right: 70px;
	}
	
	#videoArea {
		width: 80%;
		height: 50%;
		border: 1px solid darkgray;
	}
	
	video {
		width: 100%;
		height: 100%;
	}
	
/* 	.imgtext {
		color: white;
		font-size: 18px;
		top: 50%;
		left: 50%;
		text-align: center;
		margin-top: -180px;
		display: none;
	} */
	
	#videoArea:hover {
		cursor: pointer;
		background-color: black;
		opacity: 60%;
	}
	
/* 	#titleImgArea:hover .imgtext {
		display: inherit;
	} */
	
	/* 글쓰기폼 */
	#textarea {
		border-left: 2px solid black;
		padding-left: 70px;
		resize: none;
	}
	/* 버튼 스타일 */
	.btn {
		width: 80px;
		height: 30px;
		color: white;
		background-color: black;
		border: none;
	}
	
	.btn:hover {
		background-color: grey;
		cursor: pointer;
	}
</style>
</head>
<body>
<!-- 이거 아직 미완성이니까 기다려~어허 기다려~ -->
	<%@ include file="/views/common/header.jsp"%>
	<section>
		<div style="border-bottom: 1px solid black;">
			<h2 id="title">CLASS UPLOAD</h2>
		</div>

		<form action="<%= request.getContextPath() %>/classInsert.cl"
			method="post" enctype="multipart/form-data" style="margin: 50px">

			<table align="center">

				<tr id="outer">

					<td id="imgArea" colspan="2">

						<div id="videoArea">

							<img id="titleImg" />

							<div class="imgtext">
								<p>클릭해서 클래스 올리기</p>
							</div>
							
						</div>
					</td>
				</tr>
	
				<!-- 제목 -->
				<tr>
					<td>
					<td style="padding: 10px;">클래스 : </td>
						<td>
						<input type=text name=title size=100
						placeholder="  제목을 입력해 주세요.">
						</td>
				</tr>
			</table>

			<div class="fileArea" id="fileArea">
				<input type="file" name="classImg" id="classImg"
					onchange="loadImg(this);" />
			</div>

			<div align="center" style="margin-top: 70px; margin-bottom: 80px;">
				<button type="submit" class="btn">작성</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button onclick="history.go(-1)" class="btn">취소</button>
			</div>

			<script>
				
				// 사진 미리보기 기능
				$(function(){
					$('#videoArea').click(function(){
						$('#zippopImg').click();
					});
					$('#fileArea').hide();
				});
			
				
				// 사진 db로 보내기
				function loadImg(img){
					if(img.files && img.files[0]) {
						
						var reader = new FileReader();
						
						reader.onload = function(e){
							
							$('#titleImg').attr('src', e.target.result);
						}
					}
					reader.readAsDataURL(img.files[0]);
				}
				
			</script>
		</form>
	</section>

</body>
</html>