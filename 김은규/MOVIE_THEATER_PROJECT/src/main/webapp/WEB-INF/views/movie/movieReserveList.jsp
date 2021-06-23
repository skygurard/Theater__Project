<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/reserve_layout.css">
<link rel="stylesheet" href="css/reserve.css">
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<input type="button" value="ENGLISH" class="topButton" id="topButton1"> <input type="button"
					value="예매가이드" class="topButton"> <input type="button" value="제휴할인혜택" class="topButton">
				<input type="button" value="상영시간표" class="topButton"> <input type="button"
					value="예매다시하기" class="topButton">
<div class="reserve-container">
        <div class="movie-part">
            <div class="reserve-title">영화</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">예매율순</div>
                <div class="sort-korean">가나다순</div>
            </div>
             <div class="movie-list-wrapper">
                <div class="movie-list">
                <c:forEach var="movieReserveBean" items="${movieReserveList }">
                <div class="movie-list-age">${movieReserveList.movie_list_age }  </div>
                <div class="movie-list-title">${movieReserveList.movie_list_title}</div>
                </c:forEach>
                
                    <%-- <div class="movie-list-age">15</div>
                    <div class="movie-list-title">1917</div> --%>
                </div>
            </div>
        </div>
        <div class="theater-part">
            <div class="reserve-title">
                극장
            </div>
            <div class="theater-container">
                <div class="theater-wrapper">
                    <div class="theater-location-wrapper tabs">
                        <button class="theater-location tab-link" id="tab-1" >서울(30)</button>
                        <button class="theater-location tab-link" id="tab-2">경기(43)</button>
                        <button class="theater-location tab-link" id="tab-3">인천(10)</button>
                        <button class="theater-location tab-link" id="tab-4">강원(5)</button>
                    </div>
                    <div id="tab-1" class="tab-content theater-place-wrapper tab-1">
                        <button class="theater-place">천호</button>
                       
                    </div>
                    <div id="tab-2" class="tab-content theater-place-wrapper current tab-2">
                        <button class="theater-place">천호2</button>
                       
                    </div>
                    <div id="tab-3" class="tab-content theater-place-wrapper current tab-3">
                        <button class="theater-place">천호3</button>
                        
                    </div>
                    <div id="tab-4" class="tab-content theater-place-wrapper current tab-4">
                        <button class="theater-place">천호4</button>
                       
                    </div>
                </div>
            </div>
        </div>
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
        <div class="time-part">
            <div class="reserve-title">시간</div>
            <div class="reserve-time">
                <div class="reserve-where">4관(Laser) 6층(총 240석) </div>
                <div class="reserve-time-wrapper">
                    <button class="reserve-time-button">
            <span class="reserve-time-want">12:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>
                    <button class="reserve-time-button">
            <span class="reserve-time-want">14:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>
                    <button class="reserve-time-button">
            <span class="reserve-time-want">16:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>
                    <button class="reserve-time-button">
            <span class="reserve-time-want">18:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>

                </div>
            </div>
            <div>
            <form class="moveSeatForm" action="moveSeat.do" method="post">
            <input type="hidden" class="title" name="title">
            <input type="hidden" class="movieAge" name="movieAge">
            <input type="hidden" class="selectedTheater" name="selectedTheater">
            <input type="hidden" class="reserveDate" name="movieDate">
            <input type="hidden" class="runningTime" name="runningTime">
            <button class="moveSeatButton" type="button">예약하기</button>
            </form>
            </div>
        </div>

    </div>
    <script src="js/reserve.js"></script>
    <script>
    $(document).ready(function(){
    	
    	$('.theater-wrapper .tab-link').click(function(){
    		var tab_id = $(this).attr("id");
			console.log(tab_id);
    		$(".tabs").siblings().addClass('current');
    		$("."+tab_id).removeClass('current');
    	})

    })
    
</script>


</body>



</html>




