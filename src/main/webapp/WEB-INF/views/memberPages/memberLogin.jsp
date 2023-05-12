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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div id="section">
    <form action="/member/login" method="post">
        <input type="text" name="memberEmail" id="member_email" placeholder="이메일을 입력해주세요"> <br>
        <input type="text" name="memberPassword" id="member_password" placeholder="비밀번호를 입력해주세요"> <br>
        <input type="button" value="로그인" onclick="loginCheck()">
    </form>

</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const loginCheck = () => {
        const memberEmail = document.getElementById("member_email").value;
        const memberPassword = document.getElementById("member_password").value;
        $.ajax({
            type: "post",
            url: "/member/login",
            data: {
                "memberEmail": memberEmail,
                "memberPassword": memberPassword
            },
            success: function (res) {
                console.log(res);
                location.href = "/board/";
            },
            error: function () {
                alert("이메일 혹은 비밀번호를 확인해주세요")
            }
        });
    }
</script>

</html>
