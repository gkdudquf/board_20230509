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
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>

<div id="section">


    <table>
        <tr>
            <th>번호</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>글제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>
                <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>파일첨부유무</th>
            <td>${board.fileAttached}</td>
        </tr>
    </table>
    <button onclick="board_list()">목록</button>
    <button onclick="board_detail()">수정</button>
    <button onclick="board_delete('${board.id}')">삭제</button>
</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const board_list = () => {
        location.href = "/board/";
    }

    const board_detail = () => {
        const id = '${board.id}'
        location.href = "/board/update?id=" + id;
    }

    const board_delete = (id) => {
        location.href = "/board/delete-check?id=" + id;
    }
</script>

</html>
