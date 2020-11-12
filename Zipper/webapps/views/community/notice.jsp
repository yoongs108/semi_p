<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>공지사항</title>
<style>

   section h1{
        padding-left : 30px;
   }
   
   section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
   }
   
   #listArea{
      width : 100%;
      height : 100%;
      margin : 50px 50px;
   }
   
   section table tr{
      height:40px; 
      font-size : 17px;
   }
   
   .date{
      text-align : center;
   }

   section th {
      color : black;
      padding-right :10px;
      width: 2%;
   }
   
   #adminwrite{
      position : relative;
      float: right;
      top : -40px;
      width : 80px;
      height : 30px;
      color : white;
      background-color : black;
      border : none;   
   }
   #adminwrite:hover{
      background-color: #555;
      cursor: pointer;
   }
</style>
</head>
<body id="body">

    <%@ include file="/views/common/header.jsp" %>

<section> 
    <h1> NOTICE </h1>
    <div>
         <!-- 회원등급이 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
       <% if(m != null && m.getMgrd().equals("A")){ %> 
            <button id="adminwrite" onclick="location.href='views/community/noticeInsertForm.jsp'"> 작성하기 </button>
      <% } %>
    </div>
   	<hr style="width: 100%; border: solid 0.3px black;">
    <br>
    
    
       <form action>
          <table id="listArea"">
          
         <!-- 공지사항 리스트  -->
             <% if(list.size()==0){ %>
                <tr>
                   <td colspan="3"> 글이 존재하지 않습니다. </td>
                </tr>
             <%
                }else {
                  for (Board b : list) {
               %>
               <tr>
                  <input type="hidden" value="<%=b.getBno()%>">
                  <input type="hidden" value="<%=b.getBtype()%>">
                  <th> > </th>
                  <td class="titleName" name="title" width="80%"> <%=b.getBtitle()%></td>
                  <td name="date" width="20%"><%=b.getBdate()%></td>
               </tr>
            <%
                  }
               }
            %>
   
          </table>
       </form>
    
 
    
       <!-- Pagination -->
     
	<div style="text-align : center;">
		<button class="w3-bar-item w3-button w3-hover-black"
       			onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button class="w3-bar-item w3-button" disabled><</button>
		<% } else { %>
		<button class="w3-bar-item w3-button w3-hover-black"
				onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%=currentPage - 1 %>'"><</button>
		<% } %>
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){	
		%>
			<button class="w3-bar-item w3-button" disabled><%= p %></button>
		<%      }else{ %>
			<button class="w3-bar-item w3-button w3-hover-black"
					onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%= p %>'"><%= p %></button>
		<%      } %>
		<% } %>
         
        <%  if(currentPage >= maxPage){  %>
		<button class="w3-bar-item w3-button" disabled>></button>
		<%  }else{ %>
		<button class="w3-bar-item w3-button w3-hover-black" 
				onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%=currentPage + 1 %>'">></button>
		<%  } %>
		<button class="w3-bar-item w3-button w3-hover-black"
				onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%= maxPage %>'">>></button>
	</div>
   
    <script>
    // 게시글 선택 시 주는 효과 + 상세 페이지 연결 
    $(function(){
      $('section').find('tr').mouseenter(function(){
         $(this).css({"background" : "#CCC", "opacity" : "1.0", "transition" : "0.4s"});

      }).mouseout(function(){
         $(this).css({"background" : "none"});
      }).click(function(){
         var bno = $(this).find('input').eq(0).val(); // tr안에 있는 input태그의 hidden을 의미
         console.log("bno"+bno);
         location.href = "<%= request.getContextPath() %>/selectOne.no?bno="+bno;
      });
   });
    </script>

    

    <br>
    <br>
    <br>
    <br>
 </section>
 
    <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>