<%@  taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> <!-- �⺻��� -->
<%@  taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %> <!-- ���� ��� (��������)-->
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %> <!-- �Լ� ��� -->
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
        $("#btnWrite").click(function(){
            // ������ �ּ� ����(�̵�)
            alert("�۾��� �̵�");
            location.href = "${pageContext.servletContext.contextPath}/board/write";
        });
    });
    
    
    //  ������ �̵�
    function list(page) {
        location.href="${pageContext.servletContext.contextPath}/board/list?curpage="+page+"&search-${map.search}"+"&keyword=${map.keyword}";
    }
       
    
</script>
</head>
<body>
<h2>�Խñ�LIST</h2>

<form name="form1" method="post" action="${pageContext.servletContext.contextPath}/board/list">
        <select name="searchOption">            
            <option value="all" <c:out value="${map.search == 'all'?'selected':''}"/> >��ü</option>
            <option value="id" <c:out value="${map.search == 'id'?'selected':''}"/> >�ۼ���</option>
            <option value="content" <c:out value="${map.search == 'content'?'selected':''}"/> >����</option>
            <option value="title" <c:out value="${map.search == 'title'?'selected':''}"/> >����</option>
        </select>
        <input name="keyword" value="${map.keyword}">
        <input type="submit" value="��ȸ">        
    </form>
    
    �Խñ� ���� : ${map.count}���� �Խù�.
  �� ������ : ${map.bp.curPage}  
<table border="1" width="600px">
    <tr>
        <th>��ȣ</th>
        <th>����</th>
        <th>�ۼ���</th>
        <th>�ۼ���</th>
        <th>��ȸ��</th>
    </tr>
    <c:forEach var="vo" items="${map.list}">
    <tr>
        <td>${vo.no}</td>
        <td><a href="${pageContext.servletContext.contextPath}/board/view/${vo.no}">${vo.title}         
         <span style ="color: red;">(${vo.replycount})</span>         
        </a>
        </td>
        <td>${vo.id}</td>
        <td>${vo.timestamp}</td>
        <td>${vo.hit}</td>
    </tr>    
    </c:forEach>         
    
       <tr>
            <td colspan="5">
                <!-- ó���������� �̵� : ���� �������� 1���� ũ��  [ó��]�����۸�ũ�� ȭ�鿡 ���-->
                <c:if test="${map.bp.curBlock > 1}">
                    <a href="javascript:list('1')">[ó��]</a>
                </c:if>
                
                <!-- ���������� ������� �̵� : ���� ������ ���� 1���� ũ�� [����]�����۸�ũ�� ȭ�鿡 ��� -->
                <c:if test="${map.bp.curBlock > 1}">
                    <a href="javascript:list('${map.bp.prevPage}')">[����]</a>
                </c:if>
                
                <!-- �ϳ��� �� �������������� ������������ �ݺ��� ���� -->
                <c:forEach var="num" begin="${map.bp.blockBegin}" end="${map.bp.blockEnd}">
                    <!-- �����������̸� �����۸�ũ ���� -->
                    <c:choose>
                        <c:when test="${num == map.bp.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- ���������� ������� �̵� : ���� ������ ���� ��ü ������ ������ �۰ų� ������ [����]�����۸�ũ�� ȭ�鿡 ��� -->
                <c:if test="${map.bp.curBlock <= map.bp.totalBlock}">
                    <a href="javascript:list('${map.bp.nextPage}')">[����]</a>
                </c:if>
                
                <!-- ���������� �̵� : ���� �������� ��ü ���������� �۰ų� ������ [��]�����۸�ũ�� ȭ�鿡 ��� -->
                <c:if test="${map.bp.curPage <= map.bp.totalPage}">
                    <a href="javascript:list('${map.bp.totalPage}')">[��]</a>
                </c:if>
            </td>
        </tr>       
    
    
</table><br>
<button type="button" id="btnWrite">�۾���</button>

</body>
</html>