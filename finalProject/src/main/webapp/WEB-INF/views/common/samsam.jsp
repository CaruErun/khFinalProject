<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/ee429cabba.js" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
    div{
        box-sizing: border-box;
        /*border: 1px solid red;*/
    }
    .wrap{
        width: 1100px;
        height: 1300px;
        margin: auto;
        
    }
    .wrap>div{ 
        width: 100%;
    }
    /*#header{
        height: 10%;
    }*/
    #content{
        height: 70%; 
    }
    #footer{
        height: 10%;
    }
    #image{
        width: 1090px;
        height: 306px;
    }
    #content>div{
        height: 100%;
        float: left;
    }
    #content1{
        text-align: center;

    }
    #content2{
        height: 100px;
        border-bottom: 1px solid gray;
    }
    #content3{
        height: 200px;
        padding-top: 15px;
    }
    #content_3_1{
        float: left;
        width:20%;
        text-align: center;
        padding-top: 35px;
        height: 180px;
        border-bottom: 1px solid gray;
    }
    #content_3_2{
        float: left;
        width: 80%;
        height: 180px;
        border-bottom: 1px solid gray;
    }
    #content4{
        height: 200px;
        padding-top: 15px;
    }
    #content_4_1{
        float: left;
        width:20%;
        text-align: center;
        padding-top: 35px;
        height: 180px;
        border-bottom: 1px solid gray;
    }
    #content_4_2{
        float: left;
        width: 80%;
        height: 180px;
        border-bottom: 1px solid gray;
    }
    #content5{
        height: 210px;
        padding-top: 15px;
    }
    #content_5_1{
        float: left;
        width:20%;
        text-align: center;
        padding-top: 35px;
        height: 200px;
        border-bottom: 1px solid gray;
    }
    #content_5_2{
        float: left;
        width: 80%;
        height: 200px;
        border-bottom: 1px solid gray;
    }
    #content6{
        padding-top: 20px;
        height: 200px;
    }
    #content_6_1{
        float: left;
        width:20%;
        text-align: center;
        padding-top: 35px;
        height: 180px;
        border-bottom: 1px solid gray;
    }
    #content_6_2{
        float: left;
        width: 80%;
        height: 180px;
        border-bottom: 1px solid gray;
    }
    #top_icon1{
        width: 50px;
        height: 108px;
        
    }
    #btn{
        border-radius: 4px;
        border: 0px;
        height: 50px;
        background-color: black;
        color: white;
        width: 180px;
        height: 30px;
    }
    
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div class="wrap">
        <div id="header">
        </div>
        <div id="content">
                <form action="">
                    <div id="content1">
                        <img src="resources/auction.jpg" alt="이미지" id="image">
                    </div>
                    <div id="content2">
                        
                    </div>
                    <div id="content3">
                        <div id="content_3_1">
                            <i class="fa-solid fa-magnifying-glass fa-4x" id="top_icon1"></i>
                        </div>
                        <div id="content_3_2">
                            <span style="font-weight: 550; font-size: 25px;">회원가입</span> <br><br>
                            <span style="color: gray; font-weight: 400; font-size: 15px;">&nbsp&nbsp - 회원에 한해 경매물품 등록과 응찰이 가능합니다. <br>
                                &nbsp&nbsp - 회원가입은 온라인 홈페이지를 통해 간편하게 진행하실 수 있습니다. </span><br><br>
                            <button type="button" id="btn" onclick="location.href='enrollForm.me'">회원가입 페이지로 이동</button>
                        </div> 
                    </div>
                    <div id="content4">
                        <div id="content_4_1">
                            <i class="fa-regular fa-calendar-minus fa-4x"></i>
                        </div>
                        <div id="content_4_2">
                            <span style="font-weight: 550; font-size: 25px;">경매</span> <br><br>
                            <span style="color: gray; font-weight: 400; font-size: 15px;">&nbsp&nbsp - 경매는 판매자가 희망하는 가격과 호가, 경매종료일, 거래방식, 판매하려는 물품의 상세한 정보를 사진과 함께 등록합니다. <br>
                                &nbsp&nbsp - 경매의 철회는 언제나 가능하나, 철회횟수가 공개됨으로 주의가 필요합니다. <br>
                                &nbsp&nbsp - 본인이 게시한 물품의 경매에는 참여할 수 없습니다.</span>
                        </div>
                    </div>
                    <div id="content5">
                        <div id="content_5_1">
                            <i class="fa-regular fa-circle-check fa-4x"></i>
                        </div>
                        <div id="content_5_2">
                            <span style="font-weight: 550; font-size: 25px;">응찰</span> <br><br>
                            <span style="color: gray; font-weight: 400; font-size: 15px;">&nbsp&nbsp - 판매자가 설정한 종료일 전에 홈페이지를 통해 응찰이 가능하며, 경매 마감 시간 이후 최종 낙찰 확정을 합니다. <br>
                                &nbsp&nbsp - 응찰은 취소할 수 없습니다. 신중하게 응찰해주세요. </span><br><br>
                            <div style="color: gray; background-color: lightgray; font-weight: 400; font-size: 15px; width: 800px; margin-left: 20px;">
                                &nbsp- 중고경매 SAMSAM의 온라인 경매는 크롬 익스플로러에 최적화 되어있습니다. 최신 버전으로 업데이트가 되어있는 &nbsp&nbsp 지 확인하시기 바랍니다.<br>
                                &nbsp- 인터넷 익스플로러 문제로 인한 경매 응찰과정 중 문제발생시, SAMSAM은 책임을 지지 않습니다.
                            </div>
                        </div>
                    </div>
                    <div id="content6">
                        <div id="content_6_1">
                            <i class="fa-regular fa-lightbulb fa-4x"></i>
                        </div>
                        <div id="content_6_2">
                            <span style="font-weight: 550; font-size: 25px;">낙찰</span> <br><br>
                            <span style="color: gray; font-weight: 400; font-size: 15px;">&nbsp&nbsp - 경매 시작 후 최고가를 제시한 응찰자에게 경매물품이 낙찰됩니다. <br>
                                &nbsp&nbsp - 거래는 판매자가 지정한 거래방식 또는 당사자간의 협의로 진행합니다. <br>
                                &nbsp&nbsp - 판매자가 즉시 구매가를 등록했을 경우 해당 가격으로 즉시 경매물품 낙찰이 가능합니다.<br> 
                                &nbsp&nbsp - 낙찰 종료 후 구매자와 판매자 간 채팅을 통해 금액 및 물품 거래를 할 수 있습니다.
                            </span>
                        </div>
                    </div>
                </form>
        </div>
       
    </div>  
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>