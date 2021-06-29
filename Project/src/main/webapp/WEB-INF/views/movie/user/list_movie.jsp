<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>
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
						<a href="ViewMovie.do?no=${movieBean.no}"><img src="${movieBean.posterImg}"></a>
					</div>
					<div class="imgContents">
						<div class="movieTitle"><a href="">${movieBean.title}</a></div>
						
						<c:choose>
							<c:when test="${movieBean.age == '12'}">
								<div>12세 관람가</div>
							</c:when>
							<c:when test="${movieBean.age == '15'}">
								<div>15세 관람가</div>
							</c:when>
							<c:when test="${movieBean.age == '19'}">
								<div>청소년 관람불가</div>
							</c:when>
							<c:otherwise>
								<div>전체 관람가</div>
							</c:otherwise>
						</c:choose>
						
						<div>${movieBean.releaseDate}</div>
						<div class="ticket">
							<a href="MovieReserveList.do">예매하기</a>
						</div>
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
	<%@ include file="../include/footer.jsp"%>
</body>
</html>