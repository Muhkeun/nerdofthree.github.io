<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 설문 결과</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/result.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/modal.css">
    <script src="https://kit.fontawesome.com/aa5b301900.js" crossorigin="anonymous"></script>
<style>
	.content h2, p{
		font-family:'Times New Roman';
	}
	
	#p_img{
		display: inline-block;
		width: 30px;
		height: 30px;
	}
</style> 
</head>
<body>
    <!-- 상단 영역 -->
    <header>
	    <input type="checkbox" id="chk1">
	    <div class="logo">
	     	<h2>Lapflix</h2>
	    </div>
	    <ul>
	        <li><a href="/">Survey</a></li>
	        <li><a href="#" id="modal-btn">My favorite</a></li>
	        <li><a href="review">Review</a></li>
	                    
	    <!-- 로그인 여부 -->    
	    <c:if test="${sessionScope.mvo eq null }">
	        <li id="login"><a href="/signIn">SignIn</a></li>
	    </c:if>
	    <c:if test="${sessionScope.mvo ne null }">
	     	<c:if test="${sessionScope.mvo.profile_image eq null }">
	     		<li id = "signOut"><a href='javascript:signOut()'>SignOut</a></li>
	     	</c:if>
	     	<c:if test="${sessionScope.mvo.profile_image ne null }">
	    		<li id = "signOut"><a href="javascript:signOut_ok()" ><img id="p_img" src="/upload/${sessionScope.mvo.profile_image }"/></a></li>
	    	</c:if>
	    </c:if>
	     
	        <label for="chk1" class="menu-close">
	            <i class="fas fa-times" aria-hidden="true"></i>
	        </label>
	    </ul>
	    <form action="result">
	    <div class="search">
	    	
	    	<input type = "hidden" name = "laptop_MonitorSize" value = "${svo.laptop_MonitorSize}">
        	<input type = "hidden" name = "laptop_OS" value ="${svo.laptop_OS}">
        	<input type = "hidden" name = "program_Name" value ="${svo.program_Name}">
        	<input type = "hidden" name = "status" value ="${svo.status}">
        	<input type = "hidden" name = "laptop_Weight" value ="${svo.laptop_Weight}">
        	<input type = "hidden" name = "laptop_Price" value ="${svo.laptop_Price}">
        	
	        <input type="text" name="search" id="srch"
	         required placeholder="Enter your search">
	         <button type="javascript:submit(this.form)">Search</button>
	    </div>
	    </form>
	    
	    <label for="chk1" class="menu-open">
	        <i class="fas fa-bars" aria-hidden="true"></i>
	    </label>
	</header>
    <!-- 상단 영역 끝 -->
    <section>
        <div class="container">
        <c:if test="${ar ne null }">
        <c:forEach var="l_list" items="${ar }" varStatus="vs">
            <div class="slides">  
				<img src="${l_list.laptop_ImageURL }?shrink=500:500&_v=20200306133943" alt="">
                <div class="content">
                    <h2>${l_list.laptop_Name }</h2>
                    <p>CPU: ${l_list.cpu_Name }</p>
                    <p>GPU: ${l_list.gpu_Name }</p>
                    <p>WEIGHT: ${l_list.laptop_Weight } kg</p>
                    <p>PRICE: <fmt:formatNumber value="${l_list.laptop_Price }" pattern="####,###"/>won</p>
                    
                <c:if test="${sessionScope.mvo ne null }">
              		<input type="hidden" name="${vs.index }" value="${l_list.laptop_seq }"/>
                    
                    <a href="javascript:favorite(${vs.index })">
               			<i class="far fa-star"></i>        
             		</a>
                </c:if>
                 	<a href='${l_list.laptop_url }'>
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
                    <c:forEach var="l_list_s" items="${ar }" varStatus="lvs_s">
                    	<c:if test="${lvs_s.index eq '0' }">
	                        <div class="column active">
	                            <img src="${l_list_s.laptop_ImageURL }?shrink=500:500" alt="">
	                        </div>
                        </c:if>
                        <c:if test="${lvs_s.index ne '0' }">
                        	<div class="column">
	                            <img src="${l_list_s.laptop_ImageURL }?shrink=500:500" alt="">
	                        </div>
                        </c:if>
                    </c:forEach>
                    </div>
                </div>
                <div class="prev">&lt</div>
                <div class="next">></div>
        </div>
	</section>
	<div class="modal" id="modal">
           
            <div class="modal-content">
                <span class="close">&times;</span>                                                               
                <h1><i class="far fa-star"></i>    Favorite</h1>
                <div class="fav-container">
                    <div class="fav-slides">

                    </div>
                </div>                    
            </div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/slide.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/modal.js"></script>


<script>
	
	//save survey parameter
	$(document).ready(function(){
		var surveyURL = document.location.href.split("?");
		sessionStorage.setItem("surveyURL", surveyURL[1]);
	});
	
	//favorite add & delete
	function favorite(idx){
		
		var f_key = sessionStorage.getItem("f_key");
		var laptop_seq = $("input[name="+idx+"]").val();
		$.ajax({
			url: "favorite",
			type: "post",
			data: "f_key="+encodeURIComponent(f_key)+"&laptop_seq="+encodeURIComponent(laptop_seq),
			dataType: "json",
			
		}).done(function(data){
			
			if(data.f_chk == "1"){
				alert("즐겨찾기 목록에 추가되었습니다.");
			}else{
				alert("즐겨찾기 목록에서 삭제되었습니다");
			}
		});  
	}
	
	//search
	function submit(frm){
		frm.submit();
	}
</script>
</body>
</html>