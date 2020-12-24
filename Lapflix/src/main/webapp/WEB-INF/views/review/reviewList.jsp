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
    <!-- 상단 -->
	<jsp:include page="reviewHeader.jsp"/>
	<!-- 상단 끝 -->
    <section>
        <div class="board_list_wrap">
            <table class="board_list">
                <caption>리뷰 목록</caption>
                	<form action="/review" method="post">
						<input type="hidden" name="type" value="search"/>
						<select id="searchType" name="searchType">
							<option value="0">모델명</option>
							<option value="1">제목</option>
							<option value="2">글쓴이</option>
						</select>
						<input type="text" id="searchValue" name="searchValue"/>
						<input type="button" value="검색" onclick="search(this.form)"/>
					</form>

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
                <a href="#" class="write_btn">글쓰기</a>
            </div>
            
            <div class="paging">
            	${p_code }
            </div>
        </div>
    </section>
<script type="text/javascript" src="js/common.js"></script>
<script>
	$(function(){
		$(".write_btn").bind("click", function(){
			$.ajax({
				url: "write",
				dataType: "json",
			}).done(function(data){
				if(data.chk == "0"){
					alert("로그인이 필요합니다.");
				}
				location.href = data.url;
			});
		});
	});
	
	function search(frm){
		frm.submit();
	}

</script>
</body>
</html>