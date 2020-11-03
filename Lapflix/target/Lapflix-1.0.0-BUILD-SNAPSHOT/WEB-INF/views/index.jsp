<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나만의 노트북 찾기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        body{
            margin: auto;
            height: 600vh;
            width: 100%;
            position: relative;
        }
        /* 스크롤바 */
        .scrollBtn{
            position: fixed;
            z-index: 2;
            top: 50vh;
            right: 2vw;
        }
        /* 네이게이션 */
        .Nav_Bar{
            position: absolute;
            float: top;
            z-index: 1;
            width: 100%;
            height: 20%;
            color: yellow;
        }
        /* 페이지 */
        .firstPage{
            z-index: 1;
            position: relative;
        }
        .firstPage>.firstQ{
            text-align: center;
            position: absolute;
            top:50%;
            left: 50%;
            color: white;
        }
        img{
            width:100%;
            height: 100vh;
            opacity: 60%;
            vertical-align: middle;

        }
        h1{
            text-decoration-color: white;
        }

    </style>
</head>
<body>
<div class="root">
    <div class="Nav_bar">
        <!-- 상단바 -->
        <nav class="Nav_Bar">
            <!-- 로고 -->
            <a></a>
            <!-- 로그인 -->
            <ul>

            </ul>
        </nav>
    </div>
    <!-- 메인페이지 -->
    <main>
        <!-- 스크롤 -->
        <div>
            <div class="scrollBtn">
                <a href="#indexPostion">❤</a><br/>
                <a href="#target1">❤</a><br/>
                <a href="#target2">❤</a><br/>
                <a href="#target3">❤</a><br/>
                <a href="#target4">❤</a><br/>
            </div>
        </div>
        <!-- 설문페이지 -->

        <!-- 첫번째 설문-->
        <div class= "firstPage" id="indexPostion">
            <div class="firstBg">
                <img src="./res/1.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문1</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target1">아래로</a>
            </div>
        </div>
        <!-- 두번째 설문-->
        <div class= "firstPage" id="target1">
            <div class="firstBg">
                <img src="./res/2.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문2</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target2">아래로</a>
            </div>
        </div>
        <!-- 세번째 설문-->
        <div class= "firstPage" id="target2">
            <div class="firstBg">
                <img src="./res/3.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문3</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target3">아래로</a>
            </div>
        </div>
        <!-- 네번째 설문-->
        <div class= "firstPage" id="target3">
            <div class="firstBg">
                <img src="./res/1.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문4</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target4">아래로</a>
            </div>
        </div>
        <!-- 다섯번째 설문-->
        <div class= "firstPage" id="target4">
            <div class="firstBg">
                <img src="./res/4.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문5</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target5">아래로</a>
            </div>
        </div>
        <!-- 여섯번째 설문-->
        <div class= "firstPage" id="target5">
            <div class="firstBg">
                <img src="./res/6.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문6</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="login.html">아래로</a>
            </div>
        </div>
    </main>
</div>
</div>
</body>
<script>
    $(document).ready(function () {
        $('html, body').animate({
            scrollTop: $('#indexPostion').offset().top
        }, 'fast'); //slow
    });

    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        });
    });

</script>
</html>