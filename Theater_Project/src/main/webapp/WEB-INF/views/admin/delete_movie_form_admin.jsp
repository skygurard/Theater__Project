<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화삭제하기</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" href="css/layout.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
</head>
<body>
	<div class="formBox">
		<h2>영화삭제</h2>
		<form action="InsertMovie.do" id="joinForm" method="POST" enctype ="multipart/form-data" value = "test">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 600px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
<%-- 						<td><input type="text" name="name" value="${adminBean.id }"></td> --%>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" value=""></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${movieBean.no }">
				<input type="submit" value="회원 탈퇴" id="join">
				<input type="reset" value="취소" id="cancel">
				<a href="MovieListAdmin.do">회원 목록</a>
			</div>
		</form>
	</div>
</body>
</html>