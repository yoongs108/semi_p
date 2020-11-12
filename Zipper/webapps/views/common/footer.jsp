<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

	footer {
		position : relative;
		bottom : 0;
		width : 100%;
		background : black;
		color : white;
		text-align : center;
		height : 200px;
	}
	#top{
		height : 35px;
		width : 35px;
		align : center;
		margin-top : 2px;
		position: inherit;
	}
	.totop{
		text-decoration: none;
		color : white;
		font-weight: bold;
		font-size: 15px;
	}
	.totop:hover{
		cursor : pointer;
		transform: scale(1.2);
		text-decoration: none;
		color : white;
	}
	#copy { 
	font-size: 15px;
	}
	
	
</style>
</head>
<body>
	<footer>
	<section>	
			<br />
			<a href="#logo" class="totop"> 
				<img src="<%= request.getContextPath() %>/resources/images/common/up.png" id="top"class="totop" /> 
				<br />
				GO TO TOP
				<br />
			</a>
		
		<br />
		<p id="copy">&copy; &nbsp;&nbsp; Copyright&nbsp;&nbsp;2020&nbsp;&nbsp;352&nbsp;&nbsp;ZIPPER&nbsp;&nbsp;|
		  &nbsp;&nbsp;joinful&nbsp;&nbsp;contents&nbsp;&nbsp;|&nbsp;&nbsp;Love&nbsp;&nbsp;your&nbsp;&nbsp;self&nbsp;:)</p>
		<p>contact us&nbsp;&nbsp;|&nbsp;&nbsp;010 - 8282 - 1828&nbsp;&nbsp;|&nbsp;&nbsp;da_zippop_28 @ example.com</p>
	</section>	
	</footer>
</body>
</html>