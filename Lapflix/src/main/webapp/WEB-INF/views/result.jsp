<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 설문 결과</title>
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/result.css">
    <link rel="stylesheet" href="resources/css/header.css">
    <script src="https://kit.fontawesome.com/aa5b301900.js" crossorigin="anonymous"></script>
  
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
        <div class="container">
        <c:if test="${ar ne null }">
        <c:forEach var="l_list" items="${ar }">
            <div class="slides active">
                <img src="${l_list.laptop_ImageURL }" alt="">
                <div class="content">
                    <h2>${l_list.laptop_Name }</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now 
                    </a>
                </div>
            </div>
         </c:forEach>
         </c:if>
            <!-- <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/655/781/img/11781655_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/105/525/img/11525105_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/629/414/img/12414629_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/022/100/img/10100022_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/366/319/img/11319366_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>

            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/756/609/img/11609756_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>멕북</h2>
                    <p>Ldkdkdkdkdkdkdk</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/740/102/img/10102740_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/675/500/img/12500675_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
            <div class="slides">
                <img src="http://img.danawa.com/prod_img/500000/164/141/img/12141164_1.jpg?shrink=500:500" alt="">
                <div class="content">
                    <h2>Laptop name</h2>
                    <p>Laptop detail</p>
                    <a href="#">
                        <i class="far fa-star"></i>       
                        Favorite
                    </a>
                      <a href='#'>
                        <i class="fas fa-shopping-cart"></i>
                        Buy now
                    </a>
                </div>
            </div>
        </div>
         -->
            <!-- part 2 -->
            <div class="row">
                <h2>Recommend</h2>
                <div class="nav">
                    <div class="nav-bar">
                    <c:forEach var="l_list" items="${ar }">
                        <div class="column active">
                            <img src="http://img.danawa.com/prod_img/500000/022/100/img/10100022_1.jpg?shrink=500:500" alt="">
                        </div>
                    </c:forEach>
              	<!--     <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/655/781/img/11781655_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/105/525/img/11525105_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/629/414/img/12414629_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/022/100/img/10100022_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/366/319/img/11319366_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/756/609/img/11609756_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/740/102/img/10102740_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/675/500/img/12500675_1.jpg?shrink=500:500" alt="">
                        </div>
                        <div class="column">
                            <img src="http://img.danawa.com/prod_img/500000/164/141/img/12141164_1.jpg?shrink=500:500" alt="">
                        </div>
                 -->
                    </div>
                </div>
                <div class="prev">&lt</div>
                <div class="next">></div>
        </div>
        
        </section>
        <script type="text/javascript" src="resources/js/slide.js"></script>
</body>
</html>
