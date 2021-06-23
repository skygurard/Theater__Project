<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<body>

	<div class="formBox" id="list">
		<h2>회원가입</h2>
		<table>
			<colgroup>
				<col style="width: 50px">
				<col style="width: 150px">
				<col style="width: 150px">
				<col style="width: 50px">
				<col style="width: 250px">
				<col style="width: 200px">
				<col style="width: 50px">
				<col style="width: 50px">
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>ID</th>
					<th>NAME</th>
					<th>PROFILE</th>
					<th>E-MAIL</th>
					<th>PHONE</th>
					<th>INTEREST</th>
					<th>AGE</th>
				</tr>
			</thead>
			<tbody>
				<!-- ${memberList }게 MemberListController에서 memberList로 실어서 보낸 key -->
				<c:forEach var="memberBean" items="${memberList }">
					<tr>
						<td>${memberBean.no}</td>
						<td><a href="MemberInfo.do?no=${memberBean.no}">${memberBean.id}</a></td>
						<td>${memberBean.name}</td>
						<td><img src="${memberBean.profileImg}" class="profileImg"></td>
						<%-- 							<td>${memberBean.password}</td> --%>
						<td>${memberBean.email}</td>
						<td>${memberBean.phone}</td>
						<td>${memberBean.interest}</td>
						<td>${memberBean.age}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="btns">
			<a href="MemberJoinForm.do" id="join">회원가입</a>
		</div>

		<div>${msg }</div>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>




