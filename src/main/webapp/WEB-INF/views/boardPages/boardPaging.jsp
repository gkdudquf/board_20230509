<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div id="section">
<div class="container" id="search-area">
    <form action="/board/paging" method="get">
        <select name="type">
            <option value="boardTitle">제목</option>
            <option value="boardWriter">작성자</option>
        </select>
        <input type="text" name="q" placeholder="검색어를 입력해주세요">
        <input type="submit" value="검색">
    </form>
</div>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <th>id</th>
            <th>title</th>
            <th>writer</th>
            <th>date</th>
            <th>hits</th>
        </tr>
        <c:forEach items="${boardList}" var="board">

        </c:forEach>
    </table>
</div>
</div>
<%@include file="../component/footer.jsp"%>
</body>


</html>
