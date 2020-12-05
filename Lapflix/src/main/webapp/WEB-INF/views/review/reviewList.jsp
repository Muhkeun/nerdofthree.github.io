<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/header.css">
<link type="text/css" rel="stylesheet" href="/css/review.css"/>
<style>
	#p_img{
		display: inline-block;
		width: 30px;
		height: 30px;
	}
</style>
</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
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
            
        <c:if test="${sessionScope.mvo eq null }">
            <li id="login"><a href="/signIn">Login</a></li>
        </c:if>
          
         <c:if test="${sessionScope.mvo ne null }">
        	<li id = "logout"><a href="javascript:logout_ok()" ><img id="p_img" src="/upload/${sessionScope.mvo.profile_image }"/></a></li>
        </c:if>  
        
        <!-- 	로그인 시 li 태그에 id만 부여, 
        		버튼을 눌렀을 때 분만 아니라 첫 페이지 업로드 시 login/out 떠야하므로 c:if 유지
        		j쿼리로 logout 클릭시 li 태그 안의 내용을 Login a태그로 변경한다.
        -->
     
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
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 40px; color: #000; margin-bottom: 15px;">review</h1>
		<div class="bbs_area" id="bbs">
			<table summary="게시판 목록">
				<caption>게시판 목록</caption>
				<colgroup>
					<col width="5%"/>
					<col width="20%"/>
					<col width="40%"/>
					<col width="10%"/>
					<col width="20%"/>
					<col width="5%"/>
				</colgroup>
				<thead>
					<tr>
						<td colspan="6">
							<form action="/review" method="post">
								<input type="hidden" name="type" value="search"/>
								<select id="searchType" name="searchType">
									<option value="0">노트북이름</option>
									<option value="1">제목</option>
									<option value="2">글쓴이</option>
								</select>
								<input type="text" id="searchValue" name="searchValue"/>
								<input type="button" value="검색" onclick="search(this.form)"/>
							</form>
						</td>
					</tr>
					<tr class="title">
						<th class="no">번호</th>
						<th class="laptop_name">노트북이름</th>
						<th class="subject">제목</th>
						<th class="writer">글쓴이</th>
						<th class="reg">날짜</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
				
				<tfoot>
                	<tr>
                    	<td colspan="5">
                           ${p_code }
                        </td>
				  		<td>
							<input type="button" value="글쓰기" id="write_btn"/>
				  		</td>
                	</tr>
                </tfoot>
				<tbody>
				<c:if test="${rar ne null }">
					<c:forEach var="rvo" items="${rar }" varStatus="st">
					<tr>
						<td>${rowTotal - st.index - (blockList*(nowPage - 1)) }</td>
						<td>${rvo.laptop_name }</td>
						<td style="text-align: left">
							<a href="view?cPage=${nowPage }&r_idx=${rvo.r_idx}">
							${rvo.subject }
							</a></td>
						<td>${rvo.writer }</td>
						<td>
						<c:if test="${rvo.write_date ne null }">
							${fn:substring(rvo.write_date, 0, 10) }
						</c:if>
						</td>
						<td>${rvo.hit }</td>
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
		</div>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단 영역 -->
	<!-- 하단 영역 끝 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>
	$(function(){
		$("#write_btn").bind("click", function(){
			$.ajax({
				url: "write",
				dataTyape: "json",
			}).done(function(data){
				//data 안에 chk라는 변수가 0이면 로그인이 필요한 상황이다.
				if(data.chk == "0"){
					alert("로그인이 필요합니다.");
				}
				
				location.href=data.url;
			});
		});	
	});
	
	function search(frm){
		frm.submit();
	}
</script>
</body>
</html>