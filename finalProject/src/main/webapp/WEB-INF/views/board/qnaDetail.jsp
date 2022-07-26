<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>QnA</title>

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    <!-- alert창 예쁘게 꾸미는 구문 Started -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>


<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    body{
		margin-top: 20px;
	}
    .outer{
        /*  border: 1px solid blue; */
        width:1000px;
        height: 800px;
        margin: auto;
    }

    .mb-3{
        width: 800px;
    }
    #form22{
        border: 1px solid red;
    }

</style>
</head>
<body>
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.alert("서비스 요청 성공", "${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	
   
  	 <!-- header.jsp include -->
	 	<jsp:include page="../common/header.jsp"/>
	
			
		<br><br><br><br><br><br>
		
        
        <div class="outer position-relative" >
        <br><br>
        <h2 align="center" >QnA 상세보기</h2>
        
        
        
            <div class="position-absolute top-50 start-50 translate-middle">

                <!--카테고리-->
		 		        <c:if test="${q.qnaCateNo ==1101}">
						<input class="form-select form-select-sm" aria-label=".form-select-sm example" name=qnaCateNo readonly value="회원문의" />
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1102 }">
                        <input class="form-select form-select-sm" aria-label=".form-select-sm example" name=qnaCateNo readonly value="기타문의" />
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1103 }">
                        <input class="form-select form-select-sm" aria-label=".form-select-sm example" name=qnaCateNo readonly value="공지/이벤트문의" />
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1104 }">
                        <input class="form-select form-select-sm" aria-label=".form-select-sm example" name=qnaCateNo readonly value="경매문의" />
                        </c:if>
                <br>

                <!--제목-->
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="title" aria-label="Text input with dropdown button" name="qnaTitle" readonly value="${q.qnaTitle}" >
                </div>

                <!--내용-->
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label" id="content" ><b>내용</b></label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize:none" name="qnaContent" readonly>${q.qnaContent}</textarea>
                </div>

                
                <c:if test="${loginUser.userId eq q.qnaId}">
                <div align="center">
            <form method="post" name="form">
	            	<input type="hidden" name="qNo" value="${q.qnaNo }">
			    <button type="submit" class="btn btn-dark" value="update" onclick="javascript: form.action='qnaModiView.qu';">수정하기</button>
			    <button type="submit" class="btn btn-light" value="delete" onclick="javascript: form.action='delete.qu';">삭제하기</button>
			</form>
                </div>
            	</c:if>
            	
            	
			        <a class="btn btn-secondary" href="qnaList.qu" style="float:right;">목록으로</a>
            	
            	
            </div>
        </div>

        
	
	
   
   
   
   
   	<!-- footer.jsp include -->
		<jsp:include page="../common/footer.jsp"/>


	<!-- Bootstrap.bundle.min.js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
</body>
</html>