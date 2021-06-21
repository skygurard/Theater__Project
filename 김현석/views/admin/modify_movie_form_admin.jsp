<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화등록하기</title>
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
<body>
	<div class="formBox">
		<h2>영화수정</h2>
		<form action="ModifyMovie.do" id="joinForm" method="POST" enctype ="multipart/form-data" value = "test">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 600px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="userName" value="${movieBean.title}"></td>
					</tr>
					<tr>
						<th>감독</th>
						<td><input type="text" name="director" id="userEmail" value="${movieBean.director}"></td>
					</tr>
					<tr>
						<th>배우</th>
						<td><input type="text" name="actor" id="subject" value="${movieBean.actor}"></td>
					</tr>
					<tr>
					<th>장르</th>
						<td>
							<input class="genreList" type="checkBox" name ="genre" value = "액션"><span>액션</span>
							<input class="genreList" type="checkBox" name ="genre" value = "드라마"><span>드라마</span>
							<input class="genreList" type="checkBox" name ="genre" value = "SF"><span>SF</span>
							<input class="genreList" type="checkBox" name ="genre" value = "공포"><span>공포</span>
							<input class="genreList" type="checkBox" name ="genre" value = "스릴러"><span>스릴러</span>
							<input class="genreList" type="checkBox" name ="genre" value = "미스터리"><span>미스터리</span>
							<input class="genreList" type="checkBox" name ="genre" value = "판타지"><span>판타지</span>
							<input class="genreList" type="checkBox" name ="genre" value = "다큐멘터리"><span>다큐멘터리</span>
							<input class="genreList" type="checkBox" name ="genre" value = "성인"><span>성인</span>
							<input class="genreList" type="checkBox" name ="genre" value = "스포츠"><span>스포츠</span>
							<input class="genreList" type="checkBox" name ="genre" value = "코미디"><span>코미디</span>
							<input class="genreList" type="checkBox" name ="genre" value = "애니메이션"><span>애니메이션</span>
							<input class="genreList" type="checkBox" name ="genre" value = "로맨스"><span>로맨스</span>
							<input class="genreList" type="checkBox" name ="genre" value = "범죄"><span>범죄</span>
						</td>
					</tr>
					<tr>
						<th>상영일</th>
						<td><input type="text" id="releaseDate" name="releaseDate" value="${movieBean.releaseDate}"></td>
					</tr>
					<tr>
						<th>상영종료일</th>
						<td><input type="text" id="endDate" name="endDate" value="${movieBean.endDate}"></td>
					</tr>
					<tr>
						<th>러닝타임</th>
						<td><input type="text" id="runningTime" name="runningTime" value="${movieBean.runningTime}"></td>
					</tr>
					<tr>
						<th>연령제한</th>
						<td><input type="text" id="age" name="age" value="${movieBean.age}"></td>
					</tr>
					<tr>
						<th>국가</th>
						<td><input type="text" id="country" name="country" value="${movieBean.country}"></td>
					</tr>
					<tr>
						<th>영화정보</th>
						<td><textarea name="info" id="info">${movieBean.info}</textarea></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input id="profileImg" type="file" name="multipartProfileImg" value="${movieBean.profileImg}"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="submit" value="확인" id="join">
				<input type="reset" value="취소" id="cancel">
			</div>
		</form>
	</div>
	<script>
	$(function() {
		var dateFormat = "mm/dd/yy",
			releaseDate=$("#releaseDate")
				.datepicker({
					defaultDate : "+1w",
					changeMonth : true,
					numberOfMonths : 3
				}).on("change", function() {
					endDate.datepicker("option", "minDate", getDate(this));
				}), endDate=$("#endDate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3
		}).on("change", function() {
			releaseDate.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate( dateFormat, element.value );
			} catch (error) {
				date=null;
			}

			return date;
		}
	});
</script>
</body>
</body>
</html>