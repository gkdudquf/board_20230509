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

    <input type="text" name="boardPass" id="board-pass" placeholder="비밀번호">
    <button onclick="pass_check()">확인</button>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const pass_check = () => {
        const passInput = document.getElementById("board-pass").value;
        const DBPass = '${board.boardPass}';
        const id = '${board.id}';
        if (passInput == DBPass) {
            location.href = "/board/delete?id=" + id;
        } else {
            alert("비밀번호가 일치하지 않습니다")
        }
    }
</script>

</html>
