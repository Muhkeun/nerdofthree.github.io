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
	table{
		width: 900px;
	}
	table th{
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
    <table>
    	<colgroup>
    		<col width="20%"/>
    		<col width="35%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="5%"/>
    	</colgroup>
    	<thead class="table">
    		<tr>
    			<th>노트북 이미지</th>
    			<th>노트북이름</th>
    			<th>CPU</th>
    			<th>GPU</th>
    			<th>모니터 사이즈(인치)</th>
    			<th>OS</th>
    			<th>무게(kg)</th>
    		</tr>
    	</thead>
    	<tbody class="table">
    	<c:if test="${ar ne null }">
    	<c:forEach var="l_list" items="${ar }">
    		<tr>
    			<th><img src="${l_list.laptop_ImageURL }" width="130px", height="130px"/></th>
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
    			<th>${l_list.laptop_weight }</th>
    		</tr>	
    	</c:forEach>
    	</c:if>
    	<c:if test="${ar eq null }">
    		<tr>
    			<th colspan="7">표시할 데이터가 없습니다.</th>
    		</tr>
    	</c:if>
    	</tbody>
    </table>
</body>
</html>
