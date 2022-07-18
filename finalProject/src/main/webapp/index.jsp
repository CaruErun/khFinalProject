<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="pickView.bo">찜하기</a> <br>
	<a href="successfulBidView.mem">경매성공</a> <br>
	
	<a href="reportView.mem">신고하기</a> <br>
	<a href="qnaList.qu">QnA 목록</a> <br>
	
	<jsp:forward page="WEB-INF/views/main.jsp"/>


</body>
</html>