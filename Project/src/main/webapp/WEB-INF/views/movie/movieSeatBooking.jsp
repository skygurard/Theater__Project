<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Seat Booking</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/seats.css">
<link rel="stylesheet" href="css/reset.css">
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="movie-container">
    <%
    request.setCharacterEncoding("UTF-8");
    String title= request.getParameter("title");
    String age = request.getParameter("movieAge");
    String selectedTheater = request.getParameter("selectedTheater");
    String movieDate = request.getParameter("movieDate");
    String runningTime = request.getParameter("runningTime");
    %>
     
      <label><%=title %>(<%=age %>)<%=runningTime %>분<%=movieDate %><%=selectedTheater %>상영관 </label>

    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>선택 가능한 좌석</small>
      </li>

      <li>
        <div class="seat selected"></div>
        <small>선택하신 좌석</small>
      </li>

      <li>
        <div class="seat occupied"></div>
        <small>이미 예약된 좌석</small>
      </li>
    </ul>

    <div class="container">
      <div class="screen"></div>
      <div class="row">
        <div class="seat">A1</div>
        <div class="seat">A2</div>
        <div class="seat">A3</div>
        <div class="seat">A4</div>
        <div class="seat">A5</div>
        <div class="seat">A6</div>
        <div class="seat">A7</div>
        <div class="seat">A8</div>
      </div>
      <div class="row">
        <div class="seat">B1</div>
        <div class="seat">B2</div>
        <div class="seat">B3</div>
        <div class="seat">B4</div>
        <div class="seat">B5</div>
        <div class="seat">B6</div>
        <div class="seat">B7</div>
        <div class="seat">B8</div>
      </div>

      <div class="row">
        <div class="seat">C1</div>
        <div class="seat">C2</div>
        <div class="seat">C3</div>
        <div class="seat">C4</div>
        <div class="seat">C5</div>
        <div class="seat">C6</div>
        <div class="seat">C7</div>
        <div class="seat">C8</div>
      </div>

      <div class="row">
        <div class="seat">D1</div>
        <div class="seat">D2</div>
        <div class="seat">D3</div>
        <div class="seat">D4</div>
        <div class="seat">D5</div>
        <div class="seat">D6</div>
        <div class="seat">D7</div>
        <div class="seat">D8</div>
      </div>

      <div class="row">
        <div class="seat">E1</div>
        <div class="seat">E2</div>
        <div class="seat">E3</div>
        <div class="seat">E4</div>
        <div class="seat">E5</div>
        <div class="seat">E6</div>
        <div class="seat">E7</div>
        <div class="seat">E8</div>
      </div>

      <div class="row">
        <div class="seat">F1</div>
        <div class="seat">F2</div>
        <div class="seat">F3</div>
        <div class="seat">F4</div>
        <div class="seat">F5</div>
        <div class="seat">F6</div>
        <div class="seat">F7</div>
        <div class="seat">F8</div>
      </div>
    </div>

    <p class="text">
      선택한 좌석은 <span id="count">0</span> 결제하실 가격은<span id="total">0</span>
    </p>
    <div>
      <form action="kakaoPay.do" method="GET"> <!-- 일단 경수씨 GET방식에 따라 설정 -->
        <input type="hidden" class="title" name="title">
        <input type="hidden" class="movieAge" name="movieAge">
        <input type="hidden" class="selectedTheater" name="selectedTheater">
        <input type="hidden" class="reserveDate" name="movieDate">
        <input type="hidden" class="runningTime" name="runningTime">
        <input type="hidden" class="seatsIndex" name="seatsIndex">
        <input type="hidden" class="moviePrice" name="moviePrice">
        <input type="submit" value="예매하기">
        <input type="reset" value="좌석 다시 선택하기">
      </form>
    </div>
    <script src="js/seats.js"></script>

</body>




</html>




