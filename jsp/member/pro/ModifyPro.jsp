<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<html>
<head>
    <title>ȸ������ ����ó��</title>
</head>
<body>
<%@ include file = "../../dbconn.jsp" %>
    <%
        
        String id= (String)session.getAttribute("sessionID"); 
	    String pw = request.getParameter("password");
		String name = request.getParameter("name");
 
    	Statement stmt = conn.createStatement(); // ���� ��ɹ�
    	
    	String sql = "update jsp_member set password='"+pw+"' where id='"+id+"';";
        
    	stmt.executeUpdate(sql);
    	stmt.close();
    	conn.close();
    %>
    
    <br><br>
    <font size="5" color="gray">��й�ȣ�� ����Ǿ����ϴ�.</font>
    <br><br>
    <input type="button" value="��������" onclick="javascript:window.location='MainForm.jsp'"/>
    
</body>
</html>


