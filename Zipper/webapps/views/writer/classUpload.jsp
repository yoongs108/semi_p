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

	/* 동영상 올리기 */
	#videoArea {
		width: 820px;
		height: 500px;
		border : 1px solid grey;
	}
	video {
		width : 100%;
		height : 100%;
	}
	#videoArea:hover {
		cursor: pointer;
		background-color: black;
		opacity: 50%;
	}
	
	/* 글쓰기폼 */
	.title{
		padding : 20px 20px 20px 10px;
		font-size : 15px;
	}
	
	textarea { 
		resize : none;
	}
	/* 버튼 스타일 */
	.btn {
		width: 100px;
		height: 50px;
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

	<%@ include file="/views/common/header.jsp"%>
	<section>
		<div style="border-bottom: 1px solid black;">
			<h2 id="title">CLASS UPLOAD</h2>
		</div>

		<form action="<%= request.getContextPath() %>/videoInsert.vi"
			method="post" enctype="multipart/form-data" style="margin: 50px">

			<table align="center">
	
				<!-- 파일 첨부 -->
				<tr>
					<td id="imgArea" colspan="4">

						<div id="videoArea">

							<video id="titleImg"></video>
							<div class="imgtext">
							</div>
							
						</div>
					</td>
				</tr>
				
				<!-- 제목 -->
				<tr>
					<td class="title" >클래스 명</td>
					<td>
						<input type=text name=title size=65
						placeholder="  제목을 입력해 주세요.">
					</td>
					
					<td class="title">클래스 선택</td>
					<td>
						<select id="subject">
	    				<option value="" selected="selected">Select CNO</option>
	  					</select>
					</td>
				</tr>
				<!-- 내용 -->
				<tr>
					<td class="title">클래스 소개</td>
					<td colspan="3">
						<textarea name = content cols=99 rows=7 placeholder="  클래스 소개를 입력해 주세요."></textarea>
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
						$('#classImg').click();
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