<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="section">
<table>
    <tr>
        <th>id</th>
        <th>boardTitle</th>
        <th>boardWriter</th>
        <th>boardContents</th>
        <th>boardCreatedDate</th>
        <th>boardHits</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
    <tr>
        <td>${board.id}</td>
        <td><a href="/board/detail?id=${board.id}">${board.boardTitle}</a></td>
        <td>${board.boardWriter}</td>
        <td>${board.boardContents}</td>
        <td><fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
        <td>${board.boardHits}</td>
    </tr>
    </c:forEach>
</table>

</div>
<%@include file="../component/footer.jsp"%>
</body>


</html>
