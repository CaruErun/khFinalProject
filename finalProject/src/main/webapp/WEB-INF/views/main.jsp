<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>	<meta charset="UTF-8">
	<!-- swiper -->
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
	<title>Insert title here</title>
</head>
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
</style>
<body>

	<jsp:include page="common/header.jsp"/>

	<!-- swiper -->
	<div class="swiper-area" >
	    
	    <div class="swiper">
	        
	        <div class="swiper-wrapper">
	            <div class="swiper-slide"><img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt=""></div>
	        </div>
	        
	        <div class="swiper-button-prev"></div>
	        <div class="swiper-button-next"></div>
	        <div class="swiper-pagination"></div>
	    </div>
	</div>
    <script>
        const swiper = new Swiper( '.swiper', {
            autoplay: true,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
                clickable: true
            }
        });
    </script>

	<div class="see-all">
	    <div>    
	        <h2>마감임박경매</h2>
	    </div>
	    <div id="all">
	        <span>전체보기</span>
	        <a href="#">+</a>
	    </div>
	</div>
    

	<div class="item-preview">
	    
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p><b>즉시구매가</b></p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p><b>시작가</b></p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p><b>현재가</b></p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	    
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	</div>
	
	<div class="see-all">
	    <div>    
	        <h2>인기경매</h2>
	    </div>
	    <div id="all">
	        <span>전체보기</span>
	        <a href="#">+</a>
	    </div>
	</div>
	    
	
	<div class="item-preview">
	    
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	    
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>
	
	    <div class="product-box">
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	            </div>
	            <div class="text-box">
	                <div class="content-box">
	                    <p>젠북 초특가 세일~</p>
	                    <i>하트</i>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p>즉시구매가</p>
	                    <p>600,000</p>
	                </div>
	                <div class="price-content">
	                    <p>시작가</p>
	                    <p>500,000</p>
	                </div>
	                <div class="price-content">
	                    <p>현재가</p>
	                    <p>525,000</p>
	                </div>
	            </div>
	            <div class="countDown-box">
	                02일 11시간 30분 25초
	            </div>
	        </div>
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>10</p>
	                </div>
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>150</p>
	                </div>
	            </div>
	    </div>

	    
	</div>
	<jsp:include page="common/footer.jsp"/>

</body>
</html>