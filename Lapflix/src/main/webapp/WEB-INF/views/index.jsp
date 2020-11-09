<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 나만의 노트북 찾기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/scrollBtn.js"></script>
    <link rel="stylesheet" href="resources/css/index.css">

</head>
<body>
<div class="root">
    <!-- 메인페이지 -->
    <main>
        <div class="scrollBtn">
            <button class="scrollBtn_Btn" id="scrollBtn_Btn1" type="button"  onclick="moveTo(1)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn2" type="button"  onclick="moveTo(2)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn3" type="button"  onclick="moveTo(3)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn4" type="button"  onclick="moveTo(4)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn5" type="button"  onclick="moveTo(5)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn6" type="button"  onclick="moveTo(6)">●</button></br>

        </div>

        <!-- 설문페이지 -->
        <!-- 첫번째 설문-->
        <div class= "index" id="page1">

            <div class="background"><img src="resources/res/1.jpg"/></div>

            <div class="qna">
                <div class="question"><h1>🖥 모니터는 어떤 사이즈가 좋으세요? 🖥</h1></div>

                <div class="answer">
                    <form class="survey">
                        <input type="radio" name="Laptop_MonitorSize" value="13"/>1. 13인치 ~ 14인치</br>
                        <input type="radio" name="Laptop_MonitorSize" value="15"/>2. 15인치 ~ 16인치</br>
                        <input type="radio" name="Laptop_MonitorSize" value="17"/>3. 잘모르겠어요.</br>
                    </form>
                </div>


                <button class="downToBtn" type="button"  onclick="moveTo(2)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>


        </div>
        <!-- 두번째 설문-->
        <div class= "index" id="page2" >
            <div class="background"><img src="resources/res/2.jpg"/></div>

            <div class="qna">
                <div class="question"><h1>운영체제는 어떤 것을 원하세요? </h1></div>

                <div class="answer">
                    <form class="survey">

                        <input type="radio" name="Laptop_OS" value="MacOS"/>1. MacOS 🍎</br>
                        <input type="radio" name="Laptop_OS" value="Windows"/>2. Windows 🖼</br>
                        <input type="radio" name="Laptop_OS" value="Linux"/>3. Linux 🐧</br>
                        <input type="radio" name="Laptop_OS" value="미포함"/>4. FreeDos </br>
                    </form>
                </div>

                <button class="downToBtn" type="button" onclick="moveTo(3)"><img class="downToBtn_img" src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>
        </div>

</div>
<!-- 세번째 설문-->
<div class= "index" id="page3">
    <div class="background"><img src="resources/res/3.jpg"/></div>

    <div class="qna">
        <div class="question"><h1>✍️ 어떤 작업에 사용하실 생각이세요? ✍️</h1></div>

        <div class="answer">
            <form class="survey">
                <input type="radio" name="Program_Name" value=""/>1. PhotoShop (이미지작업)</br>
                <input type="radio" name="Program_Name" value=""/>2. Programming (프로그래밍)</br>
                <input type="radio" name="Program_Name" value="Premiere"/>3. Premiere Pro (영상작업)</br>
                <input type="radio" name="Program_Name" value="Battleground"/>4. Battleground (게임)</br>
                <input type="radio" name="Program_Name" value=""/>5. WebSurfing (영상작업)</br>
            </form>
        </div>

        <button class="downToBtn" type="button"  onclick="moveTo(4)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
    </div>

</div>
<!-- 네번째 설문 -->
<div class= "index" id="page4">
    <div class="background"><img src="resources/res/4.jpg"/></div>

    <div class="qna">
        <div class="question"><h1>해당 프로그램을 사용함에 있어 어느 정도의 수준으로 작업하실 생각입니까?</h1></div>

        <div class="answer">
            <form class="survey">
                <input type="radio" name="status" value="expert"/>1. 전문가</br>
                <input type="radio" name="status" value="noob"/>2. 학생 혹은 취미</br>
                <input type="radio" name="1" id=""/>3. 잘모르겠어요.</br>
            </form>
        </div>

        <button class="downToBtn" type="button"  onclick="moveTo(5)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
    </div>
</div>
<!--다섯번째 설문  -->
<div class= "index" id="page5">
    <div class="background"><img src="resources/res/5.jpg"/></div>

    <div class="qna">
        <div class="question"><h1>질문5</h1></div>

        <div class="answer">
            <form class="survey">
                <input type="radio" name="1" id=""/>1.답변1</br>
                <input type="radio" name="1" id=""/>2.답변2</br>
                <input type="radio" name="1" id=""/>3.답변3</br>
            </form>
        </div>

        <button class="downToBtn" type="button"  onclick="moveTo(6)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
    </div>

</div><div class= "index" id="page6">
    <div class="background"><img src="resources/res/6.jpg"/></div>

    <div class="qna">
        <div class="question"><h1>질문6</h1></div>

        <div class="answer">
            <form class="survey">
                <input type="radio" name="1" id=""/>1.답변1</br>
                <input type="radio" name="1" id=""/>2.답변2</br>
                <input type="radio" name="1" id=""/>3.답변3</br>
            </form>
        </div>

        <button class="submitBtn" type="submit"  onclick="submit()">결과보기</button>
    </div>

    <div id="page7"></div>
    </main>
</div>
<script>
    $(function () {
        $('.submitBtn').click(function(){
            $.get('result',$('.survey').serialize(),function(data){
                location.href = "result";
            });
        });
    });
</script>
</body>
</html>