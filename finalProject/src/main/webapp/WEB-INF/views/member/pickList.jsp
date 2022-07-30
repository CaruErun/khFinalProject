<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심물품</title>
    <link rel="stylesheet" href="resources/css/pick.css">
    <script src="https://kit.fontawesome.com/ee429cabba.js" crossorigin="anonymous"></script>


<style>
div{
    box-sizing: border-box;
    border: 1px solid red;
}
.wrap{
    width: 1000px;
    height: 700px;
    margin: auto;
}
.wrap>div{ 
    width: 100%;
}
#header{
    height: 20%;
}
#content{
    height: 80%; 
}
#footer{
    height: 10%;
}
#title{
    height: 100%;
    font-family: "Malgun Gothic";
    font-size: 25px;
    font-weight: 700;
    padding-bottom: 50px;
    padding-top: 70px;
}
#content_1{
    height: 130px;
}
#content_1_1{
    float: left;
    width:20%;
    height: 130px;
    background-color: gray;
    color : white;
    font-family: "Malgun Gothic";
    font-size: 15px;
    font-weight: 550;
    border-bottom: 1px solid gray;
    border-top: 1px solid gray;
    padding-top:15px;
}
#content_1_2{
    float: left;
    width:80%;
    height: 130px;
    border-bottom: 1px solid gray;
    border-top: 1px solid gray;
}
#content_2{
   height: 30px;
}
#content_3{
    font-family: "Malgun Gothic";
    font-size: 20px;
    font-weight: 550;
    height: 40px;
}
#td{
    text-align: center;
}
#content_5{
    height: 40px;
    padding-top: 9px;
}
.btn{
    border-radius: 4px;
    border: 0px;
    height: 25px;
    background-color: rgb(134,134,134);
    color: white;
    width: 70px;
    height: 30px;
    text-align: center;
    margin-left: 925px;
}
#content_6{
    height: 25px;
    text-align: center;
}
#content_7{
    font-family: "Malgun Gothic";
    font-size: 20px;
    font-weight: 550;
    height: 40px;
}
#content_8{
/*     height: 88px; */
}
#content_9{
    height: 40px;
    padding-top: 10px;
}
#content_10{
    height: 25px;
    text-align: center;
}
/* #tata{
    background-color: black;
    color: white;
} */
thead{
    background-color: gray;
    color: white;
    text-align: center;
}


#top_icon{
    display: inline-block;
    text-align: center;
    padding: 20px;
    padding-left: 70px;
    font-size: smaller;
}
#top_icon1, #top_icon2, #top_icon3, #top_icon4, #top_icon5{
    margin-bottom: -5px;
}
table {
    border-top: 1px solid black;
    border-bottom: 1px solid black;
}
#icon{
    float: right;
    color: black;
    padding-right: 20px;
    font-size: larger;
}

#check_all:checked~div{
	background-color: black;
	
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
			

		<br><br><br><br><br><br>
		
	
<div class="wrap">
        <div id="header">
            <div id="title">관심물품</div>
        </div>
        <div id="content">
            <form action="">
                <div id="content_1">
                        <div id="content_1_1" style= "background-color: gray;"><p>&nbsp; ${loginUser.userName} 님</p></div>
                        <div id="content_1_2">
	                        <div id="top_icon">
	                            <i class="fa-regular fa-circle-check fa-4x" id="top_icon4" onclick="success()"></i><br><br>
	                            <label for="top_icon4">낙찰</label>
	                        </div>
	                        <div id="top_icon">
	                            <i class="fa-regular fa-newspaper fa-4x" id="top_icon3" onclick="sale()"></i><br><br>
	                            <b><label for="top_icon3">판매</label></b>
	                        </div>
	                        <div id="top_icon">
	                            <i class="fa-regular fa-heart fa-4x" id="top_icon2" onclick="pickListView()"></i><br><br>
	                            <label for="top_icon2">관심물품</label>
	                        </div>
	                        <div id="top_icon">
	                            <i class="fa-regular fa-user fa-4x" id="top_icon1" onclick="myInfo()"></i><br><br>
	                            <label for="top_icon1">나의 정보</label>
	                        </div>
	                        <div id="top_icon">
	                            <i class="fa-regular fa-circle-question fa-4x" id="top_icon5" onclick="location.href='list.bo?userId=${loginUser.userId}';"></i><br><br>
	                            <label for="top_icon5">문의 내역</label>
	                        </div>
                    	</div>
                    </div><br><br>




                    <!-- 찜 목록 -->
                    <hr>
                    <p style="font-weight: 600; color: darkgray; text-align:center;">2022.07</p>
                    <hr>

                    <!--반복-->
                        <table id="tata">
	                        <thead>
	                              	<tr > <!-- 구분선 -->
	                              	<!-- 체크박스 스타일 지정 -->
                                    <th height="30" width="70"><input type="checkbox" name="Chk_list" id="check_all" style="accent-color: black"></th>
                                    <th height="30" width="400">경매상태</th>
                                    <th height="30" width="130">카테고리</th>
                                    <th height="30" width="130">제목</th>
                                    <th height="30" width="110">시작가</th>
                                    <th height="30" width="130">현재가</th>
                                    <th height="30" width="130">판매자</th>
                                </tr>
                            </thead>
	                        <tbody>
	                        </tbody>
                        </table>


 <script>
    window.onload = function(){
    	pick(1);
    }

    	function pick(cPage){
    		console.log(cPage);
    		$.ajax({
    			url : "pick.me",
    			data : { 
    			userId : "${loginUser.userId}"
    			,cPage : cPage
    			},
    			success : function(result){
    					var resultStr = "";
    					
						for(var i=0; i<result.list.length; i++){
						
							resultStr += "<tr>"   
										+"<td style='text-align: center; accent-color: black'><input name='chkbox' type='checkbox' class='input_check' value="+result.list[i].proNo+"></td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidStatus+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proCateNo+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proTitle+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].proPrice+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].bidPrice+"</td>"
										+"<td style=\"text-align: center;\">"+"</td>"
										+"<td style=\"text-align: center;\">"+result.list[i].sellId+"</td>"
									+"</tr>"
									
						}
					$("#tata>tbody").html(resultStr);	
					
					var resultStr2 = ""; 
					for(var i=result.pi.startPage; i<=result.pi.endPage; i++){
						
						resultStr2 += "<button type='button' style=\"background-color: gray; color:white; border-color: black; border-radius: 4px; width:30px; text-align:center;\" onclick='sale("+i+")'>"+i+"</button>"
						
					}
					$("#content_6").html(resultStr2);
    			},
    			error : function(){
    				console.log("ajax 통신 실패")
    			}
    		})
    	}

    	
    	
    	
    	
    	$(function(){
    		$("#tata>tbody>tr").click(function(){
    			location.href='productDetail.pr?pNo='+$(this).children().eq(0).text();
    		});
    	});
    	
    	</script>



                        


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
    	
    	function mumu(){
    		location.href="mumu.me";
    	}
    </script>
    
    
    
    
    
    	<jsp:include page="../common/footer.jsp"/>
    	
</body>
</html>