<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<body>
	<div class="formBox">
		<h2>자유게시판</h2>
		<form action="BoardRewrite.do" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" id="userName" value=""></td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td><input type="text" name="email" id="userEmail" value=""></td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td><input type="text" name="subject" id="subject" value="[re]"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>CONTENTS</th>
						<td>
							<textarea name="contents" id="contents"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="reStep" value="${reStep}">
				<input type="hidden" name="reLevel" value="${reLevel}">
				<input type="submit" value="확인" id="join">
				<input type="reset" value="취소" id="cancel">
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
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>












