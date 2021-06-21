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
<link rel="stylesheet" href="css/admin_view.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
</head>
<body>
<body>
	<div class="formBox">
		<h2>영화정보</h2>
		<form action="InsertMovie.do" id="joinForm" method="POST" enctype ="multipart/form-data" value = "test">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 600px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${movieBean.title}</td>
					</tr>
					<tr>
						<th>감독</th>
						<td>${movieBean.director }</td>
					</tr>
					<tr>
						<th>배우</th>
						<td>${movieBean.actor}</td>
					</tr>
					<tr>
					<th>장르</th>
						<td>${movieBean.genre}</td>
					</tr>
					<tr>
						<th>상영일</th>
						<td>${movieBean.releaseDate}</td>
					</tr>
					<tr>
						<th>상영종료일</th>
						<td>${movieBean.endDate}</td>
					</tr>
					<tr>
						<th>러닝타임</th>
						<td>${movieBean.runningTime}</td>
					</tr>
					<tr>
						<th>연령제한</th>
						<td>${movieBean.age}</td>
					</tr>
					<tr>
						<th>국가</th>
						<td>${movieBean.country}</td>
					</tr>
					<tr>
						<th>영화정보</th>
						<td>${movieBean.info}</td>
					</tr>
					<tr>
						<th>사진</th>
						<td><img src ="${movieBean.profileImg}"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<a href="ModifyMovieForm.do?no=${movieBean.no}">수정</a>
				<a href="DeleteMovieForm.do?no=${movieBean.no}">삭제</a>
				<a href="ListMovieAdmin.do">리스트</a>
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