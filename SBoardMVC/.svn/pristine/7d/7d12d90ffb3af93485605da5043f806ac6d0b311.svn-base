<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#newContent").click(function(){
		location.href="/SBoardMVC/board/prepareInsertBoard";
	})
});
</script>
<link href="/SBoardMVC/resources/styleBoard.css" rel="stylesheet" type="text/css">
</head>
<body>
<table>
<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
	</tr>
</thead>
<tbody>	
	<c:forEach var="ls" items="${list}">
		<tr>
			<td>${ls.num}</td>
			<td><a href="/SBoardMVC/board/boardDetail?no=${ls.no}">
			${ls.subject}</a></td>
			<td>${ls.writer}</td>
			<td>${ls.regdate}</td>
		<tr>
	</c:forEach>
	<tr>
		<td colspan="4"><button id="newContent">새글쓰기</button></td>
	</tr>
</tbody>
</table>
	<jsp:include page="navi.jsp">
		<jsp:param value="${navi}" name="navi"/>
	</jsp:include>
</body>
</html>


