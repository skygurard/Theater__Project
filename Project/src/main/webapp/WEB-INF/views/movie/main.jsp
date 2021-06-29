<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main/main.css">
    
    <link
    rel="shortcut icon"
    href="https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/CJ_logo.svg/1195px-CJ_logo.svg.png"
  />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV 영화예매 페이지</title>
</head>
<body>
    <div class="flexContainer">
        <header id="header">
            <div class="headerContainer">
                <h1 id="logo">
                    <img src="https://img.cgv.co.kr/R2014/images/title/h1_cgv.png"  alt=""><a href="BoardList.do">Movie Ticket</a>
                    </h1>
                <nav id="gnb">
                    <c:choose>
                        <c:when test="${loggedMemberInfo!=null }">
                            <ul class="menu1">
                                <li>${loggedMemberInfo.name}님 환영합니다.</li>
                                <li><a href="MemberInfo.do?no=${loggedMemberInfo.no}">회원정보수정</a></li>
                                <li><a href="BoardWriteForm.do">글쓰기</a></li>
                                <c:if test="${loggedMemberInfo.grade == 3}">
                                    <a href="ListMovie.do">영화목록</a>
                                </c:if>
                                <li><a href="MemberLogOut.do">로그아웃</a></li>
                                <%-- <li>${loggedMemberInfo.name}</li> --%>
                            </ul>
                        </c:when>
                   
                        <c:otherwise>
                            <ul class="menu1">
                                <li><a href="MemberLoginForm.do">로그인</a></li>
                                <li><a href="ListMovie.do">영화목록</a></li>
                                <li><a href="MemberJoinForm.do">회원가입</a></li>
                                <li><a href="BoardList.do">게시판</a></li>
                                <%-- <li>${loggedMemberInfo.name}</li> --%>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </nav>
            </div>
        </header>
    <section class="movieSlide">
        <div class="movieSlideContainer">
            <div class="movieSlideContainerAlbum">
              <div class="movieSlideContainerAlbumImages" id="movieSlideContainerAlbumImages">
                <img src="https://img.cgv.co.kr/Front/Main/2021/0603/16226896511230.jpg">
                <img src="https://img.cgv.co.kr/banner/main/mainbig_new_3.jpg">
                <img src="https://img.cgv.co.kr/Front/Main/2021/0623/16244092604450.jpg">
                <img src="https://img.cgv.co.kr/Front/Main/2021/0618/16239787731570.jpg">
              </div>
              <div class="movieSlideContainerAlbumButton">
                <button class="prev">
                    <span>
                        <i class="fas fa-chevron-left fa-3x"></i>
                    </span>
                </button>
                <button class="next"><i class="fas fa-chevron-right fa-3x" fa-lg></i></button>  
            </div>
            </div>

          </div>
        </section>
    <section class="movieSelection"> 
        <!-- 예고편 넣는 곳 -->
        <div class="movieList" id="momvieList">
            <img class="borderImage" src="https://img.cgv.co.kr/R2014/images/title/h3_movie_selection.gif" alt="#">
        </div>
        <div class="movieListImg">
        <c:forEach var="movieBean" items="${movieList }" begin="0"
                        end="${movieList.size()}" step="1" varStatus="status">
        
          <img src="${movieBean.posterImg}">
       
                        
        </c:forEach>
         </div>      
                        
       
    </section>
    <section class="event">
        <div class="eventList" id="eventList">
            <img class="borderImage" src="https://img.cgv.co.kr/R2014/images/title/h3_event.gif" alt="#">
        </div>
        <div class="eventListImg1">
            <ul>
                <img src="https://img.cgv.co.kr/Front/Main/2021/0330/16170705205160.jpg" alt="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31811">
                <img src="https://img.cgv.co.kr/Front/Main/2020/1222/16086237963730.jpg" alt="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=30445">
                <img src="https://img.cgv.co.kr/Front/Main/2021/0623/16244340208220.jpg" alt="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=32471&menu=001">
                <img src="https://img.cgv.co.kr/Front/Main/2021/0623/16244340208370.jpg" alt="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=32531&menu=001">
            </ul>
        </div>
        <div class="eventListImg2">
            <div class="eventListImg2Event1">
                <img src="https://img.cgv.co.kr/R2014/images/main/main_moviecollage.jpg" alt="http://www.cgv.co.kr/arthouse/">
            </div>
            <div class="eventListImg2Event2">

            </div>
        </div>
    </section>
        <footer>
            <p>ALL COPYRIGHT RESERVED BY TIS</p>
            <div class="footerImg1">
                <span></span>
            </div>
            <div class="footerImg2">
                <span></span>
            </div>
        </footer>
    </div>
    <script src="js/slide.js"></script>
</body>
</html>