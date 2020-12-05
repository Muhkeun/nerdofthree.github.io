<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/11/04
  Time: 9:16 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>Lapflix | 회원가입</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sign_up.css">
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
            <li><a href="/">Survey</a></li>
            <li><a href="javascript:f_list()">My favorite</a></li>
            <li><a href="review">Review</a></li>
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
        <div class="signup-area">

            <div class="signup-logo">
                <h2>SIGN-UP</h2>
        </div>
        <div class="signUp-form">
            <form action="/signUp" method="post" enctype="multipart/form-data">
                <div class="int-area">
                    <input type="email" name="email" id="email" autocomplete="off" required>
                    <label for="email">Email</label>
                    <h4>Your email already use</h4>
                </div>
                <div class="int-area">
                    <input type="password" name="password" id="password" autocomplete="off" required>
                    <label for="password">Password</label>
                    <h4>You have entered the wrong user password.</h4>
                </div>
               <!--  <div class="int-area">
                    <input type="password" name="Password2" id="Password2" autocomplete="off" required>
                    <label for="password2">Re-enter</label>
                    <h4>Passwords do not match</h4>
                </div>
                 -->
                <div class="int-area">
                    <input type="text" name="member_name" id="member_name" autocomplete="off" required>
                    <label for="member_name">Name</label>
                </div>
                <div class="int-area">
                    <input type="text" name="member_age" id="member_age" autocomplete="off" required>
                    <label for="member_age">Birthdate (ex: 930918)</label>
                    <h4>The date of birth is incorrectly entered.</h4>
                </div>
                <div class="int-area"  >
                    <label>Gender</label> 
                    <input type="radio" name="member_gender" class="Gender" value="male"><i class="fas fa-mars"></i>
                    <input type="radio" name="member_gender" class="Gender" value="female"><i class="fas fa-venus"></i>
                </div>
                <div>
                	<label>첨부파일: </label>
                	<input type="file" name="file"/>
                </div>
                <div class="btn-area">
                	<button id="btn" type="submit">SIGN-UP</button>
                </div>
            </form>
        </div>
    </section>
    <script type="text/javascript" src="js/common.js"></script>
    <script>
	    function backTo(frm) {
	
	        frm.submit();
	
	    }
</script>
</body>
</html>
