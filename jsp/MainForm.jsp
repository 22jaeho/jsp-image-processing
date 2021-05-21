<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="FirstView.jsp";
%>
<html>
<head>
    <title>���� ȭ��</title>
    
    <style>
        /* 
        ���̾ƿ� ��ü ��� ���� �±�  
        - margin:0 auto 0 auto;(�ð�������� ��, ������, �Ʒ�, ����)
        ����, ������ �ٱ������� auto�� �ָ� �߾������� �ȴ�. 
        
        ��ü�� �����ִ� �±� #wrap 
        */
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        
        #header {
            text-align: center;
            width: 800px;
            height:50px;
            background-color: #92FFFF;
            padding: 30px 0px;
        }
        
        #main {
            float: left;
            width: 800px;
            height: 500px;
            background-color: #FFCA6C;
            text-align:center;
            vertical-align: middle;
        }
        
    </style>
    
</head>
<body>
 
    <div id="wrap">
        <div id="header">
            <jsp:include page="Header.jsp" />
        </div>
        <div id="main">
            <jsp:include page="<%=contentPage%>" />
        </div>
    </div>
    
</body>
</html>


