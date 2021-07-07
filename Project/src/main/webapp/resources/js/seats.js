const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied');
const count = document.getElementById('count');
const total = document.getElementById('total');
const movieSelect = document.getElementById('movie');
var reserveSeat= [];

populateUI();
let ticketPrice = 10000;

$(document).ready( 
  function clearSeat(){
    var val;
    document.getElementById("count").innerHTML="0";
    document.getElementById("total").innerHTML="0";
    
    $(".seat").attr("class","seat");
    }
  )

  

  $(function(){
    $(".seat").click(function(){
      var inputVal= $(this).attr('value');
  
        if($(this).hasClass("choice")===true)
        {
          for(var i = 0; i < reserveSeat.length; i++) {
            if(reserveSeat[i] === inputVal)  {
              reserveSeat.splice(i, 1);
              i--;
              }
            $(this).removeClass("choice");
           }
        
        }else{
         
          $(this).addClass("choice");
          reserveSeat.push(inputVal);
          
        }
        console.log(reserveSeat);
        console.log(inputVal);
        Seat=reserveSeat.join(',');
        console.log(Seat);
        $("input[name='reserveSeat']").attr("value",Seat);
  
  
      });
      
      
      
      
  });
  
  
  function check(){
    const choice=document.querySelector('choice');
      if(choice !== null){
      var msg=confirm("선택한 좌석으로 예매하시겠습니까?");
      if(msg){
        
      }else{
        return false;
      }
    }else{
      alert("좌석을 선택해주세요")
      return false;
    }
          
    };
// 영화 데이터
function setMovieData(movieIndex, moviePrice) {
  localStorage.setItem('selectedMovieIndex', movieIndex);
  localStorage.setItem('selectedMoviePrice', moviePrice);
}

// 가격 및 좌석 카운트 이벤트
function updateSelectedCount() {
  const selectedSeats = document.querySelectorAll('.row .seat.selected');

  const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));



  const selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * 10000;
}

// get data from localstorage and populate ui
function populateUI() {
  const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add('selected');
      }
    });
  }

  const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');

  if (selectedMovieIndex !== null) {
    movieSelect.selectedIndex = selectedMovieIndex;
  }
}

// 영화 선택 이벤트
movieSelect.addEventListener('change', (e) => {
  ticketPrice = +e.target.value;
  setMovieData(e.target.selectedIndex, e.target.value);
  updateSelectedCount();
});

// 좌석 선택 이벤트
container.addEventListener('click', (e) => {
  if (e.target.classList.contains('seat') && !e.target.classList.contains('occupied')) {
    e.target.classList.toggle('selected');

    updateSelectedCount();
  }
});

// 최종 선택및 가격
updateSelectedCount();
