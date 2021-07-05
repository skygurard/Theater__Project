<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>
<body>
	<div id="movie">
	
		<div class="titleBox">
			<div class="titleHeader">
				<span><a href="ListMovie.do">무비차트</a></span>
			</div>
			<form action="ListMovie.do" method="GET" id="id_searchForm">
				<input type="hidden" id="id_currYn" name = "currYn" value = "N">
				<span>
					<select name="search">
						<option value="ALL" ${param.search == "ALL" ? 'selected' : ''} >전체</option>
						<option value="TITLE" ${param.search == "TITLE" ? 'selected' : ''}>제목</option>
						<option value="DIRECTOR" ${param.search == "DIRECTOR" ? 'selected' : ''}>감독</option>
						<option value="ACTOR" ${param.search == "ACTOR" ? 'selected' : ''}>배우</option>
					</select>
				</span>
				<span>
					<input name="word" type="text" placeholder="검색어를 입력하세요" value="${param.word}">
					<button onclick= onClickSearch() >검색</button>
				</span>
			</form>
<!-- 			<div class="subMenu"> -->
<!-- 				<a href="" class="chart">무비차트</a> -->
<!-- 				<a href="" class="chart">개봉예정작</a> -->
<!-- 			</div> -->
		</div>
		<div class="now">
			<input type="checkbox" id="id_currYnChk" value="N" ${param.currYn == "Y" ? 'checked' : ''}>
			<label id="id_currYnTxt" for="id_currYnChk" style="cursor: pointer; ">현재 상영작만 보기</label>
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
				<a href="ListMovie.do?clickedPage=${clickedPage - 1}">
					<span class="material-icons">navigate_before</span>
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
				<a href="ListMovie.do?clickedPage=${clickedPage + 1}">
					<span class="material-icons">navigate_next</span>
				</a>
			</c:if>
		</div>
		<c:if test="${loggedMemberInfo.grade <= 2}">
			<div id="hidBtns">
				<a href="ListMovieAdmin.do" class="join">관리자용 영화목록</a>
				<a href="InsertMovieForm.do" class="join">영화 등록</a>
			</div>
		</c:if>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
<script>
	$(document).ready(function() {
		$('#id_currYnChk').change(function(){
			onClickSearch();
		});
	});

	function onClickSearch() {
		if($('#id_currYnChk').is(":checked") == true){
			$('#id_currYn').val("Y");			 
		}else if($('#id_currYnChk').is(":checked") == false){
			$('#id_currYn').val("N");
		}
		$("#id_searchForm").submit();
	}

</script>

