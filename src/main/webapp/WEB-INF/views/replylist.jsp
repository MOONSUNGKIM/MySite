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
</head>
<body>
<h2> ����ΰ�  </h2>
  <table style="width:700px">
        <c:forEach var="vo" items="${list}">
        <tr>    
            <td>
                ����� : ${vo.timestamp}
                <br>
                ����:  ${vo.content}
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>