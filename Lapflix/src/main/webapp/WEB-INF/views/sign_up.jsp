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
        <label for="Email">Email</label>
        <input type="email" name="Email" id="Email">
        <label for="password">Password</label>
        <input type="password" name="Password" id="Password">
        <label for="password2">Re-enter password</label>
        <input type="password" name="Password2" id="Password2">
        <label for="Name">Name</label>
        <input type="text" name="Name" id="Name">
        <label>Age</label>
        <input type="radio" name="Age" class="Age" value="10"/>10대</br>
        <input type="radio" name="Age" class="Age" value="20"/>20대</br>
        <input type="radio" name="Age" class="Age" value="30"/>30대</br>
        <input type="radio" name="Age" class="Age" value="40"/>40대</br>
        <input type="radio" name="Age" class="Age" value="50"/>50대 이상</br>
        <label>Gender</label>
        <input type="radio" name="Gender" class="Gender" value="male">male</br>
        <input type="radio" name="Gender" class="Gender" value="female">female</br>


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
