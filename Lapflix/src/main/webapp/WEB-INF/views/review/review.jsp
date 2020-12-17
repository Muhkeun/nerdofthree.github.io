<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 리뷰</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/review.css">
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
	        <li><a href="/">Survey</a></li>
	        <li><a href="javascript:f_list()">My favorite</a></li>
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
        <div class="search">
            <input type="text" name="search" id="srch"
             required placeholder="Enter your search">
             <btn type="submit">Search</btn>
        </div>
        <label for="chk1" class="menu-open">
            <i class="fas fa-bars" aria-hidden="true"></i>
        </label>
    </header>
    <section>
        <div class="board_list_wrap">
            <table class="board_list">
                <caption>리뷰 목록</caption>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>모델명</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${rar ne null }">
					<c:forEach var="rvo" items="${rar }" varStatus="st">
                    <tr>
                        <td class="no">${rowTotal - st.index - (blockList*(nowPage - 1)) }</td>
                        <td class="latop_name">${rvo.laptop_name }</td>
                        <td class="subject">
                            <a href="view?cPage=${nowPage }&r_idx=${rvo.r_idx}">
                            ${rvo.subject }
                            </a>
                        </td>
                        <td class="writer">${rvo.writer }</td>
                        <td class="reg">
                        <c:if test="${rvo.write_date ne null }">
                        	${fn:substring(rvo.write_date, 0, 10) }
                        </c:if>	
                        </td>
                        <td class="hit">${rvo.hit }</td>
                    </tr>
                   	</c:forEach>
				</c:if>
                <c:if test="${rar eq null }">
                	<tr>
                		<td colspan="6" class="empty">
                			등록된 게시물이 없습니다.
                		</td>
                	</tr>
                </c:if>
                </tbody>
            </table>
            
            <div class="write">
                <a href="#" class="writebtn">글쓰기</a>
            </div>
            
            <div class="paging">
                <a href="#" class="pagebtn">첫페이지</a>
                <a href="#" class="pagebtn">이전 페이지</a>
                <a href="#" class="pageNum on">1</a>
                <a href="#" class="pageNum">2</a>
                <a href="#" class="pageNum">3</a>
                <a href="#" class="pagebtn">다음 페이지</a>
                <a href="#" class="pagebtn">마지막페이지</a>
            </div>
        </div>
    </section>
<script type="text/javascript" src="js/common.js"></script>
</body>
</html>