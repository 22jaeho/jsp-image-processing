<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>ȸ������ ȭ��</title>
	
	<!-- css ���� �и� -->
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>

	<script type="text/javascript">
	
		// �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
		function checkValue()
		{
			if(!document.userInfo.id.value){
				alert("���̵� �Է��ϼ���.");
				return false;
			}
			
			if(!document.userInfo.password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			
			// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
				alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
				return false;
			}
			
			
		}
		function checkId(){
			var id = document.getElementById("id").value;
			if(id == "gg"){
				alert("�ߺ�");
			}
			else{
				alert("��밡��")
			}
				
		}
		function goMain() {
			location.href="../../MainForm.jsp";
        }
		
	</script>
	
</head>
<body>

	<div id="wrap">
		<br><br>
		<b><font size="6" color="gray">ȸ������</font></b>
		<br><br><br>
	
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
		<form method="post" action="../pro/JoinPro.jsp" name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td>
						<input type="text" name="id" maxlength="50">				
					</td>
				</tr>
						
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="password" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸�</td>
					<td>
						<input type="text" name="name" maxlength="50">
					</td>
				</tr>
					
				
			</table>
			<br>
			<input type="submit" value="����"/>  
			<input type="button" value="���" onclick="goMain()" />
		</form>
	</div>
	
	
</body>
</html>