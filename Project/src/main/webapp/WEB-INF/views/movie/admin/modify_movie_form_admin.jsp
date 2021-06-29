<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ include file="../include/header_admin.jsp"%>

<body>
	<div class="formBox">
		<h2>영화수정</h2>
		<form action="ModifyMovie.do" id="joinForm" method="POST" enctype ="multipart/form-data">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 600px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="userName" value="${movieBean.title}"></td>
					</tr>
					<tr>
						<th>감독</th>
						<td><input type="text" name="director" id="userEmail" value="${movieBean.director}"></td>
					</tr>
					<tr>
						<th>배우</th>
						<td><input type="text" name="actor" id="subject" value="${movieBean.actor}"></td>
					</tr>
					<tr>
					<th>장르</th>
						<td>
							<input class="genreList" type="checkBox" name ="genre" value = "액션"><span>액션</span>
							<input class="genreList" type="checkBox" name ="genre" value = "드라마"><span>드라마</span>
							<input class="genreList" type="checkBox" name ="genre" value = "SF"><span>SF</span>
							<input class="genreList" type="checkBox" name ="genre" value = "공포"><span>공포</span>
							<input class="genreList" type="checkBox" name ="genre" value = "스릴러"><span>스릴러</span>
							<input class="genreList" type="checkBox" name ="genre" value = "미스터리"><span>미스터리</span>
							<input class="genreList" type="checkBox" name ="genre" value = "판타지"><span>판타지</span>
							<input class="genreList" type="checkBox" name ="genre" value = "다큐멘터리"><span>다큐멘터리</span><br>
							<input class="genreList" type="checkBox" name ="genre" value = "성인"><span>성인</span>
							<input class="genreList" type="checkBox" name ="genre" value = "스포츠"><span>스포츠</span>
							<input class="genreList" type="checkBox" name ="genre" value = "코미디"><span>코미디</span>
							<input class="genreList" type="checkBox" name ="genre" value = "애니메이션"><span>애니메이션</span>
							<input class="genreList" type="checkBox" name ="genre" value = "로맨스"><span>로맨스</span>
							<input class="genreList" type="checkBox" name ="genre" value = "범죄"><span>범죄</span>
						</td>
					</tr>
					<tr>
						<th>상영일</th>
						<td><input type="text" id="releaseDate" name="releaseDate" value="${movieBean.releaseDate}"></td>
					</tr>
					<tr>
						<th>상영종료일</th>
						<td><input type="text" id="endDate" name="endDate" value="${movieBean.endDate}"></td>
					</tr>
					<tr>
						<th>러닝타임</th>
						<td><input type="text" id="runningTime" name="runningTime" value="${movieBean.runningTime}"></td>
					</tr>
					<tr>
						<th>연령제한</th>
						<td>
							<input class="age" type="radio" name="age" value="전체관람가"><span>전체 관람가</span>
							<input class="age" type="radio" name="age" value="12"><span>12세 이상</span>
							<input class="age" type="radio" name="age" value="15"><span>15세 이상</span>
							<input class="age" type="radio" name="age" value="19"><span>청소년 관람불가</span>
						</td>
					</tr>
					<tr>
						<th>국가</th>
						<td><input type="text" id="country" name="country" value="${movieBean.country}"></td>
					</tr>
					<tr>
						<th>영화정보</th>
						<td><textarea name="info" id="info">${movieBean.info}</textarea></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input id="posterImg" type="file" name="multipartPosterImg" value="${movieBean.posterImg}"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${movieBean.no }">
				<input type="submit" value="확인" id="join">
				<input type="reset" value="취소" id="cancel">
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>

<script>

$(document).ready(function() {
	$(function() {
        //오늘 날짜를 출력
        $("#today").text(new Date().toLocaleDateString());

        //datepicker 한국어로 사용하기 위한 언어설정
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        
        // 시작일(releaseDate)은 종료일(endDate) 이후 날짜 선택 불가
        // 종료일(endDate)은 시작일(releaseDate) 이전 날짜 선택 불가

        //시작일.
        $('#releaseDate').datepicker({
            showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "images/calendar.png", // 버튼 이미지
            buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
            buttonText: "날짜선택",             // 버튼의 대체 텍스트
            dateFormat: "yy-mm-dd",             // 날짜의 형식
            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
            //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 시작일(releaseDate) datepicker가 닫힐때
                // 종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#endDate").datepicker( "option", "minDate", selectedDate );
            }                
        });

        //종료일
        $('#endDate').datepicker({
            showOn: "both", 
            buttonImage: "images/calendar.png", 
            buttonImageOnly : true,
            buttonText: "날짜선택",
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            //minDate: 0, // 오늘 이전 날짜 선택 불가
            onClose: function( selectedDate ) {
                // 종료일(endDate) datepicker가 닫힐때
                // 시작일(releaseDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#releaseDate").datepicker( "option", "maxDate", selectedDate );
            }                
        });
    });

	var genreTxt = "${movieBean.genre}"
	var text = genreTxt.split('/');
	// var text = ['액션','스포츠','스릴러','애니메이션'];
	var i = 0;
	
	for(i=0; i < text.length; i++){
  		$('.genreList').each(function(){
  			if($(this).val() === text[i] ){
  				$(this).attr("checked", true); /* 선택 */				
  			}
  		})
	}
	
	var age = "${movieBean.age}"
	$(".age").each(function() {
		if($(this).val() === age) {
			$(this).attr("checked", true);
		}
	})
});

</script>

