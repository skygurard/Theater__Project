<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>
<body>
	<div class="formBox">
		<h2>영화 복원</h2>
		<form action="RestoreMovie.do" id="joinForm" method="POST" enctype ="multipart/form-data">
			<table class="delBox">
				<colgroup>
					<col style="width: 200px">
					<col style="width: 400px">
				</colgroup>
				<tbody>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password"></td>
					</tr>
					<tr style="display:none;">
						<th>사진</th>
						<td><input id="posterImg" type="file" name="multipartPosterImg"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns del">
				<input type="hidden" name="no" value="${movieBean.no}">
				<input type="submit" value="영화 복원" id="join">
				<input type="reset" value="취소" id="cancel">
				<a href="ListMovie.do">회원용 영화목록</a>
				<a href="ListMovieAdmin.do">관리자용 영화목록</a>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>