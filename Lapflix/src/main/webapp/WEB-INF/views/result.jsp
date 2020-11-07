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
</style> 
</head>
<body>
    <h1>결과</h1>
    
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
</body>
</html>
