<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<%@ include file = "../../dbconn.jsp" %>
    <%
        String id = session.getAttribute("sessionID").toString();
    
	    Statement stmt = conn.createStatement();
	    
	    String sql = "select * from jsp_member where = '"+id+"';";
	
	    /*
		ResultSet re = stmt.executeQuery(sql);
		
	
		while(re.next()){
			String pw = re.getString("password");
			String n = re.getString("name"); 
		}
		*/
    %>
 
    <title>ȸ������ ����ȭ��</title>
    
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
    
        function init(){
            setComboValue("<%=id%>");
        }
  
        
        // ��й�ȣ �Է¿��� üũ
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
        }
        // ��� 
        function goBack(){
        	location.href="MainForm.jsp?contentPage=member/view/UserInfoForm.jsp"
        }
        
    </script>
    
</head>
<body onload="init()">
 
        <br><br>
		<b><font size="6" color="gray">��й�ȣ ����</font></b>
		<br><br><br>
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ��� -->
        <form method="post" action="MainForm.jsp?contentPage=member/pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td id="title"><%=id %></td>
                </tr>
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=""%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
       
            <br><br>
            <input type="submit" value="����">
            <input type="button" value="���" onclick="goBack()">
              
        </form>
        
</body>
</html>


