<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
    <head>
    <script>
		function goImage(){
			location.href="MainForm.jsp?contentPage=member/view/PhotoForm.jsp";
			
		}    
    </script>
        <title>ùȭ��</title>
    </head>
    <body>        
    <%
        if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
        { 
    %>
            <br><br><br>
            <b><font size="6" color="gray">����ó�� ���񽺸� �̿��Ͻ÷��� �α������ּ���</font></b>
            <br><br><br>
            
            <br><br>    
    <%
        }
        else // �α��� ���� ���
        {
    %>
            <br><br><br>
            <font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
            <font size=6>�� ȯ���մϴ�.</font>
            <br><br><br>
            <button id="goProcessing" class="btn btn-primary" onclick = "goImage()">����ó��</button>
    <%    } %>
    </body>
</html>


