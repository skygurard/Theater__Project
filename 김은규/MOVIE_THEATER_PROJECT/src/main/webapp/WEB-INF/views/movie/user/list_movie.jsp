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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/user/user_list.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="movie">
	
		<div class="titleBox">
			<div class="titleHeader">
				<span>무비차트</span>
			</div>
			<div class="subMenu">
				<a href="">무비차트</a>
				<a href="">상영예정작</a>
			</div>
		</div>
		
		<div class="now">
			<input type="checkbox" for="now">
			<label for="now">현재 상영작만 보기</label>
		</div>
		
		<div class="container">
			<c:forEach var="movieBean" items="${movieList}" begin="0"
				end="${movieList.size()}" step="1" varStatus="status">
				<div class="movieList">
					<div class="imgBox">
						<a href="ViewMovie.do?no=${movieBean.no}"><img src="${movieBean.profileImg}"></a>
					</div>
					<div class="imgContents">
						<div><a href="">${movieBean.title}</a></div>
						<div>
							<span>예매율</span>
							<span>예매율 변수넣기</span>
						</div>
						<div>${movieBean.releaseDate}</div>
						<div class="ticket"><a href="">예매하기</a></div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="pagination">
			<c:if test="${clickedPage != 1}">
				<a href="ListMovie.do?clickedPage=${clickedPage - 1}"> <span
					class="material-icons">navigate_before</span>
				</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"
				varStatus="status">
				<c:choose>
					<c:when test="${currentPage==i}">
						<a href="ListMovie.do?clickedPage=${i}" class="clicked">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="ListMovie.do?clickedPage=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${clickedPage != endPage}">
				<a href="ListMovie.do?clickedPage=${clickedPage + 1}"> <span
					class="material-icons">navigate_next</span>
				</a>
			</c:if>
		</div>
	
	</div>

</body>
</html>