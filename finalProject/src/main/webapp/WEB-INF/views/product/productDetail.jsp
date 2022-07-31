<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        
        <meta charset="UTF-8">

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
        .bid-count, .seller-id{
            border-bottom: 2px solid gray;
        }
        .delete-area{
            width: 100%;
            margin-top: 40px;
            
        }
        .da-1{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .deleteBtn{
            width: 24.5%;
            height: 35px;
            border-radius: 3px;
           
        }
        #delete-dday{
            width: 35%;
            height: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
        }
        .da-2{
            padding: 30px 20px 0px 20px;
            font-weight: bold;
        }
        
   
    
    
        .btn-area{
            width: 100%;
            height: 40px;
            display: flex;
            justify-content:start;
            margin-top: 30px;
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
        .modal-header{
            background-color: black;
            height: 40px;
            
        }
        .modal-body{
            margin-top: 10px;
        }
        .modal-body .list-area{
            font-size: 14px;
            border-top: 1px solid gray;
            width: 90%;
            height: 40px;
            margin: 0 auto;
        }
        .modal-header > button, #modalTitle{
            color: white;
            line-height: 7px;
        }
        .modal-footer1{
            display: flex;
            justify-content: space-evenly;
            text-align: center;
            margin-top: 30px;
            
        }
        .curBtn{
            margin-left: 77px;
            width: 75px;
            height: 25px;
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
        .titleInModal{
            padding-left: 20px;
            font-weight: bold;
            font-size: 18px;
        }
        .modalContent{
            margin-top: 10px;
        }
        .wishInModal{
            border-bottom: 1px solid gray;
        }
        .infoMsg{
            width: 84%;
            border-top: 2px solid gray;
            border-bottom: 2px solid gray;
            margin:0 auto;
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 15px 0 15px 0;
        }
        .curPrice{
            width: 80px;
            margin-right: 5px;
        }
        .upPrice, .downPrice{
            width: 20px;
            margin-left: 30px;
        }   
            
    
        
    
            
    </style>
    
    <body>
        <jsp:include page="../common/header.jsp"/>

        
        <div class="detail-area">
            <div class="detail-title">
                <div>
                    <h2>${p.proTitle}</h2>
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
                        var stop = 1;
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
                            var days = Math.floor(dDay / _day);
                            var hours = Math.floor((dDay % _day) / _hour);
                            var minutes = Math.floor((dDay % _hour) / _minute);
                            var seconds = Math.floor((dDay % _minute) / _second);
                            var remains = days+hours+minutes+seconds;

                            if (remains < 0) {
                                clearInterval(timer);
                                if(stop==1){
                                    alert("경매가 종료되어 리스트 페이지로 이동됩니다.");
                                    location.href="productList.pr";
                                    stop=0;
                                }
                                
                            }
                
                        
                
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
                    <div class="list-area seller-id">
                        <div class="si-1 black-area">
                            판매자 ID
                        </div>
                        <div class="si-2 text-area">
                            ${p.sellId}
                        </div>
                    </div>


                    <div class="delete-area">
                        <div>
                            
                            <form class="da-1" action="deleteProduct.pr" method="post">
                                <input type="hidden" value="${p.proNo}" name="proNo">
                                <c:if test="${loginUser.userId eq p.sellId}">
                                    <button type="submit" class="deleteBtn btn-1">삭제하기</button>
                                    <span id="delete-dday"></span>
                                </c:if>
                                </form>

                        </div>
                        <div class="da-2">
                            ※물품등록 후 5분 동안만 삭제가 가능하며, 그 이후에는 삭제가 불가합니다. <br>
                            다시한번 등록한 상품을 확인해주세요!
                        </div>

                    </div>
                    <script>
                         const startDate="${p.startDate}"
                        function convert(startDate){
                            let dateComponents = startDate.split(' ');
                            let datePieces = dateComponents[0].split("-");
                            let timePieces = dateComponents[1].split(":");
                        
                            return(new Date(datePieces[0], (datePieces[1] - 1), datePieces[2],
                                                timePieces[0], parseInt(timePieces[1])+5, timePieces[2]));
                            }
                                                
                                                
                                             
                                                
                            
                
                        const countDown5 = function(id, minutes){
                            var _Date = new Date(minutes);
                            var _second = 1000;
                            var _minute = _second * 60;
                            var _hour = _minute * 60;
                            var _day = _hour * 24;
                            var timer =null;
                            
                            show();
                          
                            function show(){      
                                var now = new Date();
                                var dDay= _Date -now;
                                var minutes = Math.floor((dDay % _hour) / _minute);
                                var seconds = Math.floor((dDay % _minute) / _second);
                                var remain = minutes + seconds;
                             
                                console.log(remain)
                                document.getElementById(id).textContent = minutes + '분 ';
                                document.getElementById(id).textContent += seconds + '초';
                                if(remain <=0){
                                    clearInterval(timer);
                                    $('#delete-dday').html("판매취소가 불가능합니다.");
                                    $('.deleteBtn').attr('disabled',true);
                                    $('.deleteBtn').css("background","gray")
                                }
                                
                            }
                          
                            timer =setInterval(show,1000);
                        }

                        
                           
                       
                            
                          
                           
                                
                                
                        countDown5('delete-dday',convert(startDate));
                   
                    </script>



                 
                    <div class="btn-area">
                        <c:choose>
                            <c:when test="${loginUser==null}">
                                <button class="btn-1 logBid" data-toggle="modal"  onclick="loginCheck();">입찰하기</button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn-1" data-toggle="modal" data-target="#bidModalForm">입찰하기</button>
                            </c:otherwise>
                        </c:choose>
                        <script>
                            function loginCheck(){
                            var check = confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")
                                if(check){
                                    $('.logBid').attr('data-target','#login_modal2');
                                }else{
                                    $('.logBid').removeAttr('data-target');
                                }
                                }
                        </script>
                        <button class="btn-2">관심물품</button>
                        <button class="btn-3" data-toggle="modal" data-target="#myModal" style="border: 1px solid black;">신고하기</button>
                    </div>
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="report.mem"  method="post" >

                                    <!-- Modal body -->
                                    <div class="modal-body">          
                                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                                      <h4 class="modal-title">신고하기</h4>
                                      <p id="gray"><br>&nbsp;&nbsp;사유가 인정될 경우 해당 사용자의 이용이 제한됩니다.</p>
                            
                                      <hr>
                                      
                                        <input type="text" value="${loginUser.userId }" name="reportId">
                            <!-- 			<input type="hidden" value="user02" name="reportId"> -->
                            
                                        <input type="text" value="${p.proNo }" name="proNo">
                            <!-- 			<input type="hidden" value="1" name="proNo"> -->
                                        
                                      <p><b>피신고자</b></p>
                                        <input type="text" value="${p.sellId }" name="reportedId" id="reason1"> 
                            <!--             <input type="text" value="user01" name="reportedId" id="reason1">  -->
                                        
                                        <br><br><br>
                                        
                                      <p><b>신고사유</b></p>
                                      <select name="reportCateNo" id="reason2">
                                          <option value="">사유 선택하기</option>
                                          <option value="1201" >허위매물</option>
                                          <option value="1202">전자상거래 금지물품 거래</option>
                                          <option value="1203">욕설 및 비방</option>
                                          <option value="1204">담합</option>
                                          <option value="1205">기타</option>
                                        </select>
                                        
                                        
                                        <BR><BR>
                                        <input type="text" id="reason3" name="reportContent" placeholder="상세 사유를 입력해주세요">
                                    
                                    
                                    <script>
                                    //상단의 select box에서 신고사유를 선택하면 나타날 인풋박스
                                    $(function(){
                                    $("#reason3").hide(); //입력박스 숨어있다가
                                    $("#reason2").change(function() { //신고사유 선택시 등장
                                            if($("#reason2").val() ) {
                                                $("#reason3").show();
                                            }  else {
                                                $("#reason3").hide();
                                            }
                                        }) 
                                    });
                                    
                                    </script>
                            
                                    </div>
                            
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                      <button type="submit" class="btn btn-danger btn-block">완료</button>
                                      <!--  data-dismiss="modal" : 모달창을 닫아준다 -->
                                    </div>
                              
                                      </form>
                            </div>
                        </div>
                    </div>
                   



                    <div class="modal fade" id="bidModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h6 class="modal-title" id="modalTitle">입찰하기</h6>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <form action="insertBid.pr" method="post">
                                    <input type="hidden" name="buyerId" value="${loginUser.userId}">
                                    <input type="hidden" name="proNo" value="${p.proNo}">
                                    <div class="modal-body">
                                        <div class="titleInModal">
                                            ${p.proTitle}
                                        </div>
                                        <div class="modalContent">

                                            <div class="list-area ">
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
                                                시작가
                                            </div>
                                            <div class="text-area">
                                                ${p.proPrice} 원
                                            </div>
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                현재입찰가
                                            </div>
                                            <div class="text-area">
                                                <div class="curPrice1">${p.curPrice}</div> 원<button type="button" class="btn-1 curBtn">새로고침</button>
                                            </div>
                                        </div>
                                        <div class="list-area">
                                            <div class="black-area">
                                                입찰금액
                                            </div>
                                            <div class="text-area">
                                                <input type="text" class="curPrice" readonly name="bidPrice" maxlength="8"> 원 
                                                <button type="button" class="btn-1 upPrice">▲</button>
                                                <button type="button" class="btn-1 downPrice">▼</button>
                                                
                                            </div>
                                        </div>
                                      
                                        <div class="list-area wishInModal">
                                            <div class="black-area">
                                                즉시구매가
                                            </div>
                                            <div class="text-area">
                                                <c:choose>

                                                    <c:when test="${p.wishPrice == 0 }">
                                                        없음
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${p.wishPrice}
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="modal-footer1">
                                        
                                            <button type="submit" id="enterBid" class="btn btn-dark" >신중하게 입찰하기</button>
                                            <button type="button" id="rsPrice"class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
                                            <c:choose>
                                                <c:when test="${p.wishPrice==0}">
                                                    <button type="button" id="enterNow" class="btn btn-secondary" disabled>즉시구매하기</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" id="enterNow" class="btn btn-secondary">즉시구매하기</button>
                                                </c:otherwise>    

                                            </c:choose>

                                    </div>
                                    <script>

                                        if("${p.curPrice}"==0){
                                            $('.curPrice').val("${p.proPrice}");
                                        }else{
                                            $('.curPrice').val("${p.curPrice}");
                                        }
                                        var cPrice = $('.curPrice').val();
                                        var bidI;
                                        var c1 = cPrice.substr(0,1);
                                        console.log(c1);
                                        if(c1<5){
                                            bidI = Math.pow(10,cPrice.length-1)*0.05;
                                        }else{
                                            bidI = Math.pow(10,cPrice.length-1)*0.1;
                                        }
                                        $('.upPrice').on('click',function(){
                                            if("${p.wishPrice}"!=0){
                                                if(parseInt(cPrice)+bidI<="${p.wishPrice}"){

                                                    $('.curPrice').val( parseInt(cPrice)+bidI);
                                                    cPrice = $('.curPrice').val();
                                                    c1=cPrice.substr(0,1);
                                                    if(c1<5){
                                                        bidI = Math.pow(10,cPrice.length-1)*0.05;
                                                    }else{
                                                        bidI = (Math.pow(10,cPrice.length-1))*0.1;
                                                    }
                                                    }
                                            }else{
                                                

                                                $('.curPrice').val( parseInt(cPrice)+bidI);
                                                cPrice = $('.curPrice').val();
                                                c1=cPrice.substr(0,1);
                                                if(c1<5){
                                                    bidI = Math.pow(10,cPrice.length-1)*0.05;
                                                }else{
                                                    bidI = (Math.pow(10,cPrice.length-1))*0.1;
                                                }
                                                
                                            }
                                           
                                        });
                                        $('.downPrice').on('click',function(){
                                            if("${p.curPrice}"!=0){
                                                if(parseInt(cPrice)-bidI>="${p.curPrice}"){

                                                    $('.curPrice').val( parseInt(cPrice)-bidI);
                                                    cPrice = $('.curPrice').val();
                                                    c1=cPrice.substr(0,1);
                                                    if(c1<5){
                                                        bidI = Math.pow(10,cPrice.length-1)*0.05;
                                                    }else{
                                                        bidI = (Math.pow(10,cPrice.length-1))*0.1;
                                                    }
                                                    }
                                            }else{
                                                if(parseInt(cPrice)-bidI>="${p.proPrice}"){

                                                    $('.curPrice').val( parseInt(cPrice)-bidI);
                                                    cPrice = $('.curPrice').val();
                                                    c1=cPrice.substr(0,1);
                                                    if(c1<5){
                                                        bidI = Math.pow(10,cPrice.length-1)*0.05;
                                                    }else{
                                                        bidI = (Math.pow(10,cPrice.length-1))*0.1;
                                                    }
                                                    }
                                            }
                                            
                                         });
                                         $('#rsPrice,.close').on('click',function(){
                                                if("${p.curPrice}"==0){
                                                    $('.curPrice').val("${p.proPrice}");
                                                }else{
                                                    $('.curPrice').val("${p.curPrice}");
                                                }
                                                cPrice = $('.curPrice').val();
                                                    c1=cPrice.substr(0,1);
                                                    if(c1<5){
                                                        bidI = Math.pow(10,cPrice.length-1)*0.05;
                                                    }else{
                                                        bidI = (Math.pow(10,cPrice.length-1))*0.1;
                                                    }
                                        });

                                            $('.curBtn').on('click',function(){

                                                $.ajax({
                                                    url : "selectBidPrice.pr",
                                                    data : {
                                                        proNo: "${p.proNo}"
                                                    },
                                                    success : function(bidPrice){
                                                        console.log(bidPrice);
                                                        $('.curPrice1').html(bidPrice);
                                                    },
                                                    error : function(){
                                                        console.log("11");
                                                    }

                                                });
                                            });
                                            function buyIm(){
                                                $.ajax({
                                                    url : "buyImmediately.pr",
                                                    data : {
                                                        proNo: "${p.proNo}"
                                                    },
                                                    success : function(result){
                                                        if(result>0){
                                                            console.log("ok");
                                                            alert("즉시구매에 성공하셨습니다.");
                                                            location.href="productList.pr"
                                                        }
                                                    },
                                                    error : function(){
                                                            alert("즉시구매에 실패하셨습니다.")
                                                    }

                                                     });
                                            }
                                            $('#enterNow').on('click',function(){
                                                var check = confirm("이 상품을 즉시 구매하시겠습니까?");
                                                if(check){
                                                   buyIm();
                                                   
                                                }
                                            });
                                            $('#enterBid').on('click',function(){
                                                if(parseInt(cPrice)=="${p.wishPrice}"){
                                                    var check = confirm("입찰하신 금액이 즉시구매가와 같아 즉시구매로 진행됩니다. 진행 하시겠습니까?");
                                                    if(check){
                                                        buyIm();
                                                    }
                                                }
                                            })
                                        


                                    </script>
                                 
                                    <div class="infoMsg">
                                        *알려드립니다.
                                        <br><br>
                                        입찰 실수 및 허위입찰은 경매사고로 이어질 수 있으며, 미정산(미입금, 구매거부, 등)
                                        2건이상 누적시 삼삼 이용이 제한이 발생됩니다. 신중한 입찰을 부탁드립니다.
                                        <br><br>삼삼에 등록된 판매물품의 내용 및 판매진행은 판매자의 전적인 책임으로 이루어지며,
                                        거래 및 결제와 관련된 모든 책임은 판매자와 구매자에게 있습니다.

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