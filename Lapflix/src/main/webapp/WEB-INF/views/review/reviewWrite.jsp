<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/summernote-lite.min.css">
<style>
	#contents_sub>h1{
		padding-left: 25px;
	}
	
	#bbs table {
	    width:915px;
	    margin: auto;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th, td{
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	#subject, #laptop_name{
	   display: inline-block;
	   width: 100%;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
	
	.empty{
		height: 50px;
	}
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
	<!-- 상단 영역 끝 -->
	<!-- 콘텐츠 영역 -->
	<div id="contents_sub">
		<h1 style="font-size: 40px; color: #000; margin-bottom: 15px;">리뷰 쓰기</h1>
		<div class="bbs_area" id="bbs">
		
			<form action="write_ok" method="post" id="frm" enctype="multipart/form-data">
				
				<input type="hidden" name="bname" value="review"/>
				<table summary="리뷰 글쓰기">
					<caption>리뷰 글쓰기</caption>
					<colgroup>
						<col width="20%"/>
						<col width="80%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>노트북 이름</th>
							<td><input id="laptop_name" type="text" name="laptop_name" size="45"/></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input id="subject" type="text" name="subject" size="45"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="content" name="content" cols="50" rows="8"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input id="file" type="file" name="file"/></td>
						</tr>
		
						<tr>
							<td colspan="2">
								<input type="button" value="저장" onclick="sendData()"/>
								<input type="button" value="목록" onclick="goList()"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			
		</div>
	</div>
	<!-- 콘텐츠 영역 끝-->
	<!-- 하단 영역 -->
	<!-- 하단 영역 끝 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="js/summernote-lite.min.js"></script>
<script src="js/lang/summernote-ko-KR.js"></script>
<script type="text/javascript" src="js/saveImage.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>
	function sendData(){
		var laptop_name = document.getElementById("laptop_name").value;
		var subject = document.getElementById("subject").value;
		var content = document.getElementById("content").value;
		var file = document.getElementById("file").value;
		
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
		
		if(!file){
			alert("파일을 첨부해 주세요.");
			return;
		}
		document.forms[0].submit();
		
	}
	
	function goList(){
		location.href="review?cPage=${param.cPage}";
	}
	
	
</script>
</body>
</html>
