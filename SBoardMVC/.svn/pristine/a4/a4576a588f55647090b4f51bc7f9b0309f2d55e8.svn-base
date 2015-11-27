<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/SBoardMVC/resources/styleBoardInsert.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
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
		}else{
			document.form.submit();
		}
	});
	$("#reset").click(function(){
		location.href="/SBoardMVC/board/BoardList";
		return false;
	});
});
</script>
</head>
<body>
<div>
	<form action="/SBoardMVC/board/insertContent" encType="multipart-form/data">
   <table>
	<tr>
		<td>제목 : 
			<input type="text" id="subject" name="subject">
		</td>
	</tr>
	<tr class="content">
		<td><textarea rows="16" cols="100" 
		id="content" name="content"></textarea><br>
		<label>파일첨부 : 
		<input type="file" name="file" id="file"></label>
		</td>
	</tr>
	<tr>
		<td>
			<button id="commit">등록</button>
			<button id="reset">취소</button>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>


