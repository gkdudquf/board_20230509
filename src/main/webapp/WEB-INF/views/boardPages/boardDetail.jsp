<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div id="section">
<table>
    <tr>
        <th>id</th>
        <td>${board.id}</td>
    </tr>
    <tr>
        <th>boardHits</th>
        <td>${board.boardHits}</td>
    </tr>
    <tr>
        <th>boardCreatedDate</th>
        <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
    </tr>
    <tr>
        <th>boardTitle</th>
        <td>${board.boardTitle}</td>
    </tr>
    <tr>
        <th>boardWriter</th>
        <td>${board.boardWriter}</td>
    </tr>
    <tr>
        <th>boardContents</th>
        <td>${board.boardContents}</td>
    </tr>
    <c:if test="${board.fileAttached == 1}">
        <tr>
            <th>image</th>
            <td>
                <c:forEach items="${boardFileList}" var="boardFile">
                    <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                         alt="" width="100" height="100">
                </c:forEach>
            </td>
        </tr>
    </c:if>
</table>

</div>
<%@include file="../component/footer.jsp"%>
</body>


</html>
