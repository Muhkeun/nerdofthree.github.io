<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<header>
	<input type="checkbox" id="chk1">
	<div class="logo">
    	<h2>Lapflix</h2>
	</div>
	<input type="hidden" value="${sessionScope.svo }" id="svo"/>
	<ul>
		<li><a href="/">Survey</a></li>
		<li><a href="javascript:result()">Result</a>
		<li><a href="review">Review</a></li>     
      
	<%--로그인 --%>  
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
		<input type="text" name="search" id="srch" required placeholder="Enter your search">
		<btn type="submit">Search</btn>
	</div>
	<label for="chk1" class="menu-open">
		<i class="fas fa-bars" aria-hidden="true"></i>
	</label>
</header>