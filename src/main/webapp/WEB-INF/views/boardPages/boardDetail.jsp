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
            <td>${boardDTO.id}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${boardDTO.boardWriter}</td>
        </tr>
        <tr>
            <th>글제목</th>
            <td>${boardDTO.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${boardDTO.boardContents}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${boardDTO.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${boardDTO.boardHits}</td>
        </tr>
        <tr>
            <th>파일첨부유무</th>
            <td>${boardDTO.fileAttached}</td>
        </tr>
    </table>
    <button onclick="board_detail('${boardDTO.id}')">수정</button>
    <button onclick="board_delete('${boardDTO.id}')">삭제</button>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const board_detail = (id) => {
        location.href = "/board/update?id=" + id;
    }

    const board_delete = (id) => {
        location.href = "/board/deleteCheck?id=" + id;
    }
</script>

</html>
