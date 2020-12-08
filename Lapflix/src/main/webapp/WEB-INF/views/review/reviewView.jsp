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
	         <button type="submit">Search</button>
	    </div>
	    <label for="chk1" class="menu-open">
	        <i class="fas fa-bars" aria-hidden="true"></i>
	    </label>
	</header>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 40px; color: #000; margin-bottom: 15px;">리뷰 보기</h1>
		<div class="bbs_area" id="bbs">
		
			<form method="post" name="frm">
				<input type="hidden" name="cPage" value="${param.cPage }">
				<input type="hidden" name="r_idx" value="${vo.r_idx }">

				<table summary="리뷰 보기">
					<caption>리뷰 보기</caption>
					
					<tbody>
						<tr>
							<td>노트북 이름</td>
							<td>${vo.laptop_name }</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${vo.subject }</td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${vo.writer }</td>
						</tr>
						<tr>
							<td>날짜</td>
							<c:if test="${vo.write_date ne null }">
								<td>${fn:substring(vo.write_date, 0, 10) }</td>							
							</c:if>
						</tr>
						<tr>
							<td>내용</td>
							<td>${vo.content }</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>${vo.hit }</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
							<c:if test="${vo.file_name ne null}">
								<a href="javascript:fDown('${vo.file_name }')">
									${vo.file_name }
								</a>
							</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<c:if test="${vo.writer eq mvo.member_name }">
								<input type="button" value="수정" onclick="editReview()"/>
								<input type="button" value="삭제" onclick="delReview()"/>
							</c:if>
								<input type="button" value="목록" onclick="goList()"/>
							
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<form method="post" action="ans_write.jsp">
<!-- 				이름:<input type="text" name="writer"/><br/> -->
<!-- 				내용:<textarea rows="4" cols="55" name="comm"></textarea><br/> -->
<!-- 				비밀번호:<input type="password" name="pwd"/><br/> -->
			
			
			<input type="hidden" name="r_idx" value="${vo.r_idx }">
			<input type="hidden" name="index" value=""/>
<!-- 			<input type="submit" value="저장하기"/>  -->
			</form>
	
<!-- 	댓글들<hr/> -->
<%-- 		<c:forEach var="cvo" items="${vo.c_list }"> --%>
<!-- 			<div> -->
<%-- 				이름:${cvo.writer } &nbsp;&nbsp; --%>
<%-- 				날짜:${cvo.write_date }<br/> --%>
<%-- 				내용:${cvo.content } --%>
<!-- 			</div> -->
<%-- 		</c:forEach> --%>
			
		</div>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단 영역 -->
	
	<!-- 하단 영역 끝 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>
	function goList(){
		location.href="review?cPage=${param.cPage}";
	}
	
	function editReview(){
		document.frm.action = "edit";
		document.frm.submit();
	}
	function fDown(fname){
		location.href="FileDownload?dir=/resources/upload&filename="+encodeURIComponent(fname);//한글처리
														//get방식을 위한 한글처리는 따로 있지만 그냥 써보자
		//get방식 한글처리를 하기 위해서는 톰켓의 server.xml에서 
		//<Connector port="8080" protocol="HTTP/1.1"...URIEncoding="UTF-8" 추가
		//<Connector port="8009" protocol=AJP/1.3"...URIEncoding="UTF-8" 추가 //다른 사람과 통신을 하기 위한. 현재 server.xml에는 주석처리 되어있으니 pass 
	}
	function delReview(){
		
		var r_idx = $("input[name=r_idx]").val();
		
		$.ajax({
			url: "del",
			data: "r_idx="+r_idx,
			dataType: "json",
			
		}).done(function(data){
			
			if(data.chk == "0"){
				alert("삭제가 완료되었습니다.");
				location.href="/review?bname=${vo.bname}&cPage=${param.cPage}";
			}
		});
	}
</script>
</body>
</html>