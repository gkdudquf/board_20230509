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
    <h2>회원가입</h2>
    <table>
        <form action="/member/save" method="post" enctype="multipart/form-data">
            <input type="text" name="memberEmail" id="member-email" placeholder="이메일" onblur="email_check()"> <br>
            <h5 id="email_check_result"></h5> <br>
            <input type="text" name="memberPassword" id="member-password" placeholder="비밀번호" onblur="password_check()"> <br>
            <h5 id="password_check_result"></h5> <br>
            <input type="text" name="memberName" id="member-name" placeholder="이름"> <br><br>
            <input type="text" name="memberMobile" id="member-mobile" placeholder="전화번호" onblur="mobile_check()"> <br>
            <h5 id="mobile_check_result"></h5> <br>
            <input type="file" name="profileFile" multiple> <br><br>
            <input type="submit" value="가입">
        </form>
    </table>

</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const email_check = () => {
        const memberEmail = document.getElementById("member-email").value;
        const result = document.getElementById("email_check_result");
        $.ajax({
            type: "post",
            url: "/member/emailCheck",
            data: {
                "memberEmail": memberEmail
            },
            success: function (res) {
                result.innerHTML = "사용가능한 이메일입니다";
            },
            error: function () {
                result.innerHTML = "중복된 이메일입니다";
                result.style.color = "red";
            }
        });

    }

    const password_check = () => {
        const memberPassword = document.getElementById("member-password").value;
        const result = document.getElementById("password_check_result");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;
        if (memberPassword.match(exp)) {
            result.innerHTML = "사용가능한 비밀번호입니다";
        } else {
            result.innerHTML = "영문소문자/숫자 필수, 5~10자로 입력해주세요";
            result.color = "red";
        }
    }

    const mobile_check = () => {
        const memberMobile = document.getElementById("member-mobile").value;
        const result = document.getElementById("mobile_check_result");
        const exp =  /^\d{3}-\d{4}-\d{4}$/;
        if (memberMobile.match(exp)) {
            result.innerHTML = "사용가능한 전화번호입니다";
        } else {
            result.innerHTML = "010-0000-0000 형식으로 입력해주세요";
            result.style.color = "red";
        }
    }

</script>

</html>
