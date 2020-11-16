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
<style>
	.content h2, p{
		font-family:'Times New Roman';
	}
</style> 
</head>
<body>
    <header>
        <input type="checkbox" id="chk1">
        <div class="logo">
         	<h2>Lapflix</h2>
        </div>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Survey</a></li>
            <li><a href="#">My favorite</a></li>
        <c:if test="${sessionScope.mvo eq null }">
            <li><a href="/signIn">Login</a></li>
        </c:if>
        <c:if test="${sessionScope.mvo ne null }">
        	<li><a href="javascript:logout()">Logout</a></li>
        </c:if>
        
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
            <div class="slides">  
				<img src="${l_list.laptop_ImageURL }?shrink=500:500&_v=20200306133943" alt="">
                <div class="content">
                    <h2>${l_list.laptop_Name }</h2>
                    <p>CPU: ${l_list.cpu_Name }</p>
                    <p>GPU: ${l_list.gpu_Name }</p>
                    <p>WEIGHT: ${l_list.laptop_Weight } kg</p>
                    <p>PRICE: ${l_list.laptop_Price } won</p>
                    <a href="favorite">
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
        </div>
            <!-- part 2 -->
            <div class="row">
                <h2>Recommend</h2>
                <div class="nav">
                    <div class="nav-bar">
                    <c:forEach var="l_list_s" items="${ar }">
                        <div class="column active">
                            <img src="${l_list_s.laptop_ImageURL }?shrink=500:500" alt="">
                        </div>
                    </c:forEach>
                    </div>
                </div>
                <div class="prev">&lt</div>
                <div class="next">></div>
        </div>
        
        </section>
        <script type="text/javascript" src="resources/js/slide.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script>
        	function logout(){
        		
        		$.ajax({
        			url: "signOut",
        			dataType: "json",
        		}).done(function(data){
        			
        			if(data.res == "0"){
	        			alert("정상적으로 로그아웃이 처리되었습니다.");
	        			location.href="/result?laptop_MonitorSize="+data.svo.laptop_MonitorSize+"&laptop_OS="+data.svo.laptop_OS+"&program_Name="+data.svo.program_Name+
						"&status="+data.svo.status+"&laptop_Weight="+data.svo.laptop_Weight+"&laptop_Price="+data.svo.laptop_Price;
        			}	
        		});
        	}
        </script>
</body>
</html>
