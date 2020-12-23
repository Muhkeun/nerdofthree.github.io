<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lapflix | 글쓰기</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/write.css">
    <link rel="stylesheet" href="css/summernote-lite.min.css">
    <script src="https://kit.fontawesome.com/aa5b301900.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/summernote-lite.min.js"></script>
	<script src="js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript" src="js/saveImage.js"></script>
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
        <div class="board_list_wrap">
            <table class="board_list">
                <caption>리뷰 목록</caption>
                    <table>
                        <tbody>
                            <div id="contents_sub">
                                
                                <div class="bbs_area" id="bbs">
                                    
                                    <form method="post" id="frm" enctype="multipart/form-data">
                                        
                                        <input type="hidden" name="cPage" value="${param.cPage }"/>
										<input type="hidden" name="r_idx" value="${sessionScope.rvo.r_idx }"/>
                                        <table summary="리뷰 수정">
                                            <caption>리뷰 수정</caption>
                                            <colgroup>
                                                <col width="20%"/>
                                                <col width="80%"/>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>노트북 이름</th>
                                                    <td><input id="laptop_name" type="text" name="laptop_name" size="45" value="${sessionScope.rvo.laptop_name }"/></td>
                                                </tr>
                                                <tr >
                                                    <th>제목</th>
                                                    <td><input id="subject" type="text" name="subject" size="45" value="${sessionScope.rvo.subject}"/></td>
                                                </tr>
                                                <tr>
                                                    <th>내용</th>
                                                    <td>
                                                        <textarea id="content" name="content" cols="50" rows="8" value="${sessionScope.rvo.content}"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>첨부파일<c:if test="${sessionScope.rvo.file_name ne null }">(${sessionScope.rvo.file_name })</c:if></th>
                                                    <td><input id="file" type="file" name="file"/></td>
                                                </tr>
                                                
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="write">
                                                            <a href="javascript:sendData()" class="write_btn">수정</a>
                                                            <a href="javascript:goView()" class="cancel_btn">취소</a>
                                                            <a href="javascript:goList()" class="list_btn">목록</a>
                                                        </div>

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                    
                                </div>
                            </div>
                         
                        </div>
                    </section>
                <script>
	                function goList(){
	            		location.href="review?cPage=${param.cPage}";
	            	}
	            	
	            	function sendData(){
	            		var laptop_name = document.getElementById("laptop_name").value;
	            		var subject = document.getElementById("subject").value;
	            		var content = document.getElementById("content").value;
	            		
	            		if(laptop_name.trim().length < 1){
	            			alert("노트북이름을 입력하세요.");
	            			
	            			document.getElementById("laptop_name").focus();
	            			return;
	            		}
	            		
	            		if(subject.trim().length < 1){
	            			alert("제목을 입력하세요.");
	            			
	            			document.getElementById("subject").focus();
	            			return;
	            		}
	            		
	            		if(content.trim().length < 1){
	            			alert("내용을 입력하세요.");
	            			
	            			document.getElementById("content").focus();
	            			return;
	            		}
	            		
	            		
	            		document.forms[0].action = "/edit";
	            		document.forms[0].submit();
	            	}
	            	
	            	function goView(){
	            		location.href = "view?cPage=${param.cPage}&r_idx=${sessionScope.rvo.r_idx}";
	            		
	            	}
                </script>
                </body>
</html>