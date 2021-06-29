<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>
<body>
	<div class="formBox" id="list">
		<h2>관리자용 영화리스트</h2>
			<table>
				<colgroup>
					<col style="width:70px">
					<col style="width:100px">
					<col style="width:360px">
					<col style="width:100px">
					<col style="width:140px">
					<col style="width:140px">
				</colgroup>
				<thead>
					<tr>
						<th>사진</th>
						<th>번호</th>
						<th>제목</th>
						<th>연령</th>
						<th>개봉일</th>
						<th>상영종료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="movieBean" items="${movieList}" >
						<tr>
							<td><img src ="${movieBean.posterImg}" class="posterImg"></td>
							<td>${movieBean.no}</td>
							<td><a href="ViewMovieAdmin.do?no=${movieBean.no}">${movieBean.title}</a></td>
							
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
							<td>${movieBean.releaseDate}</td>
							<td>${movieBean.endDate}</td>
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
			<a href="ListMovie.do" id="join">회원용 영화목록</a>
		</div>
		
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>




