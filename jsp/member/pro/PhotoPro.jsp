<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
//<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.image.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    <script type="text/javascript">
    function goBack() {
			location.href="../../MainForm.jsp?contentPage=member/view/PhotoForm.jsp";
        }
		
	</script>
</head>
<body>

<%
	MultipartRequest multi = new MultipartRequest(request, "c:\\Upload", 
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String tmp;
	Enumeration params = multi.getParameterNames();
	tmp = (String) params.nextElement();
	String algo = multi.getParameter(tmp);
	tmp = (String) params.nextElement();
	String parameter = multi.getParameter(tmp);

	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	String filename = multi.getFilesystemName(tmp);
	
			
	int inW, inH,outW=0, outH=0;
	
	File inFp;
	FileInputStream inFs;
	inFp = new File("C:/Upload/" + filename);
	
	// 칼라 이미지 처리
	BufferedImage cImage = ImageIO.read(inFp);
	inW = cImage.getHeight();
	inH = cImage.getWidth();
	// (2) JSP에서 배열 처리
	int[][][]  inImage = new int[3][inH][inW]; // 메모리 할당
	// 파일 --> 메모리
	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			int rgb = cImage.getRGB(i,k);
			inImage[0][i][k] = (rgb >> 16) & 0xFF; // Red
			inImage[1][i][k] = (rgb >> 8) & 0xFF; // Green
			inImage[2][i][k] = (rgb ) & 0xFF; // Blue
		}
	}
	
	int[][][] outImage = null;
	switch (algo) {

	case "1" :   // 반전하기
		// 반전 알고리즘 :  out = 255 - in
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		for (int rgb=0; rgb<3; rgb++)
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					outImage[rgb][i][k] = 255 - inImage[rgb][i][k];
				}
		break;
	case "2" :   // 밝게하기
		// 더하기 알고리즘 :  out = in + 값  (주의!오버플로)
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		for (int rgb=0; rgb<3; rgb++)
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					int value = inImage[rgb][i][k] + Integer.parseInt(parameter);
					if (value > 255)
						 value = 255;
					if (value < 0)
						value = 0;
					outImage[rgb][i][k] = value;				
				}
		break;	
	}
	
	// (4) 결과를 파일로 쓰기
	File outFp;
	FileOutputStream outFs;
	String outFname = "out_" + filename ;
	outFp = new File("C:/Out/"+outFname);
	
	// 칼라 이미지 저장
	BufferedImage outCImage = new BufferedImage(outH, outW,
			BufferedImage.TYPE_INT_RGB);
	
	outFs = new FileOutputStream(outFp.getPath());
	// 메모리 --> 버퍼이미지
	for (int i=0; i<outH; i++) {
		for (int k=0; k<outW; k++) {
			int r = outImage[0][i][k];
			int g = outImage[1][i][k];
			int b = outImage[2][i][k];
			int px = 0;
			px = px | (r << 16);
			px = px | (g << 8);
			px = px | (b);		
			outCImage.setRGB(i,k,px);
		}
	}
	ImageIO.write(outCImage,"jpg", outFp);
	
	
	
	
%>
<%@ include file = "../../dbconn.jsp" %>
    <%
        // 세션에서 아이디를 가져와 MemberBean에 세팅한다.
        String id= (String)session.getAttribute("sessionID"); 
 
    	Statement stmt = conn.createStatement(); // 쿼리 명령문
    	
    	String sql = "update jsp_member set count = count +1  where id='"+id+"';";
        
    	stmt.executeUpdate(sql);
    	
    	sql = "select count from jsp_member where id='"+id+"';";
    	
    	ResultSet re = stmt.executeQuery(sql);
    	re.next();
    	String count = re.getString("count"); 
    	
    	
    	stmt.close();
    	conn.close();
    %>
<div id="wrap">
        <form name='fileForm' method='post' enctype='multipart/form-data'
   action='member/pro/PhotoPro.jsp'>
        
			<br><br>
		<b><font size="6" color="gray">영상처리</font></b>
		<br><br><br>
            
            <table>
            <td id="title">영상처리횟수</td>
                <td><b1><%=count %></b1></td>
		<tr>
		<td>

		</td>
		</tr>
            </table>
            
            <button type="button" onclick = "location.href='http://localhost:8080/photo_project/member/pro/download.jsp?file=<%=outFname %>'">다운로드</button>
            
            
            <input type="button" value="뒤로가기" onclick="goBack()">

        </form>
   
    </div> 

</body>
</html>