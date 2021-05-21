<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
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
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
		
		Statement stmt = conn.createStatement(); // 쿼리 명령문
		
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
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
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
                <td><%=id %></td>
            </tr>
            <tr>
                <td id="title">영상처리 횟수</td>
                <td><%=count %></td>
            </tr>
                    
          
        </table>
        
        <br>
        
        <input type="button" value="비밀번호 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
        <input type="button" value="취소" onclick="changeForm(-1)">
</body>
</html>

