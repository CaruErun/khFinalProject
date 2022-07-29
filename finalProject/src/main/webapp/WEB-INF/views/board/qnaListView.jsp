<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            text-align:center;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
 		#boardList {text-align:center;}
        #boardList>tbody>td:hover {cursor:pointer;}
        #pagingArea {width:fit-content; margin:auto; }
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
		#content{
            padding-top:100px;
		}
		#content_2_2{
		    line-height: 36px;
		    font-family: "Malgun Gothic";
		    font-size: 20px;
		    font-weight: 700;
		    padding-top: 10px;
		    border-top: 2px solid gray;
		}
		#content{
		    width: 1500px;
		    height: 840px;
 		    margin-left: 20%;
		}
		#content_2{
		    width: 70%;
		    height: 100%;
		}
		table{
		    border-top: 1px solid gray;
		    border-bottom: 1px solid gray;
		}
		#pagingArea{
			margin-top:50px;
		}
        #searchFrom{
			margin-left:3%;
        }
        
	</style>

</head>

<body>
			<jsp:include page="../common/header.jsp"/>	
				
		<br><br><br><br><br><br>
                
		<div id="content">
			<div id="content_1">
				<h2>Q&A</h2>
            	<h4>삼삼옥션 서비스 관리자와의 질의응답 게시판입니다.</h4>
			</div>
		<h3>상담문의</h3>

                       <!-- 로그인한 회원만 보일 수 있도록 -->
<%--                 <c:if test="${!empty loginUser}"> --%>
                	<div class="btn" style="background-color:#576480; float: right; margin-right:30%;">
                		<a href="insertView.qu" style="color:white !important;  text-decoration: none; ">문의하기</a>
                	</div>
<%--                 </c:if> --%>
<br><br>

            <div id="content_2">
                <div id="content_2_2"></div>
           <form action="list.qo?kpage=1" method="post">
                <div id="content_2_3">
                    <table style="width: 1050px; text-align:center"  class="table table-hover" id="qList">
                        <thead>
                            <tr>
                                <th class="text-center id" width="10%">No.</th>
                                <th class="text-center id" width="15%">카테고리</th>
                                <th class="text-center id" width="35%">제목</th>
                                <th class="text-center id" width="10%">작성자</th>
                                <th class="text-center id" width="10%">작성일</th>
                                <th class="text-center id" width="10%">답변상태</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                        <c:choose>
                        <c:when test="${empty list}">
                        	<tr>
                        		<td colspan="4">등록된 Q&A가 없습니다.</td>
                        	</tr>
                        </c:when>
                        <c:otherwise>
                        	<c:forEach var="q" items="${list}">
                    <tr>
                        <td>${q.qnaNo}</td>
                        
                        <c:if test="${q.qnaCateNo ==1101}">
                        	<td>회원문의</td>
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1102 }">
                        	<td>기타문의</td>
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1103 }">
                        	<td>공지/이벤트문의</td>
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1104 }">
                        	<td>경매문의</td>
                        </c:if>
                        
                        <td>${q.qnaTitle}</td>
                        <td>${q.qnaId}</td>
                        <td>${q.createDate}</td>
                        
                        	<!-- 답변여부 표시 -->
                        	<c:choose>
                        		<c:when test="${q.ansStatus=='N'}">
                        		<td>답변대기</td>
                        		</c:when>
                        		<c:otherwise>
                        		<td>답변완료</td>
                        		</c:otherwise>
                        	</c:choose>
	                    </tr>
                    </c:forEach>
                         </c:otherwise>
                         </c:choose>
                        </tbody>
                    </table>
                </div><br>
            
            <!-- 게시글 보기 -->  
			<script>
            	$(function(){
            		$("#qList>tbody>tr").click(function(){
            			location.href='detail.qu?qNo='+$(this).children().eq(0).text();
            		});
            	});
            </script>
            
            
                
         <!-- 검색 -->
         <div id="searchFrom">
            <input class="form-control" id="myInput" type="text" placeholder="검색어를 입력하세요..">
            <script>
				$(function(){
				  $("#myInput").on("keyup", function() {
				    var value = $(this).val().toLowerCase();
				    $("#myTable tr").filter(function() {
				      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				    });
				  });
				});
			</script>
        </div>
        



                <!-- 페이징 -->
				<div id="pagingArea" align="center">
                	<ul class="pagination">
                
                	<c:choose>
	                	<c:when test="${pi.currentPage eq 1 }">
	                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    <li class="page-item"><a class="page-link" href="qnaList.qu?cpage=${pi.currentPage-1}">Previous</a></li>
	                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="qnaList.qu?cpage=${p}">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
	                    <c:when test="${pi.currentPage eq pi.maxPage }">
	                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    <li class="page-item"><a class="page-link" href="qnaList.qu?cpage=${pi.currentPage+1 }">Next</a></li>
	                    </c:otherwise>
                    </c:choose>
	                </ul>
	            </div>
           </form>
             </div>
             </div>	<!-- 전체 -->
             

            
             
             
             

        
        
        
         	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>