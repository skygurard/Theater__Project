<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
<body>

	<!-- 	no값을 받아서.... -->
	<!-- 	한사람에 대한 정보를 뽑아온다... -->

	<div class="formBox" id="update">
		<h2>회원정보 수정</h2>
<!-- 		<form action="MemberUpdate.do" method="POST"> -->
			<div class="profileImgBox">
				<img src="${memberBean.profileImg }" class="profileImg">
			</div>
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
<!-- 					<tr> -->
<!-- 						<th>ID</th> -->
<!-- 						<td><input type="text" name="id" readonly></td> -->
<!-- 					</tr> -->
					<tr>
						<th>NAME</th>
						<td>${memberBean.name }</td>
					</tr>
					
					<tr>
						<th>E-MAIL</th>
						<td>${memberBean.email }</td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td>${memberBean.phone}</td>
					</tr>
					<tr>
						<th>INTEREST</th>
						<td>${memberBean.interest }</td>
					</tr>
					<tr>
						<th>AGE</th>
						<td>${memberBean.age }</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<a href="MemberUpdateForm.do?no=${memberBean.no }">회원 수정</a>
				<a href="MemberDeleteForm.do?no=${memberBean.no }">회원 탈퇴</a>
				<!-- <a href="MemberList.do">회원 목록</a> -->
				<!-- <a href="MemberJoinForm.do">회원 가입</a> -->
			</div>
<!-- 		</form> -->
	</div>
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>







