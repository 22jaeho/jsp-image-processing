<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
    <title>���� �������� ���ȭ��</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="MainForm.jsp";
            }else if(val == "0"){
                location.href="MainForm.jsp?contentPage=member/view/ModifyForm.jsp";
            }else if(val == "1"){
                location.href="MainForm.jsp?contentPage=member/view/DeleteForm.jsp";
            }
        }
        
    </script>
    
</head>
<body>
<%@ include file = "../../dbconn.jsp" %>
    <%
        String id = session.getAttribute("sessionID").toString();
        // ���ǿ� ����� ���̵� �����ͼ�
        // �� ���̵� �ش��ϴ� ȸ�������� �����´�.
		
		Statement stmt = conn.createStatement(); // ���� ��ɹ�
		
		String sql = "select * from jsp_member where id = '"+id+"';";	
		ResultSet re = stmt.executeQuery(sql);
			
		re.next();
			String pw = re.getString("password");
			String name = re.getString("name");
			String count = re.getString("count");
		
		
		stmt.close();
		conn.close();
    %>
 
        <br><br>
        <b><font size="6" color="gray">�� ����</font></b>
        <br><br><br>
                        <!-- ������ ȸ�������� ����Ѵ�. -->
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=id %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%=pw %></td>
            </tr>
                    
            <tr>
                <td id="title">�̸�</td>
                <td><%=id %></td>
            </tr>
            <tr>
                <td id="title">����ó�� Ƚ��</td>
                <td><%=count %></td>
            </tr>
                    
          
        </table>
        
        <br>
        
        <input type="button" value="��й�ȣ ����" onclick="changeForm(0)">
        <input type="button" value="ȸ��Ż��" onclick="changeForm(1)">
        <input type="button" value="���" onclick="changeForm(-1)">
</body>
</html>

