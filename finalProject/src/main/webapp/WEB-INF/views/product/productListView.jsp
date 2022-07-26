<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../common/header.jsp"/>

<link 
rel="stylesheet" 
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
crossorigin="anonymous" 
referrerpolicy="no-referrer"
/>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<style>
  
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
        padding-top: 30px;
    }
    .selectList {
        width: 60%;
        font-size: 14px;
        font-weight: bold;
        display: flex;

    }
    .selectType{
        width: 100%;
        display: flex;
        justify-content: space-evenly;
    }
    
    .selectType li{
        padding-top: 4px;
        list-style-type: none;

    }
    .selectType>li>a{
        text-decoration: none;
    }
       
    .item-preview{
        position: relative;
        width: 70%;
        height: auto;
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
    .pagingArea{
        position: relative;
        top:170px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
 
  #h_mark{
        color: lightgray;
    }
    
</style>
<body>
	 
     
        <div class="see-all">
            <div>    
                <i class="fa-solid fa-circle-check"></i>
                <span>모두 ${pi.listCount}개의 게시물이 검색되었습니다.</span>
            </div>

            <div class="btn-group"> <!-- get방식 -->
                <button type="button" onclick="location.href='filterList.pr?searchType=${searchType}&searchKeyword=${searchKeyword}&sort=null&cPage=${pi.currentPage}'" class="btn btn-outline-dark float-right " >최신순</button>
				<button type="button" onclick="location.href='filterList.pr?searchType=${searchType}&searchKeyword=${searchKeyword}&sort=count&cPage=${pi.currentPage}'" class="btn btn-outline-dark float-right">마감임박순</button>
				<button type="button" onclick="location.href='filterList.pr?searchType=${searchType}&searchKeyword=${searchKeyword}&sort=hPrice&cPage=${pi.currentPage}'" class="btn btn-outline-dark float-right ">높은가격순</button>
                <button type="button" onclick="location.href='filterList.pr?searchType=${searchType}&searchKeyword=${searchKeyword}&sort=rPrice&cPage=${pi.currentPage}'" class="btn btn-outline-dark float-right ">낮은가격순</button>
                <button type="button" onclick="location.href='filterList.pr?searchType=${searchType}&searchKeyword=${searchKeyword}&sort=count&cPage=${pi.currentPage}'" class="btn btn-outline-dark float-right ">조회많은순</button>
            </div>
	    </div>
    
   
    
    
        <div class="item-preview">
        
	        <c:forEach var="i" items="${plist }" varStatus="status">

                <div class="product-box">
                    <span style="display: none;">${i.proNo}</span>
                    <div class="padding-line">

                        <div class="img-box">
                            <c:if test="${i.path eq null}">
                                <img class="item-img" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..."/>
                            </c:if>
                            <c:if test="${i.path ne null}">
                                <img class="item-img" src="${i.path}" alt="..." />
                            </c:if>

                        </div>

                        <div class="text-box">
                            <div class="content-box">
                                <p>${i.proTitle }</p>
                                <i class="fa-solid fa-heart" id="h_mark"></i>
                            </div>
                        </div>

                        <div class="price-box">
                            <div class="price-content">
                                <p><b>즉시구매가</b></p>
                                <p>${i.wishPrice }</p>
                            </div>
                        
                            <div class="price-content">
                                <p><b>시작가</b></p>
                                <p>${i.proPrice }</p>
                            </div>
                            <div class="price-content">
                                <p><b>현재가</b></p>
                                <p>${i.curPrice}</p>
                            </div>
                        </div>

                        <div class="countDown-box" >
                            <span id="ed-${status.index}"></span>
                        </div>

                    </div>

                    <div class="count-box">
                        <div class="count-content">
                            <p>입찰</p>
                            <p>${i.bidCount}</p>
                        </div>
                        <div class="count-content">
                            <p>조회</p>
                            <p>${i.count}</p>
                        </div>
                    </div>
                    
                </div>
        </c:forEach>
    </div>
        
        
        
    <script>
        const endDate =new Array();
        <c:forEach var="i" items="${plist }">
            endDate.push("${i.endDate}");
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

        for(var i=0; i<endDate.length; i++ ){
            countDownTimer('ed-'+i,convertFromStringToDate(endDate[i])); 
            
        }
        var pb= $(".product-box")
        for(var i =0;i<pb.length;i++){

            pb[i].onclick = function(){
                var pNo = $(this).children("span").eq(0).text();
                
                location.href ="productDetail.pr?pNo="+pNo;
            }
        }
   
        
        
        
       
    </script>
              
	    
	 	    <div class="pagingArea">
                <ul class="pagination">
                	<c:choose>
	                	<c:when test="${pi.currentPage != 1 }">
			                    <li class="page-item"><a class="page-link" href="productList.pr?cPage=${pi.currentPage -1}">Previous</a></li>
        	        	</c:when>
        	        	<c:otherwise>
        	        			<li class="page-item disabled"><a class="page-link">Previous</a></li>
        	        	</c:otherwise>
                	</c:choose>
                    <c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
                    	<c:choose>
	                    	<c:when test="${i != pi.currentPage }">
	                    		<li class="page-item"><a class="page-link" href="productList.pr?cPage=${i}">${i }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item disabled"><a class="page-link">${i }</a></li>
	                    	</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
	                	<c:when test="${pi.currentPage != pi.maxPage}">
			                    <li class="page-item "><a class="page-link" href="productList.pr?cPage=${pi.currentPage +1}">Next</a></li>
        	        	</c:when>
        	        	<c:otherwise>
        	        			<li class="page-item disabled"><a class="page-link">Next</a></li>
        	        	</c:otherwise>
                	</c:choose>
                </ul>
            </div>
        
        
	 
	 
	 

	 <jsp:include page="../common/footer.jsp" />
	 
</body>
</html>