<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</head>
<body>
<div id="wrap">
        <form name='fileForm' method='post' enctype='multipart/form-data' action='member/pro/PhotoPro.jsp'>
        
		<br><br>
		<b><font size="6" color="gray">����ó��</font></b>
		<br><br><br>
            
            <table>
		<tr>
		<td bgcolor="skyblue">�̹���</td>
		<td bgcolor="skyblue"><input type='file' name='filename'></td>
	
		</tr>
                <tr>
                <td bgcolor="skyblue">����ó��</td>
                    <td><select name="algo">
		<option value="0"> --- ���� ---</option>
		<option value="1">����ó��</option>
		<option value="2">����ϱ�</option>		
		</select></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">��</td>
                    <td><input type="text" value="0" name="parameter"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="ó���ϱ�" >
        </form>
   
    </div>   

</body>
</html>