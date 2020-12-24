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
    <!-- 상단영역 -->
    <jsp:include page="review/reviewHeader.jsp"/>
    <!-- 상단영역 끝 -->
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
                <div class="int-area">
                	<label>Profile Image</label><br/>
                	<div class="btn-file">이미지를 업로드하세요.
                		<input type="file" name="file">
                	</div>
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
