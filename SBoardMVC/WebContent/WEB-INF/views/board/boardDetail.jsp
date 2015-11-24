<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	$("#delete").click(function(){
		var url="${pageContext.request.contextPath}/board/deleteBoard?no=${vo.no}";
		location.href=url;
	});
	
	$("#modify").click(function(){
		var url="${pageContext.request.contextPath}/board/modifyBoard?no=${vo.no}";
		location.href=url;
	});
		
	$("#list").click(function(){
		var url="${pageContext.request.contextPath}/board/BoardList";
		location.href=url;
	});

});
</script>
<link href="/SBoardMVC/resources/styleBoardDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
<table id="viewForm" border=1>
	<tr>
		<td colspan="2">작성자</td><td colspan="2">
			<spring:message text="${vo.writer}"/>
		</td>
	</tr>
	<tr>
		<td>작성일</td><td align="center">${vo.regdate}</td>
		<td>조회수</td><td align="center">${vo.readhit}</td>
	</tr>
	<tr>
		<td colspan="2">제목</td>
		<td name="subject" colspan="2" align="center">
		${vo.subject}</td>
	</tr>
	<tr>
		<td colspan="4">
		<textarea name="content" cols="100" rows="16" readonly>
		${vo.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2"><label for="file">첨부파일</label></td><td colspan="2">
			<c:choose>
				<c:when test="${vo.filename != '' || vo.filename != null}">
					<a href="#">
						<spring:message text="${vo.filename}"/>
					</a><spring:message text="(${vo.filesize}KB)"/>
				</c:when>
				<c:otherwise>
					없음
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td align="left"><button id="modify">수정</button></td>
		<td align="right"><button id="reply">답글</button> </td>
		<td align="left"><button id="list">목록</button></td>
		<td align="right"><button id="delete">삭제</button></td>
	</tr>
</table>
<div id="d1">
</div>
<div id="replyinput">
	<textarea rows="5" cols="80" name="replycontent" id="replycontent">
	</textarea><button id="replyButton">확인</button>
</div>
</body>
</html>