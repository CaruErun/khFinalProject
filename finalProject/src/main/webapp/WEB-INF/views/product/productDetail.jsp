<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        
        <meta charset="UTF-8">

        <jsp:include page="../common/header.jsp"/>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- swiper -->
        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
        <title>Document</title>
    </head>
    <style>
       
        .detail-area{
            position: relative;
            width: 70%;
            margin: 0 auto;
            top: 300px;
        }
        .detail-title{
            width: 100%;
            height: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .detail-title > div{
            width: 98%;
            height: 40px;
            border-bottom: 1px dotted black;
        }
        .detail-info{
            width: 100%;
            height: 800px;
            display: flex;
        }
        .detail-img{
            width: 50%;
            height: 100%;
        }
        .big-imgbox{
            width: 100%;
            height: 70%;
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        .big-img{
            width: 80%;
            height: 500px;
            border: 1px dotted black;
        }
        .small-imgbox{
            width: 100%;
            height: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
         
        }
        .swiper{
            width: 90%;
            height: 100%;
          
        }
        .swiper-wrapper{
            width: 100%;
            height: 100%;
            padding-left: 4px;
         
        }
        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        .swiper-button-prev,.swiper-button-next{
            width : 3%;
            color:black;
            border: 1px solid black;
        }
        .small-img{
            width: 50%;
            height: 150px;
            margin-right: 10px;
            border: 1px dotted black;
            cursor: pointer;
        }
        .small-imgbox > span{
            font-size: 50px;
            margin-right: 30px;
            margin-left: 20px;
        }
        .detail-text{
            width: 50%;
            height: 100%;
        }
            
        
        .cur-price{
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 5px 0 5px;
        }
        #cp-1{
            width: 30%;
            height: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #cp-2{
            width: 35%;
            height: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
        }
        .list-area{
            width: 100%;
            height: 50px;
            display: flex;
            align-items: center;
        }
        .black-area{
            background-color: black;
            color: white;
            width: 23%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .text-area{
            width: 77%;
            height: 100%;
            display: flex;
            align-items: center;
            padding-left: 15px;
        }
        .bc-2 {
            display: flex;
            justify-content: space-between;
            padding-right: 5px;
    
        }
        .bc-2 a{
            width: 30%;
            height: 30px;
            text-decoration: none;
            padding-top: 4px;
            text-align: center;
            color: white;
            background-color:black ;
        }
        .renew{
            border-top: 2px solid gray;
        }
        .bid-count, .shipping-price{
            border-bottom: 2px solid gray;
        }
        .seller-info{
            width: 100%;
            height: 120px;
            margin-top: 50px;
        }
        .seller-area{
            width: 100%;
            height: 50px;
            display: flex;
        }
        .seller-area > div {
            width: 50%;
            height: 100%;
            display: flex;
            border: 1px solid gray;
            
        }
        .seller-black{
            width: 46%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
        }
        .seller-text{
            width: 54%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: black;
            padding-left: 15px;
            padding-right: 5px;
        }
        .seller-text > a{
            width: 50%;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            color: white;
            background-color: black;
        }
        .btn-area{
            width: 100%;
            height: 40px;
            display: flex;
            justify-content:start;
        }
        .btn-area > button{
            width: 25%;
            height: 100%;
            font-size: 16px;
            border-radius: 3px;
        }
        .btn-1{
            background-color: black;
            color: white;
        }
        .btn-2{
            background-color: rgb(94, 94, 94);
            color: white;
            margin: 0 83px 0 83px;
            border-style: none;
        }
        .btn-3{
            background-color: white;
        }
        .detail-content{
            width: 100%;
            margin-top: 200px;
        }
        .content-btn{
            width: 100%;
            height: 40px;
            display: flex;
        }
        .content-btn > button{
            margin: 0 3px;
        }
        .btn-white{
            width: 12%;
            height: 100%;
            font-size: 16px;
            background-color: white;
            border-style: none;
            border-top: 1px solid black;
            border-left: 1px solid black;
            border-right: 1px solid black;
            border-radius: 3px;
        }
        .btn-black{
            width: 12%;
            height: 100%;
            font-size: 16px;
            background-color: black;
            color: white;
            border-radius: 3px;
        }
        .content-text{
            width: 60%;
            overflow: hidden;
            height: auto;
            text-align: center;
            padding-top: 100px;
            margin: 0 auto;
            padding-bottom: 150px;
        }
        .btn-line{
            width: 63%;
            height: 100%;
            border-bottom: 1px dotted black;
        }
        .content-qna{
            width: 100%;
            padding-top: 100px;
            padding-bottom: 150px;
        }
        .content-qna > #qna-table{
            width: 100%;
           
        }
        #qna-table > thead {
            height: 40px;
            background-color: black;
            color: white;
            text-align: center;
        }
        #qna-table > thead > tr> th, td{
            padding-top: 10px;
        }
        #qna-table > tbody > tr {
            height: 40px;
            text-align: center;
            border: 1px solid black;
        }
        .btn-qna{
            width: 12%;
            height: 40px;
            font-size: 16px;
            background-color: black;
            color: white;
            border-radius: 3px;
            float: right;
            margin-top: 15px;
        }
        .content-ship{
            width: 100%;
            height: 100px;
            margin-top: 100px;
            padding-left: 3px;
            margin-bottom: 250px;
            border: 1px solid gray;
        }
        .cs-1{
            width: 100%;
            height: 50%;
            display: flex;
        }
        .cs-2{
            width: 100%;
            height: 50%;
            display: flex;
            border-top: 1px solid gray;
        }   
        .cs-black{
            width: 12%;
            background-color: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .cs-text{
            width: 88%;
            height: 100%;
            display: flex;
            align-items: center;
            padding-left: 25px;
        }
        .modal-footer1{
            display: flex;
            justify-content: center;
            border: 1px solid black;
            text-align: center;
            
            
        }
        .modal-header{
            background-color: black;
        }
        /* .modal-body{
            display: flex;
            flex-direction: column;
            align-items: center;
        } */
        .modal-body .list-area{
            font-size: 14px;
            border-top: 1px solid gray;
            width: 90%;
            height: 40px;
            margin: 0 auto;
        }
        #modalTitle{
            color: white;
        }
        #endDate-modal{
            width: 46%;
            height: 25px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
            margin-left: 7px;
        }
        
            
    
        
    
            
    </style>
    
    <body>
        
        <div class="detail-area">
            <div class="detail-title">
                <div>
                    <h2>${p.proTitle}</h3>
                </div>
            </div>
            <div class="detail-info">
                <div class="detail-img">

                        <div class="big-imgbox">
                            <img class="big-img" src="${p.path}" alt="..." />
                        </div>
                        <div class="small-imgbox">
                            

                            <div class="swiper">

                                <div class="swiper-wrapper">
                                    <c:forEach var="i" items="${piList }">

                                        <div class="swiper-slide"><img class="small-img" src="${i.path}" alt="..." /></div>
                                    </c:forEach>
                                    
                                </div>
                                 
                                   
                                <!-- <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div> -->
                                <div class="swiper-pagination"></div>
                            </div>
                            
                            
                        </div>
                 
                        <script>
                            const swiper = new Swiper( '.swiper', {
                                autoplay: false,
                                loop: false,
                                slidesPerView: 3,
                                // navigation: {
                                //     nextEl: '.swiper-button-next',
                                //     prevEl: '.swiper-button-prev'
                                // },
                                pagination: {
                                    el: '.swiper-pagination',
                                    type: 'bullets',
                                    clickable: true
                                }
                            });
                            $('.small-img').on('click',function(){
                                const path = $(this).attr('src');
                                console.log(path);
                                $('.big-img').attr('src',path);
                            })
                            
                        </script>
                  
                </div>
                
                <div class="detail-text">
                    <div class="cur-price">
                        <div id="cp-1">
                            <span><h4>현재가</h4></span>
                            <span><b>${p.curPrice} 원</b></span>
                        </div>
                        <div id="cp-2"></div>
                    </div>
                    <script>
                        const endDate = "${p.endDate}"
                        function convertFromStringToDate(endDate) {
                            let dateComponents = endDate.split(' ');
                            let datePieces = dateComponents[0].split("-");
                            let timePieces = dateComponents[1].split(":");
                        
                            return(new Date(datePieces[0], (datePieces[1] - 1), datePieces[2],
                                                timePieces[0], timePieces[1], timePieces[2]));
                
                        }
                        const countDownTimer = function (id, date) {
                          
                        var _Date = new Date(date);
                        var _second = 1000;
                        var _minute = _second * 60;
                        var _hour = _minute * 60;
                        var _day = _hour * 24;
                        var timer;
                
                        function showRemaining() {
                            var now = new Date();
                            var dDay = _Date - now;
                
                            if (dDay < 0) {
                                clearInterval(timer);
                                
                            }
                
                            var days = Math.floor(dDay / _day);
                            var hours = Math.floor((dDay % _day) / _hour);
                            var minutes = Math.floor((dDay % _hour) / _minute);
                            var seconds = Math.floor((dDay % _minute) / _second);
                
                            document.getElementById(id).textContent = days + '일 ';
                            document.getElementById(id).textContent += hours + '시간 ';
                            document.getElementById(id).textContent += minutes + '분 ';
                            document.getElementById(id).textContent += seconds + '초';
                        }
                
                        timer = setInterval(showRemaining, 1000);
                        }
                        countDownTimer('cp-2',convertFromStringToDate(endDate));
                        countDownTimer('endDate-modal',convertFromStringToDate(endDate));
                    </script>
                    <div class="renew list-area">
                        <div class="rn-1 black-area">
                            새로고침
                        </div>
                        <div class="rn-2 text-area">
                            적용
                        </div>
                    </div>
                    <div class="d-day list-area">
                        <div class="dd-1 black-area">
                            경매기간
                        </div>
                        <div class="dd-2 text-area">
                            ${p.startDate}    ~    ${p.endDate}
                        </div>
                    </div>
                    <div class="start-price list-area">
                        <div class="sp-1 black-area">
                            시작가
                        </div>
                        <div class="sp-2 text-area">
                            ${p.proPrice}원
                        </div>
                    </div>
                    <div class="wish-price list-area">
                        <div class="wp-1 black-area">
                            즉시구매
                        </div>
                        <div class="wp-2 text-area">
                            ${p.wishPrice}원
                        </div>
                    </div>
                    <div class="top-buyer list-area">
                        <div class="tb-1 black-area">
                            최고입찰자
                        </div>
                        <div class="tb-2 text-area">
                            경매중비공개
                        </div>
                    </div>
                    <div class="bid-type list-area">
                        <div class="bt-1 black-area">
                            입찰방식
                        </div>
                        <div class="bt-2 text-area">
                            비공개
                        </div>
                    </div>
                    <div class="bid-count list-area">
                        <div class="bc-1 black-area">
                            입찰 수
                        </div>
                        <div class="bc-2 text-area">
                            <p>${p.bidCount}</p> 
                        </div>
                    </div>
                    <div class="shipping-type list-area">
                        <div class="st-1 black-area">
                            배송방법
                        </div>
                        <div class="st-2 text-area">
                            택배
                        </div>
                    </div>
                    <div class="shipping-price list-area">
                        <div class="shp-1 black-area">
                            배송비용
                        </div>
                        <div class="shp-2 text-area">
                            3500원
                        </div>
                    </div>
                    <div class="seller-info">
                        
                        <div class="seller-area">
                            <div>
                                <div class="seller-black">
                                    판매자 ID
                                </div>
                                <div class="seller-text">
                                    alsrbwlws
                                </div>
                            </div>
    
                            <div>
                                <div class="seller-black">
                                    거래등급
                                </div>
                                <div class="seller-text">
                                    등급(미정)                                
                                </div>
                            </div>
                        </div>
                        
                        <div class="seller-area">
                            <div>
                                <div class="seller-black">
                                    판매자 다른물품
                                </div>
                                <div class="seller-text">
                                    <p>0건</p> 
                                    <a href="#">더보기 ></a>
                                </div>
    
                            </div>
    
                            <div>
                                <div class="seller-black">
                                    판매자 구매후기
                                </div>
                                <div class="seller-text">
                                    <p>4건</p> 
                                    <a href="#">더보기 ></a>                               
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <button class="btn-1" data-toggle="modal" data-target="#bidModalForm">입찰하기</button>
                        <button class="btn-2">관심물품</button>
                        <button class="btn-3" style="border: 1px solid black;">문의하기</button>
                    </div>
                    <div class="modal fade" id="bidModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalTitle">입찰하기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <form action="">

                                    <div class="modal-body">
                                        <div class="titleInModal">
                                            ${p.proTitle}
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                판매자
                                            </div>
                                            <div class="text-area">
                                                이예구
                                            </div>
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                남은기간
                                            </div>
                                            <div class="text-area">
                                                ${p.endDate}까지
                                                <div id="endDate-modal">
                                                </div>
                                            </div>
                                        </div>
                                                    
                                        <div class="list-area">
                                            <div class="black-area">
                                                배송방법
                                            </div>
                                            <div class="text-area">
                                                택배, 비용[${p.postPrice}원]
                                            </div>
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                현재가
                                            </div>
                                            <div class="text-area">
                                                ${p.curPrice} <button type="button" class="btn-1">새로고침</button>
                                            </div>
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                입찰금액
                                            </div>
                                            <div class="text-area">
                                                 
                                            </div>
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                즉시구매가
                                            </div>
                                            <div class="text-area">
                                                ${p.wishPrice}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer1">
                                        
                                            <button type="button" class="btn btn-dark" >신중하게 입찰하기</button>
                                            <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
                                            <button type="button" class="btn btn-secondary">즉시구매하기</button>
                                        

                                    </div>
                                </form>
                            </div>
                          </div>

                    </div>
                </div>
            </div>
        
            <div class="detail-content">
                <div class="content-btn">
                    <button class="btn-white btn1">물품정보</button>
                    <button class="btn-black btn2">물품문의</button>
                    <button class="btn-black btn3">배송정보</button>
                    <div class="btn-line"></div>
                </div>
                <div class="content-text">
                    ${p.proContent}
                </div>
                <div class="content-btn">
                    <button class="btn-black btn1">물품정보</button>
                    <button class="btn-white btn2">물품문의</button>
                    <button class="btn-black btn3">배송정보</button>
                    <div class="btn-line"></div>
                </div>
                <div class="content-qna">
                    <table id="qna-table" border="1">
                        <thead>
                            <tr>
                                <th width="10%">번호</th>
                                <th width="15%">질문구분</th>
                                <th width="45%">제목</th>
                                <th width="15%">등록자</th>
                                <th width="15%">등록일</th>
                            </tr>
                        </thead>
    
                        <tbody>
                            <tr>
                                <td colspan="5" align="center">검색된 내용이 없습니다.</td>
                            </tr>
                            <tr>
                                <td>s</td>
                                <td>2</td>
                                <td>2</td>
                                <td>2</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>s</td>
                                <td>2</td>
                                <td>2</td>
                                <td>2</td>
                                <td>2</td>
                            </tr>
                         
                        </tbody>
                    </table>
                    <button class="btn-qna">문의하기</button>
                </div>
                <div class="content-btn">
                    <button class="btn-black btn1">물품정보</button>
                    <button class="btn-black btn2">물품문의</button>
                    <button class="btn-white btn3">배송정보</button>
                    <div class="btn-line"></div>
                </div>       
                <div class="content-ship">
                    <div class="cs-1">
                        <div class="cs-black">배송지역</div>
                        <div class="cs-text">전국※제주권 및 도서산간 지역은 배송비가 추가될 수 있습니다.</div>
                    </div>
                    <div class="cs-2">
                        <div class="cs-black">배송방법</div>
                        <div class="cs-text">택배(파손물품주의), 비용[ 3,500원 ]</div>
                    </div>
    
                </div>
            </div>
            <script>
           
                $(document).ready(function(){
                    $('.btn1').click(function(){
                        var offset = $('.content-text').offset();
                        console.log(offset)
                        $('html').animate({scrollTop : offset.top-300},400);
                    });
                    $('.btn2').click(function(){
                        var offset = $('.content-qna').offset();
                        $('html').animate({scrollTop : offset.top-300},400);
                    });
                    $('.btn3').click(function(){
                        var offset = $('.content-ship').offset();
                        $('html').animate({scrollTop : offset.top-300},400);
                    });
                });
            </script>
    
            
                
              
        </div>

    
        
        <jsp:include page="../common/footer.jsp" />

    </body>
    </html>