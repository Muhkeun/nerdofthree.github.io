<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/resources/css/review.css"/>
</head>
<body>
<div id="wrap">
	<!-- 상단 영역 -->
<%-- 	<jsp:include page="../header.jsp"/> --%>
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 40px; color: #000; margin-bottom: 15px;">review</h1>
		<div class="bbs_area" id="bbs">
			<table summary="게시판 목록">
				<caption>게시판 목록</caption>
				<thead>
					<tr class="title">
						<th class="no">번호</th>
						<th class="subject">제목</th>
						<th class="writer">글쓴이</th>
						<th class="reg">날짜</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
				
				<tfoot>
	                      <tr>
	                          <td colspan="4">
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
						<td>${rowTotal - st.index - (blockList*(nowPage - 1)) }</td><!-- 데이터가 삭제된 경우 b_idx도 끊어져서 표시됨
												제일 나중에 저장된 데이터가 페이지의 제일 위에. -->
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
						<td colspan="5" class="empty">
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
<%-- 	<jsp:include page="../footer.jsp"/> --%>
	<!-- 하단 영역 끝 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

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
</script>
</body>
</html>