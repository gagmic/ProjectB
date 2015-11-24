<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
src="/SBoardMVC/resources/js/jqueryui/jquery-ui.min.js">
</script>
<script type="text/javascript">
$(function(){
	$("#id").blur(function(){
		//var v = $(this).val();
		$.ajax({
			url:"/SBoardMVC/regist/checkid",
			data:{v:$(this).val()},
			method:"GET",
			success:function(data){
				$("#result").text(data);
			}
		});
	});
	$("#dialog").dialog({
		autoOpen:false,
		resizable:true,
		height: 400,
		width: 600
	});
	$("#openDialog").click(function(){
		$("#dialog").dialog("open");
	});
	$("#daiclose").click(function(){
		$("#dialog").dialog("close");
	});
	$("#sebutton").click(function(){
		$.ajax({
			url:"/SBoardMVC/regist/ziplist",
			data:{v:$("#search-zipcode").val()},
			method:"GET",
			dataType:"html",
			success:function(data){
				$("#ziplist").append(data);
			}
		});
	});
});
</script>
<link href="/SBoardMVC/resources/styleRegist.css" rel="stylesheet" type="text/css">
<link href="/SBoardMVC/resources/js/jqueryui/jquery-ui.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="dialog">
	<div id="search">
	<input type="text" id="search-zipcode" name="search-zipcode"
	size="50">
	<button id="sebutton">검색</button>
	</div>
	<div>
		<table id="ziplist">
			<tr>
				<th>우편번호</th>
				<th>주소</th>
			<tr>
		</table>
	</div>
	<button id="daiclose">닫기</button>
</div>
<h3 align="center">회원 가입 화면</h3>
   <form:form action="/SBoardMVC/regist/register" method="post" 
   commandName="vo">
      <table border="1" align="center" width="70%">
         <tr>
            <td width="25%" align="center">
            	<label for="id">아이디</label>
            </td>
            <td width="75%" align="left">
            <form:input path="id"/>
               <span id="result"></span></td>
         </tr>
         <tr>
            <td width="25%" align="center">
            	<label for="name">이름</label>
            </td>
            <td width="75%" align="left">
            <form:input path="name"/>
            </td>
         </tr>
         <tr>
            <td align="center">
            	<label for="password">비밀 번호</label>
            </td>
            <td width="75%" align="left">
            <form:input path="password"/>
            </td>
         </tr>
         <tr>
            <td width="25%" align="center">
            	<label for="salary">급여</label>
            </td>
            <td width="75%" align="left">
            	<form:input path="salary"/>
            </td>
         </tr>
         <tr>
            <td width="25%" align="center">
            	<label for="salary">성별</label>
            <td width="75%" align="left">
            <form:radiobuttons items="${genderlist}" path="gender"/> 
         </tr>
         <tr>
            <td width="25%" align="center">
            	<label for="hobby">취미</label>
            <td width="75%" align="left">
            <form:checkboxes items="${hobbylist}" path="hobby"/>
            </td>
         </tr>
         <tr>	
            <td width="25%" align="center">
            	<label>직업</label>
            </td>
            <td width="75%" align="left">
            <form:select path="job" items="${joblist}"/>
            </td>
         </tr>
         <tr>
            <td width="25%" align="center">우편 번호</td>
            <td width="75%" align="left"><input type="text"
               class="setdiaabledme" name="zipcode" id="zipcode" readonly="readonly"> <input
               type="button" id="openDialog" value="우편 번호 찾기"></td>
         </tr>
         <tr>
            <td width="25%" align="center">주소</td>
            <td width="75%" align="left"><input type="text"
               class="setdiaabledme" name="address1" id="address1" size="40" readonly="readonly"></td>
         </tr>
         <tr>
            <td width="25%" align="center">세부 주소</td>
            <td width="75%" align="left"><input type="text" name="address2"
               size="40"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit"
               value="회원 가입"> <input type="reset" value="취소"></td>
         </tr>
      </table>
   </form:form>
   </body>
</html>
<script type="text/javascript">
function insert_address(z,v){
	$("#zipcode").val(z);
	$("#address1").val(v);
	$("#dialog").dialog("close");
}
</script>