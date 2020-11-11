<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
<title>1 : 1 문의 글쓰기</title>
<style type="text/css">
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}

	/*웹 제목 스타일*/
	#title {
		text-align: center;
	}
	
	.table2 tr,
	.table2 td {
		padding: 20px 0 20px 5px ;
		font-weight: bold;
		border-bottom: 1px solid black;
	}
	.table2 tr>td {
		width : 300px;
	}
	
	.btn{
		width : 100px;
		height : 50px;
		color : white;
		background-color : black;
		border : none;	
	}
	
	.btn:hover{
		background-color: #555;
		cursor: pointer;
	}
	textarea { 
		resize : none;
	}
</style>
<script>
	function back() {
		$(this).on('click', function() {
			location.href="<%= request.getContextPath() %>/helpfaq.fq";
		});
	}
</script>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section>
		<div style="border-bottom : 1px solid black;">
		<h2 id="title">FAQ 작성</h2>
		</div>
		
		<div id="textarea" align = "center">
		
			<form method = "post" action = "<%=request.getContextPath()%>/insertFaq.fq?mno=<%= m.getMno() %>">
			
               			<table class = "table2" style="padding-top:10px; width : 85%;">
               				<tr>
        						<br />
               					<div>
               						<input type="radio" name="faqtype" id="" value="1" checked/> 클래스
               						&nbsp;&nbsp;&nbsp;&nbsp;
               						<input type="radio" name="faqtype" id="" value="2"/> 결제
               						&nbsp;&nbsp;&nbsp;&nbsp;
               						<input type="radio" name="faqtype" id="" value="3"/> 배송
               						&nbsp;&nbsp;&nbsp;&nbsp;
               						<input type="radio" name="faqtype" id="" value="4"/> 환불
               						&nbsp;&nbsp;&nbsp;&nbsp;
               						<input type="radio" name="faqtype" id="" value="5"/> 글쓰기
               					</div>               					
               				</tr>
	                        <tr >
	                        	<td style="padding: 10px;">Q. </td>
	                        	<td>
	                        		<input type ="text" name ="title" 
	                        			size="100" placeholder ="  제목을 입력해 주세요.">
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<td colspan="2">
	                        		<textarea name = "content" cols="105" rows="15" placeholder=" 내용을 입력해 주세요 "></textarea>
	                        	</td>
	                        </tr>
                        </table>

        	<div align="center" style="margin-top:50px;margin-bottom:80px;">
			<input type="submit" value="작성" class="btn" id="btn"> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="back();" class="btn" >취소</button>
			</div>
        </form>
		</div>
		
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>