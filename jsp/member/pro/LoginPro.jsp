<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
<%@ include file = "../../dbconn.jsp" %>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String id = request.getParameter("id");
		String pw = request.getParameter("password");
        
        // DB에서 아이디, 비밀번호 확인
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Statement stmt = conn.createStatement();
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        
   
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            int x = -1;
 			String sql = "select password from jsp_member where id ='"+id+"';";
 			
 			rs = stmt.executeQuery(sql);
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
         // URL 및 로그인관련 전달 메시지
            String msg = "";
            
            if(x == 1)    // 로그인 성공
            { 
                // 세션에 현재 아이디 세팅
                session.setAttribute("sessionID", id);
                msg = "../../MainForm.jsp";
            }
            else if(x == 0) // 비밀번호가 틀릴경우
            {
                msg = "../view/LoginForm.jsp?msg=0";
            }
            else    // 아이디가 틀릴경우
            {
                msg = "../view/LoginForm.jsp?msg=-1";
            }
             
            // sendRedirect(String URL) : 해당 URL로 이동
            // URL뒤에 get방식 처럼 데이터를 전달가능
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
