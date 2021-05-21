<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 

<html>
<head>
	<title>회원가입 처리 JSP</title>
	
	
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
	
</head>
<body>

	<%@ include file = "../../dbconn.jsp" %>
	<%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
	<% 
		// 한글 깨짐을 방지하기 위한 인코딩 처리
		request.setCharacterEncoding("euc-kr"); 
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		int count = 0;
		
		Statement stmt = conn.createStatement(); // 쿼리 명령문
		
		
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
		<b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
		<br><br>
		<font color="blue"><%=name %></font>님 가입을 축하드립니다.
		<br><br>
		

		<table>
			<tr>
				<td id="title">아이디</td>
				<td><%=id %></td>
			</tr>		
			<tr>
				<td id="title">비밀번호</td>
				<td><%=pw %></td>
			</tr>		
			<tr>
				<td id="title">이름</td>
				<td><%=name %></td>
			</tr>		
		</table>
		
		<br>
		<input type="button" value="확인" onclick="goLoginForm()" />
		
	</div>
</body>
</html>