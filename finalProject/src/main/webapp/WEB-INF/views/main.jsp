<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- swiper -->
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
	
	<!--icon-->
    <script src="https://kit.fontawesome.com/e849be2e05.js" crossorigin="anonymous"></script>
    
    
	<title>SAMSAM AUCTION</title>
</head>
<style>

	.swiper-area{
        position: relative;
        z-index: 0;
        left: 15%;
        top: 250px;
        width: 70%;
        height: 300px;

/*     	margin-top : 100px; */
    }
    .swiper{
        position: absolute;
        left: 10%;
        width: 80%;
        height: 100%;
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

        width : 10%;
        color:black;
        z-index : 4;  
    }
    .see-all{
        position: relative;
        left: 15%;
        top:250px;
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
    #all a{
    	text-decoration:none;
    }
    #all a:hover{
    	color:gray;
	font-weight: bold;

    }
    .item-preview{
        position: relative;
        width: 70%;
        height: 1000px;
        left: 15%;
        top:250px;
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
<body>

	<jsp:include page="common/header.jsp"/>




	<div class="outer">


	<!-- swiper -->
	<div class="swiper-area" >
	    
	    <div class="swiper">
	        
	        <div class="swiper-wrapper">
	            <div class="swiper-slide"><img src="resources/images/event.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="resources/images/dolpin.gif" alt=""></div>
	            <div class="swiper-slide"><img src="resources/images/rokket.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="resources/images/saramin.jpg" alt=""></div>
	            <div class="swiper-slide"><img src="resources/images/uyungu.jpg" alt=""></div>
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
	        <a href="productList.pr">전체보기 +</a>
	    </div>
	</div>
    

	<div class="item-preview">
		<c:forEach var = "s" items="${sList }" varStatus="status">
	    <div class="product-box" onclick="location.href='productDetail.pr?pNo=${s.proNo }'">
	        <span style="display: none;">${s.proNo}</span>
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="${s.path }" alt="..." />
	            </div>
	            <div class="text-box">
	            <div data-no="${s.proNo }"></div>
	                <div class="content-box">
	                    <p>${s.proTitle }</p>
	                    <c:if test="${pslikeList.get(status.index).likeNo ne 1 }"><button class="h_mark" id="h_mark-${status.index}" onclick="event.cancelBubble='true';addList(${s.proNo},this)"><i class="fa-solid fa-heart" style="color:lightgray;"></i></button></c:if>
						<c:if test="${pslikeList.get(status.index).likeNo eq 1 }"><button class="h_mark" id="h_mark-${status.index}" onclick="event.cancelBubble='true';rmList(${s.proNo},this)" ><i class="fa-solid fa-heart" style="color:hotpink;"></i></button></c:if>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p><b>즉시구매가</b></p>
	                    <p><c:if test="${empty s.wishPrice }">없음</c:if>
	                    <c:if test="${not empty s.wishPrice }">${s.wishPrice }</c:if></p>
	                </div>
	                <div class="price-content">
	                    <p><b>시작가</b></p>
	                    <p>${s.proPrice }</p>
	                </div>
	                <div class="price-content">
	                    <p><b>현재가</b></p>
	                    <p>${s.curPrice }</p>
	                </div>
	            </div>
	            <div class="countDown-box">
                            <span id="ed2-${status.index}"></span>
	            </div>
	        </div>
	        
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>${s.bidCount }</p>
	                </div>
	                
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>${s.count }</p>
	                </div>
	            </div>
	    </div>
	    </c:forEach>
	    
 	    <form id="postform" action=""> 
 			<input type="hidden" id="selectProNo" name="proNo" value="1"> 
 			<input type="hidden" name="userId" value="${loginUser.userId}"> 
 		</form> 
 		<script> 
 			function addWishlist(proNo){
				$("#selectProNo").val(proNo);
 				$("#postform").attr("action", "addWishlist.my").submit();
 			}
 			
 			function removeWishlist(){
 				$("#postform").attr("action", "removeWishlist.my").submit();
 			}
 		</script> 
	    
	    
	    
	    
	    
	    
	    <!-- =======찜하기 버튼을 누를경우 이벤트 발생======= -->
		<script>
		    $(function() {
		        $('#h_mark').on('click',function(event) { //#h=x
		            event.preventDefault();
		            // 비로그인 상태시 찜하기 버튼을 누르면
		            if ("${loginUser.userId}" == "") {
		                confirm("로그인 한 회원만 이용가능합니다.")
		                    // 거부하면 해당 페이지 새로고침
		                    location.reload();
		                }
		            // 로그인 상태시 찜하기 버튼을 누르면    
		             else {
		                // 해당 멤버ID와 상품ID의 정보를 가져옴
		                var userId = "${loginUser.userId}";
		                var proNo = "${p.proNo}";
		                var sellId= "${p.sellId}";
		
		                console.log("userId: " + userId);
		                console.log("proNo: " + proNo);
		                console.log("sellId: " + sellId);

		                var form = {
		                		userId : userId,
		                		proNo : proNo,
		                		sellId : sellId
		                };
		                
		                $.ajax({
		                    url : "addWishlist.my",
		                    type : "POST",
		                    cache : false,
		                    contentType : 'application/json; charset=utf-8',
		                    data : JSON.stringify(form), //userId, proNo, sellId 담은 거!
		                    
		                    success : function(result) {
		                        console.log(result);
		                        if (result >0) {
		                        	 $('#h_mark').css("color","hotpink");
		                        	 
		                            console.log("찜 성공!")
		                            
		                            if (confirm("해당 상품을 찜하셨습니다. 목록 페이지로 이동하시겠습니까?")) {
		                                // 승낙하면 마이페이지의 찜하기 리스트로 이동
		                                location.href = '../member/pickList';
		                            } else {
		                                // 거부하면 해당 페이지 새로고침하여 찜한거 반영되게하기(HTTP의 속성 때문...)
		                                location.reload();
		                            }
		                        }
		                    },
		                    error : function(e) {
		                        console.log(e);
		                        alert('찜할 수 없습니다.');
		                        location.reload(); // 실패시 새로고침하기
		                    }
		                })
		            }
		        });
		    });
		</script>

	</div>
	
	<div class="see-all">
	    <div>    
	        <h2>인기경매</h2>
	    </div>
	    <div id="all">
	        <a href="productList.pr">전체보기 +</a>
	    </div>
	</div>
	    
	
	<div class="item-preview">
	    
	    <c:forEach var = "c" items="${cList }" varStatus="status">
	    <div class="product-box" onclick="location.href='productDetail.pr?pNo=${c.proNo }'">
	       	<span style="display: none;">${c.proNo}</span>
	        <div class="padding-line">
	            <div class="img-box">
	                <img class="item-img" src="${c.path }" alt="..." />
	            </div>
	            <div class="text-box">
	            <div data-no="${c.proNo }"></div>
	                <div class="content-box">
	                    <p>${c.proTitle }</p>
						<c:if test="${pclikeList.get(status.index).likeNo ne 1 }"><button class="h_mark" id="h_mark-${status.index}" onclick="event.cancelBubble='true';addList(${c.proNo},this)"><i class="fa-solid fa-heart" style="color:lightgray;"></i></button></c:if>
						<c:if test="${pclikeList.get(status.index).likeNo eq 1 }"><button class="h_mark" id="h_mark-${status.index}" onclick="event.cancelBubble='true';rmList(${c.proNo},this)" ><i class="fa-solid fa-heart" style="color:hotpink;"></i></button></c:if>
	                </div>
	            </div>
	            <div class="price-box">
	                <div class="price-content">
	                    <p><b>즉시구매가</b></p>
	                    <p><c:if test="${empty c.wishPrice }">없음</c:if>
	                    <c:if test="${not empty c.wishPrice }">${c.wishPrice }</c:if></p>
	                </div>
	                <div class="price-content">
	                    <p><b>시작가</b></p>
	                    <p>${c.proPrice }</p>
	                </div>
	                <div class="price-content">
	                    <p><b>현재가</b></p>
	                    <p>${c.curPrice }</p>
	                </div>
	            </div>
	            <div class="countDown-box">
                            <span id="ed-${status.index}"></span>
	            </div>
	        </div>
	        
	            <div class="count-box">
	                <div class="count-content">
	                    <p>입찰</p>
	                    <p>${c.bidCount }</p>
	                </div>
	                
	                <div class="count-content">
	                    <p>조회</p>
	                    <p>${c.count }</p>
	                </div>
	            </div>
	    </div>
	    </c:forEach>
	   
	    </div>

	    </div>

	    

	</div>
</div>
 <script>
        const endDate =new Array();
        <c:forEach var="c" items="${cList }">
            endDate.push("${c.endDate}");
        </c:forEach>
        const endDate2 =new Array();
        <c:forEach var="s" items="${sList }">
            endDate2.push("${s.endDate}");
        </c:forEach>

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
            var days = Math.floor(dDay / _day);
			var hours = Math.floor((dDay % _day) / _hour);
			var minutes = Math.floor((dDay % _hour) / _minute);
			var seconds = Math.floor((dDay % _minute) / _second);
            var remains = days+hours+minutes+seconds;
           
			if (remains <= 0) {
                console.log("11");
                var pNo = $('#'+id).parent().parent().parent().children("span").eq(0).text();
                console.log(pNo);
				clearInterval(timer);
                $.ajax({
                    url : "endSell.pr",
                    data : {
                        proNo: pNo
                    },
                    success : function(result){
                        if(result>0){
                            console.log("되나");
                            location.reload();
                          


                        }
                    },
                    error : function(){
                           console.log("이미 사라졌어.")
                    }

                });

				
			}
			document.getElementById(id).textContent = days + '일 ';
			document.getElementById(id).textContent += hours + '시간 ';
			document.getElementById(id).textContent += minutes + '분 ';
			document.getElementById(id).textContent += seconds + '초';
		}

		timer = setInterval(showRemaining, 1000);
	    }

        for(var i=0; i<endDate.length; i++ ){
            countDownTimer('ed-'+i,convertFromStringToDate(endDate[i])); 
            countDownTimer('ed2-'+i,convertFromStringToDate(endDate2[i])); 
        }
       
 
        
        </script>
 		<script>
		    function addList(proNo, ti){
		    	console.log(ti.children[0]);
		    	if("${loginUser.userId}" == ""){
		    		alert("로그인 후 이용해주세요");
		    		openModal();
		    	}else{
		    		$.ajax({
	                    url : "addWishlist.my",
	                    data : {
	                    	userId : "${loginUser.userId}",
	                		proNo : proNo
	                    	
	                    },
	                    
	                    success : function(result) {
	                        console.log(result);
	                        if (result >0) {
	                        	 ti.children[0].style.color="hotpink";
	                        	 
	                            console.log("찜 성공!")
	                            
	                            if (confirm("해당 상품을 찜하셨습니다. 목록 페이지로 이동하시겠습니까?")) {
	                                location.href = 'pick.me';
	                            } else {
		                                location.reload();
	                            }
	                        }
	                    },
	                    error : function() {
	                        alert('찜할 수 없습니다.');
	                        location.reload(); // 실패시 새로고침하기
	                    }
	                })
		    	}
		    	
		    	
		    }
		    function rmList(proNo, ti){
		    	$.ajax({
	                url : "removeWishlist.my",
	                contentType : 'application/json; charset=utf-8',
	                data : {
	                	userId : "${loginUser.userId}",
	                	proNo : proNo
	                	 
	                },
	                
	                success : function(result) {
	                    console.log(result);
	                    if (result >0) {
                        	 ti.children[0].style.color="lightgray";
	                    	 
	                        console.log("찜 해제 성공!")
	                        
	                        alert("찜이 해제되었습니다.")
	                            location.reload();
	                    }
	                },
	                error : function(e) {
	                    console.log(e);
	                    alert('찜 해제 할 수 없습니다.');
	                    location.reload(); 
	                }
	    });
		    }
		</script>
              
	<jsp:include page="common/footer.jsp"/>

</body>
</html>