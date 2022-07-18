<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>report_done</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



<style>
    div{
        text-align:center;
    }
    #button{
        text-align:center;
    }
    p{
        color: NAVY;
    }
    #t1{
        width: 400px;
        text-align: center;
        margin:auto; /*가운데 정렬이 안된다면 margin:auto를 사용해라*/
    }
    .ttd{
        width: 76%;
    }
    #tt{
        background-color: rgb(240, 239, 239);
    }


</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
    
    		
		<br><br><br><br><br><br><br><br><br>
	

    <div>
    <h3>신고가 완료되었습니다.</h3>
     <br><br>
     <div id="t1">
    <table class="table table-bordered">
        <tr>
            <td id="tt">피신고자</td>
            <td class="ttd" colspan=2>${r.reportedId }</td>
        </tr>
        <tr>
            <td id="tt">신고 사유</td>
		        <c:if test="${r.reportCategoryNo==1201 }">
		              <td>허위매물</td>
		        </c:if>
		        <c:if test="${r.reportCategoryNo==1202 }">
		              <td>전자상거래 금지물품 거래</td>
		        </c:if>
		        <c:if test="${r.reportCategoryNo==1203 }">
		              <td>욕설 및 비방</td>
		        </c:if>
		        <c:if test="${r.reportCategoryNo==1204 }">
		              <td>담합</td>
		        </c:if>
		        <c:if test="${r.reportCategoryNo==1205 }">
		              <td>기타</td>
		        </c:if>
        </tr>
        <tr>
        	<td id="tt">상세 사유</td>
            <td>${r.reportContent }</td>
        </tr>
    </table>
    </div>

    <br><br>
    <p>소비자보호원에 신고를 원하시면 아래의 버튼을 눌러주세요.</p>
    <button type="button" class="btn btn-dark" id="button" onclick="location.href='https://www.kca.go.kr/odr/link/pg/pr/osPgReqFormW.do#none'">소비자보호원으로 이동</button>
    </div>
    
    	<jsp:include page="../common/footer.jsp"/>
</body>
</html>