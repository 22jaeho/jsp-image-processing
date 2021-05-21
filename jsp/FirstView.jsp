<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
    <head>
    <script>
		function goImage(){
			location.href="MainForm.jsp?contentPage=member/view/PhotoForm.jsp";
			
		}    
    </script>
        <title>첫화면</title>
    </head>
    <body>        
    <%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { 
    %>
            <br><br><br>
            <b><font size="6" color="gray">영상처리 서비스를 이용하시려면 로그인해주세요</font></b>
            <br><br><br>
            
            <br><br>    
    <%
        }
        else // 로그인 했을 경우
        {
    %>
            <br><br><br>
            <font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
            <font size=6>님 환영합니다.</font>
            <br><br><br>
            <button id="goProcessing" class="btn btn-primary" onclick = "goImage()">영상처리</button>
    <%    } %>
    </body>
</html>


