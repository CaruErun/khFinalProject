<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<title>QnA</title>

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
        tesxt-align:center;
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
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	
	
  	 <!-- header.jsp include -->
	 <%@ include file="../common/header.jsp" %>
	
     <form action="insert.qu" method="post" id="queEnrollform" enctype="multipart/form-data" >
        
        <div class="outer position-relative" >
        <br><br>
        <h2 align="center">QnA 작성</h2>
        <br>

			<input type="hidden" name="qnaId" value="${loginUser.userId }">
<!-- 			<input type="hidden" name="qnaId" value="user01"> -->


            <div class="position-absolute top-50 start-50 translate-middle">

        <!--카테고리-->
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="qnaCateNo">
							
<%-- 							<c:forEach var="c" items="${category }"> <!-- items에 키값을 넣어야해!! --> --%>
 							<c:forEach var="c" items="${category }">
 								<c:if test="${c.cateNo<=1104}">
		                            	<option value="${c.cateNo}">${c.cateName}</option>
		                        </c:if>
		                    </c:forEach>
		                    
<!-- 				              <option value="">문의 유형 선택하기</option> -->
<!-- 				              <option value="1101" >회원문의</option> -->
<!-- 				              <option value="1102">기타문의</option> -->
<!-- 				              <option value="1103">공지/이벤트문의</option> -->
<!-- 				              <option value="1104">경매문의</option> -->
            
		 </select>

                <br>

                <!--제목-->
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="title" aria-label="Text input with dropdown button" name="qnaTitle" placeholder="제목">
                </div>

                <!--내용-->
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label" id="qnaContent" ><b>내용</b></label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize:none" name="qnaContent" placeholder="내용"></textarea>
                </div>

                
                
                <div align="center">
                    <button type="submit"  class="btn btn-dark">등록하기</button>
                    <button type="reset"  class="btn btn-light">초기화</button>
                </div> 
            
        
            </div>
        </div>
</form>

        
	
	
   
   
   
   
   	<!-- footer.jsp include -->
	<%@ include file="../common/footer.jsp" %>


	<!-- Bootstrap.bundle.min.js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
</body>
</html>