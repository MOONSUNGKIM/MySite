<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js">
</script>
<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){            
            var title = $("#title").val();
            var content = $("#content").val();
            var id = $("#id").val();
            if(title == ""){
                alert("���� �Է���");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("�����Է���");
                document.form1.content.focus();
                return;
            }
            if(id == ""){
                alert("�̸��Է���");
                document.form1.writer.focus();
                return;
            }            
            document.form1.submit();
        });
    });
</script>
</head>
<body>
<h2>�Խñ� �ۼ�</h2>
<form name="form1" method="post" action="${pageContext.servletContext.contextPath}/board/insert">
    <div>
        ����
        <input name="title" id="title" size="80" placeholder="������ �Է���">
    </div>
    <div>
        ����
        <textarea name="content" id="content" rows="13" cols="80" placeholder="������ �Է����ּ���"></textarea>
    </div>
    <div>
     �ۼ��� 
        <input name="id" id="id" placeholder="�ۼ��� ���̵� ">
    </div>
    <div style="width:650px; text-align: center;">
        <button type="button" id="btnSave">Ȯ��</button>
        <button type="reset">���</button>
    </div>
</form>
</body>
</html>