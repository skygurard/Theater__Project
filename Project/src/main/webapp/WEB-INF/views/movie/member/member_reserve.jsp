<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
<body>

	<!-- 	no값을 받아서.... -->
	<!-- 	한사람에 대한 정보를 뽑아온다... -->

	<div class="formBox" id="update">
		<h2>영화예매내역</h2>

			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>

					<tr>
						<th>NAME</th>
						<td>${reserveBean.title }</td>
					</tr>
					
					<tr>
						<th>E-MAIL</th>
						<td>${reserveBean.selectedTheater }</td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td>${reserveBean.runningTime}</td>
					</tr>
					<tr>
						<th>INTEREST</th>
						<td>${reserveBean.age }</td>
					</tr>
					<tr>
						<th>AGE</th>
						<td>${reserveBean.reserveSeat }</td>
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







