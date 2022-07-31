<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	    #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
</style>

</head>
<body>

	<jsp:include page="../customerInfoMenubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>공지사항 등록</h2>
            <br>

            <form id=enrollForm method="post" action="insert.no">
            	<table align="center" width="800px">	
            		<tr>
            			<th></th>
            			<td>
	            		<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="float:right;" name="nfCateNo">
	 						<c:forEach var="c" items="${category }">
	 							<c:if test="${c.cateNo<=1104}">
			                    	<option value="${c.cateNo}">${c.cateName}</option>
			                    </c:if>
			                </c:forEach>
			 			</select> <br><br>
		 				</td>
                	</tr>
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="nfTitle" maxlength="30" required></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="nfContent" required></textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-secondary">등록하기</button>
                    <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

         	<jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>