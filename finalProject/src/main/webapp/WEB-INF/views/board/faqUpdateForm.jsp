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
            <h2>공지사항 수정</h2>
            <br>

            <form id="updateForm" method="post" action="update.fq" enctype="multipart/form-data">
            	<input type="hidden" name="nfNo" value="${f.nfNo }">
            	
                <table algin="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${f.nfTitle }" name="nfTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="nfContent" required>${f.nfContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-secondary">수정</button>
                    <a class="btn btn-secondary" href="delete.fq?nfNo=${f.nfNo}">삭제</a>
                    <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
         	<jsp:include page="../common/footer.jsp"/>
</body>
</html>