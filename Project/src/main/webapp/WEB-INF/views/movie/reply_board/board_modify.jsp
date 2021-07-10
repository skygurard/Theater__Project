<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../include/header.jsp" %>
<body>
	<div class="formBox">
		<h2>자유게시판</h2>
		<form id="joinForm" method="POST" action="BoardModify.do">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>닉네임</th>
						<td><input type="text" name="name" id="userName" value="${replyBoardBean.name}"></td>
					</tr>
					<tr>
						<th>한줄평</th>
						<td><input type="text" name="email" id="userEmail" value="${replyBoardBean.email}"></td>
					</tr>
					<tr>
						<th>영화제목</th>
						<td><input type="text" name="subject" id="subject" value="${replyBoardBean.subject}"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>리뷰내용</th>
						<td><textarea name="contents" id="summernote">${replyBoardBean.contents}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${no}">
				<input type="submit" value="수정" id="join">
				<a href="BoardList.do">목록</a>
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
		  $("#summernote").summernote({
			  height:350
		  });
		});
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>












