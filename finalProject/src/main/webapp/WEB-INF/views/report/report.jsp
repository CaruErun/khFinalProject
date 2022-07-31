<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>report</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
    #gray{
        color: gray;
        font-size: 13px;
    }
    #reason1, #reason2, #reason3{
        border-radius: 5px;
        border: solid 1px lightgray;
        text-align: center;
        color: cornflowerblue;
    }
    #reason1{
        width: 150px;
    }
    #reason2{
        width: 300px;
        height: 30px;
    }
    #reason3{
        width: 400px;
        height: 100px;
    }
    p{
        color: gray;
    }
</style>
</head>
<body>

		




      	<form action="report.mem"  method="post" >

        <!-- Modal body -->
        <div class="modal-body">          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">신고하기</h4>
          <p id="gray"><br>&nbsp;&nbsp;사유가 인정될 경우 해당 사용자의 이용이 제한됩니다.</p>

          <hr>
          
			<input type="text" value="${loginUser.userId }" name="reportId">
<!-- 			<input type="hidden" value="user02" name="reportId"> -->

			<input type="text" value="${p.proNo }" name="proNo">
<!-- 			<input type="hidden" value="1" name="proNo"> -->
			
          <p><b>피신고자</b></p>
            <input type="text" value="${p.sellId }" name="reportedId" id="reason1"> 
<!--             <input type="text" value="user01" name="reportedId" id="reason1">  -->
            
            <br><br><br>
            
          <p><b>신고사유</b></p>
          <select name="reportCateNo" id="reason2">
              <option value="">사유 선택하기</option>
              <option value="1201" >허위매물</option>
              <option value="1202">전자상거래 금지물품 거래</option>
              <option value="1203">욕설 및 비방</option>
              <option value="1204">담합</option>
              <option value="1205">기타</option>
            </select>
            
            
            <BR><BR>
            <input type="text" id="reason3" name="reportContent" placeholder="상세 사유를 입력해주세요">
        
        
        <script>
        //상단의 select box에서 신고사유를 선택하면 나타날 인풋박스
        $(function(){
        $("#reason3").hide(); //입력박스 숨어있다가
        $("#reason2").change(function() { //신고사유 선택시 등장
                if($("#reason2").val() ) {
                    $("#reason3").show();
                }  else {
                    $("#reason3").hide();
                }
            }) 
        });
        
        </script>

        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-block">완료</button>
          <!--  data-dismiss="modal" : 모달창을 닫아준다 -->
        </div>
  
 		 </form>
  

</body>
</html>