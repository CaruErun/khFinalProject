<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/changePassword.css">
    <title>비밀번호 변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<c:if test="${ not empty alertMsg }">
<script>
	alert("${alertMsg}");
</script>
<c:remove var="alertMsg" scope="session"/>
</c:if>


    <div class="wrap">
        <div id="header">
            <div id="title">비밀번호 변경</div>
            
        </div>
                <form action="pwdChange.me" method="post">
        <div id="content">
                    <div id="content1">
                        <span style="color: midnightblue; font-weight: 550; font-size: 14px;">안전한 비밀번호로 내정보를 보호하세요</span>
                        <br>
                        <span style="color: red; font-weight: 550; font-size: 14px;">· 다른 아이디/사이트에서 사용한 적 없는 비밀번호</span>
                        <br>
                        <span style="color: red; font-weight: 550; font-size: 14px;">· 이전에 사용한 적 없는 비밀번호</span>가 안전합니다.
                    </div>
                    <div id="content2">
                    </div>
                    <div id="content3">
                        <div id="content_3_1">
                            <input type="password" id="inputbox"  name="userPwd" placeholder="현재 비밀번호">
                        </div>
                        <div id="content_3_2">
                            <input type="password" id="inputbox"  class="newPwd" name="newPwd" placeholder="새 비밀번호">
                        </div> 
                        <div id="content_3_3">
                            <input type="password" id="inputbox"  name="newPwdCheck" placeholder="새 비밀번호 확인">
                        </div> 
                        <div id="content_3_4">
                        </div>
                    </div>
        </div>
        <div id="footer">
            <div id="footer_1">
                <input type="button" id="" class="btn3" value="확인" onclick="submit()">
                <button type="button" class="btn4" onclick="back()">취소</button>
            </div>
        </div>
                </form>
    </div> 
    <script>
    function submit(){
			location.href="myInfo.me";
		} 
    
    function back(){
    	location.href="myInfo.me";
    }
    </script>
    
    <script>
    var pwJ = /^[A-Za-z0-9]{4,12}$/;
    
      $('.newPwd').blur(function() {
      if (pwJ.test($('.newPwd').val())) {
         console.log('true');
         $('#content_3_4').text('');
      } else {
         console.log('false');
         $('#content_3_4').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
         $('#content_3_4').css('color', 'red');
         $('#content_3_4').css('font-family', 'Malgun Gothic');
         $('#content_3_4').css('font-size', '12px');
      }
      })
	</script>
    
</body>
</html>