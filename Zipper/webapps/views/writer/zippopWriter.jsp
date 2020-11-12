<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>ZIPPOP 글쓰기</title>
<style>
	/* 페이지 공통 스타일*/
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}
	#title{
		text-align : center;
	}
	/* 사진 올리기 */
	#imgArea{
		padding-right : 70px;
	}
	#titleImgArea {
		width:330px;
		height:330px;
		border:1px solid darkgray;
	}
	img{
		width:100%;
		height:100%;
	}
	#titleImgArea:hover{
		cursor: pointer;
		background-color : black;
		opacity: 60%;
	}
	.imgtext{
		color : white;
		text-align : center;
		margin-top : 40%;
		font-size : 18px;
	}
	/* 글쓰기폼 */
	#textarea{
		border-left : 2px solid black;
		padding-left : 70px;
		resize : none;
	}
	/* 버튼 스타일 */
	#btn{
		width : 100px;
		height : 50px;
		color : white;
		background-color : black;
		border : none;	
	}
	#btn:hover{
		background-color: #555;
		cursor: pointer;
	}
	
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
	<section>
		<div style="border-bottom : 1px solid black;">
		<h2 id="title">ZIP POP</h2>
		</div>
		
		<form action="<%= request.getContextPath() %>/zippopInsert.zp"
			  method="post" enctype="multipart/form-data" style ="margin : 50px">
			  
			<table align="center">
			
				<tr id = "outer">
				
					<td id="imgArea">
					
						<div id="titleImgArea">
						
							<img id="titleImg" />
				
							<div class="imgtext">
							클릭해서 사진올리기
							</div>
							
						</div>
					</td>
					<td id="textarea">
						<textarea name = content cols=45 rows=16
								placeholder = "뭐든 원하는대로 자유롭게 적어주세요 :)"></textarea>
					</td>
				</tr>
			</table>
			
			<div class="fileArea" id="fileArea">
				<input type="file" name="zippopImg" id="zippopImg" onchange="loadImg(this);" />
			</div>
			
			<div align="center" style="margin-top:70px; margin-bottom:80px;">
			<button type="submit" id="btn">작성</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="back();" id="btn1">취소</button>
			</div>
        		
       		<script>
       			

				function back() {
						history.go(-1);
				}
				
				// 사진 미리보기 기능
				$(function(){
					$('#titleImgArea').click(function(){
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