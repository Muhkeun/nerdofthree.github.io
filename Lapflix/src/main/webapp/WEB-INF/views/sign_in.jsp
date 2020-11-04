<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/11/04
  Time: 9:23 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lapflix | 로그인</title>
</head>
<body>
            <div>
                <form action="result" method="post">
                    <label for="email">아이디</label>
                    <input type="email" name="email" id="email"></br>
                    <label for="password">비밀번호</label>
                    <input type="password" name="password" id="password">
                    <input type="button" value="Sign-in" onclick="submit(this.form)">
                </form>
                <a href="signUp"><input type="button" value="회원가입"> </a>
            </div>
            <div>
                <a>
                <img src="/res/sign_b/kakao_login_medium.png"/>
                </a>
            </div>
    <script>
        function submit(frm) {
            frm.submit();
        }
    </script>
</body>
</html>
