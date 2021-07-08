<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
rel="stylesheet">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/reserve_layout.css">
<link rel="stylesheet"
href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
crossorigin="anonymous">
<link rel="stylesheet" href="css/main/header.css">

<link rel="shortcut icon"
href="https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/CJ_logo.svg/1195px-CJ_logo.svg.png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="flexContainer">
    <header id="header">
        <div class="headerContainer">
            <h1 id="logo">
                <img src="https://img.cgv.co.kr/R2014/images/title/h1_cgv.png"
                    alt=""><a href="BoardList.do"></a>
            </h1>
            <nav id="gnb">
                <c:choose>
                    <c:when test="${loggedMemberInfo!=null }">
                        <ul class="menu1">
                            <li>${loggedMemberInfo.name}님환영합니다.</li>
                            <li><a href="MemberInfo.do?no=${loggedMemberInfo.no}">회원정보수정</a></li>
                            <li><a href="BoardWriteForm.do">글쓰기</a></li>
                            <c:if test="${loggedMemberInfo.grade == 3}">
                                <a href="ListMovie.do">영화목록</a>
                            </c:if>
                            <li><a href="MemberLogOut.do">로그아웃</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="menu1">
                            <li><a href="MemberLoginForm.do">로그인</a></li>
                            <li><a href="ListMovie.do">영화목록</a></li>
                            <li><a href="MemberJoinForm.do">회원가입</a></li>
                            <li><a href="BoardList.do">게시판</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </nav>
        </div>
    </header>
</div>





