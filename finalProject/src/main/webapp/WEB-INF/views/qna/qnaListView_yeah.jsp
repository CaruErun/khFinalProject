<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SAMSAM AUCTION</title>

	<style>
		#qnaList {text-align:center;}
        #qnaList>tbody>tr:hover {cursor:pointer;}

        .text {width:53%;}
        .searchBtn {width:20%;}
        #qnaList a{
        	color:black;
        	text-decoration: none;
        }
        .btn-secondary{
            margin-right: 10px;
        }
        #pagingArea{
        	width:fit-content; margin:auto;
        }
        
	</style>

</head>

<body>
		<jsp:include page="../customerInfoMenubar.jsp"/>
		<div class="content">
        <div class="innerOuter" style="padding:0% 10%;">
        
<%--             <input type="hidden" name="nno" value="${n.nfNo }"> --%>
			<br>
            <h2>Q&A</h2>
            <h4>삼삼옥션 서비스 관리자와의 질의응답 게시판입니다.</h4>
            <br>
            	<a class="btn btn-secondary" style="float:right;" href="enrollForm.qa">QNA 작성</a>
            <br><br><br>
            <table id="qnaList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="q" items="${list }">
	                    <tr onclick = "location.href='detail.qa?qno=${q.qnaNo}'">
	                        <td class="qnaNo">${q.qnaNo }</td>
	                        <td>${q.qnaCateNo }</td>
	                        <td>${q.qnaTitle }</td>
	                        <td>${q.createDate }</td>
	                        <c:choose>
                				<c:when test="${empty q.answerContent}">
	                    			<td><b>답변없음</b></td>
                				</c:when>
                				<c:otherwise>
                					<td>답변있음</td>
                				</c:otherwise>
                			</c:choose>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <script>	// 자바 스크립트 => $jquery
            	$(function(){
            		$("#noticeList>tbody>tr").click(function(){
						console.log($(this).closest('tr').prevAll().length);
            		})
            	})
            </script>
            
            <br><br>
            <div id="pagingArea">
                <ul class="pagination">
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
                    <li class="page-item"><a class="page-link" href="qnaList.qa?cpage=${p}">${p}</a></li>
                </c:forEach>
                </ul>
            </div>
        </div>
        <br><br>

    </div>
	
</body>
</html>














