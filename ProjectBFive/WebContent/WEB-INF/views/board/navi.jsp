<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	margin: auto;
	text-align: center;
}
div a:LINK {
	text-decoration: none;
	color: black;
}
div a:VISITED {
	color: black;
}
div a:HOVER {
	color: blue;
	background-color: #cccccc;
	font-weight: bold;
}
</style>
</head>
<body>
<div>
	<a href="${navi.url}nowPage=1">
		[처음]
	</a>
	<c:if test="${navi.nowPage != 1}">
		<a href="${navi.url}nowPage=${navi.nowPage-1}">◀</a>
	</c:if>
	<c:forEach var="i" begin="${navi.beginPage}" end="${navi.endPage}">
		<c:choose>
			<c:when test="i==${navi.nowPage}">
				<h3>${i}</h3>
			</c:when>
			<c:otherwise>
				<a href="${navi.url}nowPage=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${navi.nowPage != navi.totalPage}">
		<a href="${navi.url}nowPage=${navi.nowPage+1}">▶</a>
	</c:if>
	<a href="${navi.url}nowPage=${navi.totalPage}">
		[끝]
	</a>
</div>
</body>
</html>