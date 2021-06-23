const container = document.querySelector('.container');
const count = document.querySelector('#count');
const total = document.querySelector('#total');
const seats = document.querySelectorAll('.rows .seat:not(occupied)');
const moiveSelect = document.querySelector('#movie');

let moviePrice = moiveSelect.value;

moiveSelect.addEventListener('change',e=>{
    moviePrice = e.target.value;
    updateUi();
})
function updateUi(){
    const selectedSeats = document.querySelectorAll('.rows .seat.selected');
    count.innerText = selectedSeats.length;
    total.innerText = moviePrice * selectedSeats.length;

    const selectedIndex = [...selectedSeats].map(seat=>{
        return [...seats].indexOf(seat);
    })
}
container.addEventListener('click',e=>{
   if(e.target.classList.contains('seat') &&
        !e.target.classList.contains('occupied')){
        e.target.classList.toggle('selected')

        updateUi();
   }
})