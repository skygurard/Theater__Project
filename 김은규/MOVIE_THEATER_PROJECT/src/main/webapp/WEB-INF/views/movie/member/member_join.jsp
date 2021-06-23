<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="formBox">
		<h2>회원가입</h2>
		<form action="MemberJoin.do" id="joinForm" method="POST" enctype="multipart/form-data">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td>
							<input type="text" name="id" id="userID">
							<button id="btnIdCheck">아이디 중복확인</button>
						</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" id="userName" value=""></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<!-- 이메일 정규표현식을 사용해서 이메일 필터링 -->
						<td><input type="text" name="email" value="" id="userEmail"></td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td><input type="text" name="phone" value="" id="userPhone"></td>
					</tr>
					<tr>
						<th>INTEREST</th>
						<td>
							<select name="interest" id="">
								<option value="Action">액션</option>
								<option value="Horror">공포</option>
								<option value="Romance">로맨스</option>
								<option value="Humor">유머</option>
								<option value="Animation">애니메이션</option>
							</select>
						</td>
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
					<tr>
						<th>PROFILE IMG</th>
						<td>
							<input type="file" name="multipartProfileImg" id="profileImg">
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="button" value="회원가입" id="join">
			<!--<input type="submit" value="회원가입" id="join"> -->
			<!--<button type="submit">회원가입</button> -->
				<input type="reset" value="취소" id="cancel">
				<!-- <a href="MemberList.do">회원 목록</a> -->
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>
	
	<script>
		// front에서 db직접 접근 불가능....
		
		$("#join").on("click",function(){
			if($("#userID").val().length<=0){
				alert("ID는 필수입력사항입니다.");
				$("#userID").focus();
				return 
			} else if($("#userName").val().length<=0){
				alert("이름은 필수입력사항입니다.");
				$("#userName").focus();
				return 
			} else if($("#userPassword").val().length<=0){
				alert("이름은 필수입력사항입니다.");
				$("#userPassword").focus();
				return 
			} else {
				$("#joinForm").submit();
			}
		})
		
		$("#btnIdCheck").on("click",function(){
			//ajax
			let id = $("#userID").val();
			console.log(id);
			if(id.length<3){
				alert("id는 4자 이상이어야 합니다.");
			} else {
				$.ajax({
					url:"MemberIdCheck.do?id="+id,  //여기서 체크해서 결과를 리턴
					success:function(data) {
						//여기서 결과를 받는다.
						let result =  data.result;
						console.log("MemberIdCheck.do에서 넘겨받은 값=="+result);
						if(result>0){
							alert("쓸 수 없는 ID입니다.");
							$("#userID").val("");
							$("#userID").focus();
						} else {
							let check = confirm("사용가능한 ID입니다.","사용하시겠습니까?");
							if(check){
								$("#userID").attr("readonly",true);
							} else {
								$("#userID").val("");
								$("#userID").focus();
							}
						}
					}
				})	
			}
			
			return false;
		})
	</script>
</body>
</html>




