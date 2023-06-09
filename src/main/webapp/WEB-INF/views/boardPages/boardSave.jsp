<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form action="/board/" method="post" enctype="multipart/form-data">
            <input type="text" name="boardTitle" placeholder="제목"> <br>
            <input type="text" name="boardWriter" value="${sessionScope.loginEmail}"> <br>
            <textarea name="boardContents" cols="30" rows="10"></textarea> <br>
            <input type="file" name="boardFile" multiple> <br>
            <input type="submit" value="작성">
        </form>
    </table>

</div>
<%@include file="../component/footer.jsp"%>
</body>


</html>
