<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
    <title>�α��� ó�� JSP</title>
</head>
<body>
<%@ include file = "../../dbconn.jsp" %>
    <%
        // ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
        
        // �α��� ȭ�鿡 �Էµ� ���̵�� ��й�ȣ�� �����´�
        String id = request.getParameter("id");
		String pw = request.getParameter("password");
        
        // DB���� ���̵�, ��й�ȣ Ȯ��
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Statement stmt = conn.createStatement();
 
        String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
        
   
        try {
            // ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
            int x = -1;
 			String sql = "select password from jsp_member where id ='"+id+"';";
 			
 			rs = stmt.executeQuery(sql);
 
            if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
            {
                dbPW = rs.getString("password"); // ����� ������ �ִ´�.
 
                if (dbPW.equals(pw)) 
                    x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
                else                  
                    x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
                
            } else {
                x = -1; // �ش� ���̵� ���� ���
            }
         // URL �� �α��ΰ��� ���� �޽���
            String msg = "";
            
            if(x == 1)    // �α��� ����
            { 
                // ���ǿ� ���� ���̵� ����
                session.setAttribute("sessionID", id);
                msg = "../../MainForm.jsp";
            }
            else if(x == 0) // ��й�ȣ�� Ʋ�����
            {
                msg = "../view/LoginForm.jsp?msg=0";
            }
            else    // ���̵� Ʋ�����
            {
                msg = "../view/LoginForm.jsp?msg=-1";
            }
             
            // sendRedirect(String URL) : �ش� URL�� �̵�
            // URL�ڿ� get��� ó�� �����͸� ���ް���
            response.sendRedirect(msg);
 
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    






    	
        
    %>
</body>
</html>
