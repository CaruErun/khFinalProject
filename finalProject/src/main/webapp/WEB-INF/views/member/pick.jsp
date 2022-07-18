<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심물품</title>
    <link rel="stylesheet" href="resources/css/pick.css">
    <script src="https://kit.fontawesome.com/ee429cabba.js" crossorigin="anonymous"></script>
    

</head>
<div class="wrap">
<body>
        <div id="header">
            <div id="title">관심물품</div>
        </div>
        <div id="content">
                <form action="">
                    <div id="content_1">
                        <div id="content_1_1"><p>&nbsp; 싸욥 님</p></div>
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
	                            <i class="fa-regular fa-heart fa-4x" id="top_icon2" onclick="interest()"></i><br><br>
	                            <label for="top_icon2">관심물품</label>
	                        </div>
	                        <div id="top_icon">
	                            <i class="fa-regular fa-user fa-4x" id="top_icon1" onclick="myInfo()"></i><br><br>
	                            <label for="top_icon1">나의 정보</label>
	                        </div>
                    	</div>
                    </div> <br><br><br>




                    <!-- 찜 목록 -->
                    <hr>
                    <p style="font-weight: 600; color: darkgray;">2022.07 (4)</p>
                    <hr>

                    <!--반복-->
                        <table>
                                <tr>
                                    <th width="200" rowspan="3"><img src="resources/중고경매.png" alt="이미지" id="image"></th>
                                    <th width="700" colspan="3"><h3>(경매상태)  [카테고리]  제목</h3></th>
                                    <th width="140" rowspan="2">판매자</th>
                                    <th width="100" rowspan="3">
                                        <!--if 경매중= 버튼 생성 / 아니면 버튼 없음-->
                                        
                                        <button class="tBtn" id="tBtn1">응찰하기</button>
                                        <button type="submit" class="tBtn" id="tBtn2">삭제하기</button>
                                    </th>
                                </tr>
                                <tr>
                                    <td><p>2022.07.03
                                        &nbsp;&nbsp;|&nbsp;&nbsp;
                                        시작가 : 시작가 원 
                                        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        현재가 : 현재가 원</p></td>
                                </tr> 
                        </table>
                        <hr>
                        <!--/반복-->


                        




                            

                        
                        
                        <!--페이징바-->
                        <br><br><br><br><br>
                        <div id="pagingArea" align="center">
                            <ul class="pagination">
                            
                                <c:choose>
                                    <c:when test="${pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage-1}">Previous</a></li>
                                    </c:otherwise>
                                </c:choose>
                                
                                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p }</a></li>
                                </c:forEach>
                                
                                <c:choose>
                                    <c:when test="${pi.currentPage eq pi.maxPage }">
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage+1 }">Next</a></li>
                                    </c:otherwise>
                                </c:choose>
                                
                            </ul>
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
    	
    	function interest(){
    		location.href="pick.me"
    	}
    	
    	function myInfo(){
    		location.href="myInfo.me"
    	}
    </script>
</body>
</html>