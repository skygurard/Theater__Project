<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>
<body>
	<div class="formBox" id="list">
		<h2>관리자용 삭제된 영화리스트</h2>
		<form action="DeletedListMovieAdmin.do" method="GET" id="id_searchForm">
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
		<div class="now">
			<input type="checkbox" id="id_currYnChk" value="N" ${param.currYn == "Y" ? 'checked' : ''}>
			<label id="id_currYnTxt" for="id_currYnChk" style="cursor: pointer; ">현재 상영작만 보기</label>
		</div>
		
			<table>
				<colgroup>
					<col style="width:70px">
					<col style="width:100px">
					<col style="width:360px">
					<col style="width:80px">
					<col style="width:120px">
					<col style="width:120px">
					<col style="width:60px">
				</colgroup>
				<thead>
					<tr>
						<th>사진</th>
						<th>번호</th>
						<th>제목</th>
						<th>연령</th>
						<th>개봉일</th>
						<th>상영종료일</th>
						<th>복원</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="movieBean" items="${movieList}" >
						<tr>
							<td><img src ="${movieBean.posterImg}" class="posterImg"></td>
							<td>${movieBean.no}</td>
							<td><a href="ViewDeletedMovieAdmin.do?no=${movieBean.no}">${movieBean.title}</a></td>
							
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
							<td><a href="RestoreMovieForm.do?no=${movieBean.no}" class="btns" value = "${movieBean.no}" style="text-align:center; margin-top:0">복원</a></td>
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
			<a href="ListMovieAdmin.do" id="join">관리자용 영화목록</a>
		</div>
		
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




