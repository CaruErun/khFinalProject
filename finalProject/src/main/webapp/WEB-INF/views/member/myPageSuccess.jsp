<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지(낙찰)</title>

<script src="https://kit.fontawesome.com/ee429cabba.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
div {
	box-sizing: border-box;
	/*     border: 1px solid red;  */
}

.wrap {
	width: 1000px;
	height: 700px;
	margin: auto;
}

.wrap>div {
	width: 100%;
}

#header {
	height: 20%;
}

#content {
	height: 80%;
}

#footer {
	height: 10%;
}

#title {
	height: 100%;
	font-family: "Malgun Gothic";
	font-size: 25px;
	font-weight: 700;
	padding-bottom: 50px;
	padding-top: 70px;
}

#content_1 {
	height: 130px;
}

#content_1_1 {
	float: left;
	width: 20%;
	height: 130px;
	background-color: gray;
	font-family: "Malgun Gothic";
	font-size: 15px;
	font-weight: 550;
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	padding-top: 15px;
}

#content_1_2 {
	float: left;
	width: 80%;
	height: 130px;
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
}

#content_2 {
	height: 30px;
}

#content_3 {
	font-family: "Malgun Gothic";
	font-size: 20px;
	font-weight: 550;
	height: 40px;
}

#td {
	text-align: center;
}

#content_5 {
	height: 40px;
	padding-top: 9px;
}

.btn {
	border-radius: 4px;
	border: 0px;
	height: 25px;
	background-color: rgb(134, 134, 134);
	color: white;
	width: 70px;
	height: 30px;
	text-align: center;
	margin-left: 925px;
}

#content_6 {
	height: 25px;
	text-align: center;
}

#content_7 {
	font-family: "Malgun Gothic";
	font-size: 20px;
	font-weight: 550;
	height: 40px;
}

#content_9 {
	height: 40px;
	padding-top: 10px;
}

#content_10 {
	height: 25px;
	text-align: center;
}

#content_11 {
	font-family: "Malgun Gothic";
	font-size: 20px;
	font-weight: 550;
	height: 40px;
}

/*  #content_13 {  */
/*  	height: 80px;  */
/*  	padding-top: 150px;  */
/*  } */

#content_14 {
	height: 25px;
	text-align: center;
}

/* #tata{
    border: 2px solid gray;
} */
th {
	background-color: gray;
	color: white;
}

table {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

thead {
	background-color: gray;
	color: white;
	text-align: center;
}

#top_icon {
	display: inline-block;
	text-align: center;
	padding: 20px;
	padding-left: 70px;
	font-size: smaller;
}

#top_icon1, #top_icon2, #top_icon3, #top_icon4 {
	margin-bottom: -5px;
}

#content_8, #content_12 {
	height: 52.5px;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<link rel="stylesheet" href="resources/css/myPageSuccess.css">

	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="wrap">
		<form action="">
			<div id="header">
				<div id="title">마이페이지(낙찰)</div>
			</div>
			<div id="content">
				<div id="content_1">
					<div id="content_1_1" style="background-color: gray; color: white">
						<p>&nbsp; ${loginUser.userName} 님</p>
					</div>
					<div id="content_1_2">
						<div id="top_icon">
							<i class="fa-regular fa-circle-check fa-4x" id="top_icon4"
								onclick="success()"></i><br>
							<br> <b><label for="top_icon4" id="one">낙찰</label></b>
						</div>
						<div id="top_icon">
							<i class="fa-regular fa-newspaper fa-4x" id="top_icon3"
								onclick="sale()"></i><br>
							<br> <label for="top_icon3">판매</label>
						</div>
						<div id="top_icon">
							<i class="fa-regular fa-heart fa-4x" id="top_icon2"
								onclick="pickListView()"></i><br>
							<br> <label for="top_icon2">관심물품</label>
						</div>
						<div id="top_icon">
							<i class="fa-regular fa-user fa-4x" id="top_icon1"
								onclick="myInfo()"></i><br>
							<br> <label for="top_icon1">나의 정보</label>
						</div>
						<div id="top_icon">
							<i class="fa-regular fa-circle-question fa-4x" id="top_icon5"
								onclick="location.href='list.bo?userId=${loginUser.userId}';"></i><br>
							<br> <label for="top_icon5">문의 내역</label>
						</div>
					</div>
				</div>
				<br>
				<br>


				<div id="content_2"></div>
				<div id="content_3">&nbsp· 응찰현황</div>
				<div id="content_4">
					<table id="attend">
						<thead>
							<tr>
								<th height="30" width="70" id="tata"><input type="checkbox"
									name="" id="check_all" style="accent-color: black"></th>
								<th height="30" width="130" id="tata">판매자</th>
								<th height="30" width="320" id="tata">입찰상품</th>
								<th height="30" width="160" id="tata">응찰가</th>
								<th height="30" width="160" id="tata">현재가</th>
								<th height="30" width="155" id="tata">상태</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<div id="content_5">
<!-- 					<button type="submit" class="btn" onclick="attendDelete()">삭제</button> -->
				</div>
				<div id="content_6"></div>
				<div id="content_7">&nbsp· 낙찰현황</div>
				<div id="content_8" style="height: 52.5px;">
					<table id="bid">
						<thead>
							<tr>
								<th height="30" width="70" id="tata"><input type="checkbox"
									name="" id="check_all2" style="accent-color: black"></th>
								<th height="30" width="400" id="tata">판매상품</th>
								<th height="30" width="265" id="tata">낙찰가</th>
								<th height="30" width="260" id="tata">낙찰일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="content_9">
					<button type="button" class="btn" onclick="bidDelete()">삭제</button>
				</div>
				<div id="content_10"></div>
				<div id="content_11">&nbsp· 운송장 조회</div>
				<div id="content_12" style="height: 52.5px;">
					<table id="nPost">
						<thead>
							<tr>
								<th height="30" width="70" id="tata"><input type="checkbox"
									name="" id="check_all3" style="accent-color: black"></th>
								<th height="30" width="400" id="tata">구매한 물품</th>
								<th height="30" width="200" id="tata">택배회사</th>
								<th height="30" width="320" id="tata">운송장 번호</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<div id="content_13" style=" height: 70px; padding-top: 30px;" >
					<button type="button" class="btn" onclick="nPostDelete()">삭제</button>
				</div>
				<div id="content_14"></div>
		</form>
	</div>
	</div>
	<br>
	<br>
	<jsp:include page="../common/footer.jsp" />


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


	<!-- 응찰현황 -->
	<script>
    window.onload = function(){
    	attend(1);
    	bid(1);
    	nPost(1);
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
    			userId : "${loginUser.userId}"
    			,sPage : sPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
    					
//     					console.log(result.list[0].proTitle);

						   
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>" 
								+"<td style='text-align: center; accent-color: black'><input type='checkbox' class='input_check'  value="+result.list[i].proNo+"></td>"
										+"<td style=\"text-align: center;\">"+result.list[i].buyerId+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidPrice+"</td>"
										+"<td style=\"text-align: center;\">"+"</td>"
										+"<td style=\"text-align: center;\">"+((result.list[i].bidStatus == 'Y')?'진행중' : '경매완료')+"</td>"
									+"</tr>"
									
						}
					$("#attend>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' style=\"background-color: gray; color:white; border-color: black; border-radius: 4px; width:30px; text-align:center;\" onclick='attend("+i+")'>"+i+"</button>"
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

	<!-- 낙찰현황 -->
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
    			userId : "${loginUser.userId}"
    			,bPage : bPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
    					
//     					console.log(result.list[0].proTitle);

						   
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>" 
										+"<td style=\"text-align: center; accent-color: black\">"+"<input type=\"checkbox\" class=\'input_check2\' name='chkbox3' value="+result.list[i].bidNo+">"+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidPrice+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].endDate+"</td>"
									+"</tr>"
									
									
						}
					$("#bid>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' style=\"background-color: gray; color:white; border-color: black; border-radius: 4px; width:30px; text-align:center;\" onclick='bid("+i+")'>"+i+"</button>"
						
					}
					$("#content_10").html(resultStr2);
    			},
    			error : function(){
    				console.log("ajax 통신 실패")
    			}
    		})
    	}
//     })
    </script>


	<!-- 운송장 조회 -->
	<script>
//      $(function(){
//     	$(document).ready(function(){
//     		sale(1);
//     	})
    	function nPost(nPage){
    		console.log(nPage);
    		$.ajax({
    			url : " nPost.me",
    			data : { 
    			userId : "${loginUser.userId}"
    			,nPage : nPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
    					
//     					console.log(result.list[0].proTitle);

						   
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>" 
								+"<td style=\"text-align: center; accent-color: black\">"+"<div>"+"<input type=\"checkbox\" class=\"input_check3\" name='chkbox4' id=\"checkInput\" value="+result.list[i].pboxNo+">"+"<div>"+"</td>"
								+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
								+"<td style=\"text-align: center;\">"+result.list[i].pboxName+"</td>"
								+"<td style=\"text-align: center;\">"+result.list[i].pboxNo+"</td>"
							+"</tr>"
									
									
						}
					$("#nPost>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' style=\"background-color: gray; color:white; border-color: black; border-radius: 4px; width:30px; text-align:center;\" onclick='nPost("+i+")'>"+i+"</button>"
						
					}
					$("#content_14").html(resultStr2);
    			},
    			error : function(){
    				console.log("ajax 통신 실패")
    			}
    		})
    	}
//     })
    </script>


	<!-- 낙찰현황  삭제 -->
	<script>
	    	function bidDelete(){
	    		if(window.confirm("진짜 삭제하시겠습니까?")){
	    			
				var checkValue3 = [];
				var checkRows3 = $("[name='chkbox3']:checked");
				for(var i = 0; i<checkRows3.length;i++){
					checkValue3[i] = checkRows3.eq(i).val();
				}
				console.log(checkValue3);
					$.ajax({
 						url:"deleteBid.my",
 						type:"post",
 						traditional : true,
 						data:{
 							chArr3 : checkValue3
 						},
 						success: function(){
 
 							bid(1);
 							
 						}
 					})
	    	}
	    	}
    </script>
    
    <!-- 운송장 판매  삭제 -->
	<script>
	    	function nPostDelete(){
	    		if(window.confirm("진짜 삭제하시겠습니까?")){
	    			
				var checkValue4 = [];
				var checkRows4 = $("[name='chkbox4']:checked");
				for(var i = 0; i<checkRows4.length;i++){
					checkValue4[i] = checkRows4.eq(i).val(); //checkRows에 check된 체크박스들이 있고 걔네들 value에 다시 넣어준거
				}
				console.log(checkValue4);
					$.ajax({
 						url:"deleteNpost.my",
 						type:"post",
 						traditional : true,
 						data:{
 							chArr4 : checkValue4
 						},
 						success: function(){
 
 							nPost(1);
 							
 						}
 					})
	    	}
	    	}
    </script>


	<!-- 체크박스 -->
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
	    	$(document).on('click','#check_all3',function(){
			if($('#check_all3').is(':checked')){
				$('.input_check3').prop('checked',true);
			}else{
				$('.input_check3').prop('checked',false);
			}
		});
		
 		$(document).on('click','.input_check3',function(){
 			if($('input[class=input_check3]:checked').length==$('.input_check3').length){
 				$('#check_all3').prop('checked',true);
 			}else{
 				$('#check_all3').prop('checked',false);
 			}
 		});
 		</script>




</body>
</html>