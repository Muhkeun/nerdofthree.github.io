<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 나만의 노트북 찾기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/scrollBtn.js"></script>
    <script type="text/stylesheet" src="resources/css/index.css"></script>
   
</head>
<body>
<div class="root">

    <!-- 메인페이지 -->
    <main>
        <!-- 스크롤 -->
        <div>
            <div class="scrollBtn">
                <a href="#indexPostion">*</a><br/>
                <a href="#target1">*</a><br/>
                <a href="#target2">*</a><br/>
                <a href="#target3">*</a><br/>
                <a href="#target4">*</a><br/>
                <a href="#target5">*</a>
            </div>
        </div>
        <!-- 설문페이지 -->

        <!-- 첫번째 설문-->
        <div class= "firstPage" id="indexPostion">
            <div class="firstBg">
                <img src="resources/res/1.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문1</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target1">다음</a>
            </div>
        </div>
        <!-- 두번째 설문-->
        <div class= "firstPage" id="target1">
            <div class="firstBg">
                <img src="resources/res/2.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문2</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target2">다</a>
            </div>
        </div>
        <!-- 세번째 설문-->
        <div class= "firstPage" id="target2">
            <div class="firstBg">
                <img src="resources/res/3.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문3</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target3">다음</a>
            </div>
        </div>
        <!-- 네번째 설문-->
        <div class= "firstPage" id="target3">
            <div class="firstBg">
                <img src="resources/res/1.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문4</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target4">다음</a>
            </div>
        </div>음
        <!-- 다섯번째 설문-->
        <div class= "firstPage" id="target4">
            <div class="firstBg">
                <img src="resources/res/4.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문5</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="#target5">다음</a>
            </div>
        </div>
        <!-- 여섯번째 설문-->
        <div class= "firstPage" id="target5">
            <div class="firstBg">
                <img src="resources/res/6.jpg"/>
            </div>
            <div class="firstQ">
                <h1>질문6</h1>
                <form action="">
                    <input type="radio" name="1" id=""/>1.답변1</br>
                    <input type="radio" name="1" id=""/>2.답변2</br>
                    <input type="radio" name="1" id=""/>3.답변3</br>
                </form>
                <a href="/signIn">설문 끝! 결과 보러가기</a>
            </div>
        </div>기
    </main>
</div>
</div>
</body>
</html>