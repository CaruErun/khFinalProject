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
        <div class="innerOuter" padding="50">
            <h2>공지사항</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="noticeList.no">목록으로</a>
            <br><br><br><br>

            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="400">${n.nfTitle }</th>
                    <td width="100">${n.createDate }</td>
                    <td width="100">조회 ${n.count }</td>
                </tr>
                <tr>
                    <td colspan="3"><div>${n.nfContent }</div></td>
                </tr>
                
            </table>
            <br>

			<c:if test="${loginUser.userId eq 'admin' }">
            <div align="center">
                <!-- 관리자가 로그인했을때만 -->
                <a class="btn btn-secondary" onclick="postFormSubmit(1)">수정하기</a>
                <a class="btn btn-secondary" onclick="postFormSubmit(2)">삭제하기</a>
            </div>
            </c:if>
            
            <form id="postForm" action="" method="post">
            	<input type="hidden" name="nfNo" value="${n.nfNo }">
            </form>
            
            <script>
            	// 수정하기 또는 삭제하기 url로 요청 못하게 post형식으로 숨기기
            	function postFormSubmit(num){
            		// action속성에 경로값을 넣어주는 함수 + submit까지
            		if(num==1){	// 수정하기
            			$("#postForm").attr("action", "updateForm.no").submit();
            		}else{	// 삭제하기
            			$("#postForm").attr("action", "delete.no").submit();
            		}
            	}
            </script>
        </div>
    </div>
    <br><br><br><br>
    
         	<jsp:include page="../common/footer.jsp"/>
</body>
</html>







