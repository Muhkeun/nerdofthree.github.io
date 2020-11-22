<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#table{
		width: 900px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	#table tr th{
		border: 1px solid black;
	}
</style>
</head>
<body>
	<h1>favorite 결과</h1>
	<table id="table">
		<colgroup>
			<col width="30%"/>
			<col width="10%"/>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
		<thead>
			<tr>
				<th>LAPTOP_NAME</th>
				<th>LAPTOP_SEQ</th>
				<th>PRICE</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${sessionScope.far ne null }">
		<c:forEach var="f_list" items="${far }">
			<tr>
				<th>${f_list.laptop_Name }</th>
				<th>${f_list.laptop_seq }</th>
				<th>${f_list.laptop_Price } won</th>
				<th><a href="${f_list.laptop_url }">${f_list.laptop_url }</a></th>
			</tr>
		</c:forEach>
		</c:if>
		</tbody>
	</table>
</body>
</html>