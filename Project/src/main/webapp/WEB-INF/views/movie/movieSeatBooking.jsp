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
     
      <label id="movie"><%=title %>(<%=age %>)<%=runningTime %>분<%=movieDate %><%=selectedTheater %>상영관 </label>

    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>선택 가능한 좌석</small>
      </li>

      <li>
        <div class="seat selected" id="selected"></div>
        <small>선택하신 좌석</small>
      </li>

      <li>
        <div class="seat occupied" id="occupied"></div>
        <small>이미 예약된 좌석</small>
      </li>
    </ul>

    <div class="container">
      <div class="screen"></div>
      <div class="row">
        <input type='button' class="seat" value='A1'>
        <input type='button' class="seat" value='A2'>
        <input type='button' class="seat" value='A3'>
        <input type='button' class="seat" value='A4'>
        <input type='button' class="seat" value='A5'>
        <input type='button' class="seat" value='A6'>
        <input type='button' class="seat" value='A7'>
        <input type='button' class="seat" value='A8'>

      </div>
      <div class="row">
        <input type='button' class="seat" value='B1'>
        <input type='button' class="seat" value='B2'>
        <input type='button' class="seat" value='B3'>
        <input type='button' class="seat" value='B4'>
        <input type='button' class="seat" value='B5'>
        <input type='button' class="seat" value='B6'>
        <input type='button' class="seat" value='B7'>
        <input type='button' class="seat" value='B8'>
      </div>

      <div class="row">
        <input type='button' class="seat" value='C1'>
        <input type='button' class="seat" value='C2'>
        <input type='button' class="seat" value='C3'>
        <input type='button' class="seat" value='C4'>
        <input type='button' class="seat" value='C5'>
        <input type='button' class="seat" value='C6'>
        <input type='button' class="seat" value='C7'>
        <input type='button' class="seat" value='C8'>
      </div>

      <div class="row">
        <input type='button' class="seat" value='D1'>
        <input type='button' class="seat" value='D2'>
        <input type='button' class="seat" value='D3'>
        <input type='button' class="seat" value='D4'>
        <input type='button' class="seat" value='D5'>
        <input type='button' class="seat" value='D6'>
        <input type='button' class="seat" value='D7'>
        <input type='button' class="seat" value='D8'>
      </div>

      <div class="row">
        <input type='button' class="seat" value='E1'>
        <input type='button' class="seat" value='E2'>
        <input type='button' class="seat" value='E3'>
        <input type='button' class="seat" value='E4'>
        <input type='button' class="seat" value='E5'>
        <input type='button' class="seat" value='E6'>
        <input type='button' class="seat" value='E7'>
        <input type='button' class="seat" value='E8'>
      </div>

      <div class="row">
        <input type='button' class="seat" value='F1'>
        <input type='button' class="seat" value='F2'>
        <input type='button' class="seat" value='F3'>
        <input type='button' class="seat" value='F4'>
        <input type='button' class="seat" value='F5'>
        <input type='button' class="seat" value='F6'>
        <input type='button' class="seat" value='F7'>
        <input type='button' class="seat" value='F8'>
      </div>
    </div>

    <p class="text">
      선택한 좌석은 <span id="count">0</span> 결제하실 가격은<span id="total">0</span>
    </p>
    <div>
      <form action="kakaoPay.do" method="GET" onsubmit="return check()"> <!-- 일단 경수씨 GET방식에 따라 설정 -->
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




