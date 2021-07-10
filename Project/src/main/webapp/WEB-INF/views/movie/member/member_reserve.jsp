<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
<body>

	<!-- 	no값을 받아서.... -->
	<!-- 	한사람에 대한 정보를 뽑아온다... -->

	<div class="formBox" id="update">
		<h2>영화예매내역</h2>

			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>

					<tr>
						<th>예매영화</th>
						<td>${reserveBean.title }</td>
					</tr>
					
					<tr>
						<th>상영관</th>
						<td>${reserveBean.selectedTheater }</td>
					</tr>
					<tr>
						<th>예매일</th>
						<td>${reserveBean.movieDate}</td>
					</tr>
					<tr>
						<th>예매시간</th>
						<td>${reserveBean.runningTime}</td>
					</tr>
					<tr>
						<th>시청관람가</th>
						<td>${reserveBean.age }</td>
					</tr>
					<tr>
						<th>예매좌석</th>
						<td>${reserveBean.reserveSeat }</td>
					</tr>
				</tbody>
			</table>
		
<!-- 		</form> -->
	</div>
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>







