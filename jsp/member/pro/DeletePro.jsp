<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<html>
<head>
    <title>ȸ�� ���� ó��</title>
</head>
<body>
<%@ include file="../../dbconn.jsp" %>
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = request.getParameter("password");
     	// ���ǿ��� ���̵�, DeleteForm.jsp���� �Է¹��� ��й�ȣ�� �����´�.
        // ������ ����� ������ ȸ�������� �����Ѵ�. - ��������� ��ȯ
        Statement stmt = conn.createStatement();
        
        String sql = "select password from jsp_member where id= '"+id+"';";
	      
		ResultSet re = stmt.executeQuery(sql);

		re.next();
		String pwCheck = re.getString("password"); 
		
		int check = 1;
		if(pw.equals(pwCheck)){
			
			sql = "delete from jsp_member where id='"+id+"';";
			stmt.executeUpdate(sql);
			
			session.invalidate(); // �����ߴٸ� ���������� �����Ѵ�.
			
            
	%>
		        <br><br>
		        <b><font size="4" color="gray">ȸ�������� �����Ǿ����ϴ�.</font></b>
		        <br><br><br>
		    
		        <input type="button" value="Ȯ��" onclick="javascript:window.location='MainForm.jsp'">
		    
	<%    
		}        
         // ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
        else{
    %>
        <script>
            alert("��й�ȣ�� ���� �ʽ��ϴ�.");
            history.go(-1);
        </script>
    <%
        } 
        
    %>
</body>
</html>


