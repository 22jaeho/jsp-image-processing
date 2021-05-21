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
 
    <title>회원정보 수정화면</title>
    
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
  
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        // 취소 
        function goBack(){
        	location.href="MainForm.jsp?contentPage=member/view/UserInfoForm.jsp"
        }
        
    </script>
    
</head>
<body onload="init()">
 
        <br><br>
		<b><font size="6" color="gray">비밀번호 변경</font></b>
		<br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="MainForm.jsp?contentPage=member/pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td id="title"><%=id %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=""%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
       
            <br><br>
            <input type="submit" value="수정">
            <input type="button" value="취소" onclick="goBack()">
              
        </form>
        
</body>
</html>


