<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!-- alert창 예쁘게 꾸미는 구문 Started -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />


<link href="<c:url value='/resources/css/reset.css'/>" rel="stylesheet" />
<link href="${path}/resources/css/style.css" rel="stylesheet" />
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box !important;
}

.menubar {
	width: 100%;
	height: 140px;
	position: fixed;
	border: solid 1px black;
	z-index: 1000;
	
}

.navbar {
	width: 100%;
	height: 40px;
	position: relative;
	display: flex;
	justify-content: space-between;
	border: solid 1px black;
	background-color: white;
}

.navbar div {
	width: 35%;
	height: 100%;
	font-size: 14px;
	display: flex;
	align-items: center;
}

#clock {
	margin-left: 100px;
}

.nav-list {
	width: 90%;
	list-style-type: none;
	display: flex;
	justify-content: space-evenly;
}

.nav-list a {
	text-decoration: none;
	color: black;
}

.header {
	background-color: black;
	width: 100%;
	height: 100px;
	position: relative;
	display: flex;
	justify-content: center;
	box-shadow: 0px 5px 7px rgba(0, 0, 0, 0.5);
}

.head-inner {
	width: 80%;
	height: 100%;
	display: flex;
	justify-content: space-evenly;
}

.h1 {
	width: 10%;
}

.h2 {
	width: 50%;
}

.head-inner>div {
	font-size: 22px;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.header-nav {
	width: 100%;
	list-style: none;
	display: flex;
	justify-content: space-evenly;
}

.header a {
	text-decoration: none;
	color: white;
	margin: 45px;
}

.search-bar {
	height: 30px;
	font-size: 15px;
}
</style>

<body>
<c:if test="${ not empty alertMsg }">
<script>
	alert("${alertMsg}");
</script>
<c:remove var="alertMsg" scope="session"/>
</c:if>
	
	<div class="menubar">
		<!-- Navigation-->
		<div class="navbar">
			<div id="clock" style="color: black"></div>
			<div>
				<ul class="nav-list">
					<c:choose>
						<c:when test="${ empty loginUser }">
							<li><a href="#!">samsam은 처음이신가요?</a></li>
							<li><a data-toggle="modal" data-target="#login_modal2">로그인</a></li>
							<li><a href="enrollForm.me">회원가입</a></li>
							<li><a href="noticeList.no">고객센터</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${loginUser.userId eq 'admin' }">
									<lable>${ loginUser.userName }님 환영합니다</label> &nbsp;&nbsp; <a href="logout.me">로그아웃</a> <a href="noticeList.no">고객센터</a> <a href="new.me">차트</a>
								</c:when>
								<c:otherwise>
									<lable>${ loginUser.userName }님 환영합니다</label> &nbsp;&nbsp; <a href="myPageSale.me">마이페이지</a> <a href="logout.me">로그아웃</a> <a href="noticeList.no">고객센터</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<script>
        var clockTarget = document.getElementById("clock");
        function clock() {
            var today = new Date();
            clockTarget.innerText =today;
        }
        function init() {
            clock();
            setInterval(clock, 1000);
        }
        init();
    </script>
		<!-- Header-->
		<div class="header">
			<div class="head-inner">
				<div class="h1">
					<img src="#" alt=""> <a href="${pageContext.request.contextPath }">samsam<br>Auction
					</a>
				</div>
				<div class="h2">
					<ul class="header-nav">

						<li><a href="#">신규경매</a></li>
						<li><a href="#">마감임박경매</a></li>
						<li><a href="#">카테고리</a></li>
						<c:choose>
                            <c:when test="${loginUser==null}">
								<li><a href="insertProductForm.pr" id="loginId" data-toggle="modal"  onclick="loginCheck();">물품등록</a></li>
                            </c:when>
                            <c:otherwise>
								<li><a href="insertProductForm.pr">물품등록</a></li>
                            </c:otherwise>
                        </c:choose>
					</ul>
				</div>
				<script>
					function loginCheck(){
						var check = confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")
						if(check){
							$('#loginId').attr('data-target','#login_modal2');
						}else{
							$('#loginId').removeAttr('data-target');
						}
					}
				</script>

				<div class="h3">
					<select name="" class="search-bar">
						<option value="">물품명</option>
					</select> <input type="text" class="search-bar" placeholder="검색어를 입력하세요.">
					<button class="search-bar">검색</button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade ch" id="login_modal2">
		<h2 class="blind">로그인 팝업</h2>
		<div class="login-modal-box">
			<div class="login-modal-head">
				<button class="close-btn"></button>
				<h3 class="login-modal-title">로그인</h3>
			</div>
			<div class="topline"></div>
			<div style="text-align: center;">
				<img class="logoimg" src="resources/images/중고경매.png" alt="">
			</div>
			<p class="sub-text">SAMSAM AUCTION</p>
			<form class="user-input-wrap" action="login.me" method="post">
				<input id="userId" name="userId" class="user-input-box" type="text" placeholder="아이디" />
				<div class="error-line"></div>
				<strong class="id-error">아이디를 입력해 주세요.</strong> <input id="userPw" name="userPw" class="user-input-box" type="password" placeholder="비밀번호" />
				<div class="info-error">아이디 혹은 비밀번호가 일치하지 않습니다.</div>
				<input id="login-status-btn" class="login-status-btn" type="checkbox" /> <label for="login-status-btn" class="login-status-text">로그인 상태 유지</label>
				<button id="modal-login-btn" class="login-btn">로그인</button>
			</form>
			<ul class="user-function-wrap">
				<li class="user-function-list"><a href="" class="user-function-link">회원가입</a></li>
				<li class="user-function-list"><a href="" class="user-function-link">아이디/비밀번호 찾기</a></li>
			</ul>
			<div class="line">또는</div>
			<ul class="easy-login-wrap">
				<li><a class="easy-login-link google" href="https://www.google.com/">구글 계정으로 로그인</a></li>
				<li><a class="easy-login-link facebook" href="https://www.facebook.com/">페이스북 계정으로 로그인</a></li>
				<li><a class="easy-login-link naver" href="https://www.naver.com/">네이버 계정으로 로그인</a></li>
				<li><a class="easy-login-link kakao" href="https://www.kakaocorp.com/page/">카카오톡 계정으로 로그인</a></li>
			</ul>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


	<script>
      let modalCheck = false;
      $(".login-btn").click(function () {
        if (!modalCheck) {
          $(".login-modal").show();
          modalCheck = true;
        }
      });
      $(".close-btn").click(function () {
        if (modalCheck) {
          $(".login-modal").hide();
          modalCheck = false;
        }
      });
      $("#modal-login-btn").click(function () {
        let userID = $("#user-id").val();
        if (userID =="") {
        	$(".info-error").show();
          $("#user-id").css("border", "2px solid #F4492E");
        } else {
          
        }
      });
    
  </script>


</body>





</html>