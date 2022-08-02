<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SAMSAM AUCTION</title>

	<style> 		
		#boardList {text-align:center;}
        #boardList>tbody>td:hover {cursor:pointer;}
        #pagingArea {
        	width:fit-content; margin:auto;
 			margin-top:50px; 
		}
		#content{
            padding-top:50px; 
		    width: 1500px;
		    height: 840px;
 		    margin-left: 20%;
		}
		table{
		    border-top: 1px solid gray;
		    border-bottom: 1px solid gray;
		}
		#content_2{
		    width: 70%;
		    height: 100%;
		}

        #searchFrom{
			margin-left:3%;
        }
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
	</style>

</head>

<body>
		<jsp:include page="../customerInfoMenubar.jsp"/>
                
		<div id="content">
            <h2>Q&A</h2>
            <h4>삼삼옥션 서비스 관리자와의 질의응답 게시판입니다.</h4>

				<br><br><br><br>

            <div id="content_2">
           	<form action="myPageList.me" method="post">
           	<input type="hidden" name="userId" value="${loginUser.userId }">
                <div id="content_2_3">
                <div class="container">
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
                        		<td colspan="4" onclick="event.cancelBubble='true'">등록된 Q&A가 없습니다.</td>
                        	</tr>
                        </c:when>
                        <c:otherwise>
                        
                        
                        	<c:forEach var="q" items="${list}">
                    <tr>
                        <td>${q.qnaNo}</td>
                        <td>${q.qnaCateNo }</td>
                        <td>${q.qnaTitle}</td>
                        <td>${q.qnaId}</td>
                        <td>${q.createDate}</td>
                        
                        	<!-- 답변여부 표시 -->
                        	<c:choose>
                        		<c:when test="${q.ansStatus=='N'}">
                        		<td><b>답변대기</b></td>
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
               	</div>
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
            <input class="form-control" id="myInput" type="text" placeholder="검색어를 입력하세요.">
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
        <br>
                <!-- 페이징 -->
				<div id="pagingArea" align="center">
                	<ul class="pagination">
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.bo?mpage=${p}">${p }</a></li>
                    </c:forEach>

	                </ul>
	            </div>
           </form>
             </div>
             </div>
             
         	<jsp:include page="../common/footer.jsp"/>
	
</body>
