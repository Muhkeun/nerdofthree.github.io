<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/review.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
<%-- 	<jsp:include page="../header.jsp"/> --%>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 40px; color: #000; margin-bottom: 15px;">리뷰 보기</h1>
		<div class="bbs_area" id="bbs">
		
			<form method="post" name="frm">
				<input type="hidden" name="cPage" value="${param.cPage }">
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
								<input type="button" value="수정" onclick="editBbs()"/>
								<input type="button" value="삭제" onclick="delBbs()"/>
							</c:if>
								<input type="button" value="목록" onclick="goBack()"/>
							
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
<%-- 	<jsp:include page="../footer.jsp"/> --%>
	<!-- 하단 영역 끝 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
	function goBack(){
		location.href="review?cPage=${param.cPage}";
	}
	
	function editBbs(){
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
</script>
</body>
</html>