<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(낙찰)</title>
    <link rel="stylesheet" href="resources/css/myPageSuccess.css">
    <script src="https://kit.fontawesome.com/ee429cabba.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%-- <jsp:include page="../common/header.jsp"/> --%>

    <div class="wrap">
        <div id="header">
            <div id="title">마이페이지(낙찰)</div>
        </div>
        <div id="content">
            <form action="">
                <div id="content_1">
                    <div id="content_1_1"><p>&nbsp; ${loginUser.userName} 님</p></div>
                    <div id="content_1_2">
                        <div id="top_icon">
                            <i class="fa-regular fa-circle-check fa-4x" id="top_icon4" onclick="success()"></i><br><br>
                            <label for="top_icon4" id="one">낙찰</label>
                        </div>
                        <div id="top_icon">
                            <i class="fa-regular fa-newspaper fa-4x" id="top_icon3" onclick="sale()"></i><br><br>
                            <label for="top_icon3">판매</label>
                        </div>
                        <div id="top_icon">
                            <i class="fa-regular fa-heart fa-4x" id="top_icon2" onclick="pickListView()"></i><br><br>
                            <label for="top_icon2">관심물품</label>
                        </div>
                        <div id="top_icon">
                            <i class="fa-regular fa-user fa-4x" id="top_icon1" onclick="myInfo()"></i><br><br>
                            <label for="top_icon1">나의 정보</label>
                        </div>
                    </div>
                </div> <br><br>

                
                    <div id="content_2"></div>
                    <div id="content_3">&nbsp· 응찰현황</div>
                    <div id="content_4">
                        <table id="attend">
                            <thead>
                                <tr>
                                    <th height="30" width="70" id="tata"><input type="checkbox" name="" id=""></th>
<!--                                     <th height="30" width="150" id="tata">카테고리</th> -->
                                    <th height="30" width="130" id="tata">판매자</th>
                                    <th height="30" width="320" id="tata">입찰상품</th>
                                    <th height="30" width="160" id="tata">응찰가</th>
                                    <th height="30" width="160"id="tata">현재가</th>
                                    <th height="30" width="140" id="tata">상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>  
                            </table>
                    </div>
                    <div id="content_5">
                        <button type="submit" class="btn">삭제</button>
                    </div>
                    <div id="content_6">
                        <button onclick="attend2()">1</button>

                    </div>
                    <div id="content_7">
                        &nbsp· 낙찰현황
                    </div>
                    <div id="content_8">
                        <table id="bid">
                            <thead>
                                <tr>
                                    <th height="30" width="70" id="tata"><input type="checkbox" name="" id=""></th>
<!--                                     <th height="30" width="150" id="tata">카테고리</th> -->
                                    <th height="30" width="400" id="tata">판매상품</th>
                                    <th height="30" width="260" id="tata">낙찰가</th>
                                    <th height="30" width="260" id="tata">낙찰일</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>  
                            </table>
                    </div>
                    <div id="content_9">
                        <button type="submit" class="btn">삭제</button>
                    </div>
                    <div id="content_10">
                        <button onclick="bid2()">1</button>
                    </div>
                    <div id="content_11">
                        &nbsp· 운송장 조회
                    </div>
                    <div id="content_12">
                        <table >
                            <thead>
                                <tr>
                                    <th height="30" width="70" id="tata"><input type="checkbox" name="" id=""></th>
<!--                                     <th height="30" width="150" id="tata">카테고리</th> -->
                                    <th height="30" width="400" id="tata">구매한 물품</th>
                                    <th height="30" width="180" id="tata">택배회사</th>
                                    <th height="30" width="320" id="tata">운송장 번호</th>
                                </tr>
                            </thead>
                            <tbody id="td">
                                
                            </tbody>  
                            </table>
                    </div>
                    <div id="content_13">
                        <button type="submit" class="btn">삭제</button>
                    </div>
                    <div id="content_14">
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                    </div>
                </form>
        </div>
    </div>
    <script>
    	function success(){
        	location.href="myPageSuccess.me";
        	
        }
    	
    	function sale(){
    		location.href="myPageSale.me";
    	}
    	
    	function pickListView(){
    		location.href="pick.me"
    	}
    	
    	function myInfo(){
    		location.href="myInfo.me"
    	}
    </script>
    
    
    <script>
    window.onload = function(){
    	attend(1);
    	bid(1);
    }

//      $(function(){
//     	$(document).ready(function(){
//     		sale(1);
//     	})
    	function attend(sPage){
    		console.log(sPage);
    		$.ajax({
    			url : "attend.me",<%--<form action> href:sale.me--%>
    			data : { <%--sale.me?userId--%>
    			userId : "userId"
    			,sPage : sPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
    					
//				 		console.log(result.list[0].cateNo);
    					console.log(result.list[0].proTitle);
//      				console.log(result.list[0].proPrice);
//      				console.log(result.list[0].proTitle);
//      				console.log(result.list[0].count);
//      				console.log(result.list[0].proStatus);

						   
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>" 
										+"<td style=\"text-align: center;\">"+"<input type=\"checkbox\">"+"</td>"
// 										+"<td style=\"text-align: center;\">"+result.list[i].cateNo+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].buyerId+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidPrice+"</td>"
										+"<td style=\"text-align: center;\">"+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidStatus+"</td>"
									+"</tr>"
									
									
						}
					$("#attend>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' onclick='bid("+i+")'>"+i+"</button>"
						
					}
					$("#content_6").html(resultStr2);
    			},
    			error : function(){
    				console.log("ajax 통신 실패")
    			}
    		})
    	}
//     })
    </script>
    
    <script>
//      $(function(){
//     	$(document).ready(function(){
//     		sale(1);
//     	})
    	function bid(bPage){
    		console.log(bPage);
    		$.ajax({
    			url : "bid.me",<%--<form action> href:sale.me--%>
    			data : { <%--sale.me?userId--%>
    			userId : "userId"
    			,bPage : bPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
    					
//				 		console.log(result.list[0].cateNo);
    					console.log(result.list[0].proTitle);
//      				console.log(result.list[0].proPrice);
//      				console.log(result.list[0].proTitle);
//      				console.log(result.list[0].count);
//      				console.log(result.list[0].proStatus);

						   
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>" 
										+"<td style=\"text-align: center;\">"+"<input type=\"checkbox\">"+"</td>"
// 										+"<td style=\"text-align: center;\">"+result.list[i].cateNo+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidPrice+"</td>"
										+"<td style=\"text-align: center;\">"+"</td>"
									+"</tr>"
									
									
						}
					$("#bid>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' onclick='attend("+i+")'>"+i+"</button>"
						
					}
					$("#content_6").html(resultStr2);
    			},
    			error : function(){
    				console.log("ajax 통신 실패")
    			}
    		})
    	}
//     })
    </script>
    
    
</body>
</html>