<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" 
src="/SBoardMVC/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#commit").click(function(){
		var sub = $("#subject").val();
		var con = $("#content").val();
		if(sub==""){
			alert("제목을 입력해주세요");
			return false;
		}else if(con==""){
			alert("내용을 입력해주세요");
			return false;
		}
	});
	$("#reset").click(function(){
		location.href="/SBoardMVC/board/BoardList";
		return false;
	});
});
</script>
<style type="text/css">
table,tr,td{
	top:30px;
	border:1px solid black;
}
table{
	margin:auto;
	width:80%;
}
.content{
	height:500px;
}
</style>
</head>
<body>
<form:form commandName="vo" 
action="/SBoardMVC/board/insertBoard" encType="multipart/form-data">
<form:hidden path="writer"/>
<form:hidden path="password"/>
<table>
	<tr>
		<td>제목 : 
			<form:input path="subject"/>
		</td>
	</tr>
	<tr class="content">
		<td><form:textarea rows="16" cols="100" 
		path="content"/><br>
		<label>파일첨부 : 
		<input type="file" name="file" id="file" multiple></label>
		</td>
	</tr>
	<tr>
		<td>
			<button id="commit">등록</button>
			<button id="reset">취소</button>
		</td>
	</tr>
</table>
</form:form>
</body>
</html>