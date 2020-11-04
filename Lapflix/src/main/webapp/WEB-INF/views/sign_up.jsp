<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/11/04
  Time: 9:16 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lapflix | 회원가입</title>
</head>
<body>
<div>
    <form action="signIn" method="post">
        <label for="email">email</label>
        <input type="email" name="Email" id="Email">

        <input type="button" value="확인" onclick="backTo(this.form)">

    </form>
</div>
<script>
    function backTo(frm) {

        frm.submit();

    }
</script>
</body>
</html>
