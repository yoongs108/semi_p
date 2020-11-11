<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
<title> 공지사항 작성 </title>
<style type="text/css">
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}
	.table2 {
		margin-top: 25px;
	}
	/*웹 제목 스타일*/
	#title {
		text-align: center;
	}
	
	/* 제목과 작성일 */
	.table2 tr,
	.table2 td {
	
		padding: 25px 0 20px 5px ;
		font-weight: bold;
		border-bottom: 1px solid black;
	}
	
	input[name=title]{
		width : 500px;
	}
	input[name=date]{
		width : 100px;
	}
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
	
	textarea { 
		resize : none;
	}
	

</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
		<!-- 회원등급이 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 		<% if(m != null && m.getMgrd().equals("A")){ %> 
	<section>
		<div style="border-bottom : 1px solid black;">
		<h2 id="title"> 공지사항 </h2>
		</div>
		
		<div id="textarea" align = "center">
		
			<form action="<%=request.getContextPath()%>/nInsert.no" method="post">
					<div class = "table2" >
               			<table style="padding-top:10px; width : 85%;">
               			  
	                        <tr>
	                        	<td style="padding-left: 20px;" name="title">제목</td>
	                        	<td>
	                        		<input type = text name = title 
	                        			size=100 placeholder ="  제목을 입력해 주세요.">
	                        	</td>
	                        	<td>
	                        		작성일 
									<input type="text" readonly="readonly" name="date" id="date">
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<td colspan="3">
	                        		<textarea name = content cols=105 rows=15></textarea>
	                        	</td>
	                        </tr>
                        </table>
					</div>
        	<div align="center" style="margin-top:50px;margin-bottom:80px;">
			<input type="submit" value="작성" id="btn"> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" onclick="location.href = '<%= request.getContextPath() %>/selectList.no?'" id="btn" value="취소"> 
			</div>
        		
        		<script>
					 // 현재시간
					window.onload = function(){
					//var date1 = new Date();
					//let today = new date();
		         	//document.write(today)
		         	//date.innerHTML += date + "<br>";
		           // div3.innerHTML += date1 + "<br>";
		           //.toISOString().substr(0, 10).replace('T', ' ');
						//var st_date = new Date().toISOString().substr(0, 10).replace('T', ' ');
						//alert(st_date);
						var today = new Date();
						var dd = today.getDate();
						var mm = today.getMonth()+1; //January is 0!
						var yyyy = today.getFullYear();
						if(dd<10) {
  						   dd='0'+dd
						} 
						if(mm<10) {
						   mm='0'+mm
						} 
						today = yyyy+'-' + mm+'-'+dd;
						$('#date').val(today);
					 }
				</script>
        </form>
        
		</div>
		<% } else {
		request.setAttribute("msg", "관계자 외에 접근이 불가능한 페이지입니다.");
		request.getRequestDispatcher("view/common/errorPage.jsp").forward(request, response);
		} %>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>