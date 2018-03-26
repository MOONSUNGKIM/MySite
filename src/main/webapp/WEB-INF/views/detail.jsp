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
    	
        listReply(); // ��� ��� ȣ��        
        
        // ����ۼ���ư
        $("#btnReply").click(function(){        	
            var content=$("#content").val();
            var b_no="${vo.no}"
            var param="content="+content+"&b_no="+b_no;            
            $.ajax({
                type: "post",
                url: "${pageContext.servletContext.contextPath}/reply/insert",
                data: param,
                success: function(result){
                    alert("����� ��ϵǾ���.");
                    listReply();
                },
              error : function(request, status, error) {            	  
                    //alert("insert�����߻�");
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              }
            });
        });
            
        
        $("#btnDelete").click(function(){
            if(confirm("�����ҷ� ?")){
                document.form1.action = "${pageContext.servletContext.contextPath}/board/delete";
                document.form1.submit();
            }
        });
        
        $("#btnUpdete").click(function(){            
            var id = $("#id").val();
            var content = $("#content").val();
            var writer = $("#id").val();
            if(title == ""){
                alert("������ �Է���");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("���� �Է���");
                document.form1.content.focus();
                return;
            }
            if(id == ""){
                alert("id �Է���");
                document.form1.writer.focus();
                return;
            }
            if(confirm("�����ҰŴ�?")){
            document.form1.action="${pageContext.servletContext.contextPath}/board/update"
            // ���� �Է��� �����͸� ������ ����
            document.form1.submit();
            }
        });
        
        $("#btnlist").click(function(){       
        	if(confirm("��ϰ���?")){
                document.form1.action = "${pageContext.servletContext.contextPath}/board/list";
                document.form1.submit();
        	}
        });

    });
           
    
    // ��� ���
    function listReply(){
        $.ajax({
            type: "get",
            url: "${pageContext.servletContext.contextPath}/reply/list/${vo.no}",
            success: function(result){
            // responseText�� result�� �����.
            alert("listReply�� ��� ");
                $("#listReply").html(result); //������
            },
            error : function(xhr, status, error) {
                alert("�����߻�");
            }
        });
    }
    
    
    
</script>
</head>
<body>
<h2>�Խñ� ����</h2>
<form name="form1" method="post">
        �ۼ��� : ${vo.timestamp}                   
    <div>
        ��ȸ�� : ${vo.hit}
    </div>
    <div>
        ����
        <input name="title" id="title" size="80" value="${vo.title}" placeholder="������ �Է����ּ���">
    </div>
    <div>
        ����
        <textarea name="content" id="content" rows="4" cols="80" placeholder="������ �Է����ּ���">${vo.content}</textarea>
    </div>
    <div>
        ���̵�
        <input name="id" id="id" value="${vo.id}" placeholder="id �Է����ּ���">
    </div>
    <div style="width:650px; text-align: center;">
        <!-- �Խù���ȣ�� hidden-->
        <input type="hidden" name="no" value="${vo.no}">
        
        <button type="button" id="btnUpdete">����</button>
        <button type="button" id="btnDelete">����</button>
        <button type="button" id="btnlist">���</button>
    </div>
</form>

  <div style="width:650px; text-align: center;">
        <br>
        <!-- �α��� �� ȸ�����Ը� ��� �ۼ��� ���ϼ� �ֵ���  
        <c:if test="${sessionScope.userId != null}">
        !-->    
        <textarea rows="5" cols="80" id="replytext" name= "replytext" placeholder="����� �ۼ����ּ���"></textarea>
        <br>
        <button type="button" id="btnReply">��� �ۼ�</button>
        <!-- </c:if>  -->
    </div>
    <!-- **��� ��� ����� ��ġ -->
    <div id="listReply"></div>

</body>
</html>