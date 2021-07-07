const date = new Date();
// console.log(date.getFullYear());
const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
const nextLastDay = new Date(date.getFullYear(), date.getMonth() + 2, 0);
const reserveDate = document.querySelector('.reserve-date');
const theaterPlace = document.querySelectorAll('.theater-place');
const reserveTimeWant = document.querySelectorAll('.reserve-time-want');
const inputAge = document.querySelector('movie-list-age');
const inputTitle = document.querySelector('.title');

const inputSelectedTheater = document.querySelector('.selectedTheater');
const inputReserveDate = document.querySelector('.reserveDate');
const inputRunningTime = document.querySelector('.runningTime');
const moveSeatForm = document.querySelector('.moveSeatForm');
const moveSeatButton = document.querySelector('.moveSeatButton');
const movieAge = document.querySelector('.movieAge');
var movieSelectAge='';


let movieListAge = '';
let year = 0;
let month = 0;
add();
document.addEventListener('DOMContentLoaded', () => {
    add();
    addDate();
});

// 데이터 가져오기
//*
function add() {
    $.ajax({
        url: 'MemberList.do',
        type: 'get',
        success: function(data) {
            
            document.querySelectorAll('.movie-list-title').forEach(li => {
                li.addEventListener('click', function() {
                    const movieListTitleActvie = document.querySelectorAll(
                        '.movie-list-title-active'
                    );
                    
                    movieListTitleActvie.forEach(li => {
                        li.classList.remove('movie-list-title-active');
                    });
                    li.parentNode.classList.add('movie-list-title-active');
                    
                    //console.log(li.innerHTML);
                    
                    //console.log(li.parentElement);
                    console.log(li.parentElement.childNodes[1].innerHTML);
                    console.log(li.parentElement.childNodes[0].innerHTML)
                    movieAge.value = li.parentElement.childNodes[0].innerHTML;
                    inputTitle.value = li.innerHTML;
                });
             
            });
        },
        error: function() {
            document.querySelector('.movie-list-wrapper').innerHTML =
                '데이터가없습니다 새로고침해주세요';
        },
    });
}

function setData(data) {
    data = JSON.parse(data);

    return data;
}

function setList(data) {
    document.querySelector('.movie-list-wrapper').innerHTML = JSON.parse(
        data
    ).reduce((html = '', item, index = 0) => {
        html += getMovieList(item);

        return html;
    }, ' ');
}

function getMovieList(MovieBean) {
    console.log(MovieBean);
    return `<div class="movie-list">
    <div class="movie-list-age">${item.movieAge}</div>
    <button class="movie-list-title">${item.movieTitle}</button>
</div>`;
}

function addDay(){
    const weekOfDay = ['일', '월', '화', '수', '목', '금', '토'];
    const button = document.createElement('button');
    const spanWeekOfDay = document.createElement('span');
    const spanDay = document.createElement('span');

    //class넣기
    button.classList = 'movie-date-wrapper';
    spanWeekOfDay.classList = 'movie-week-of-day';
    spanDay.classList = 'movie-day';

    //weekOfDay[new Date(2020-03-날짜)]
    const dayOfWeek =
        weekOfDay[new Date(year + '-' + month + '-' + i).getDay()];

    //요일 넣기
    if (dayOfWeek === '토') {
        spanWeekOfDay.classList.add('saturday');
        spanDay.classList.add('saturday');
    } else if (dayOfWeek === '일') {
        spanWeekOfDay.classList.add('sunday');
        spanDay.classList.add('sunday');
    }
    spanWeekOfDay.innerHTML = dayOfWeek;
    button.append(spanWeekOfDay);
    //날짜 넣기
    spanDay.innerHTML = i;
    button.append(spanDay);
    //button.append(i);

    reserveDate.append(button);

    dayClickEvent(button);
}


function addDate() {
    
    remainDay= (lastDay.getDate()-date.getDate());
    year = date.getFullYear();
    month = date.getMonth()+1;
    console.log(remainDay)
    reserveDate.append(year + '/' + month);
    if(remainDay<8){

        for (i = date.getDate(); i <= lastDay.getDate(); i++) {
        month = date.getMonth()+1;
        
            addDay();
        }
        month = date.getMonth()+2;
        reserveDate.append(year + '/' + month);
        for (i =1; i <= lastDay.getDate(); i++) {
        month = date.getMonth()+2;
        
            addDay();
        }
    }else{
    for (i = date.getDate(); i <= lastDay.getDate(); i++) {
    month = date.getMonth()+1;
    
        addDay();
    }
    }
}

function dayClickEvent(button) {
    button.addEventListener('click', function() {
        const movieDateWrapperActive = document.querySelectorAll(
            '.movie-date-wrapper-active'
        );
        movieDateWrapperActive.forEach(list => {
            list.classList.remove('movie-date-wrapper-active');
        });
        button.classList.add('movie-date-wrapper-active');
        console.log(button.childNodes[1].innerHTML);
        inputReserveDate.value =
            year +
            '.' +
            month +
            '.' +
            button.childNodes[1].innerHTML +
            '(' +
            button.childNodes[0].innerHTML +
            ')';
        console.log(inputReserveDate.value);
    });
}

theaterPlace.forEach(list => {
    list.addEventListener('click', function() {
        const theaterPlaceWrapper = document.querySelectorAll(
            '.theater-place-active'
        );
        theaterPlaceWrapper.forEach(li => {
            li.classList.remove('theater-place-active');
        });
        list.classList.add('theater-place-active');
        console.log(list.innerHTML);
        inputSelectedTheater.value = list.innerHTML;
    });
});

reserveTimeWant.forEach(list => {
    list.addEventListener('click', function() {
        const reserveTimeActive = document.querySelectorAll('.reserve-time-active');
        reserveTimeActive.forEach(li => {
            li.classList.remove('reserve-time-active');
        });
        list.classList.add('reserve-time-active');
        console.log(list.innerHTML);
        inputRunningTime.value = list.innerHTML;
    });
});

moveSeatButton.addEventListener('click', function() {
    if (!!inputTitle.value &&
        !!inputSelectedTheater.value &&
        !!inputReserveDate.value &&
        !!inputRunningTime.value
    ) {
        moveSeatForm.submit();
    } else {
        console.log("click");
        if(!inputTitle.value){
            alert("영화을 선택 해주세요");
        }else  if(!inputSelectedTheater.value){
            alert("극장을 선택 해주세요");
        }else  if(!inputReserveDate.value){
            alert("날짜을 선택 해주세요");
        }else  if(!inputRunningTime.value){
            alert("시간을 선택 해주세요");
        }
        
    }
});