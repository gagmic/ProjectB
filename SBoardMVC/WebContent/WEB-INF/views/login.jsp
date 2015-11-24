<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/styleLogin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
/* $(function(){
	$("#regist").click(function(){
		location.href="/SBoardMVC/regist/registPage";
	});
}) */
</script>
</head>
<body>
	<div class="login-card">
    <h1>로그인</h1><br>
  <form action="/SBoardMVC/login/welcomePage">
    <input type="text" name="id" id="id" placeholder="아이디">
    <input type="password" name="pw" id="pw" placeholder="비밀번호">
    <input type="submit" name="login" class="login login-submit" value="로그인">
  </form>
    
  <div class="login-help">
    <a href="/SBoardMVC/regist/registPage">회원가입</a> • <a href="#">비밀번호를 잊었니</a>
  </div>
</div>
</body>
</html>