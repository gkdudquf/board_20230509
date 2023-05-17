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
        <form action="/member/update" method="post" name="updateForm">
            <img src="${pageContext.request.contextPath}/update/${member.profileFile}"
                 alt="" width="100" height="100"> <br>
            <input type="hidden" name="id" value="${member.id}">
            <input type="text" name="memberEmail" id="member_email" value="${member.memberEmail}"> <br>
            <input type="text" name="memberPassword" id="member_password" placeholder="비밀번호를 입력해주세요"> <br>
            <input type="text" name="memberName" value="${member.memberName}" readonly> <br>
            <input type="text" name="memberMobile" id="member_mobile" value="${member.memberMobile}" onblur="mobile_check()"> <br>
            <h5 id="mobile_check_result"></h5> <br>
            <input type="button" onclick="update_check()" value="수정">



        </form>
    </table>

</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>

    const mobile_check = () => {
        const memberMobile = document.getElementById("member_mobile").value;
        const result = document.getElementById("mobile_check_result");
        const exp =  /^\d{3}-\d{4}-\d{4}$/;
        if (memberMobile.match(exp)) {
            result.innerHTML = "사용가능한 전화번호입니다";
        } else {
            result.innerHTML = "010-0000-0000 형식으로 입력해주세요";
            result.style.color = "red";
        }
    }

    const update_check = () => {
        const inputPass = document.getElementById("member_password").value;
        const DBPass = '${member.memberPassword}';
        if (inputPass == DBPass) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다");
        }
    }
</script>

</html>
