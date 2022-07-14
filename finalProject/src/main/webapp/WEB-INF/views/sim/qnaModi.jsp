<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
   
  	 <!-- header.jsp include -->
	 <%@ include file="../common/header.jsp" %>
	
     <form action="qnaModi.qu" method="post" id="queEnrollform" enctype="multipart/form-data" >
		    <input type="hidden" name="qNo" value="${q.qnaNo}">
        
        <div class="outer position-relative" >
        <br><br>
        <h2 align="center">QnA 수정하기</h2>
        <br>


            <div class="position-absolute top-50 start-50 translate-middle">

        <!--카테고리 : 변경할 수 없음(처음 설정 그대로 하기) -->
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="qnaCateNo">
		               
		               <c:if test="${q.qnaCateNo ==1101}">
		                    <option value="${q.qnaCateNo}">회원문의</option>
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1102 }">
                        	<option value="${q.qnaCateNo}">기타문의</option>
                        </c:if>
                        	<c:if test="${q.qnaCateNo ==1103 }">
                        <option value="${q.qnaCateNo}">공지/이벤트문의</option>
                        </c:if>
                        <c:if test="${q.qnaCateNo ==1104 }">
                        	<option value="${q.qnaCateNo}">경매문의</option>
                        </c:if>
		 </select>
		 
		 
                        <script>
                             $(function(){
                                 $("option").each(function(){
                                    if($(this).text()=="${q.qnaCateNo}"){
                                         $(this).attr("selected",true); 
                                     }
                                 })

                             })
                        </script>
                        
                        
                <br>

                <!--제목-->
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="title" aria-label="Text input with dropdown button" name="qnaTitle" value="${q.qnaTitle}">
                </div>

                <!--내용-->
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label" id="content" ><b>내용</b></label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize:none" name="qnaContent">${q.qnaContent}</textarea>
                </div>

                
                
                <div align="center">
                    <button type="submit"  class="btn btn-dark">수정하기</button>
                    <button type="button"  class="btn btn-light" onclick="javascript:history.go(-1);">뒤로</button>
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