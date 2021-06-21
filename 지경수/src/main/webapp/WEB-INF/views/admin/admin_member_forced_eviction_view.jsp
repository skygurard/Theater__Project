<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="formBox">
		<h2>회원 강제 탈퇴</h2>
		<form action="admin_member_forced_eviction.do" id="joinForm" method="POST">


			<center>
				<br> -회원 아이디- <input type="text" name="user_id" placeholder="  탈퇴시킬 회원의 아이디를 입력하세요. "><br>
				<br>
				<button type="submit" name="submit">회원 강제 탈퇴</button>

				<br> <br>


			</center>


			<%-- <table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" name="admin_id" id="userID"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="admin_password" id="userPassword"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="submit" value="로그인" id="join">
				<input type="reset" value="취소" id="cancel">
				<!--<a href="MemberList.do">회원 목록</a> -->
			</div> --%>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
            alert(responseMessage)
        }
    })
</script>

</html>




