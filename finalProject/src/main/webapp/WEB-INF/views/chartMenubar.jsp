<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>


<style>
.menu{
    width: 1000px;
    height: 120px;
    /* text-align: center; */
    margin: 5%;
}
.menu1{
    height: 50%;
    box-sizing: border-box;
    /* border-bottom: 4px solid black; */
}
.menu2{
    height: 50%;
    padding: 10px;
}
.mtit1{
    font-size: 35px;
    padding: 30px;
    text-decoration: none;
    color: black;
    /* text-shadow: 1px 1px rgb(244, 222, 201); */
    font-weight: 800;
}
.mtit1:hover{
    color: black;
    font-weight: 1000;
    text-decoration: none;
}
.mtit2:hover{
    color: black;
    font-weight: 1000;
    text-decoration: none;
}
.mtit2{
    font-size: 25px;
    padding: 30px;
    text-decoration: none;
    color: black;
    /* text-shadow: 1px 1px rgb(244, 222, 201); */
    font-weight: 800;
}

        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
</style>    
</head>

<body>
	<jsp:include page="common/header.jsp"/>
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.alert("서비스 요청 성공", "${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

    <div style="margin-top:50px;">
        <div class="menu">
            <div class="menu1">
                <a class="mtit1" href="">회원 관리</a>
            </div>
            <div class="menu2">
                <a class="mtit2" href="new.me">신규회원</a>
                <a class="mtit2" href="remove.me">탈퇴회원</a>
                <a class="mtit2" href="product.ct">등록/거래 수량</a>
                <a class="mtit2" href="money.ct">등록/거래 금액</a>
            </div>
        </div>
    </div>
   
</body>
</html>