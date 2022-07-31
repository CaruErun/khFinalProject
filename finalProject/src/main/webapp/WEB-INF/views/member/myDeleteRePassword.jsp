<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/myDeleteRePassword.css">
    <title>비밀번호 입력</title>
</head>
<body>

<c:if test="${ not empty alertMsg }">
<script>
	alert("${alertMsg}");
</script>
<c:remove var="alertMsg" scope="session"/>
</c:if>

    <div class="wrap">
                <form action="deleteRe.me" method="post">
        <div id="header">
            <div id="title">회원탈퇴</div>
            
        </div>
        <div id="content">
                    <div id="content1">
                        <span style="color: midnightblue; font-weight: 550; font-size: 14px;">탈퇴 후 복구가 불가능합니다. 
                            정말로 탈퇴 하시겠습니까? </span>
                        <br>
                    </div>
                    <div id="content2">
                    </div>
                    <div id="content3">
                        <div id="content_3_1">
                            <input type="password" id="inputbox" name="userPwd"  placeholder="비밀번호를 입력해주세요">
                        </div>
                    </div>
        </div>
        <div id="footer">
            <div id="footer_1">
                <input type="submit" id="" class="btn3" value="확인">
                <button class="btn4" onclick="backback()">취소</button>
            </div>
        </div>
                </form>
    </div>  
    <script>
     function backback(){
    	location.href="myInfo.me";
    }
    </script>
</body>
</html>