<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/admin/admin_list.css">
</head>
<body>
	<div class="formBox" id="list">
		<h2>관리자용 영화리스트</h2>
			<table>
				<colgroup>
					<col style="width:50px">
					<col style="width:70px">
					<col style="width:230px">
					<col style="width:150px">
					<col style="width:150px">
					<col style="width:150px">
				</colgroup>
				<thead>
					<tr>
						<th>사진</th>
						<th>번호</th>
						<th>제목</th>
						<th>개봉일</th>
						<th>상영종료일</th>
						<th>연령가</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="movieBean" items="${movieList}" >
						<tr>
							<td><img src ="${movieBean.posterImg}" class="posterImg"></td>
							<td>${movieBean.no}</td>
							<td><a href="ViewMovieAdmin.do?no=${movieBean.no}">${movieBean.title}</a></td>
							<td>${movieBean.releaseDate}</td>
							<td>${movieBean.endDate}</td>
							<td>${movieBean.age}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="pagination">
			<c:if test="${clickedPage != 1}">
				<a href="ListMovieAdmin.do?clickedPage=${clickedPage - 1}"> <span
					class="material-icons">navigate_before</span>
				</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"
				varStatus="status">
				<c:choose>
					<c:when test="${currentPage==i}">
						<a href="ListMovieAdmin.do?clickedPage=${i}" class="clicked">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="ListMovieAdmin.do?clickedPage=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${clickedPage != endPage}">
				<a href="ListMovieAdmin.do?clickedPage=${clickedPage + 1}"> <span
					class="material-icons">navigate_next</span>
				</a>
			</c:if>
		</div>
			
		<div class="btns">
			<a href="InsertMovieForm.do" id="join">영화등록</a>
		</div>
	</div>
</body>
</html>




