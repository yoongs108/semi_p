<%@page import="com.zipper.board.model.vo.Attachment"%>
<%@page import="com.zipper.classMain.model.vo.ClassList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.classMain.model.vo.*" %>
    <%
    ClassList cl = (ClassList)request.getAttribute("cl");
    Attachment at = (Attachment)request.getAttribute("at");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>CLASS UPDATE</title>
<style>
	
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}
	
	.writeBox {
		width: 700px;
		margin-top: 50px;
	}
	
	.imgBox {
		width:260px;
		height:220px;
		border:1px solid black;
		display: inline-block;
	}
	
	.imgBox:hover{
		cursor: pointer;
		background-color : black;
		
	}
	
	.input {
		text-align: right;
	
	}
		
	img{
		width:100%;
		height:100%;
	}
	
	
	
	/* ---------------------------------- */
	
	
	button {
		position: relative;
		margin-top: 600px;
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
		cursor: pointer;
	}
	
	
	
	
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
	<section>
		<div class="titleBox" style="border-bottom: 1px solid black;">
			<h2 id="title" align="center">CLASS</h2>
		</div>
		
		<form action="<%= request.getContextPath() %>/Update.cl" method="post" enctype="multipart/form-data">
			 <table class="writeBox" align="center"> 
				<tr>
					<td>
						<div class="imgBox">
							<img class="titleImg" value="<%= at.get()%>"/>
						</div>
					</td>
					
					<td>
						<div class="input">
							클래스 이름 : <input size="50" name="cname" value="<%= cl.getCno()%>"></input> <br />
							<br /><br />
							강사 명 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input size="50" name="tname" value="<%= cl.getTname()%>"></input> <br />
							<br /><br />
							키트 항목 : &nbsp;&nbsp;&nbsp;<input size="50" name="kdetail" value="<%= cl.getKdetail()%>"></input> <br />
							<br /><br />
							가 격 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input size="50" name="price" value="<%= cl.getPrice()%>"placeholder="단위 제외하고 숫자만 표기"></input> <br />
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<br /><br />
						클래스 소개 : <br />
						<textarea name = cintro cols=100 rows=5 value="<%= cl.getCintro()%>"></textarea>
				 	</td>
				 	<td></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<br />
						커리큘럼 : <br />
						<textarea name = course cols=100 rows=5 value="<%= cl.getCourse()%>"></textarea>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br /><br />
						<button style="color: white;" type="submit" id="upload">작성</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button style="color: white;" onclick="cancel();" id="cancle">취소</button>
					</td>
					<td></td>
				</tr>
				
			</table>
				
				
				
				<div class="fileArea" id="fileArea">
					<input type="file" name="selectImg" id="selectImg" onchange="loadImg(this);" />
				</div>
				
				
				
		
        			
       		<script>

       			function cancel() {
						location.href = "<%= request.getContextPath() %>/class/classDetail.jsp";
				};
				
				// 사진 미리보기 기능
				$(function(){
					$('.imgBox').click(function(){
						$('#selectImg').click();
					});
					$('#fileArea').hide();
				});
			
				
				// 사진 db로 보내기
				function loadImg(img){
					if(img.files && img.files[0]) {
						
						var reader = new FileReader();
						
						reader.onload = function(e){
							
							$('.titleImg').attr('src', e.target.result);
						}
					}
					reader.readAsDataURL(img.files[0]);
				}

			</script>
		</form>
	</section>
</body>
</html>