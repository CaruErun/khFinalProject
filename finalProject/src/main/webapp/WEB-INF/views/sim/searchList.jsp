<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchList</title>

    <script src="https://kit.fontawesome.com/ee429cabba.js" crossorigin="anonymous"></script>
    
<style>
	.swiper-area{
        position: relative;
        z-index: 0;
        left: 15%;
        top: 150px;
        width: 70%;
        height: 300px;
        border: solid 1px black;
    }
    .swiper{
        position: absolute;
        left: 10%;
        width: 80%;
        height: 100%;
        border: solid 1px black;
    }
    .swiper-wrapper{
        width: 100%;
        height: 100%;
    }
    .swiper-slide {
        display: flex;
        justify-content: center;
    }
    .swiper-wrapper img{
        width: 80%;
        height: 100%;
    }
    .swiper-button-prev,.swiper-button-next{
        border: solid 1px black;
        width : 10%;
        color:black;
        z-index : 4;  
    }
    .see-all{
        position: relative;
        left: 15%;
        top:150px;
        width: 70%;
        height: 80px;
        border-bottom: 1px dotted black;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 100px;
    }
    .see-all>div{
        padding-top: 20px;
    }
    #all {
        font-size: 14px;
        font-weight: bold;
    }
    .item-preview{
        position: relative;
        width: 70%;
        height: 1000px;
        left: 15%;
        top:150px;
        display: flex;
        flex-wrap:wrap;
        justify-content: center;
       
        
        
    }
    .item-preview > .product-box {
        width: 19%;
        height: 416px;
        background-color: white;
        margin: 6px;
        border: 1px dotted black;
    }
     .padding-line{
        width: 100%;
        padding: 10px 10px 0px 10px;
     }   
    .img-box > img {
        width: 100%;
        height: 220px;
    }
    .content-box{
        width: 100%;
        height:25px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0px 5px 0px 5px;
        font-size: 16px;
    }
    .price-box{
        width: 100%;
        margin-top: 5px;
        border-top: 1px dotted black;
        padding-top: 5px;
        
    }
    .price-content{
        width: 100%;
        display: flex;
        justify-content: space-between;
        font-size: 15px;
        padding-bottom: 8px;
    }
    .countDown-box{
        width: 100%;
        height: 25px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 16px;
        font-weight: bold;
        color:cornflowerblue;
        padding-bottom: 8px;
    }
    .count-box{
        width: 100%;
        height: 35px;
        display: flex;
        color: white;
        background-color: black;
    }
    .count-content{
        width: 50%;
        height: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 16px;
        border: 1px solid white;
        padding: 5px;
    }
    #h_mark{
        color: lightgray;
    }
</style>
</head>
<body>


	<jsp:include page="../common/header.jsp"/>

	<div class="item-preview">
	
	
	   	<c:forEach var="p" items="${proList }">
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>${p.proTitle }</p>
	                    <i class="fa-solid fa-heart" id="h_mark"></i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p><b>즉시구매가</b></p>
	                    <p>${p.wishPrice }</p>
	                </div>
	                <div class="price-content">
	                    <p><b>시작가</b></p>
	                    <p>${p.proPrice }</p>
	                </div>
	                <div class="price-content">
	                    <p><b>현재가</b></p>
	                    <p>******</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                ***02일 11시간 30분 25초***
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>******</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>${p.count }</p>
	                </div>
	            </div>
	    </div>
	    </c:forEach>
	    
	    
	    <script>
	    	
	    </script>
	    
	    
	 </div>

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>