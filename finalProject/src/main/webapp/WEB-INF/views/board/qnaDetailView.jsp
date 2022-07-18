<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	    table * {margin:5px;}
        table {width:100%;}
</style>

</head>
<body>
    
	<jsp:include page="../customerInfoMenubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>QNA</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="qnaList.qa">목록으로</a>
            <br><br>

            <table id="contentArea" align="center" class="table">
                <tr>
                    <td width="100">${q.qnaCateNo }</td>
                    <th width="300">${q.qnaTitle }</th>
                    <td width="100">${q.createDate }</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">${q.qnaContent }</td>
                </tr>
                <c:choose>
                	<c:when test="${q.answerContent ne null }">
                		<tr>
                			<td>답변</td>
	                    	<td>${q.answerContent }</td>
	                    	<td>${q.answerDate }</td>
	                	</tr>
                	</c:when>
                	<c:otherwise>
                		<tr>
                			<td colspan="3">등록된 답변이 없습니다.</td>
                		</tr>
                	</c:otherwise>
                </c:choose>
            </table>
            <br>
		                <!-- 관리자가 로그인했을때 and 등록된 답변이 없을 때 -->
			<c:if test="${1 eq 1 and q.answerContent eq null }">
	            <form id=enrollForm method="post" action="insert.ans?qnaNo=${q.qnaNo }">
		            <div align="center">
		                <textarea id="content" class="form-control" rows="10" style="resize:none;" name="answerContent" required></textarea>
		            </div>
	            	<br>
	            	<div align="center">
	                    <button type="submit" class="btn btn-secondary">등록하기</button>
	                </div>
	        	</form>
            </c:if>
	            <form id="postForm" action="" method="post">
	            	<input type="hidden" name="qNo" value="${q.qnaNo }">
	            </form>
        </div>
    </div>
    
            <br>
            <br>
            <br>
            <br>
    
</body>
</html>







