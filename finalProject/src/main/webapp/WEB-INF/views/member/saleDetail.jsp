<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매현황</title>
    <link rel="stylesheet" href="resources/css/saleDetail.css">
</head>
<body>
    <div class="wrap">
    <form action="saleDetail.me">
        <div id="content_2"></div>
        <div id="content_3">&nbsp· 판매현황</div>
        <div id="content_4">
            <table id="tata">
                <thead >
                    <tr >
                        <th height="30" width="50" id="tata"><input type="checkbox" name="" id=""></th>
                        <th height="30" width="150"id="tata">카테고리</th>
                        <th height="30" width="300" id="tata">판매상품</th>
                        <th height="30" width="120" id="tata">시작가</th>
                        <th height="30" width="120" id="tata">현재가</th>
                        <th height="30" width="90" id="tata">조회수</th>
                        <th height="30" width="130" id="tata">상태</th>
                    </tr>
                </thead>
                <tbody id="td">
                	<c:forEach var="p" items="${list}">
	                    <tr>
	                        <td ><input type="checkbox" name="" id=""></td>
	                        <td >${p.proCateNo}</td>
	                        <td >${p.proTitle}</td>
	                        <td >${p.proPrice }</td>
	                        <td >600</td>
	                        <td >${p.count}</td>
	                        <td >${p.proStatus}</td>
	                        
	                    </tr>
                    </c:forEach>
                </tbody>  
                </table>
        </div>
        <div id="content_5">
            <button type="submit" class="btn">삭제</button>
        </div>
        <div id="content_6">
            <div id="pagingArea">
                <ul class="pagination">
                	<c:if test="${pi.currentPage ne 1}">
                    <li class="page-item"><a class="page-link" href="saleDetail.me?cpage=${pi.currentPage-1}">Previous</a></li>
                	</c:if>
                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="saleDetail.me?cpage=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${pi.currentPage ne pi.maxPage}">
                    <li class="page-item"><a class="page-link" href="saleDetail.me?cpage=${pi.currentPage+1}">Next</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
         </form>
    </div>
</body>
</html>