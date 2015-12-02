<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세 보기</title>
<style type="text/css">
#replyinput, #d1{
	margin:auto;
	width:50%;
}
</style>
<script type="text/javascript" 
src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#deleteButton").click(function(){
		var url="${pageContext.request.contextPath}/board/deleteBoard?no=${vo.no}";
		location.href=url;
	});
	$("#modifyButton").click(function(){
		var url="${pageContext.request.contextPath}/board/modifyBoard?no=${vo.no}";
		location.href=url;
	});
	
	$.ajax({
		url:"/SBoardMVC/reply/replyList?no=${vo.no}",
		type:"get",
		dataType:"html",
		success:function(data){
			$("#d1").html(data);
		}
	});
	
	$(document).on("click","#delReply",function(){
		var id = $(this).attr("no");
		var no = ${vo.no};
		$.ajax({
			url:"${pageContext.request.contextPath}/reply/deleteReply?id="+id+"&no="+no,
			type:"get",
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
			}
		});
	});
	
	$("#replyButton").click(function(){
		var no = ${vo.no};
		 $.ajax({
			url:"${pageContext.request.contextPath}/reply/insertReply",
			type:"post",
			data:{
				no : no,
				content : $("#replycontent").val()
			},
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
				$("#replycontent").val("");
			},
			error:function(){
				alert("답글 입력에 실패하였습니다.");	
			} 
		});
	});
	
	$(document).on("click","#modReply",function(){
		var id = $(this).attr("no");
		var contentid = $(this).attr("rec");
		var content = $("#"+contentid).text().trim();
		var head = $(this).attr("head");
		var tag = "<textarea rows=\"5\" cols=\"80\""+
				  "name=\"recont\" id=\"recont\">"+
				   content+"</textarea>"+
				   "<button id=\"modbutton\" no="+id+">수정</button>";
		$("#"+head).html(tag);
	});
	
	$(document).on("click","#modbutton",function(){
		var id = $(this).attr("no");
		var no = ${vo.no};
		var recont = $("#recont").val();
		$.ajax({
			url:"${pageContext.request.contextPath}"+
			"/reply/updateReply?id="+id+"&no="+no+
					"&recont="+recont,
			type:"get",
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
			}
		});
	});
	
	$(document).on("click","#subReply",function(){
		var id = $(this).attr("no");
		var head = $(this).attr("head");
		var tag = "<div><textarea rows=\"5\" cols=\"80\""+
				  "name=\"subcont\" id=\"subcont\"></textarea>"+
				   "<button id=\"subbutton\"  spid=\""+id+"\">등록</button></div>";
		$("#"+head).after(tag);
	});
	
	$(document).on("click","#subbutton",function(){
		var no = ${vo.no};
		var subcont = $("#subcont").val();
		var id = $(this).attr("spid");
		alert(no+":"+subcont+":"+id);
		$.ajax({
			url:"${pageContext.request.contextPath}/reply/insertSubReply",
			data:{
				no : no,
				content : subcont,
				id : id
			},
			type:"post",
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
			}
		});
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
		<td>작성일</td><td align="center">
		<spring:message text="${vo.regdate}"/></td>
		<td>조회수</td><td align="center">
		<spring:message text="${vo.readhit}"/></td>
	</tr>
	<tr>
		<td colspan="2">제목</td>
		<td name="subject" colspan="2" align="center">
		<spring:message text="${vo.subject}"/></td>
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
					<a href="/SBoardMVC/board/downloadFile?no=${vo.no}">
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
		<td align="left"><button id="modifyButton">수정</button></td>
		<td align="right"><button id="addButton">답글</button> </td>
		<td align="left"><button id="goback">목록</button></td>
		<td align="right"><button id="deleteButton">삭제</button></td>
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