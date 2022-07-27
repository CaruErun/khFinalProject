<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(판매)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/ee429cabba.js" crossorigin="anonymous"></script>
	<jsp:include page="../common/header.jsp"/>
    <link rel="stylesheet" href="resources/css/myPageSale.css">
</head>



<body>
<%-- <jsp:include page="../common/header.jsp"/> --%>
    <link rel="stylesheet" href="resources/css/myPageSale.css">

    <div class="wrap">
        <div id="header">
            <div id="title">마이페이지(판매)</div>
        </div>
        <div id="content">
                <form action="">
                    <div id="content_1">
                        <div id="content_1_1"><p>&nbsp; ${loginUser.userName} 님</p></div>
                        <div id="content_1_2">
	                        <div id="top_icon">
	                            <i class="fa-regular fa-circle-check fa-4x" id="top_icon4" onclick="success()"></i><br><br>
	                            <label for="top_icon4">낙찰</label>
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
                    </div><br><br>

                    <div id="content_2"></div>
                    <div id="content_3">&nbsp· 판매현황 </div>
                    <div id="content_4">
                        <table id="tata">
                            <thead>
                                <tr >
                                    <th height="30" width="70"><input type="checkbox" name="Chk_list" id="check_all" style="accent-color: black"></th>
<!--                                     <th height="30" width="150">카테고리</th> -->
                                    <th height="30" width="400">판매상품</th>
                                    <th height="30" width="130">시작가</th>
                                    <th height="30" width="130">현재가</th>
                                    <th height="30" width="110">조회수</th>
                                    <th height="30" width="130">상태</th>
                                </tr>
                            </thead>
                            <tbody>      
                                                 
                            </tbody>  
                            </table>
                    </div>
                    <div id="content_5">
                        <button type="button" id="delBtn2" onclick="delRow()" class="btn">삭제</button>
                    </div>
                    <div id="content_6">
                    	<button id="one" onclick="sale2()">1</button>
                    </div>
                    <div id="content_7">
                        &nbsp· 운송장 조회 
                    </div>
                    <div id="content_8">
                        <table id="tata2">
                            <thead>
                                <tr>
                                    <th height="30" width="70"><input type="checkbox" name="Chk_list" id="check_all2" style="accent-color: black"></th>
<!--                                     <th height="30" width="150">카테고리</th> -->
                                    <th height="30" width="400">구매한 물품</th>
                                    <th height="30" width="180">택배회사</th>
                                    <th height="30" width="320">운송장 번호</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>  
                            </table>
                    </div>
                    <div id="content_9">
                        <button type="button"  id="delBtn" class="btn">삭제</button>
                    </div>
                    <div id="content_10">
                      <button onclick="post2()">1</button>
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
    	
    	function detail(){
    		location.href="saleDetail.me"
    	}
    	
    	function post(){
    		location.href="salePostBox.me"
    	}
    </script>
    
    
    <script>
    window.onload = function(){
    	sale(1);
    	post(1);s
    }

//      $(function(){
//     	$(document).ready(function(){
//     		sale(1);
//     	})
    	function sale(cPage){
    		console.log(cPage);
    		$.ajax({
    			url : "sale.me",<%--<form action> href:sale.me--%>
    			data : { <%--sale.me?userId--%>
    			userId : "userId"
    			,cPage : cPage
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
										+"<td style=\"text-align: center; accent-color: black\">"+"<input type=\"checkbox\" class=\"input_check\">"+"</td>"
// 										+"<td style=\"text-align: center;\">"+result.list[i].cateNo+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proPrice+"</td>"
										+"<td style=\"text-align: center;\">"+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].count+"</td>"
										+"<td style=\"text-align: center;\">"+ "<a href=\"postBox.me?proNo="+result.list[i].proNo+"\">" + result.list[i].proStatus+ "</a>" + "</td>"
									+"</tr>"
									
						}
					$("#tata>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' style=\"background-color: gray; color:white; border-color: white\" onclick='sale("+i+")'>"+i+"</button>"
						
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
    	function post(pPage){
    		console.log(pPage);
    		$.ajax({
    			url : "post.me",<%--<form action> href:sale.me--%>
    			data : { <%--sale.me?userId--%>
    			userId : "userId"
    			,pPage : pPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
    					
//				 		console.log(result.list[0].cateNo);
//     					console.log(result.list[0].proTitle);
//      				console.log(result.list[0].proPrice);
//      				console.log(result.list[0].proTitle);
//      				console.log(result.list[0].count);
//      				console.log(result.list[0].proStatus);

						   
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>" 
										+"<td style=\"text-align: center; accent-color: black\">"+"<div>"+"<input type=\"checkbox\" class=\"input_check2\" id=\"checkInput\">"+"<div>"+"</td>"
// 										+"<td style=\"text-align: center;\">"+result.list[i].cateNo+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].pboxName+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].pboxNo+"</td>"
									+"</tr>"
									
						}
					$("#tata2>tbody").html(resultStr);
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' style=\"background-color: gray; color:white; border-color: white\" onclick='post("+i+")'>"+i+"</button>"
						
					}
					$("#content_10 ").html(resultStr2);
					
					
					$("#delBtn").click(function() {
						var checkRow = $("input[id='checkInput']");
						checkRow.parent().parent().parent().remove();
					})
    			},
    			error : function(){
    				console.log("ajax 통신 실패")
    			}
    		})
    	}
	    	</script>
	    	
	    	<script>
	    	$(document).on('click','#check_all',function(){
			if($('#check_all').is(':checked')){
				$('.input_check').prop('checked',true);
			}else{
				$('.input_check').prop('checked',false);
			}
		});
		
 		$(document).on('click','.input_check',function(){
 			if($('input[class=input_check]:checked').length==$('.input_check').length){
 				$('#check_all').prop('checked',true);
 			}else{
 				$('#check_all').prop('checked',false);
 			}
 		});
 		</script>
 		
 		<script>
	    	$(document).on('click','#check_all2',function(){
			if($('#check_all2').is(':checked')){
				$('.input_check2').prop('checked',true);
			}else{
				$('.input_check2').prop('checked',false);
			}
		});
		
 		$(document).on('click','.input_check2',function(){
 			if($('input[class=input_check2]:checked').length==$('.input_check2').length){
 				$('#check_all2').prop('checked',true);
 			}else{
 				$('#check_all2').prop('checked',false);
 			}
 		});
 		</script>
 		
 		<script>
//  			function delRow(){

// 				var checkRows = $("[name='chkbox']:checked");
// 				for(var i=checkRows.length-1; i>-1; i--){
					
// 					checkRows.eq(i).closest('tr').remove();
// 				}
 				
//  			}



// 		$("#delBtn").click(function() {
// 			var checkRow = $("input[id='checkInput']");
// 			checkRow.parent().parent().remove();
// 		})
 		</script>
    
</body>
</html>