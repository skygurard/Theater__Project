<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/admin/admin_view.css">
</head>
<body>
	<div class="formBox">
		<h2>영화 상세 정보</h2>
		<form id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:200px">
					<col style="width:600px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${movieBean.title}</td>
					</tr>
					<tr>
						<th>감독</th>
						<td>${movieBean.director}</td>
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
						<c:choose>
								<c:when test="${movieBean.age == '12'}">
									<td>12세</td>
								</c:when>
								<c:when test="${movieBean.age == '15'}">
									<td>15세</td>
								</c:when>
								<c:when test="${movieBean.age == '19'}">
									<td>청불</td>
								</c:when>
								<c:otherwise>
									<td>전체</td>
								</c:otherwise>
						</c:choose>
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
						<td><img src ="${movieBean.posterImg}"></td>
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

</body>
</html>












