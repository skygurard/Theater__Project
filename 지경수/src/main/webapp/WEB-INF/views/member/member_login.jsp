<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="formBox">
		<h2>로그인</h2>
		<form action="MemberLogin.do" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userID"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="submit" value="로그인" id="join">
				<input type="reset" value="취소" id="cancel">
				<!--<a href="MemberList.do">회원 목록</a> -->
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>




