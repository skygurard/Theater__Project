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
<link rel="stylesheet" href="css/reset.css">
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
                <ul>
                <c:forEach var="movieBean" items="${movieList }" begin="0"
				end="${movieList.size()}" step="1" varStatus="status">
				
				
					<c:choose>
						<c:when test="${movieBean.age == '12'}">
							<li><span class="movie-list-age showTwelven"></span><span class="movie-list-title">${movieBean.title}</span></li>
						</c:when>
						<c:when test="${movieBean.age == '15'}">
							<li><span class="movie-list-age showFiften"></span><span class="movie-list-title">${movieBean.title}</span></li>
						</c:when>
						<c:when test="${movieBean.age == '19'}">
							<li><span class="movie-list-age showNineten"></span><span class="movie-list-title">${movieBean.title}</span></li>
						</c:when>
						<c:otherwise>
							<li><span class="movie-list-age showAllAge"></span><span class="movie-list-title">${movieBean.title}</span></li>
						</c:otherwise>
					</c:choose>
<%-- 				<span  class="movie-list-age">${movieBean.age }</span> --%>
                
                </c:forEach>
                </ul>
                
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
                        <button class="theater-location tab-link" id="tab-1" >서울</button>
                        <button class="theater-location tab-link" id="tab-2">경기</button>
                        <button class="theater-location tab-link" id="tab-3">인천</button>
                        <button class="theater-location tab-link" id="tab-4">강원</button>
                    </div>
                    <div id="tab-1" class="tab-content theater-place-wrapper tab-1">
                        <button class="theater-place">천호</button>
                        <button class="theater-place">강남</button>
                        <button class="theater-place">화곡</button>
                        <button class="theater-place">홍대</button>
                        <button class="theater-place">외대</button>
                        <button class="theater-place">여의도</button>
                       
                    </div>
                    <div id="tab-2" class="tab-content theater-place-wrapper current tab-2">
                        <button class="theater-place">김포</button>
                        <button class="theater-place">동탄</button>
                        <button class="theater-place">부천</button>
                        <button class="theater-place">범골</button>
                        <button class="theater-place">수원</button>
                       
                    </div>
                    <div id="tab-3" class="tab-content theater-place-wrapper current tab-3">
                        <button class="theater-place">부평</button>
                        <button class="theater-place">인천</button>
                        <button class="theater-place">청라</button>
                        <button class="theater-place">계양</button>
                        
                    </div>
                    <div id="tab-4" class="tab-content theater-place-wrapper current tab-4">
                        <button class="theater-place">동래</button>
                        <button class="theater-place">서면</button>
                        <button class="theater-place">정관</button>
                       
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




