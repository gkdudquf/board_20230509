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

    <h2>수정페이지</h2>
    <form action="/board/update" method="post" name="updateForm">
    <table>
        <tr>
            <th>글번호</th>
            <td>
                <input type="text" name="id" value="${boardDTO.id}" readonly>
            </td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>
                <input type="text" name="boardWriter" value="${boardDTO.boardWriter}" readonly>
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>
                <input type="text" name="boardPass" id="board-pass">
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td>
                <input type="text" name="boardTitle" value="${boardDTO.boardTitle}">
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <input type="text" name="boardContents" value="${boardDTO.boardContents}">
            </td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>
                <input type="text" name="boardCreatedDate" value="${boardDTO.boardCreatedDate}" readonly>
            </td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>
                <input type="text" name="boardHits" value="${boardDTO.boardHits}" readonly>
            </td>
        </tr>
    </table>
        <input type="button" onclick="update_check()" value="수정">
    </form>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const update_check = () => {
        const inputPass = document.getElementById("board-pass").value;
        const DBPass = '${boardDTO.boardPass}';
        if (inputPass == DBPass) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다");
        }
    }
</script>

</html>
