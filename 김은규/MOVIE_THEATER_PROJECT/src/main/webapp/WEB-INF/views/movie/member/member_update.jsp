<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<body>


	<div class="formBox" id="update">
		<h2>회원정보 수정</h2>
		<form action="MemberUpdate.do" method="POST">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<!-- 					<tr> -->
					<!-- 						<th>ID</th> -->
					<!-- 						<td><input type="text" name="id" readonly></td> -->
					<!-- 					</tr> -->
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name"
							value="${memberBean.name }"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" value=""></td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td><input type="text" name="email"
							value="${memberBean.email }"></td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td><input type="text" name="phone"
							value="${memberBean.phone }"></td>
					</tr>
					<tr>
						<th>INTEREST</th>
						<td><select name="interest" id="">
								<option value="Action">액션</option>
								<option value="Horror">공포</option>
								<option value="Romance">로맨스</option>
								<option value="Humor">유머</option>
								<option value="Animation">애니메이션</option>
						</select></td>
					</tr>
					<tr>
						<th>AGE</th>
						<td>
							<input type="text" name="age" value="${memberBean.age }">
							<!-- <select name="age" id="">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="40">40</option>
									<option value="50">50</option>
							</select> -->
						</td>
					</tr>
					
				</tbody>
			</table>
			<div class="btns">
					<input type="hidden" name="no" value="${memberBean.no }"> 
					<input type="submit" value="회원 정보 수정" id="join"> 
					<input type="reset" value="취소" id="cancel"> 
					<!-- <a href="MemberList.do">회원 목록</a> -->
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>