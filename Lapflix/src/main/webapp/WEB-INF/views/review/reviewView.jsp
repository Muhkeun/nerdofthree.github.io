<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/view.css">
    <script src="https://kit.fontawesome.com/aa5b301900.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/common.js"></script>
</head>
<body>
    <header>
        <input type="checkbox" id="chk1">
        <div class="logo">
            <h2>Lapflix</h2>
        </div>
        <ul>
	        <li><a href="/">Survey</a></li>
	        <li><a href="#" id="modal-btn">Result</a></li>
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
        <div id="view_wrap">
        	<form method="post" name="frm">
	        	<input type="hidden" name="cPage" value="${param.cPage }">
				<input type="hidden" name="r_idx" value="${vo.r_idx }">
			</form>
            <h1 id="laptop_name">
                ${vo.laptop_name }
            </h1>
            <div id="subject_date">
                <h1 id="subject">${vo.subject }</h1>
                <span id="write_date">${fn:substring(vo.write_date, 0, 10) }</span>
            </div>
            <div id="writer_hit">
                <div id="writer">${vo.writer }</div>
                <div id="hit"><span>조회수: ${vo.hit }</span></div>
            </div>
            <div id="contents">
                ${vo.content }
            </div>
            <div class="btnarea">
<!--                 <a href="#">이전글</a> -->
                <div >
	            <c:if test="${vo.writer eq mvo.member_name }">
	                <a href="javascript:editReview()">수정</a>
	                <a href="javascript:delReview()">삭제</a>
	            </c:if>
	                <a href="javascript:goList()">목록</a>
                </div>
<!--                 <a href="#">다음글</a> -->
            </div>
            <div id="file">
            	<c:if test="${vo.file_name ne null }">
                <th id="file_th">첨부파일</th>
                <td>
                
                    <li>
                        <a id="file_name" href="javascript:fDown('${vo.file_name }')">
                        ${vo.file_name }
                        </a>
                    </li>
                </c:if>
                </td>
            </div>
        </div>
        </section>
<script>
	function editReview(){
		document.frm.action = "edit";
		document.frm.submit();
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
	
	function goList(){
		location.href="review?cPage=${param.cPage}";
	}
	
	function fDown(fname){
		location.href="FileDownload?dir=/resources/upload&filename="+encodeURIComponent(fname);
	}
</script>        
</body>
</html>