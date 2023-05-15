<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="nav">
    <ul>
        <li id="house">
            <a href="/"><i class="bi bi-house" ></i></a>
        </li>
        <li>
            <a href="/member/save">회원가입</a>
        </li>
        <li>
            <a href="/board/save">게시글 작성</a>
        </li>
        <li>
            <a href="/board/">게시글 목록</a>
        </li>
        <li>
            <a href="/board/paging">페이징목록</a>
        </li>
        <li class="login-name" id="login-area">

        </li>
    </ul>
</div>

<script>
    const loginArea = document.getElementById("login-area");
    const loginEmail = '${sessionScope.loginEmail}';

    if (loginEmail.length != 0) {
        loginArea.innerHTML = "<a href='/member/mypage' style='color: black;'>" + loginEmail + "님 환영해요!</a>" +
                                "<a href='/member/logout'>logout</a>";
    } else {
        loginArea.innerHTML = "<a href='/member/login'>login</a>";
    }


</script>