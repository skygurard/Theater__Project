<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
	<div class="formBox">
		<h2>자유게시판</h2>
		<form id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:350px">
					<col style="width:150px">
					<col style="width:350px">
				</colgroup>
				<tbody>
					<tr>
						<th>NAME</th>
						<td>${replyBoardBean.name}</td>
						<th>HIT</th>
						<td>${replyBoardBean.readCount}</td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td>${replyBoardBean.email}</td>
						<th>DATE</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${replyBoardBean.regDate}" /></td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td colspan="3">${replyBoardBean.subject}</td>
					</tr>
					<tr>
						<th>CONTENTS</th>
						<td colspan="3">
							<div name="contents" id="summernote" readonly>${replyBoardBean.contents}</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<a href="BoardRewriteForm.do?no=${replyBoardBean.no}&ref=${replyBoardBean.ref}&reStep=${replyBoardBean.reStep}&reLevel=${replyBoardBean.reLevel}" id="join">답글쓰기</a>
				<a href="BoardModifyForm.do?no=${replyBoardBean.no}">수정</a>
				<a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a>
				<a href="BoardList.do">목록</a>
			</div>
		</form>
	</div>
	<script>
// 		$(document).ready(function() {
// 		  $("#summernote").summernote({
// 			  height:350
// 		  });
// 		});
		$("#summernote").summernote("destroy");
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>












