<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	 *{
        margin: 0;
        padding: 0;
        box-sizing: border-box !important; 
    }
    .menubar{
        width: 100%;
        height: 140px;
        position:fixed;
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
    .navbar div{
        width: 35%;
        height: 100%;
        font-size: 14px;
        display: flex;
        align-items: center;
    }
    #clock{
        margin-left: 100px;
    }
    .nav-list{
        width: 90%;
        list-style-type: none;
        display: flex;
        justify-content: space-evenly;
        
    }
    .nav-list a{
        text-decoration: none;
        color: black;
    }
    .header{
        background-color: black;
        width: 100%;
        height: 100px;
        position: relative;
        display: flex;
        justify-content: center;
        box-shadow: 0px 5px 7px rgba(0, 0, 0, 0.5);
    }
    .head-inner{
        width: 80%;
        height: 100%;
        display: flex;
        justify-content: space-evenly;
    }
    .h1{
        width: 10%;
    }
    .h2{
        width: 50%;
    }
    .head-inner>div{
        font-size: 22px;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .header-nav{
        width: 100%;
        list-style: none;
        display: flex;
        justify-content: space-evenly;
    }
    .header a{
        text-decoration: none;
        color: white;
        margin: 45px;
    } 
    .search-bar{
        height: 30px;
        font-size: 15px;
    }
	
</style>
<body>


<div class="menubar">

    <!-- Navigation-->
    <div class="navbar">
      

        <div id="clock" style="color:black"></div>
        
        <div>
            <ul class="nav-list">
                <li><a href="#!">samsam은 처음이신가요?</a></li>
                <li><a href="#!">로그인</a></li>
                <li><a href="#!">회원가입</a></li>
                <li><a href="#">고객센터</a></li>
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
                <img src="#" alt="">
                <a href="${pageContext.request.contextPath }">samsam<br>Auction</a>
            </div>
            <div class="h2">
                <ul class="header-nav">
                    
                    <li><a href="#">신규경매</a></li>
                    <li><a href="#">마감임박경매</a></li>
                    <li><a href="#">카테고리</a></li>
                    <li><a href="insertProductForm.pr">물품등록</a></li>
                </ul>
            </div>
            <div class="h3">
                <select name="" class="search-bar">
                    <option value="">물품명</option>
                </select>
                <input type="text" class="search-bar"placeholder="검색어를 입력하세요.">
                <button class="search-bar">검색</button>
            </div>
        </div>

    </div>
</div>


</body>
</html>