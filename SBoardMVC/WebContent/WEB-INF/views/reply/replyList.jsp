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
/* $(function(){
	$(".creater").click(function(){
		var attr = $(this).parent().attr("alt");
		var arra = attr.split(":");
		//alert(arra);
		var v = '<div class="editer" alt="'+ 
				arra[0]+':'+arra[1]+':'+
				(Number(arra[2])+1)+':'+
				(Number(arra[3])+1)+
				'">'+
				'	<textarea id="rcontent"></textarea>'+
				'   <button class="rsubmit">등록</button>'+
				'	<button class="rreset">취소</button>'+
				'</div>';
		$(this).parent().after(v);
	});
	//동적 바인딩 - 동적으로 생성되는 객체에 이벤트를 부여할경우 생성
	$(document).on("click",".rreset",function(){
		$(this).parent().remove();
	});
	
	$(".modifier").click(function(){
		var attr = $(this).parent().attr("alt");
		var arra = attr.split(":");
		//alert(arra);
		var cont = $(this).parent().find("span").html();
		//alert(cont);
		var v = '<div class="editer" title="'+
				arra[0]+'" alt="'+ 
					arra[0]+':'+arra[1]+':'+
					(Number(arra[2])+1)+':'+
					(Number(arra[3])+1)+
					'">'+
				'	<textarea id="mcontent">'+cont+'</textarea>'+
				'   <button class="msubmit">등록</button>'+
				'	<button class="mreset">취소</button>'+
				'</div>';
		$(this).parent().html(v);
	});
	
		
}); */
</script>
</head>
<body>
		<table>
<!-- <thead>
	<tr>
		<th>이름</th>
		<th>작성일</th>
	</tr>
</thead> -->
<tbody>	
	<c:forEach var="reply" items="${list}">
		<tr>
			<td>
				<div class="info">
					<label>이름 : <c:out value="${reply.writer}"></c:out></label>
					<label>작성일 : <c:out value="${reply.regdate}"></c:out></label>
					<span class="buttonSet">
						<button id="subReply" no="${reply.id}" >댓글</button>
						<button id="modReply" no="${reply.id}" >수정</button>
						<button id="delReply" no="${reply.id}" >삭제</button>
					</span>
				</div>
				<div class="message">
					<c:out value="${reply.content}"/>
				</div>
			</td>
		<tr>
	</c:forEach>
</tbody>
</table>
			
</body>
</html>