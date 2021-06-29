<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>
<body>
	<div id="movieInfo">
	
		<div class="titleBoxInfo">
			<div class="titleHeader">
				<span>영화상세</span>
			</div>
		</div>
		
		<div class="movieBox">
		
			<div class="movieImgBox">
				<img src="${movieBean.posterImg}">
			</div>
			
			<div class="movieContents">
			
				<div class="movieTitleBox">
					<h2>${movieBean.title}</h2>
				</div>
				
				<div class="movieInfoBox">
					<span>감독 : ${movieBean.director} / </span>
					<span>배우 : ${movieBean.actor}</span><br>
					<span>장르 : ${movieBean.genre} / </span>
					
					<c:choose>
						<c:when test="${movieBean.age == '12'}">
							<span>12세 관람가 / </span>
						</c:when>
						<c:when test="${movieBean.age == '15'}">
							<span>15세 관람가 / </span>
						</c:when>
						<c:when test="${movieBean.age == '19'}">
							<span>청소년 관람불가 / </span>
						</c:when>
						<c:otherwise>
							<span>전체 관람가 / </span>
						</c:otherwise>
					</c:choose>
					<span>${movieBean.runningTime} / </span>
					<span>${movieBean.country}</span><br>
					<span>개봉 : ${movieBean.releaseDate}</span>
				</div>
			
			
				<div class="ticket">
					<a href="MovieReserveList.do">예매하기</a>
					<a href="ListMovie.do">돌아가기</a>
				</div>
				
			</div>
		</div>
		<div class="info">
			<p>${movieBean.info}</p>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>