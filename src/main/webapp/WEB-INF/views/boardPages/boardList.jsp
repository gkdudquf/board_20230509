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
            <th>번호</th>
            <th>작성자</th>
            <th>비밀번호</th>
            <th>글제목</th>
            <th>내용</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>파일첨부유무</th>
        </tr>
        <c:forEach items="${List}" var="list">
        <tr>
            <td>${list.id}</td>
            <td>${list.boardWriter}</td>
            <td>${list.boardPass}</td>
            <td>${list.boardTitle}</td>
            <td>${list.boardContents}</td>
            <td>${list.boardCreatedDate}</td>
            <td>${list.boardHit}</td>
            <td>${list.fileAttached}</td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>

<%@include file="../component/footer.jsp"%>
</html>
