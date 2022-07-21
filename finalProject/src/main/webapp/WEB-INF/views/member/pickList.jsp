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
                        <div id="content_1_1"><p>&nbsp; ((싸욥)) 님</p></div>
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
                    </div> <br><br><br>




                    <!-- 찜 목록 -->
                    <hr>
                    <p style="font-weight: 600; color: darkgray;">2022.07 (00)</p>
                    <hr>

                    <!--반복-->
                        <table>
                                <tr>
                                    <th width="200" rowspan="3"><img src="resources/중고경매.png" alt="이미지" id="image"></th>
                                    <th width="700" colspan="3"><h3>(((경매상태))  [((카테고리))]  ((제목))</h3></th>
                                    <th width="140" rowspan="2">((판매자))</th>
                                    <th width="100" rowspan="3">
                                        <!--if 경매중= 버튼 생성 / 아니면 버튼 없음-->
                                        
                                        <button class="tBtn" id="tBtn1">응찰하기</button>
                                        <button type="submit" class="tBtn" id="tBtn2">삭제하기</button>
                                    </th>
                                </tr>
                                <tr>
                                    <td>찜한 날짜 : 2022.07.03
                                    </td>
                                    <td>
                                        시작가 : ((시작가))원 
                                        <br>
                                        현재가 : ((현재가))원</p>
                                        <br>
                                        <p id="nokoriBid">남은 경매 시간 : 00000</p>
                                    </td>
                                </tr> 
                        </table>
                        <hr>
                        <!--/반복-->


                        <script>
				function getSearchList(){
					$.ajax({
						type: 'GET',
						url : "/pickList",
						data : $("#searchFrom").serialize(),
						success : function(result){
							//테이블 초기화
// 							$('#boardtable > tbody').empty();
							if(result.length>=1){
								result.forEach(function(item){
									str='<tr>'
									str += "<td>"+item.idx+"</td>";
									str+="<td>"+item.writer+"</td>";
									str+="<td><a href = '/board/detail?idx=" + item.idx + "'>" + item.title + "</a></td>";
									str+="<td>"+item.date+"</td>";
									str+="<td>"+item.hit+"</td>";
									str+="</tr>"
									$('#boardtable').append(str);
				        		})				 
							}
						}
					})
				}  
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
    </script>
    
    
    
    
    
    	<jsp:include page="../common/footer.jsp"/>
    	
</body>
</html>