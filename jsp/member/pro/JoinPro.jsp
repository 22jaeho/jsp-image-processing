<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 

<html>
<head>
	<title>ȸ������ ó�� JSP</title>
	
	
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
	
</head>
<body>

	<%@ include file = "../../dbconn.jsp" %>
	<%-- JoinForm.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. --%>
	<% 
		// �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		int count = 0;
		
		Statement stmt = conn.createStatement(); // ���� ��ɹ�
		
		
		String sql = "insert into jsp_member(id, password, name, count)";
		sql += "values ('" + id + "', '" + pw+ "', '";
		sql += name + "', "+count+");";

		//out.println(sql);

	 	stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
		
	%>
	
	<script type="text/javascript">
		function goLoginForm() {
			location.href="../view/LoginForm.jsp";
	    }
	</script>
	<div id="wrap">
		<br><br>
		<b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
		<br><br>
		<font color="blue"><%=name %></font>�� ������ ���ϵ帳�ϴ�.
		<br><br>
		

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
				<td><%=name %></td>
			</tr>		
		</table>
		
		<br>
		<input type="button" value="Ȯ��" onclick="goLoginForm()" />
		
	</div>
</body>
</html>