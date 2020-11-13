<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/11/04
  Time: 9:23 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 로그인</title>
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/sign_in.css">
    <script src="https://kit.fontawesome.com/aa5b301900.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <input type="checkbox" id="chk1">
        <div class="logo">
            <h2>Lapflix</h2>
        </div>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Servey</a></li>
            <li><a href="#">My favorite</a></li>
            <li><a href="#">Login</a></li>
            <label for="chk1" class="menu-close">
                <i class="fas fa-times" aria-hidden="true"></i>
            </label>
        </ul>
        <div class="search">
            <input type="text" name="search" id="srch"
             required placeholder="Enter your search">
             <button type="submit">Search</button>
        </div>
        <label for="chk1" class="menu-open">
            <i class="fas fa-bars" aria-hidden="true"></i>
        </label>
    </header>
    <section>
        <div  class="login_form">
            <div class="center-logo">
                <h1>Lapflix</h1>
            </div>
            <form action="" method="POST">
                <div class="int-area">
                    <input type="text" name="id" id="id" autocomplete="off" required>
                    <label for="id">EMAIL</label>
                </div>
                <div class="int-area">
                    <input type="password" name="password" id="password" autocomplete="off" required>
                    <label for="password">PASSWORD</label>
                </div>
                <div class="btn-area">
                    <button id="btn" type="submit">SIGN-IN</button>
                </div>
                <div class="caption">
                    <a href="#">sign up</a>
                </div>
            </form>
            
        </div>
    </section>
    <script type="text/javascript" src="resources/js/login.js"></script>
</body>
</html>
