<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오페이 결제창</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String age = request.getParameter("movieAge");
	String selectedTheater = request.getParameter("selectedTheater");
	String movieDate = request.getParameter("movieDate");
	String runningTime = request.getParameter("runningTime");
	String reserveSeat = request.getParameter("reserveSeat");
	String userId = request.getParameter("userId");
	String moviePrice = request.getParameter("moviePrice");
	String seatsIndex = request.getParameter("seatsIndex");
	%>

	<label id="movie"><%=title%>(<%=age%>)<%=runningTime%>분<%=movieDate%><%=selectedTheater%>상영관,
		가격 <%=moviePrice%><%=userId %></label>

	<p>
	<p>카카오페이 결제하기</p>
	<button id="check_module" type="button">
		<img src="images/payment_icon_yellow_medium.png">
	</button>
	<form action="MemberReserve.do" method="POST">
		<input type="hidden" class="userId" name= userId value="<%=userId%>">
	  	<input type="hidden" class="title" name="title" value="<%=title %>">
        <input type="hidden" class="age" name="age" value="<%=age %>">
        <input type="hidden" class="selectedTheater" name="selectedTheater" value="<%=selectedTheater %>">
        <input type="hidden" class="reserveDate" name="movieDate" value="<%=movieDate %>">
        <input type="hidden" class="runningTime" name="runningTime" value="<%=runningTime %>">
        <input type="hidden" class="reserveSeat" name="reserveSeat" value="<%=reserveSeat %>">
		<input type="submit" value="" class="submit">
	</form>
	</p>


	<script>
    
    
    $(function(){
        var obj = new Object();
        obj.title='<%=title%>';
        obj.age='<%=age%>';
        obj.runningTime='<%=runningTime%>';
        obj.movieDate='<%=movieDate%>';
        obj.selectedSeater='<%=selectedTheater%>';
        obj.reserveSeat='<%=reserveSeat%>';

        var jsonData=JSON.stringify(obj);




    	var price=<%=moviePrice%>;
    	    console.log(price);
        var IMP = window.IMP; // 생략가능
        IMP.init('imp73022622'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '영화 티켓 예매',
            amount : price,
            buyer_email : 'movie@movie.com',
            buyer_name : '지경수',
            buyer_tel : '010-1234-1234',
            buyer_addr : '서울특별시 영등포 TIS상영관',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                //location.href='http://www.naver.com';
              $(".submit").trigger("click");

            } else {
            	msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
              <%--   location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                alert(msg);
                $(".submit").trigger("click");
            }
        });
        
    });
    </script>





</body>
</html>
