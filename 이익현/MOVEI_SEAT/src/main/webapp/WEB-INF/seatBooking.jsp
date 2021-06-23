<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 좌석 예매</title>
</head>
<body>
	    <div class="movie-container">

    </div>
    <ul class="showcase">
        <li>
            <div class="seat"></div>
            <small>선택 가능한 좌석</small>
        </li>
        <li>
            <div class="seat selected"></div>
            <small>선택한 좌석</small>
        </li>
        <li>
            <div class="seat occupied"></div>
            <small>선택 불가</small>
        </li>
    </ul>
    <div class="container">
        <div class="screen"></div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
        <div class="rows">
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>
            <div class="seat"></div>          
        </div>
      
    </div>
    <p class="text">선택한 좌석은 <span id="count">0</span> 이며, 결제 금액은 <span id="total">0</span>입니다.</p>
     
    <input id="button" type="submit" value="결제">
    <script src="script.js"></script>

</body>
</html>