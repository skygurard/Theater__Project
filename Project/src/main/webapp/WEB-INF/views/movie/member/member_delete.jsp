<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
<body>

	<div class="formBox" id="update">
		<h2>회원정보 수정</h2>
		<form action="MemberDelete.do" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" name="name" value="${memberBean.id }"></td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" value="${memberBean.name }"></td>
					</tr>
					
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" value=""></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${memberBean.no }">
				<input type="submit" value="회원 탈퇴" id="join">
				<input type="reset" value="취소" id="cancel">
				<a href="MemberList.do">회원 목록</a>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>






