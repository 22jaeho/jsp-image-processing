<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<html>
<head>
    <title>회원정보 수정처리</title>
</head>
<body>
<%@ include file = "../../dbconn.jsp" %>
    <%
        
        String id= (String)session.getAttribute("sessionID"); 
	    String pw = request.getParameter("password");
		String name = request.getParameter("name");
 
    	Statement stmt = conn.createStatement(); // 쿼리 명령문
    	
    	String sql = "update jsp_member set password='"+pw+"' where id='"+id+"';";
        
    	stmt.executeUpdate(sql);
    	stmt.close();
    	conn.close();
    %>
    
    <br><br>
    <font size="5" color="gray">비밀번호가 변경되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="javascript:window.location='MainForm.jsp'"/>
    
</body>
</html>


