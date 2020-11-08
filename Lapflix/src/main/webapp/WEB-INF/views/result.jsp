<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/11/04
  Time: 9:24 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>   
<style>
	.table{
		border-collapse: collapse;
	}
	.table th{
		border: 1px solid black;
		border-collapse: collapse;
		width: 150px;
	}
	.txt_right{
		text-align: right;
	}
	#sort{
		text-align: right;
	}
</style> 
</head>
<body>
    <h1>결과</h1>	
    <h1>${sort }</h1>
 	<select id="sort" name="sort">
 		<option value="0">노트북이름순</option>
 		<option value="1">성능순</option>
 		<option value="2">모니터크기순</option>
 	</select>
 	
    <table>
    	<thead class="table">
    		<tr>
    			<th>노트북이름</th>
    			<th>CPU</th>
    			<th>GPU</th>
    			<th>모니터 사이즈</th>
    			<th>OS</th>
    		</tr>
    	</thead>
    	<tbody class="table">
    	<c:if test="${ar ne null }">
    	<c:forEach var="l_list" items="${ar }">
    		<tr>
    			<th>${l_list.laptop_Name }</th>
    			<th>${l_list.cpu_Name }</th>
    		<c:if test="${l_list.gpu_Name ne null }">
    			<th>${l_list.gpu_Name }</th>
    		</c:if>
    		<c:if test="${l_list.gpu_Name eq null }">
    			<th>-</th>
    		</c:if>
    			<th>${l_list.laptop_MonitorSize }</th>
    			<th>${l_list.laptop_OS }</th>
    		</tr>	
    	</c:forEach>
    	</c:if>
    	<c:if test="${ar eq null }">
    		<tr>
    			<th colspan="5">표시할 데이터가 없습니다.</th>
    		</tr>
    	</c:if>
    	</tbody>
    </table>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <script>
    	$(function(){
    		$("#sort").bind("click", function(){
    			if(var sort == null){
    				sort = $("#sort").val();
    			}
    			$.ajax({
    				url: "result",
    				type: "post",
    				data: "sort="+sort
    				
    			}).done(function(data){
    				if(data.res == "0")
    					alert("이름순으로 sort합니다.");
    				else if(data.res == "1")
    					alert("성능순으로 sort합니다.");
    				else if(data.res == "2")
    					alert("모니터사이즈순으로 sort합니다.");
    			});
    		});
    	});
    </script>
</body>
</html>
