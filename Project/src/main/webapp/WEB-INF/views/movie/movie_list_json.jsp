<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<body>

   <div class="formBox" id="list">
      <h2>회원가입</h2>
      <ul id="movieList">
         <li>
            <a href="">
               <div class="img"><img src="fdsklfjds.png"></div>
               <div class="info">
                  <h2>ID:fjkdjfs</h2>
                  <p>Name:lkfjdkjlsfds</p>
               </div>
            </a>
         </li>
      </ul>
      <div class="btns">
         <a href="InsertMovieForm.do" id="join">영화 등록</a>
      </div>
      <div>${msg }</div>
   </div>
   <script>
      $.ajax({
         url:"MovieListJson.do",
         success:function(data){
            console.log(data.movieList);
            let movieList = data.movieList;
            $.each(movieList,function(i,item){
               //console.log(item);
               $("#movieList").append(`
                  <li>
                     <a href="">
                        <div class="img"><img src="\${item.profileImg}"></div>
                        <div class="info">
                           <h2>TITLE:\${item.title}</h2>
                           <p>DIRECTOR:\${item.director}</p>
                           <p>ACTOR:\${item.actor}</p>
                           <p>RELEASEDATE:\${item.releaseDate}</p>
                           <p>RUNNINGTIME:\${item.runningTime}</p>
                           <p>AGE:\${item.age}</p>
                           <p>COUNTRY:\${item.country}</p>
                           <p>INFO:\${item.info}</p>
                        </div>
                     </a>
                  </li>      
               `)
            });
         }
      })
      
   </script>
</body>
</html>



