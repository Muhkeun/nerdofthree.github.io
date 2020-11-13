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
        <link rel="stylesheet" href="resources/css/header.css">
   
</head>
<body>
    <section>
        <div class="root">
            <!-- btn -->
        <div class="scrollBtn">
            <button class="scrollBtn_Btn" id="scrollBtn_Btn1" type="button"  onclick="moveTo(1)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn2" type="button"  onclick="moveTo(2)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn3" type="button"  onclick="moveTo(3)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn4" type="button"  onclick="moveTo(4)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn5" type="button"  onclick="moveTo(5)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn6" type="button"  onclick="moveTo(6)">●</button></br>
            <button class="scrollBtn_Btn" id="scrollBtn_Btn7" type="button"  onclick="moveTo(7)">●</button></br>
        </div>
     
        
        <!-- main -->
        <!-- 1st survey-->
        <div class= "index" id="page1">
          
            <div class="background"><img src="resources/res/1.jpg"/></div>
            <div class="qna">
                <div class="logo">
                    <h2>Lapflix</h2>
                </div>
            
                <div class="answer">
                    <h3>
                        설문에 참여하고 지금 즉시 나와 어울리는 최고의 노트북을 찾아보세요!
                    </h3> 
                </div>   
                <div class="btn-area">
                    <button class="downToBtn" type="button"  onclick="moveTo(2)">Start!</button>
                </div>
                    
                
            </div>
        </div>
        <div class= "index" id="page2">
            
            <div class="background"><img src="resources/res/2.jpg"/></div>
            
            <div class="qna">
                <div class="question"><h1> 모니터는 어떤 사이즈가 좋으세요? 🖥</h1></div>
                
                <div class="answer">
                    <form action="">
                        <input type="radio" name="laptop_MonitorSize" value="0" class="size"/>1. 13인치 미만</br>
                        <input type="radio" name="laptop_MonitorSize" value="1"/>2. 13~15인치</br>
                        <input type="radio" name="laptop_MonitorSize" value="2"/>3. 15인치 초과</br>                  
                        <input type="radio" name="laptop_MonitorSize" value=""/>4. 잘 모르겠어요.</br>
                    </form>  
                </div>   
                
                
                <button class="downToBtn" type="button"  onclick="moveTo(3)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>
                    
            
        </div>
        <!-- 2nd survey-->
        <div class= "index" id="page3" >
            <div class="background"><img src="resources/res/3.jpg"/></div>
            
            <div class="qna">
                <div class="question"><h1>운영체제는 어떤 것을 원하세요? 👨‍💻</h1></div>
                
                <div class="answer">
                    <form action="">
            
                        <input type="radio" name="laptop_OS" value="mac"/>1. MacOS 🍎</br>
                        <input type="radio" name="laptop_OS" value="윈도우10"/>2. Windows 🖼</br>
                        <input type="radio" name="laptop_OS" value="리눅스"/>3. Linux 🐧</br>
                        <input type="radio" name="laptop_OS" value="미포함"/>4. FreeDos </br>
                    </form>
                </div>

                <button class="downToBtn" type="button" onclick="moveTo(4)"><img class="downToBtn_img" src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>
        </div>
            
        </div>
        <!-- 3rd survey-->
        <div class= "index" id="page4">
            <div class="background"><img src="resources/res/4.jpg"/></div>
            
            <div class="qna">
                <div class="question"><h1> 어떤 작업에 사용하실 생각이세요? ✍️</h1></div>
                    
                <div class="answer">
                    <form action="">
                        <input type="radio" name="program_Name" value=""/>1. PhotoShop (이미지작업)</br>
		                <input type="radio" name="program_Name" value=""/>2. Programming (프로그래밍)</br>
		                <input type="radio" name="program_Name" value="Premiere"/>3. Premiere Pro (영상작업)</br>
		                <input type="radio" name="program_Name" value="Battleground"/>4. Battleground (게임)</br>
		                <input type="radio" name="program_Name" value=""/>5. WebSurfing (영상작업)</br>
                    </form>
                </div>
                
                <button class="downToBtn" type="button"  onclick="moveTo(5)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>
              
        </div>
        <!-- 4th survey -->
        <div class= "index" id="page5">
            <div class="background"><img src="resources/res/5.jpg"/></div>
            
            <div class="qna">
                <div class="question"><h1>해당 프로그램을 사용함에 있어 어느 정도의 수준으로 작업하실 생각입니까?</h1></div>
                    
                <div class="answer">
                    <form action="">
                        <input type="radio" name="status" value="expert"/>1. 전문가</br>
		                <input type="radio" name="status" value="noob"/>2. 학생 혹은 취미</br>
		                <input type="radio" name="status" value=""/>3. 잘모르겠어요.</br>
                    </form>
                </div>
                
                <button class="downToBtn" type="button"  onclick="moveTo(6)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>
        </div>
        <!--5th survey  -->
        <div class= "index" id="page6">
            <div class="background"><img src="resources/res/6.jpg"/></div>
            
            <div class="qna">
                <div class="question"><h1>어느 정도의 무게감을 원하시나요?</h1></div>
                    
                <div class="answer">
                    <form action="">
                        <input type="radio" name="laptop_Weight" value="0"/>1. 휴대성이 매우 좋다.</br>
		                <input type="radio" name="laptop_Weight" value="1"/>2. 들고 다니기 적당하다.</br>
		                <input type="radio" name="laptop_Weight" value="2"/>3. 들고 다니지 않을 예정이다.</br>
                    </form>
                </div>
                
                <button class="downToBtn" type="button"  onclick="moveTo(7)"><img class="downToBtn_img"src="resources/res/Btn/icon-157360_1280.png" alt=""></button>
            </div>

        <!-- 6th survey -->
        </div><div class= "index" id="page7">
            <div class="background"><img src="resources/res/7.jpg"/></div>
            
            <div class="qna">
                <div class="question"><h1>가격은 어느 선까지 생각하시나요?</h1></div>
                    
                <div class="answer">
                    <form action="">
                        <input type="radio" name="laptop_Price" value="0"/>1. 50만원 미만</br>
		                <input type="radio" name="laptop_Price" value="1"/>2. 80만원 미만</br>
		                <input type="radio" name="laptop_Price" value="2"/>3. 110만원 미만</br>
		                <input type="radio" name="laptop_Price" value="3"/>3. 110만원 이상</br>
                    </form>
                </div>
                
                <div class="btn-area">
                    <button class="submitBtn" type="submit"  onclick="submit()">Check</button>
                </div>
            </div>
              
            <div id="page8"></div>
        </div>
    </section>
	<script type="text/javascript" src="resources/js/submit.js"></script>
</body>
</html>

</body>
</html>