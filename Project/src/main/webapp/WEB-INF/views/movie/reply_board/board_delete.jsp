<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<body>
	<div class="formBox">
		<h2>자유게시판</h2>
		<form id="joinForm" method="POST" action="BoardDelete.do">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>닉네임</th>
						<td>${replyBoardBean.name}</td>
					</tr>
					<tr>
						<th>영화제목</th>
						<td>${replyBoardBean.subject}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${no}">
				<input type="submit" value="삭제" id="join">
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












